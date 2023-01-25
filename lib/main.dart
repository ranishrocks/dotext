import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'ui/pages/app_main.dart';

void main() {
  runApp(
    ProviderScope(
      child: MainApp()
    )
  );
}