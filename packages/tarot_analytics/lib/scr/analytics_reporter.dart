/// Interface for reporting analytics events.
///
/// This interface should be implemented to report [AnalyticsEvent]s to the
/// analytics service being used by the application.
abstract interface class AnalyticsReporter {
  /// Logs the provided [event] to analytics.
  ///
  /// This method should be implemented to report the event to the analytics
  /// service being used by the application.
  ///
  /// The [event] should be logged to the analytics service as-is, including any
  /// parameters that are included with the event.
  Future<void> logEvent(AnalyticsEvent event);
}

/// Represents an event that can be logged to analytics by [AnalyticsReporter].
///
/// This class can be used to track user interactions, screen views, or other
/// significant actions within the application.
///
/// It is recommended to create custom events by extending this class, although
/// events can also be added directly using this class.
base class AnalyticsEvent {
  const AnalyticsEvent(this.name, {this.parameters = const {}});

  /// The name of the event.
  ///
  /// It should be a unique identifier for the event that is understood by the
  /// analytics service being used.
  final String name;

  /// The parameters of the event.
  ///
  /// Parameters are optional and can be used to provide additional context or
  /// data with the event.
  final Set<AnalyticsParameter<Object>> parameters;

  @override
  String toString() => 'AnalyticsEvent(name: $name, parameters: ${parameters.join(', ')})';
}

/// A parameter that can be added to an [AnalyticsEvent].
///
/// Currently, there are two types of parameters:
/// - [StringAnalyticsParameter]
/// - [NumberAnalyticsParameter]
///
/// Other types are not supported by Firebase Analytics. If you are using a
/// different tool for analytics, you can create a custom parameter type.
sealed class AnalyticsParameter<T> {
  const AnalyticsParameter(this.name, this.value);

  /// The name of the parameter.
  final String name;

  /// The value of the parameter.
  final T value;
}

/// Analytics parameter that contains a [String] value.
final class StringAnalyticsParameter extends AnalyticsParameter<String> {
  const StringAnalyticsParameter(super.name, super.value);

  @override
  String toString() => 'StringAnalyticsParameter(name: $name, value: $value)';
}

/// Analytics parameter that contains a [num] value.
final class NumberAnalyticsParameter extends AnalyticsParameter<num> {
  const NumberAnalyticsParameter(super.name, super.value);

  @override
  String toString() => 'NumberAnalyticsParameter(name: $name, value: $value)';
}
