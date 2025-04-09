# Flutter assignment - Documentation by [Tanvir Ahmed](https://Tanvir Ahmed.dev/) v1.0

Created: 19/11/2024  
By: [Tanvir Ahmed](https://Tanvir Ahmed.dev/)  
Email: [tomalahmed350@gmail.com](mailto:tomalahmed350@gmail.com)



![Flutter assignment Logo](https://i.imgur.com/7sx5g2b.png)

---

## Table of Contents
- [Flutter assignment - Documentation](#Flutter assignment---documentation-by-Tanvir Ahmed-v10)
  - [Table of Contents](#table-of-contents)
  - [Environment Details](#environment-details)
  - [Change Application Colors 🔝](#change-application-colors-)
    - [Sample Code](#sample-code)
    - [If you want to change application primary color just modify this lines of code](#if-you-want-to-change-application-primary-color-just-modify-this-lines-of-code)
      - [OLD CODE](#old-code)
      - [Update CODE](#update-code)
  - [Change Application Theme 🔝](#change-application-theme-)
    - [Sample Code](#sample-code-1)
  - [Use Custom Fonts 🔝](#use-custom-fonts-)
  - [Change Application Constant Value 🔝](#change-application-constant-value-)
  - [Project Structures - Clean Architectures 🔝](#project-structures---clean-architectures-)
- [Features 🔝](#features-)
  - [State management 🔝](#state-management-)
  - [Application Routing 🔝](#application-routing-)
  - [Plugins 🔝](#plugins-)
  - [Dev Plugins 🔝](#dev-plugins-)
  - [Contact Us](#contact-us)

---

## Environment Details

| Tools     | Version   |
| --------- | --------- |
| Flutter   | 3.27.2    |
| Dart      | 3.5.4     |
| DevTools  | 2.37.2    |

---


Change Application Colors [🔝](#table-of-contents)
--------------------------------------------------

In this file [lib/core/shared/theme/scheme.dart](lib/core/shared/theme/scheme.dart) all types of app colors are defined, you can change on your own There are two types of color scheme (Light, and Dark) Scheme.

### Sample Code
```dart
    class ThemeScheme {
            final Color backgroundPrimary;
            final Color backgroundSecondary;
            final Color backgroundTertiary;
            final Color textPrimary;
            final Color iconColor;
            final Color textSecondary;
            final Color cardColor;
            final Color positive;
            final Color positiveBackground;
            final Color positiveBackgroundTertiary;
            final Color primary;
            final Color negative;
            final Color warning;
            final Color shimmer;
        
          .................
          .................
        }
        
```
-------------------------------------------------

In this file [lib/core/config/config.dart](lib/core/config/config.dart) your application themes are initialized. Basically two types of theme (Light, and Dark) Theme. Both themes are support Material 3 Library. For Instance If you want to change `Elevated Button Style` in your complete application then initialize the style here, in order to avoid Repeat your self again and again. you can change on your own
 

Use Custom Fonts [🔝](#table-of-contents)
-----------------------------------------

*   Add your custom font in [assets/fonts](assets/fonts) folder
*   Open [pubspec.yaml](pubspec.yaml) file and add your font like this
```yaml
        flutter:
              fonts:
                - family: Roboto
                  fonts:
                    - asset: assets/fonts/Roboto-Regular.ttf
                    - asset: assets/fonts/Roboto-Bold.ttf
```     
    
*   Then Run this command
```sh    
      flutter pub get
```          
    
*   Now you can use your custom font in your application
*   For Instance
```dart
        Text(
             'Hello World',
             style: TextStyle(
               fontFamily: 'Roboto',
               fontSize: 24,
               fontWeight: FontWeight.bold,
             ),
            );
```            
    

Change Application Constant Value [🔝](#table-of-contents)
----------------------------------------------------------

All types of Application constants values are initialed here you can change it here

*   [Constants Folder](lib/core/shared/constants.dart)

Project Structures - Clean Architectures [🔝](#table-of-contents)
-----------------------------------------------------------------

![Clean Architecture](https://blog.cleancoder.com/uncle-bob/images/2012-08-13-the-clean-architecture/CleanArchitecture.jpg)

    lib
        ├── core
        │   ├── config
        │   │   ├── dependencies/
        │   │   ├── network_certification.dart
        │   │   ├── config.dart
        │   │   │   
        │   ├── shared
        │   │   │   ├── error/
        │   │   │   ├── extension/
        │   │   │   ├── remote/
        │   │   │   └── resource/
        │   │   │   ├── theme/
        │   │   │   ├── enums.dart
        │   │   │   ├── loading_indicator.dart 
        │   │   │   └── resource.dart
        │   │   │   └── ppp_constants.dart
        │   │   │   └── text_styles.dart
        │   │   │   └── snackbar.dart
        │   │   │   └── router.dart
        │   │   │   └── scheme.dart
        └── features
            └── `features_name`
                   ├── `data`
                   │    ├── `data_source`
                   │    ├── `models`
                   │    ├── `repository`
                   ├── `domain`
                   │   ├── `entities`
                   │   ├── `repository`
                   │   ├── `use_case`
                   ├── `presentation`
                        ├── `bloc`
                        ├── `pages`
                        ├── `widgets`
        


[Features](lib/features/) [🔝](#table-of-contents)
============================
*   [Onboarding](lib/features/onboarding/)
*   [Login](lib/features/login)
*   [Signup](lib/features/signup)
*   [Profile](lib/features/profile)
*   [Forgot Password](lib/features/forgot_password)
*   [Reset Password](lib/features/reset_password)
*   [Invite Friends](lib/features/invite_friends)
*   [Home](lib/features/home)
*   [Restaurant](lib/features/restaurant)
*   [History](lib/features/history)
*   [Notification](lib/features/notification)
*   [Reals](lib/features/reals)
*   [FAQ](lib/features/faq)
*   [Privacy Policy](lib/features/privacy_policy)


State management [🔝](#table-of-contents)
-----------------------------------------

![Bloc](https://i.imgur.com/dPoWwQf.png)  
* [Flutter BloC](https://bloclibrary.dev/#/gettingstarted)
* [Mason](https://pub.dev/packages/mason)
* [Fgen](https://pub.dev/packages/flutter_asset_generator)

Application Routing [🔝](#table-of-contents)
--------------------------------------------

For Application Routing, we are using [GoRouter](https://pub.dev/packages/go_router) package

*   To Create New Screen
    
    *   Save route name in each page like string
    ```dart
          class DashboardPage extends StatefulWidget {
                  static const String path = '/dashboard';
                  static const String name = 'DashboardPage';
                  const DashboardPage({super.key});
              }
    ```   
    
*   Register your route in [lib/core/shared/router.dart](lib/core/shared/router.dart) Sample Code
    ```dart
          final rootNavigationKey = GlobalKey<NavigatorState>();
              final dashBoardNavigationKey = GlobalKey<NavigatorState>();
            
              final router = GoRouter(
                  navigatorKey: rootNavigationKey,
                  initialLocation: WelcomePage.path,
                  routes: [
                      GoRoute(
                      path: WelcomePage.path,
                      name: WelcomePage.name,
                      builder: (context, state) => const WelcomePage(),
                      ),
                  ]
              );
            
    ```

*   Navigate to the page
    ```dart
              GoRouter.of(context).goTo(DashboardPage.path);
    ```
    
*   Navigate to the page with arguments
    ```dart
              GoRouter.of(context).goTo(DashboardPage.path, arguments: {'id': 1});
    ```     
    
*   Navigate to the page with arguments and return value
    ```dart
              final result = await GoRouter.of(context).goTo(DashboardPage.path, arguments: {'id': 1});
    ```
*   Navigate to the page with arguments and return value
    ```dart
              final result = await GoRouter.of(context).goTo(DashboardPage.path, arguments: {'id': 1});
     ```       
    

## Plugins [🔝](#table-of-contents)
| Package                        | Version  |
|--------------------------------|-----------|
| cached_network_image           | ^3.4.1    |
| chewie                         | ^1.8.5    |
| collection                     | ^1.18.0   |
| cupertino_icons                | ^1.0.8    |
| custom_rating_bar              | ^3.0.0    |
| either_dart                    | ^1.0.0    |
| equatable                      | ^2.0.5    |
| flutter                        | sdk: flutter |
| flutter_animate                | ^4.5.0    |
| flutter_bloc                   | ^8.1.6    |
| flutter_dotenv                 | ^5.2.1    |
| flutter_inappwebview           | ^6.1.4    |
| flutter_launcher_icons         | ^0.14.0   |
| flutter_native_splash          | ^2.4.1    |
| flutter_screenutil             | ^5.9.3    |
| flutter_svg                    | ^2.0.10+1 |
| flutter_typeahead              | ^5.2.0    |
| geolocator                     | ^13.0.1   |
| get_it                         | ^8.0.0    |
| go_router                      | ^14.2.7   |
| google_fonts                   | ^6.2.1    |
| google_maps_flutter            | ^2.9.0    |
| http                           | ^1.2.2    |
| hydrated_bloc                  | ^9.1.5    |
| image_picker                   | ^1.1.2    |
| in_app_update                  | ^4.2.3    |
| internet_connection_checker    | ^1.0.0+1  |
| intl                           | ^0.19.0   |
| lottie                         | ^3.1.2    |
| modal_bottom_sheet             | ^3.0.0    |
| package_info_plus              | ^8.0.2    |
| path_provider                  | ^2.1.4    |
| pin_code_fields                | ^8.0.1    |
| timeago                        | ^3.7.0    |
| url_launcher                   | ^6.3.1    |
| video_player                   | ^2.9.2    |

## Dev Plugins [🔝](#table-of-contents)
| Package                        | Version   |
|--------------------------------|-----------|
| change_app_package_name         | ^1.4.0    |
| flutter_lints                   | ^4.0.0    |
| flutter_test                    | sdk: flutter |




![](https://avatars.githubusercontent.com/u/179485439?s=96&v=4)

Contact Us
----------

We'd love to hear from you!

3rd Floor, House 31, Road 10, Sector 6

Uttara, Dhaka-1230, Bangladesh

* * *

[Go To Table of Contents](#table-of-contents)

* * *