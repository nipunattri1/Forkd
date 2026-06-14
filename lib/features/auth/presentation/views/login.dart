import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forkd/core/common/strings.dart';
import 'package:forkd/core/extensions/theme_context.dart';
import 'package:forkd/core/utils/constants.dart';
import 'package:forkd/core/widgets/forkd_scaffold.dart';
import 'package:forkd/core/widgets/forkd_sliver_list.dart';
import 'package:forkd/core/widgets/forkd_text_field.dart';
import 'package:forkd/dependency_injection.dart';
import 'package:forkd/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';

class AddAccountScreen extends StatefulWidget {
  const AddAccountScreen({super.key});

  @override
  State<AddAccountScreen> createState() => _AddAccountScreenState();
}

class _AddAccountScreenState extends State<AddAccountScreen> {
  late TextEditingController _tokenController;
  late TextEditingController _domainController;
  final ValueNotifier<bool> _isDomainExpanded = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _tokenController = TextEditingController();
    _domainController = TextEditingController();
  }

  @override
  void dispose() {
    _tokenController.dispose();
    _domainController.dispose();
    super.dispose();
  }

  /// Strips protocol schemes, whitespace, paths, and trailing slashes, then
  /// returns a clean bare hostname (e.g. "gitlab.company.com").
  String _sanitizeDomain(String raw) {
    var value = raw.trim();
    // Remove protocol prefix (http:// or https://)
    value = value.replaceFirst(RegExp('^https?://'), '');
    // Remove path, query string, and fragment — keep only the host
    value = value.split('/').first.split('?').first.split('#').first;
    // Normalise to lowercase
    return value.toLowerCase();
  }

  /// Returns an error string if [value] is not a valid hostname,
  /// or null when the field is empty (custom domain is optional).
  String? _validateDomain(String? value) {
    if (value == null || value.trim().isEmpty) return null; // optional
    final sanitized = _sanitizeDomain(value);
    // Labels separated by dots; each label: alphanumeric + hyphens, no
    // leading/trailing hyphen; TLD at least 2 chars.
    final hostnameRegex = RegExp(
      r'^(?:[a-z0-9](?:[a-z0-9\-]{0,61}[a-z0-9])?\.)+[a-z]{2,}$',
    );
    if (!hostnameRegex.hasMatch(sanitized)) {
      return 'Enter a valid domain (e.g. gitlab.company.com)';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return ForkdScaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                appName,
                style: context.theme.textTheme.displayMedium,
              ),
              expandedTitleScale: 1,
              titlePadding: const EdgeInsets.symmetric(horizontal: 16),
            ),
            expandedHeight: kToolbarHeight * 3,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'add an account',
                style: context.theme.textTheme.headlineMedium,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsetsGeometry.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            sliver: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                return ForkdList.sliver(
                  tileData: [
                    ...state.map(
                      loading: (_) => [
                        const ForkdListTileData.custom(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            child: LinearProgressIndicator(),
                          ),
                        ),
                      ],
                      data: (data) => data.accounts
                          .map(
                            (account) => ForkdListTileData(
                              title: Text(account.platform.name),
                              subtitle: Text(account.domain),
                              decoration: false,
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                  account.avatarUrl,
                                ),
                              ),
                              onTap: () {
                                di<AuthBloc>().add(
                                  AuthEvent.setActiveAccount(account),
                                );
                              },
                            ),
                          )
                          .toList(),
                      error: (err) => [],
                    ),
                    ForkdListTileData(
                      title: const Text('Add new Account'),
                      leading: const Icon(Symbols.add),
                      onTap: () => choosePlatformBottomSheet(context),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> choosePlatformBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.sizeOf(context).height * 0.5,
          ),
          child: Padding(
            padding: defaultPadding,
            child: ForkdList(
              shrinkWrap: true,
              tileData: [
                // ForkdListTileData(
                //   title: Text('Github'),
                //   leading: Icon(Symbols.merge),
                //   subtitle: Text('Github.com'),
                //   onTap: () {
                //     BlocProvider.of<AuthBloc>(
                //       context,
                //     ).add(AuthEvent.addGithubOAuthAccount());
                //   },
                // ),
                ForkdListTileData(
                  title: const Text('Gitlab'),
                  leading: const Icon(Symbols.fork_right_sharp),
                  subtitle: const Text('Gitlab.com'),
                  onTap: () async {
                    await showGitlabDetailsDialog(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> showGitlabDetailsDialog(BuildContext context) {
    final authBloc = context.read<AuthBloc>();
    final theme = context.theme;

    final formKey = GlobalKey<FormState>();

    return showDialog<dynamic>(
      context: context,
      builder: (dialogCtx) {
        return AlertDialog(
          title: Text('Add token', style: theme.textTheme.headlineSmall),
          content: SingleChildScrollView(
            child: Form(
              key: formKey, // Wrap the content in a Form
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ForkdTextField(
                    hintText: 'Token',
                    obscureText: true,
                    prefixIcon: Symbols.lock_clock_rounded,
                    controller: _tokenController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Token cannot be empty';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  Theme(
                    // Removes the default ExpansionTile dividers so it sits
                    // flush with the rest of the dialog content.
                    data: theme.copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      tilePadding: EdgeInsets.zero,
                      trailing: ValueListenableBuilder<bool>(
                        valueListenable: _isDomainExpanded,
                        builder: (context, expanded, _) => AnimatedRotation(
                          turns: expanded ? 0.5 : 0,
                          duration: const Duration(milliseconds: 200),
                          child: const Icon(Symbols.expand_more),
                        ),
                      ),
                      childrenPadding: EdgeInsets.zero,
                      leading: Icon(
                        Symbols.dns_rounded,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      title: Text(
                        'Custom domain',
                        style: theme.textTheme.bodyMedium,
                      ),
                      subtitle: Text(
                        'Self-hosted GitLab instance',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      children: [
                        const SizedBox(height: 8),
                        ForkdTextField(
                          hintText: 'gitlab.company.com',
                          prefixIcon: Symbols.link_rounded,
                          controller: _domainController,
                          // Sanitize on every change so the user sees the
                          // cleaned value before they submit.
                          onChanged: (value) {
                            if (value == null) return;
                            final sanitized = _sanitizeDomain(value);
                            if (sanitized != value) {
                              _domainController.value = _domainController.value
                                  .copyWith(
                                    text: sanitized,
                                    selection: TextSelection.collapsed(
                                      offset: sanitized.length,
                                    ),
                                  );
                            }
                          },
                          validator: _validateDomain,
                        ),
                        const SizedBox(height: 4),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Text(
                            'Leave blank to use gitlab.com',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(dialogCtx).pop();
                        authBloc.add(
                          const AuthEvent.addGitlabOAuthAccount(
                            domain: 'gitlab.com',
                          ),
                        );
                      },
                      style: theme.textButtonTheme.style,
                      child: const Text('Use OAuth instead'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            OutlinedButton(
              onPressed: () => Navigator.of(dialogCtx).pop(),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  final domain = _domainController.text.trim().isEmpty
                      ? 'gitlab.com'
                      : _sanitizeDomain(_domainController.text);
                  authBloc.add(
                    AuthEvent.addGitlabTokenAccount(
                      token: _tokenController.text.trim(),
                      domain: domain,
                    ),
                  );
                  Navigator.of(dialogCtx).pop();
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    ).whenComplete(() {
      _tokenController.clear();
      _domainController.clear();
    });
  }
}
