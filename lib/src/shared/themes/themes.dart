import 'package:flutter/material.dart';

import '../definitions/const_values.dart';
import 'custom_color.dart';

part 'color_schemes.dart';

ThemeData get darkTheme => ThemeData(
      useMaterial3: true,
      colorScheme: _darkColorScheme,
      extensions: [darkCustomColors],
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: _darkColorScheme.primaryContainer,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: _darkColorScheme.primary,
        foregroundColor: _darkColorScheme.onPrimary,
      ),
      segmentedButtonTheme: _segmentButtomTheme,
    );

ThemeData get lightTheme => ThemeData(
      useMaterial3: true,
      colorScheme: _lightColorScheme,
      extensions: [lightCustomColors],
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: _lightColorScheme.primaryContainer,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: _lightColorScheme.primary,
        foregroundColor: _lightColorScheme.onPrimary,
      ),
      segmentedButtonTheme: _segmentButtomTheme,
    );

SegmentedButtonThemeData get _segmentButtomTheme => SegmentedButtonThemeData(
      style: ButtonStyle(
        alignment: Alignment.center,
        iconSize: MaterialStateProperty.resolveWith<double?>((states) {
          if (states.contains(MaterialState.selected)) {
            return ConstValues.iconSizeExtraSmaller;
          }
          return ConstValues.iconSizeSmall;
        }),
        textStyle: MaterialStateProperty.resolveWith<TextStyle?>((states) {
          if (states.contains(MaterialState.selected)) {
            return const TextStyle(
              fontSize: ConstValues.fontSizeExtraSmall,
              fontWeight: ConstValues.fontWeightMedium,
            );
          }
          return const TextStyle(
            fontSize: ConstValues.fontSizeSmall,
          );
        }),
      ),
    );
