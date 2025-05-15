import 'package:taro/core/firebase/options/firebase_options_dev.g.dart' as dev_options;
import 'package:taro/core/firebase/options/firebase_options_prod.g.dart' as prod_options;

abstract final class TarotFirebaseOptions {
  static final dev = dev_options.DefaultFirebaseOptions.currentPlatform;
  static final prod = prod_options.DefaultFirebaseOptions.currentPlatform;
}
