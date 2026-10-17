# Architecture

Forkd is a Flutter client for the GitLab REST API v4, built feature-first.

## Layers

Under `lib/features/<feature>/`:

- `domain/` — entities, repository interfaces, value objects, use cases.
- `data/` / `infrastructure/` — datasources, models, repository implementations.
- `application/` — dashboard use cases.
- `presentation/` — BLoC/Cubit, mappers, screens, widgets. (`presentation` is intentionally misspelled; keep it.)

Cross-cutting code lives in `lib/core/` (networking, router, theme, services, widgets, utils).

## State management

`flutter_bloc` with `freezed` events/states. States expose `map`/`when`/`maybeMap`.

## Dependency injection

`get_it` registrations in `lib/dependency_injection.dart` (`configureDependencies`).
Repositories resolve the active account, point the shared `Dio` at that account's domain, and the auth interceptor attaches the token.

## Networking

- `dio` + `pretty_dio_logger`; `http` for the auth handshake.
- `NetworkingHelpers.getAllPages` follows `X-Next-Page` for paged GitLab list endpoints.
- `AuthInterceptor` attaches the bearer token, refreshes once on `401` (queueing concurrent requests behind a single refresh), and honours GitLab's rate-limit reset header on `429`.

## Auth

GitLab OAuth2 + PKCE (`app_links`, `crypto`, `nanoid`) or personal access token.
Tokens stored in `flutter_secure_storage` keyed by a random hash; only the hash is persisted alongside account metadata in `shared_preferences`.

## Routing

`go_router` with an auth guard. Routes: `/`, `/login`, `/auth/gitlab`.

## Data flow

UI → BLoC event → use case → repository → datasource → GitLab API v4 → model → entity → presenter → UI.