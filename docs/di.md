## Dependency Injection

We use a dependency injection (DI) approach based on the [`auto_route`](https://pub.dev/packages/auto_route) package.

The package exposes the `AutoRouteWrapper` interface, which provides the `wrappedRoute` method. This method allows you to wrap a screen with the required dependencies at the point of route entry.

### How It Works

To inject dependencies into a screen, you can create a custom DI scope using an `InheritedWidget`. Then, within your route widget, implement `AutoRouteWrapper` and return the widget wrapped in the desired scope.

### Example: DI Scope

```dart
class AccountDiScope extends InheritedWidget {
  // Define your dependencies here
  final SomeDependency someDependency;

  const AccountDiScope({
    required this.someDependency,
    required super.child,
    super.key,
  });

  static AccountDiScope of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AccountDiScope>()!;
  }

  @override
  bool updateShouldNotify(AccountDiScope oldWidget) => false;
}
```

### Example: Route Wrapper

```dart
/// Entry screen for the "Account" flow.
class AccountEntry extends StatelessWidget implements AutoRouteWrapper {
  final String name;
  final String email;
  final String? avatar;

  /// Creates a stack of screens for the "Account" flow with the necessary dependencies.
  const AccountEntry({
    required this.name,
    required this.email,
    this.avatar,
    super.key,
  });

  @override
  Widget wrappedRoute(BuildContext context) {
    return AccountDiScope(
      someDependency: SomeDependencyImpl(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AccountScreen(
      name: name,
      email: email,
      avatar: avatar,
    );
  }
}
```

### Example: Usage

To access a dependency inside any child widget:

```dart
late final someDependency = AccountDiScope.of(context).someDependency;
```

### Benefits

- **Encapsulation:** Each route encapsulates its own dependencies.
- **Separation of Concerns:** Dependency setup is clearly separated from the widget logic.
- **Scalability:** Makes it easy to manage dependencies per flow or module.