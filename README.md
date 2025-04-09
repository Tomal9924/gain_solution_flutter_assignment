# Flutter assignment - Documentation by [Tanvir Ahmed]

Created: 09/04/2025  
By: [Tanvir Ahmed]  
Email: [tomalahmed350@gmail.com](mailto:tomalahmed350@gmail.com)



![Flutter assignment Logo](https://i.imgur.com/7sx5g2b.png)

---
[![Download APK](https://img.shields.io/badge/Download-APK-blue?style=for-the-badge)](https://drive.google.com/drive/folders/1w1RLDfmNA2_0h-OXWYMHobWRmYz3NZIQ?usp=drive_link)


## Table of Contents
- [Flutter assignment - Documentation](#Flutter assignment---> Documentation-by-Tanvir Ahmed)
  - [Change Application Colors 🔝](#change-application-colors-)
    - [Sample Code](#sample-code)
  - [Use Custom Fonts 🔝](#use-custom-fonts-)
  - [Change Application Constant Value 🔝](#change-application-constant-value-)
  - [Project Structures - Clean Architectures 🔝](#project-structures---clean-architectures-)
  - [Features 🔝](#features-)
  - [Screenshots 🔝](#screenshots-)
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

## Splash Screen
![Splash](https://i.imgur.com/mH4nEtO.png) 

## Tickets Management
- The app displays a list of support tickets with details such as ticket ID, subject, priority, status, and creation date.
- Tickets can be marked with statuses like "New," "First response overdue," or "Customer responded."
- Each ticket includes metadata like the creator's name (e.g., Michele, Noah, Jonus) and timestamp (e.g., 23 Dec 2023 03:43 pm).
- A filter option allows users to narrow down tickets by brand (e.g., GainSolution), priority, and tags.
![Ticket](https://i.imgur.com/H7yql96.jpeg) 
## Contacts Management
- The app has a contacts section where users can search for and view contact details.
- Contact information includes name, email, phone number, and address (e.g., Michele Kahnwald, michele@email.com, +12 34 56 78 90, 12A, Lillistrom, Norway).
- Users can filter contacts by name (e.g., searching for "Michele").
![Contacts](https://i.imgur.com/r83RXWo.jpeg) 
## Profile Management
- The app includes a "My Profile" section where users can view and edit their personal information.
- Profile details include the user's name (e.g., Jonaus Kahnwald), email (e.g., username@email.com), and assigned roles (e.g., Manager, Agent).
- Roles are associated with groups (e.g., Codecanyon support, Marvel team) and include team members (e.g., Jonaus Kahnwald, Lana Si).
- There is a logout option for the user to sign out of the app.
![Profile](https://i.imgur.com/WayOvAc.jpeg) 
## Filtering and Tagging
- The app provides a filtering mechanism for tickets, allowing users to filter by brand (e.g., GainSolution, GainHQ), priority, and tags.
- Tags are predefined (e.g., Tag one, Tag two, Tag three with long text) and can be searched or selected to refine ticket visibility.
![Filter](https://i.imgur.com/C3Nctfv.jpeg) 
### Customized Filter by API
- **Access**: The Customized Filter by API is likely accessible through the same filter icon on the Tickets screen but may be a secondary option or dynamically loaded based on API data.
- **Purpose**: This filter allows for dynamic filtering options that are fetched from an API, enabling more flexibility and customization based on the backend configuration.
- **Components**:
  - **Dynamic Brand Selection**:
    - Brands are fetched from the API, allowing the list to be updated dynamically (e.g., new brands like "GainHQ" could be added without app updates).
    - Similar to the Global Filter, users can select multiple brands using checkboxes.
  - **Dynamic Priority Selection**:
    - Priority options are retrieved from the API, potentially including custom priority levels beyond the predefined ones (e.g., "Critical," "Medium").
    - Presented in a dropdown menu similar to the Global Filter.
  - **Dynamic Tags Selection**:
    - Tags are fetched from the API, allowing for a more extensive or updated list compared to the predefined tags in the Global Filter.
    - Users can search for tags using a search bar and select multiple tags, similar to the Global Filter.
    - Example tags might include new or updated labels not present in the Global Filter (e.g., "Tag eight," "Tag nine").

![Profile](https://i.imgur.com/QEvQray.jpeg) 
## Contacts Search
- The app provides a search bar in the Contacts section, allowing users to search for contacts by name.
- The search bar is prominently displayed at the top of the Contacts screen with a placeholder text "Search contact" and a magnifying glass icon.
- As the user types a query (e.g., "Michele"), the app filters the contact list in real-time to display matching results.
- Search results show contact details such as name, email, phone number, and address (e.g., Michele Kahnwald, michele@email.com, +12 34 56 78 90, 12A, Lillistrom, Norway).

![Contact-Search](https://i.imgur.com/Rrmpnfk.jpeg) 
## Contacts Popup Menu

- **Trigger**: The popup menu is displayed when the user taps the three-dot icon (more options) located to the right of a contact's name in the Contacts list (e.g., next to "Michele Kahnwald").

- **Options**:
  - **Edit**:
    - The first option in the popup menu.
    - Allows the user to edit the contact's details (e.g., name, email, phone number, address).
  - **View Tickets**:
    - The second option in the popup menu.
    - Enables the user to view all tickets associated with the selected contact (e.g., tickets created by or assigned to Michele Kahnwald).
  - **Delete**:
    - The third option in the popup menu.
    - Allows the user to delete the contact from the list.
    - This action is likely to prompt a confirmation dialog to prevent accidental deletion.


![Contact-popup](https://i.imgur.com/bp0pSuz.jpeg)

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
