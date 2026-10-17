# Project Structure

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

Feature subfolders follow `domain/`, `data/`/`infrastructure/`, `application/`, `presentation/`.