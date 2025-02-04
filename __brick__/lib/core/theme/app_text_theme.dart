import 'app_colors.dart';
import 'app_size.dart';
import 'package:flutter/widgets.dart';

class AppTextTheme {
  {{#textStyles}}
  static const {{name}} = TextStyle(fontSize : {{size}}, color: {{color}}, fontFamily: "{{fontFamily}}",);
  {{/textStyles}}
  
}
