import 'package:mason/mason.dart';

import 'generator/generator.dart';

void run(HookContext context) {
  // Process Colors

  final formattedColors = colorGenerator(context);

  // Process Font Sizes

  final List<Map<String, dynamic>> formattedFontSizes =
      appSizeGenerator(context);

  final fontFamily = context.vars['fontFamily'] as String? ?? 'Inter';

  final List<Map<String, String>> textStyles = [];

  for (var color in formattedColors) {
    for (var fontSize in formattedFontSizes) {
      textStyles.add({
        'name': ('${color['name']}_' + "${fontSize['name']}").camelCase,
        'size': "AppFont.${fontSize['name']}",
        'color': "AppColor.${color['name']}",
        'fontFamily': fontFamily
      });
    }
  }

  final List<dynamic> colorsList =
      (context.vars['textExtension'] as List<dynamic>?) ?? [];
  final List<Map<String, dynamic>> textExtensions = [];
  for (var color in colorsList) {
    final isTheme = color["theme"] != null;
    for (var fontSize in formattedFontSizes) {
      textExtensions.add({
        'name': '${color["name"]}_${fontSize['name']}'.camelCase,
        'isTheme': isTheme,
        "noTheme": !isTheme,
        "isThemeNameLight":
            '${color["name"]}_light_${fontSize['name']}'.camelCase,
        "isThemeNameDark":
            '${color["name"]}_dark_${fontSize['name']}'.camelCase,
      });
    }
  }

  final List<dynamic> colorExtlist =
      (context.vars['colorExtension'] as List<dynamic>?) ?? [];
  final List<Map<String, dynamic>> colorExtension = [];
  for (var color in colorsList) {
    final isTheme = color["theme"] != null;

    colorExtension.add({
      'name': '${color["name"]}'.camelCase,
      'isTheme': isTheme,
      "noTheme": !isTheme,
      "isColorNameLight": '${color["name"]}_light'.camelCase,
      "isColorNameDark": '${color["name"]}_dark'.camelCase,
    });
  }

  context.vars = {
    'colors': formattedColors,
    'fontSizes': formattedFontSizes,
    'textStyles': textStyles,
    "textExtensions": textExtensions,
    "colorsExtension": colorExtension
  };
}
