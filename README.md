# Forkd

[![Flutter](https://img.shields.io/badge/Flutter-3.47.7-02569B?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.12+-0175C2?logo=dart)](https://dart.dev)
[![Analysis](https://img.shields.io/badge/analyze-0%20issues-brightgreen)](#commands)
[![License](https://img.shields.io/badge/license-unspecified-lightgrey)](#license)

A Flutter mobile client for GitLab. Forkd talks directly to the GitLab REST API
v4 and pulls the things you would otherwise open a browser for — your to-dos,
merge requests, pipelines and projects — into a single app, with support for
multiple accounts and self-hosted GitLab instances.

## Table of contents

- [Features](#features)
- [Tech stack](#tech-stack)
- [Architecture](#architecture)
- [Getting started](#getting-started)
- [Commands](#commands)
- [Project structure](#project-structure)
- [Testing](#testing)
- [Documentation](#documentation)
- [Contributing](#contributing)
- [Roadmap](#roadmap)
- [Security](#security)
- [License](#license)

## Features

- **Multi-account GitLab auth** — sign in to `gitlab.com` or any self-hosted
  instance, using either the OAuth2 + PKCE browser flow or a personal access
  token. Switch the active account without signing out; every account is kept
  separate.
- **Dashboard** — tabbed feed with To-Do, Merge requests and Pipelines. To-dos
  are grouped into Today / Yesterday / Earlier and can be marked done inline.
  Merge requests can be filtered by scope, status and sort order.
- **Projects** — Starred / Yours / Explore lists with a client-side name filter.
- **Secure token storage** — access and refresh tokens live in
  `flutter_secure_storage` keyed by a random hash. Only the hash is persisted
  alongside the account metadata in `shared_preferences`, so the token itself
  never lands in plaintext preferences.
- **Automatic token refresh** — a Dio interceptor attaches the bearer token,
  refreshes it once on `401` (queueing concurrent requests behind a single
  refresh), and honours GitLab's rate-limit reset header on `429`.

### Not implemented yet

- Explore and You tabs are placeholders.
- GitHub support is modelled in the domain layer but disabled throughout.
- Issue feed (the Issues tab shows a placeholder).

## Tech stack

| Concern            | Choice                                                       |
| ------------------ | ------------------------------------------------------------ |
| Framework          | Flutter (Dart `^3.12.0`), managed with FVM                   |
| State management   | `flutter_bloc` + `freezed` states                            |
| Dependency inject. | `get_it`                                                     |
| Routing            | `go_router`                                                  |
| Networking         | `dio` (+ `http` for the auth handshake)                      |
| Auth               | OAuth2 PKCE, `app_links`, `flutter_secure_storage`, `crypto` |
| Backend            | GitLab REST API v4                                           |

## Architecture

Feature-first under `lib/features/<feature>/`, mirrored across features:

- `domain/` — entities, repository interfaces, value objects, use cases.
- `data/` / `infrastructure/` — datasources, models and repository
  implementations (auth lives under `data/`, dashboard under `infrastructure/`).
- `application/` — dashboard use cases.
- `presentation/` — BLoC/Cubit, mappers, screens and widgets.

Cross-cutting code lives in `lib/core/` (networking, router, theme, services,
widgets).

Platform-specific implementations live under
`lib/features/<feature>/data/platforms/<platform>/` (e.g. `.../platforms/gitlab/`).
Adding a new platform means adding a folder there, implementing the same
repository/auth interfaces, and registering it in `lib/dependency_injection.dart`.

Dependency injection is wired in `lib/dependency_injection.dart`; repositories
resolve the active account, point the shared `Dio` at that account's domain, and
let the auth interceptor attach the token. GitLab list endpoints are paged via
`NetworkingHelpers.getAllPages`, which follows `X-Next-Page`.

## Getting started

Forkd uses [FVM](https://fvm.app); install it and the pinned SDK first.

```bash
dart pub global activate fvm
fvm install
fvm flutter pub get
fvm flutter run
```

The default OAuth client ID targets `gitlab.com`. For a self-hosted instance,
register an OAuth application there with the redirect URI
`app://nipunattri1.forkd/auth/gitlab`, then enter the instance domain on the
login screen.

## Commands

```bash
fvm flutter pub get         # install dependencies
fvm flutter analyze         # static analysis (must end with 0 issues)
fvm flutter test            # run tests
fvm run build_runner build  # regenerate freezed / json_serializable code
fvm flutter run             # run the app
fvm flutter build apk        # build Android
fvm flutter build ios        # build iOS
```

## Project structure

```
lib/
├── main.dart                     # entry point, wires AuthBloc + DI
├── app.dart                      # MaterialApp.router, theme, global toasts
├── dependency_injection.dart     # get_it registrations
├── core/
│   ├── networking/               # Dio setup, pagination, auth interceptor
│   ├── router/                   # go_router config + auth guard
│   ├── services/                 # secure token storage
│   ├── theme/  widgets/  utils/  # shared UI and helpers
│   └── usecase/                  # base use case contract
└── features/
    ├── auth/                     # accounts, OAuth/PAT login, auth bloc
    └── dashboard/                # to-dos, MRs, projects, pipelines
```

## Testing

```bash
fvm flutter test            # run all tests
fvm flutter analyze         # static analysis (must be 0 issues)
```

Tests live under `test/` mirroring `lib/`: `test/auth/`, `test/core/`,
`test/dashboard/`. New non-trivial logic should ship with a small test.

## Documentation

Full docs live under [`doc/`](doc/), including a [wiki home](doc/Home.md),
[architecture](doc/Architecture.md), [getting started](doc/Getting-Started.md),
[features](doc/Features.md), [project structure](doc/Project-Structure.md),
[testing](doc/Testing.md) and [contributing](doc/Contributing.md). Generated
API reference is in [`doc/api/`](doc/api/index.html).

## Contributing

- Keep `fvm flutter analyze` at **0 issues** before opening a PR.
- Regenerate freezed / JSON code with `fvm run build_runner build` after any
  model change.
- Commit messages follow [Conventional Commits](https://www.conventionalcommits.org/)
  (`feat:`, `fix:`, `refactor:`, `docs:`, ...).
- No new dependencies or abstractions without discussion.

## Roadmap

- Implement Explore and You tabs.
- Wire the Issue feed.
- Re-enable GitHub support behind its domain interfaces.
- Add CI for analyze + test.

## Security

Tokens are stored in `flutter_secure_storage` and never in plaintext
preferences. Report vulnerabilities privately to the maintainers; do not open
public issues for security bugs.

## License

Released under the [MIT License](LICENSE).