import 'package:forkd/features/dashboard/domain/entities/merge_request_entity.dart';
import 'package:forkd/features/dashboard/domain/repositories/merge_request_repository.dart';
import 'package:forkd/features/dashboard/domain/value_objects/merge_request_filter.dart';

/// Dev-only repository serving the Figma sample data.
// TODO(bubble): replace with a GitLab-backed implementation.
class FakeMergeRequestRepository implements MergeRequestRepository {
  const FakeMergeRequestRepository();

  @override
  Future<List<MergeRequestEntity>> fetch(MergeRequestFilter filter) async {
    await Future<void>.delayed(const Duration(milliseconds: 400));
    final now = DateTime.now();
    DateTime ago(Duration d) => now.subtract(d);

    return [
      MergeRequestEntity(
        projectPath: 'acme/payments-api',
        iid: 482,
        updatedAt: ago(const Duration(hours: 2)),
        title: 'Fix rounding drift in ledger totals',
        sourceBranch: 'fix/ledger-rounding',
        targetBranch: 'main',
        pipeline: PipelineStatus.success,
        comments: 6,
        approvals: 1,
        approvalsRequired: 2,
        labels: const [
          MrLabelEntity('bug', tone: LabelTone.danger),
          MrLabelEntity('priority', value: '1', tone: LabelTone.danger),
        ],
      ),
      MergeRequestEntity(
        projectPath: 'acme/web-checkout',
        iid: 1207,
        updatedAt: ago(const Duration(hours: 5)),
        title:
            'Replace deprecated Stripe SDK calls in checkout flow and add '
            'retry handling for 429 responses',
        sourceBranch: 'feat/stripe-sdk-v12',
        targetBranch: 'main',
        pipeline: PipelineStatus.running,
        comments: 14,
        approvals: 0,
        approvalsRequired: 2,
        labels: const [MrLabelEntity('backend')],
      ),
      MergeRequestEntity(
        projectPath: 'platform/infra-modules',
        iid: 96,
        updatedAt: ago(const Duration(hours: 30)),
        title: 'Draft: Bump terraform aws provider to 5.x',
        sourceBranch: 'chore/tf-provider-5',
        targetBranch: 'main',
        pipeline: PipelineStatus.failed,
        comments: 2,
        approvals: 0,
        approvalsRequired: 1,
        labels: const [
          MrLabelEntity('infra', value: 'aws', tone: LabelTone.warning),
        ],
      ),
      MergeRequestEntity(
        projectPath: 'acme/payments-api',
        iid: 479,
        updatedAt: ago(const Duration(hours: 28)),
        title: 'Add idempotency keys to refund endpoint',
        sourceBranch: 'feat/refund-idempotency',
        targetBranch: 'main',
        pipeline: PipelineStatus.success,
        comments: 3,
        approvals: 2,
        approvalsRequired: 2,
      ),
      MergeRequestEntity(
        projectPath: 'docs/handbook',
        iid: 2318,
        updatedAt: ago(const Duration(days: 2)),
        title: 'Update on-call escalation policy',
        sourceBranch: 'docs/oncall-policy',
        targetBranch: 'main',
        pipeline: PipelineStatus.manual,
        comments: 0,
        approvals: 0,
        approvalsRequired: 1,
      ),
      MergeRequestEntity(
        projectPath: 'acme/web-checkout',
        iid: 1195,
        updatedAt: ago(const Duration(days: 3)),
        title: 'Migrate cart totals to decimal money type',
        sourceBranch: 'refactor/decimal-money',
        targetBranch: 'main',
        pipeline: PipelineStatus.success,
        comments: 9,
        approvals: 1,
        approvalsRequired: 2,
      ),
    ];
  }
}
