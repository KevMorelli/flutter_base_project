# flutter_base_project

This project aims to have a functioning starting point for new apps.

## Including:
- Clean architecture, using [Riverpod](https://riverpod.dev/)
- Dark/light theme support

## Todo:
- Notifications support
- Script to create a new project
- Shared preferences and secure storage usage
- Ready-to-use API client
- Dialog service

## Getting Started

Clone this project and then find-and-replace `flutter_base_project` and `flutterBaseProject` with the project name you desire.

Also, change the `PRODUCT_BUNDLE_IDENTIFIER` in `ios/Runner.xcodeproj/project.pbxproj`, because you can't upload an iOS app with it starting with `com.example`

flutter pub run easy_localization:generate -S ./assets/translations -f keys -O lib/core -o locale_keys.g.dart