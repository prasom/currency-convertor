# CURRENCY CONVERTOR

- [CURRENCY CONVERTOR](#currency-convertor)
  - [Introduction](#introduction)
      - [Preview](#preview)
      - [Feature](#feature)
  - [Getting Started](#getting-started)
      - [Flutter Installation](#flutter-installation)
      - [Appium Installation](#appium-installation)
      - [Development](#development)
      - [Testing](#testing)


## Introduction

A currecy covertor made by Flutter.

#### Preview

![App UI](/app-preview/app_ui.png)

####  Feature
- Click arrow icon to switch view target
- Click numpad to enter number to view target
- Click search icon to search and select currency
- Click delete to delete target view
- Click reset button to reset all enter value
- Click top-right icon to switch light theme or dark theme
## Getting Started

#### Flutter Installation
mac OS

Please follow flutter mac OS installation guideline [Click Here](https://flutter.dev/docs/get-started/install/macos)

windows

Please follow flutter window OS installation guideline [Click Here](https://flutter.dev/docs/get-started/install/windows)
#### Appium Installation
To setup appium [click here](https://medium.com/@chompoowirawan/%E0%B8%A3%E0%B8%A7%E0%B8%A1%E0%B8%A7%E0%B8%B4%E0%B8%98%E0%B8%B5-install-appium-for-robot-framework-%E0%B8%97%E0%B8%B1%E0%B9%89%E0%B8%87-android-%E0%B9%81%E0%B8%A5%E0%B8%B0-ios-%E0%B8%9A%E0%B8%99-mac-os-c54cb8adede6)
#### Development
*Clone Project*
```
git clone https://github.com/prasom/currency-convertor.git
```
```
cd currency-convertor
```
*Get dependencies*
```
flutter pub get
```
*Run device*
```
flutter run -d {your device}
```
#### Testing
*Unit testing*
```
flutter test
```
*E2E Test*

Start appium server 
```
appium
```
Change apk path to your local apk path
```
${APP_ANDROID}    /{your local path}/currency_convertor/build/app/outputs/apk/debug/app-debug.apk
```
Run android test script 
```
robot e2e/android/home.robot
```
