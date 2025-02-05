
# Infinity Workspace 📱

## Pre-requisites 📐

| Technology | Recommended Version | Installation Guide                                                    |
|------------|---------------------|-----------------------------------------------------------------------|
| Flutter    | v3.24.x             | [Flutter Official Docs](https://flutter.dev/docs/get-started/install) |
| Dart       | v3.5.x              | Installed automatically with Flutter                                  |

## Get Started 🚀

- Clone this project
```bash 
  flutter pub get 
```
- Run to generate localization files
```bash
flutter gen-l10n
```
- Run to generate freezes files
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```
- Run for **staging** or
```bash
flutter run --flavor stg -t lib/main.dart --dart-define-from-file .env.stg.json 
```
- Run for **production**
```bash
flutter run --flavor prd -t lib/main.dart --dart-define-from-file .env.prd.json 
```
- Test Coverage, we ignore some folders and files which is not necessary to test coverage because it are generated file
- Note: on macOS, you need to have lcov installed on your system (`brew install lcov`) to use this:
```bash
 flutter test -j8 --coverage;lcov --remove coverage/lcov.info 'lib/core/localization/generated/' 'lib/core/resources/*' 'lib/utils/services/firebase/*' '**/*.g.dart' -o coverage/new_lcov.info ;genhtml coverage/new_lcov.info -o coverage/html
````
- To generate a launcher icon based on Flavor 
```bash
dart run flutter_launcher_icons 
```
- To generate native splash screen
```bash
dart run flutter_native_splash:create --flavors stg,prd
```
- To generate mock class
```bash
dart pub run build_runner build
```


## Feature ✅

- [x] BLoC State Management
- [x] **Clean Architecture with TDD**
    - [x] Unit Test
    - [x] Widget Test
    - [x] BLoC test
- [x] Theme Configuration: `System, Light, Dark`
- [x] Multi-Language: `English, Bahasa`
- [x] Login, Register Example
- [x] Pagination Example
- [x] [Autofill Username and Password](https://github.com/lazycatlabs/flutter_auth_app/pull/3)
- [x] Integration Test
- [x] Implement multi-flavor
- [x] Auto routing based on login status
- [x] Implement [Go Router](https://pub.dev/packages/go_router)

## TODO 📝
- [ ] Login with Biometric / FaceID



## Maestro Test 🧪
- Install Maestro on your machine [Maestro](https://maestro.mobile.dev/getting-started/installing-maestro)
- Run this command to run the test
  ```bash
   maestro test maestro-stg/main.yaml #or
   maestro test maestro-prd/main.yaml
  ```



## Architecture Proposal by [Resocoder](https://github.com/ResoCoder/flutter-tdd-clean-architecture-course)

<br>

![architecture-proposal](./architecture-proposal.png)

<br><br>
