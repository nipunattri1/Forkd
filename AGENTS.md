# forkd

## 0. AI Operating Mode

- **Mode**: ponytail, level full (lazy senior dev). Build the smallest change that fully solves the task — YAGNI, no unrequested features, abstractions, dependencies, or boilerplate.
- **Standards enforced**: `fvm flutter analyze` must report **0 issues** before a task is done; conventional commit messages (`feat:`, `fix:`, `refactor:`, `docs:`, ...); no new dependencies unless explicitly requested; regenerate freezed/json code with `fvm run build_runner build` after model changes.
- Mark deliberate simplifications that cut a real corner with a `shortcut: <ceiling>, <upgrade path>` comment.

## 1. Tech Stack & Architecture

- **Platform**: Flutter (Dart SDK `^3.12.0`), managed with **FVM** (see `.fvmrc` and `.fvm/flutter_sdk`).
- **State management**: `flutter_bloc` (Bloc/Cubit) + `freezed` for events/states (pattern extensions: `map`, `when`, `maybeMap`).
- **Dependency injection**: `get_it` (`lib/dependency_injection.dart`).
- **Routing**: `go_router`.
- **Networking**: `dio` (+ `pretty_dio_logger`), `http`; GitLab API v4 backend.
- **Auth**: GitLab OAuth2 / token-based (`app_links`, `flutter_secure_storage`, `crypto`, `nanoid`, `shared_preferences`).

### Layering (feature-first, under `lib/features/<feature>/`)

- `domain/` — entities, repository interfaces, value objects, use cases.
- `data/` — datasources, repository implementations, models.
- `application/` — use cases (orchestrate domain).
- `infrastructure/` — implementations / dev fakes.
- `persentation/` — BLoC/Cubit, mappers, screens, widgets.

Note: `persentation` is misspelled on purpose (existing convention — keep it).

## 2. Build & Testing Commands

```bash
fvm flutter pub get        # install dependencies
fvm flutter analyze         # static analysis (must end with 0 issues)
fvm run build_runner build  # regenerate freezed / json_serializable code
fvm flutter test            # run tests (none exist yet)
fvm flutter run             # run the app
fvm flutter build apk       # build Android
fvm flutter build ios       # build iOS
```

## 3. Code Style & Standards

- Lints: `very_good_analysis` + `flutter_lints` (see `analysis_options.yaml`).
- Naming: freezed BLoC events/states; states expose `map`/`when`/`maybeMap` pattern extensions.
- Design patterns: repository pattern, use cases, value objects, UI mappers.
- DI registrations live in `lib/dependency_injection.dart` (`configureDependencies`).
- TODO comments: `// TODO: ...` style (enforced by `flutter_style_todos`).
- Named parameters: required before optional (`always_put_required_named_parameters_first`).

## 4. Workflow Rules

- Before completing any task, run `fvm flutter analyze` and fix until it reports **0 issues**.
- After changing freezed / json models, run `fvm run build_runner build` and re-analyze.
- Commit messages: conventional commits (`feat:`, `fix:`, `refactor:`, `docs:`, ...). Example: `fix: OAuth bugs`.
- No new dependencies or abstractions unless explicitly requested.
