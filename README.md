# flutter_base_project

This project aims to have a functioning starting point for new apps.

## Including:
- Clean code architecture using [Riverpod](https://riverpod.dev/)
- Dark/light theme support with custom font
- Localization using [easy_localization](https://pub.dev/packages/easy_localization)
- Version tracking using [VersionTracker](https://pub.dev/packages/version_tracker)
- Error reported to Sentry service using [Catcher](https://pub.dev/packages/catcher)
- Device preview for UI build when launching web using [Device Preview](https://pub.dev/packages/device_preview)
- Shared Preferences
- Splash screen using [flutter_native_splash](https://pub.dev/packages/flutter_native_splash)



## Todo:
- Script to create a new project
- Shared preferences and secure storage usage
- Ready-to-use API client
- Dialog service
- https://pub.dev/packages/flutter_launcher_icons

## Getting Started

Clone this project and then find-and-replace `flutter_base_project` and `flutterBaseProject` with the project name you desire.

Also, change the `PRODUCT_BUNDLE_IDENTIFIER` in `ios/Runner.xcodeproj/project.pbxproj`, because you can't upload an iOS app with it starting with `com.example`

flutter pub run easy_localization:generate -S ./assets/translations -f keys -O lib/core -o locale_keys.g.dart

flutter pub run flutter_native_splash:create