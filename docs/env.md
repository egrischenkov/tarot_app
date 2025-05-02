## 📁 Environment Variables

Environment variables in Flutter are passed using the `--dart-define` or `--dart-define-from-file` flags with the `flutter run` or `flutter build` commands.

The `.env` file must be placed at the root of the project and **must not be tracked by git**.

### Example Command

```bash
flutter build apk --flavor=dev --dart-define-from-file=.env
```

---

## 🏗️ Environment Variables in CodeMagic

Since CodeMagic doesn't support file storage directly, you need to convert your `.env` file contents to a Base64 string and store it as an environment variable.

To convert and copy:

```bash
cat .env | base64 | pbcopy
```

**Explanation:**
- `cat .env`: Outputs the contents of the `.env` file
- `base64`: Encodes the contents in Base64
- `pbcopy`: Copies the result to clipboard (macOS only)

---

## 🌐 Using Dart Define Keys in Native Code

### iOS

Native usage on iOS is not directly supported, but can be achieved through a workaround using a script located at:

`ios/Flutter/extract_dart_defines.sh`

More details can be found in [this article](https://medium.com/@nayanbabariya/set-up-environment-variables-in-flutter-for-secure-and-scalable-apps-7409ae0c383e).

1. Add a key to your `Info.plist`:
```plist
<key>GOOGLE_MAPS_API_KEY</key>
<string>$(GOOGLE_MAPS_IOS_KEY)</string>
```

2. Access it in Swift:
```swift
let googleMapsApiKey = Bundle.main.object(forInfoDictionaryKey: "GOOGLE_MAPS_API_KEY")
```

### Android

1. Define the key in `app/build.gradle` under `defaultConfig`:
```gradle
resValue "string", "google_maps_api_key", dartDefines.GOOGLE_MAPS_API_KEY
```

2. Reference it in `AndroidManifest.xml`:
```xml
<meta-data android:name="com.google.android.geo.API_KEY"
           android:value="@string/google_maps_api_key" />
```

