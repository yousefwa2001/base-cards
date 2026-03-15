import 'package:flutter/material.dart';

import '../extensions/context_typography_extension.dart';

class ResponsiveText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Color? color;
  final int maxLines;
  final TextAlign textAlign;
  final TextOverflow overflow;

  const ResponsiveText(
    this.text, {
    super.key,
    this.style,
    this.color,
    this.maxLines = 1,
    this.textAlign = TextAlign.start,
    this.overflow = TextOverflow.ellipsis,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        maxLines: maxLines,
        textAlign: textAlign,
        overflow: overflow,
        style: (style ?? context.regular12()).copyWith(color: color),
      ),
    );
  }
}
