import 'dart:ui';

import 'package:flutter/material.dart';

class FrostedBackgroundWidget extends StatelessWidget {
  final Widget child;
  final BorderRadius? borderRadius;
  final ImageFilter? imageFilter;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  const FrostedBackgroundWidget({Key? key,
    required this.child,
    this.borderRadius,
    this.imageFilter,
    this.margin,
    this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: imageFilter ?? ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
        child: Container(
          decoration: BoxDecoration(
            color: Theme
                .of(context)
                .appBarTheme
                .backgroundColor
                ?.withOpacity(0),),
          margin: margin,
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}
