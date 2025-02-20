import 'package:flutter/material.dart';

import '../data/app_color.dart';
import '../data/app_font.dart';


extension GenThemeTextStyleExtension on TextStyle {
  
  {{#colorsListExtension}}
  TextStyle get {{name}} => copyWith(
    color: AppColor.{{name}}
  );
  {{/colorsListExtension}}
  {{#fontWeights}}
  TextStyle get w{{.}} => copyWith(
    fontWeight: FontWeight.w{{.}}
  );
  {{/fontWeights}}
  {{#fontSizes}}
  TextStyle get {{name}} => copyWith(
    fontSize: AppFont.{{name}}
  );
  {{/fontSizes}}


  {{#weightData}}
  TextStyle get {{name}} => copyWith(
    fontWeight: FontWeight.{{weight}}
  );
  {{/weightData}}

}
