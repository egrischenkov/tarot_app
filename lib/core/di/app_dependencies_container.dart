/// Container used to reuse dependencies across the application.
///
/// {@macro composition_process}
class AppDependenciesContainer {
  const AppDependenciesContainer();
}

/// A special version of [AppDependenciesContainer] that is used in tests.
///
/// In order to use [AppDependenciesContainer] in tests, it is needed to
/// extend this class and provide the dependencies that are needed for the test.
base class TestAppDependenciesContainer implements AppDependenciesContainer {
  const TestAppDependenciesContainer();

  @override
  Object noSuchMethod(Invocation invocation) {
    throw UnimplementedError(
      'The test tries to access ${invocation.memberName} dependency, but '
      'it was not provided. Please provide the dependency in the test. '
      'You can do it by extending this class and providing the dependency.',
    );
  }
}
