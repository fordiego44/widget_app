import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme.dart';

// Listado de colores inmutables
final colorListProvider = Provider<List<Color>>((ref) => colorList);

// Un simple boolean
final isDarkmodeProvider = StateProvider<bool>((ref) => false);

// Un simple int
final selectedColorProvider = StateProvider<int>((ref) => 0);

// Un objeto de tipo AppTheme (custom)
final themeNitifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

// Controller o Notifier
class ThemeNotifier extends StateNotifier<AppTheme> {
  // STATE = Estado = new AppTheme();
  ThemeNotifier() : super(AppTheme());

  void toggleDarkmode() {
    state = state.copyWith(isDarkmode: !state.isDarkmode);
  }

  void changeColorIndex( int colorIndex ) {
    state = state.copyWith(selectedColor: colorIndex);
  }
}
