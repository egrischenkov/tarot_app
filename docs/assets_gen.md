## 🧬 Resource Code Generation with Flutter Gen

To generate Dart accessors for assets such as images, icons, and SVGs, use the [`flutter_gen`](https://pub.dev/packages/flutter_gen) package.

### 🧩 Setup

1. Add the following to your `pubspec.yaml`:
```yaml
dev_dependencies:
  flutter_gen_runner: ^5.3.1
  build_runner: ^2.4.6
```

2. Create a `flutter_gen.yaml` in the root directory:
```yaml
output: lib/gen/
integrations:
  flutter_svg: true
```

3. Ensure you list your assets in `pubspec.yaml`:
```yaml
flutter:
  assets:
    - assets/images/
    - assets/icons/
```

4. Run the generator:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### ✅ Usage Example

If you have `assets/images/logo.png`, use it like:
```dart
Image.asset(Assets.images.logo);
```

If using `flutter_svg` and have `assets/icons/star.svg`:
```dart
SvgPicture.asset(Assets.icons.star);
```

This helps eliminate typos in asset paths and makes your code more maintainable.

