# Features

## Implemented

- **Multi-account GitLab auth** — sign in to `gitlab.com` or any self-hosted instance via OAuth2 PKCE or personal access token. Switch active account without signing out.
- **Dashboard** — tabbed feed: To-Do, Merge requests, Pipelines. To-dos grouped Today / Yesterday / Earlier, mark done inline. Merge requests filterable by scope, status, sort.
- **Projects** — Starred / Yours / Explore lists with client-side name filter.
- **Secure token storage** — tokens in `flutter_secure_storage`, hash in `shared_preferences`.
- **Automatic token refresh** — single-flight refresh on 401; 429 rate-limit handling.

## Not implemented yet

- Explore and You tabs are placeholders.
- GitHub support modelled in domain layer but disabled.
- Issue feed (Issues tab placeholder).