# Flutter assignment - Documentation by [Tanvir Ahmed](https://Tanvir Ahmed.dev/) v1.0

Created: 19/11/2024  
By: [Tanvir Ahmed](https://Tanvir Ahmed.dev/)  
Email: [tomalahmed350@gmail.com](mailto:tomalahmed350@gmail.com)



![Flutter assignment Logo](https://i.imgur.com/7sx5g2b.png)

---

## Table of Contents
- [Flutter assignment - Documentation](#Flutter assignment---documentation-by-Tanvir Ahmed-v10)
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
    
*   Now i used the font and TextStyle form -()- [lib/core/shared/text_styles.dart](lib/core/shared/text_styles.dart)
*   For Instance
```dart
      static TextStyle caption({
          required BuildContext context,
          required Color color,
        }) {
          return GoogleFonts.montserrat(
            textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: color, fontWeight: FontWeight.w600, fontSize: 10.sp),
          );
        }
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
*   [Ticket](lib/features/tickets/)
*   [Contacts](lib/features/contacts/)
*   [Profile](lib/features/profile/)
*   [Filter](lib/features/filter/)
*   [Contact-Search](lib/features/contact/)


[Screenshots](lib/features/) [🔝](#table-of-contents)
============================
*   [Ticket](lib/features/tickets/)
![Ticket](https://i.imgur.com/H7yql96.jpeg) 
*   [Contacts](lib/features/contacts/)
![Contacts](https://i.imgur.com/r83RXWo.jpeg) 
*   [Profile](lib/features/profile/)
![Profile](https://i.imgur.com/WayOvAc.jpeg) 
*   [Filter](lib/features/filter/)
![Filter](https://i.imgur.com/C3Nctfv.jpeg) 
*   [Filter-with-custom-feature](lib/features/filter/)
![Profile](https://i.imgur.com/QEvQray.jpeg) 
*   [Contact-Search](lib/features/contact/)
![Contact-Search](https://i.imgur.com/Rrmpnfk.jpeg) 


State management [🔝](#table-of-contents)
-----------------------------------------


* [Flutter BloC](https://bloclibrary.dev/#/gettingstarted)
* [Mason](https://pub.dev/packages/mason)

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
    

*   Navigate to the page
    ```dart
             context.pushNamed(DashboardPage.name);
    ```

## Plugins [🔝](#table-of-contents)
- [`cupertino_icons`](https://pub.dev/packages/cupertino_icons): ^1.0.8  
- [`flutter_native_splash`](https://pub.dev/packages/flutter_native_splash): ^2.4.5  
- [`cached_network_image`](https://pub.dev/packages/cached_network_image): ^3.4.1  
- [`collection`](https://pub.dev/packages/collection): ^1.19.1  
- [`either_dart`](https://pub.dev/packages/either_dart): ^1.0.0  
- [`equatable`](https://pub.dev/packages/equatable): ^2.0.7  
- [`flutter_bloc`](https://pub.dev/packages/flutter_bloc): ^8.1.5  
- [`flutter_screenutil`](https://pub.dev/packages/flutter_screenutil): ^5.9.3  
- [`get_it`](https://pub.dev/packages/get_it): ^8.0.3  
- [`google_fonts`](https://pub.dev/packages/google_fonts): ^6.2.1  
- [`go_router`](https://pub.dev/packages/go_router): ^14.8.1  
- [`hydrated_bloc`](https://pub.dev/packages/hydrated_bloc): ^9.1.5  
- [`http`](https://pub.dev/packages/http): ^1.3.0  
- [`internet_connection_checker`](https://pub.dev/packages/internet_connection_checker): ^3.0.1  
- [`intl`](https://pub.dev/packages/intl): ^0.20.2  
- [`image_picker`](https://pub.dev/packages/image_picker): ^1.1.2  
- [`in_app_update`](https://pub.dev/packages/in_app_update): ^4.2.3  
- [`package_info_plus`](https://pub.dev/packages/package_info_plus): ^8.3.0  
- [`path_provider`](https://pub.dev/packages/path_provider): ^2.1.5  
- [`url_launcher`](https://pub.dev/packages/url_launcher): ^6.3.1  
- [`flutter_animate`](https://pub.dev/packages/flutter_animate): ^4.5.2  
- [`flutter_svg`](https://pub.dev/packages/flutter_svg): ^2.0.17  

## Dev Plugins [🔝](#table-of-contents)
| Package                        | Version   |
|--------------------------------|-----------|
| change_app_package_name         | ^1.4.0    |
| flutter_lints                   | ^4.0.0    |
| flutter_test                    | sdk: flutter |




![](https://i.imgur.com/7sx5g2b.png)
