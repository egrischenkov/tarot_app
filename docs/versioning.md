\## 🔖 Versioning and Lock File

We follow [Semantic Versioning (SemVer)](https://semver.org/), which defines version numbers in the format:
```
MAJOR.MINOR.PATCH
```
- **MAJOR** version when you make incompatible API changes,
- **MINOR** version when you add functionality in a backward-compatible manner,
- **PATCH** version when you make backward-compatible bug fixes.

### 🎯 Dependency Version Syntax

In `pubspec.yaml`, dependencies can include a "caret constraint" (^) prefix:

```yaml
dependencies:
  some_package: ^1.2.3
```

This means:
- The project will accept any version from `>=1.2.3 <2.0.0`
- Dart’s package resolver will pick the latest compatible version within that range

You may also use other range types like `~`, or strict versions like:
```yaml
  another_package: 1.2.3  # exact version
  cool_package: ">=1.2.0 <2.0.0"
```

Use this wisely based on stability and flexibility needs. For production, narrower ranges or pinning versions can increase reliability.

### 🔗 Transitive Dependencies

Transitive dependencies (i.e., dependencies of your dependencies) may use newer versions than the one explicitly declared in your own `pubspec.yaml`, **as long as they stay within the allowed range**.

For example:
- Your project specifies: `my_lib: ^1.2.3` → meaning `>=1.2.3 <2.0.0`
- A package you use requires: `my_lib: ^1.5.0`
- The resolver may pick `1.6.0` if that satisfies both

However, if another dependency requires `^2.0.0`, the resolver will throw a version solving error because `^1.2.3` is not compatible with `^2.0.0`.

### Why Keep `pubspec.lock` in Version Control?

The `pubspec.lock` file locks down the exact versions of dependencies used in the project. This ensures:

- **Consistent builds across all environments** (CI/CD, local machines).
- **Avoids unexpected breaking changes** caused by indirect dependency updates.
- **Improves debugging** by ensuring everyone is using the same dependency versions.

✅ We **commit the `pubspec.lock` file** without hesitation since we rely on specific, well-defined versions and want predictable builds.

> Note: For published libraries, you usually don’t commit the `.lock` file. For apps, you should.
