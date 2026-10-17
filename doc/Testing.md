# Testing

```bash
fvm flutter test            # run all tests
fvm flutter analyze         # static analysis (must be 0 issues)
```

Tests live under `test/` mirroring `lib/`: `test/auth/`, `test/core/`, `test/dashboard/`.

After changing freezed/json models, regenerate with `fvm run build_runner build` and re-analyze.

New non-trivial logic should include a small test or assert-based self-check.