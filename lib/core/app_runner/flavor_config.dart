import 'package:firebase_core/firebase_core.dart';
import 'package:taro/core/firebase/tarot_firebase_options.dart';

sealed class FlavorConfig {
  const FlavorConfig();

  factory FlavorConfig.dev() = FlavorConfig$Dev;

  factory FlavorConfig.prod() = FlavorConfig$Prod;

  FirebaseOptions get firebaseOptions;
}

final class FlavorConfig$Dev extends FlavorConfig {
  const FlavorConfig$Dev();

  @override
  FirebaseOptions get firebaseOptions => TarotFirebaseOptions.dev;
}

final class FlavorConfig$Prod extends FlavorConfig {
  const FlavorConfig$Prod();

  @override
  FirebaseOptions get firebaseOptions => TarotFirebaseOptions.prod;
}
