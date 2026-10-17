# Getting Started

Forkd uses [FVM](https://fvm.app).

## Prerequisites

- FVM installed (`dart pub global activate fvm`).
- Pinned Flutter SDK (see `.fvmrc`).

## Install & run

```bash
fvm install
fvm flutter pub get
fvm flutter run
```

## Self-hosted GitLab

Register an OAuth application with redirect URI `app://nipunattri1.forkd/auth/gitlab`,
then enter the instance domain on the login screen. Default client ID targets `gitlab.com`.

## Useful commands

```bash
fvm flutter pub get
fvm flutter analyze
fvm flutter test
fvm run build_runner build
fvm flutter build apk
fvm flutter build ios
```