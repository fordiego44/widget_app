

import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme.dart';

// Listado de colores inmutables
final colorListProvider = Provider<List<Color>>((ref) => colorList);

// Un simple boolean
final  isDarkmodeProvider = StateProvider<bool>((ref) => false); 

// Un simple int
final  selectedColorProvider = StateProvider<int>((ref) => 0); 
