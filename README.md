# dot_connect_flutter

App for Braille teaching and Braille recognition. This is a part of google solution challenge. (Team Connecting-the-Dots, GDSC Yonsei)

You can find other part of our solution in this [repository](https://github.com/inshining/ConnetingTheDots-GDSC-Solution-Challenge-2023).

</br></br>

## APK
Dowload apk for android [HERE!](https://drive.google.com/file/d/1E8bA4USMCyfeo7sZTLlj5UNWw3JewiZR/view?usp=sharing)

</br>

## Run Code locally
if you wish to run this code locally, follow the steps bellow

1. install dependency
2. skip login code (you cannot use google login since you don't have the build key)
3. check out the rest of our code

</br></br>

## About Project
### Core Concept
1. Braille Recognition
2. Braille Teaching
3. Social Awareless for Braille

</br>

### Tech Dependences
1. Network : [Dio](https://github.com/flutterchina/dio)

2. State ManageMent: [Riverpod](https://riverpod.dev/)

3. ML Interpreter: [flutter_pytorch](https://pub.dev/packages/flutter_pytorch)

4. [Firebase](https://pub.dev/packages/firebase_core)


</br></br>

## Architecture
This project's architecture was inspired by [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html), [Bloc](https://pub.dev/packages/bloc) and [MVVM](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93viewmodel)

```
lib
├── core
│   └── tflite
│       ├── classifier.dart
│       ├── constant.dart
│       ├── recognition.dart
│       └── stats.dart
├── data
│   ├── local
│   │   ├── database
│   │   │   ├── db_schema.dart
│   │   │   ├── local_db.dart
│   │   │   └── use_case.dart
│   │   └── shared_preference
│   │       ├── shared_pref.dart
│   │       ├── shared_pref_keys.dart
│   │       └── use_case.dart
│   └── remote
│       ├── dio
│       │   ├── base_dio.dart
│       │   └── interceptor.dart
│       ├── network.dart
│       ├── network_const.dart
│       ├── network_data
│       │   ├── request
│       │   │   └── request_data.dart
│       │   └── response
│       │       └── response_data.dart
│       └── use_case
│           └── search_api_use_case.dart
├── entities
│   └── braille_info_page_entity.dart
├── firebase_options.dart
├── main.dart
├── ui
│   ├── constants
│   │   ├── fixed_data.dart
│   │   └── theme.dart
│   ├── pages
│   │   ├── app_main.dart
│   │   ├── braille_detail_page
│   │   │   ├── braille_detail_page.dart
│   │   │   └── braille_detail_vm.dart
│   │   ├── braille_info_list_page
│   │   │   ├── braill_info_list_vm.dart
│   │   │   ├── braille_info_list_page.dart
│   │   │   ├── list_braille_infos.dart
│   │   │   ├── single_info_row.dart
│   │   │   └── title_braille_info.dart
│   │   ├── home_page
│   │   │   ├── appbar_home.dart
│   │   │   ├── home_page.dart
│   │   │   ├── home_page_detail.dart
│   │   │   ├── home_vm.dart
│   │   │   ├── logout_btn.dart
│   │   │   └── option_list.dart
│   │   ├── login_page
│   │   │   ├── google_login_btn.dart
│   │   │   ├── login_page.dart
│   │   │   └── login_vm.dart
│   │   ├── report_page
│   │   │   ├── report_page.dart
│   │   │   └── report_vm.dart
│   │   ├── search_page
│   │   │   ├── search_detail
│   │   │   │   ├── search_detail_input.dart
│   │   │   │   └── search_page_detail.dart
│   │   │   ├── search_simple
│   │   │   │   ├── search_body.dart
│   │   │   │   └── search_page.dart
│   │   │   └── search_vm.dart
│   │   └── translate_cam_page
│   │       ├── box_widget.dart
│   │       ├── camera_view.dart
│   │       ├── camera_view_singleton.dart
│   │       ├── translate_cam_page.dart
│   │       └── translate_cam_vm.dart
│   ├── states
│   │   └── view_mode_state.dart
│   └── widgets
│       ├── black_btn.dart
│       ├── logo_widget.dart
│       ├── main_appbar.dart
│       ├── text_sized
│       │   ├── text_large.dart
│       │   ├── text_medium.dart
│       │   ├── text_small.dart
│       │   ├── text_with_margin.dart
│       │   └── text_xlarge.dart
│       └── title_text_large.dart
└── utils
    ├── image_utils.dart
    ├── isolate_utils.dart
    ├── language_util.dart
    └── route
        └── route_util.dart

```