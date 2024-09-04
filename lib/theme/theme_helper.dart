import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

String _appTheme = "primary";

class ThemeHelper {
  final Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors(),
  };

  final Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme,
  };

  void changeTheme(String _newTheme) {
    _appTheme = _newTheme;
  }

  PrimaryColors _getThemeColors() {
    if (!_supportedCustomColor.containsKey(_appTheme)) {
      throw Exception(
        "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner",
      );
    }
    return _supportedCustomColor[_appTheme]!;
  }

  ColorScheme _getColorScheme() {
    if (!_supportedColorScheme.containsKey(_appTheme)) {
      throw Exception(
        "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner",
      );
    }
    return _supportedColorScheme[_appTheme]!;
  }

  ThemeData _getThemeData() {
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: _getColorScheme(),
      textTheme: TextThemes.textTheme(),
      scaffoldBackgroundColor: _getColorScheme().onError,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: appTheme.gray,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: appTheme.pink500,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: appTheme.pink500,
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return _getColorScheme().primary;
          }
          return _getColorScheme().onSurface;
        }),
        side: const BorderSide(
          width: 1,
        ),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: appTheme.black900,
        selectionColor: appTheme.cyan200,
        selectionHandleColor: appTheme.pink500,
      ),
      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 1,
        color: appTheme.blueGray50,
      ),
    );
  }

  PrimaryColors themeColor() => _getThemeColors();

  ThemeData themeData() => _getThemeData();
  TextTheme textTheme() => TextThemes.textTheme();
}

class TextThemes {
  static TextTheme textTheme() => const TextTheme(
      bodyLarge: TextStyle(
        color: Color.fromRGBO(35, 86, 178, 1),
        fontSize: 16,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        color: Color.fromRGBO(35, 86, 178, 1),
        fontSize: 32,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
      ),
      bodySmall: TextStyle(
        color: Color.fromRGBO(35, 86, 178, 1),
        fontSize: 12,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
      ),
      // displayMedium: TextStyle(
      //   color: Colors.black,
      //   fontSize: 40,
      //   fontFamily: 'Poppins',
      //   fontWeight: FontWeight.w400,
      // ),
      // labelLarge: TextStyle(
      //   color: Colors.black,
      //   fontSize: 12,
      //   fontFamily: 'Poppins',
      //   fontWeight: FontWeight.w500,
      // ),
      // labelMedium: TextStyle(
      //   color: Colors.black,
      //   fontSize: 10,
      //   fontFamily: 'Poppins',
      //   fontWeight: FontWeight.w600,
      // ),
      labelSmall: TextStyle(
        color: Colors.white,
        fontSize: 11,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
      )
      // titleLarge: TextStyle(
      //   color: Colors.black,
      //   fontSize: 20,
      //   fontFamily: 'Poppins',
      //   fontWeight: FontWeight.w500,
      // ),
      // titleMedium: TextStyle(
      //   color: Colors.black,
      //   fontSize: 16,
      //   fontFamily: 'Poppins',
      //   fontWeight: FontWeight.w500,
      // ),
      // titleSmall: TextStyle(
      //   color: Colors.blue,
      //   fontSize: 14,
      //   fontFamily: 'Poppins',
      //   fontWeight: FontWeight.w500,
      // ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static const primaryColorScheme = ColorScheme.light(
    primary: Color.fromRGBO(35, 86, 178, 1),
    primaryContainer: Color.fromRGBO(35, 86, 178, 1),
    secondary: Color.fromRGBO(25, 107, 254, 1),
    secondaryContainer: Color.fromRGBO(25, 107, 254, 1),
  );
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  Color get primary => const Color.fromRGBO(35, 86, 178, 1);
  Color get secondary => const Color.fromRGBO(25, 107, 254, 1);
  //white
  Color get white => const Color(0XFFFFFFFF);
  // Amber
  Color get amberA200 => const Color(0XFFFFD347);
  Color get amberA20001 => const Color(0XFFFFD747);

  // Black
  Color get black900 => const Color(0XFF000000);

  // BlueGray
  Color get blueGray100 => const Color(0XFFCED3D6);
  Color get blueGray300 => const Color(0XFF909BA3);
  Color get blueGray50 => const Color(0XFFEBEEF0);
  Color get blueGray600 => const Color(0XFF5A6770);

  // Cyan
  Color get cyan200 => const Color(0XFF80D2DD);
  Color get cyan50 => const Color(0XFFE6F6F8);

  // DeepOrange
  Color get deepOrange100 => const Color(0XFFFCC4AE);

  // Gray
  Color get gray => const Color.fromRGBO(143, 143, 143, 1);
  Color get gray300 => const Color(0XFFE0E0DE);
  Color get gray50 => const Color(0XFFFFF2F9);

  // Pink
  Color get pink100 => const Color(0XFFFF99D5);
  Color get pink300 => const Color.fromARGB(255, 255, 66, 180);
  Color get pink500 => const Color(0XFFED008B);

  // Red
  Color get red => Colors.red;
  Color get red50 => const Color(0XFFFEECF7);
  //green
  Color get green => const Color.fromRGBO(0, 139, 39, 1);
  // Teal
  Color get teal300 => const Color(0XFF32A9B9);
  Color get teal400 => const Color(0XFF31A8B8);
  Color get teal50 => const Color(0XFFD3EFF2);
}

PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();
TextTheme get textTheme => ThemeHelper().textTheme();

extension on TextStyle {
  TextStyle get Poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }
}
