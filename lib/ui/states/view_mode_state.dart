import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ViewMode {simple, detail}

final ModeProvider = StateProvider<ViewMode>((ref){
  return ViewMode.simple;
});