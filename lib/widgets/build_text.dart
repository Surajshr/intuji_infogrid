import 'package:flutter/material.dart';
import 'package:intuji_infogrid/core/constants/app_constants.dart';

class BuildText extends StatelessWidget {
  const BuildText({
    super.key,
    this.text = '',
    this.fontSize,
    this.color = Colors.black,
    this.family = '',
    this.height = 1.1,
    this.letterSpacing,
    this.decoration = TextDecoration.none,
    this.textAlign = TextAlign.start,
    this.maxLines = 4,
    this.italics = false,
    this.fontWeight = FontWeight.w400,
    this.shadows,
    this.onTextPressed,
    this.overflow = TextOverflow.ellipsis,
  });

  final String text;
  final double? fontSize;
  final double height;
  final double? letterSpacing;
  final Color? color;
  final TextDecoration decoration;
  final TextAlign textAlign;
  final int? maxLines;
  final bool italics;
  final String? family;
  final List<Shadow>? shadows;

  final void Function()? onTextPressed;
  final FontWeight? fontWeight;
  final TextOverflow overflow;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTextPressed,
      child: Text(
        text,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: fontSize,
          fontFamily: AppConstants.kFontFamily,
          letterSpacing: letterSpacing,
          height: height,
          color: color ?? Colors.black,
          decoration: decoration,
          fontWeight: fontWeight,
          shadows: shadows,
          overflow: overflow,
        ),
      ),
    );
  }
}
