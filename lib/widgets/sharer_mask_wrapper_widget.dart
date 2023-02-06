import 'package:flutter/material.dart';

class SharedMaskWrapperWidget extends StatelessWidget {
  const SharedMaskWrapperWidget({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) {
        return LinearGradient(
          end: Alignment.bottomCenter,
          begin: Alignment.topCenter,
          colors: [
            Theme.of(context).backgroundColor.withOpacity(0.7),
            Theme.of(context).backgroundColor.withOpacity(0.6),
            Theme.of(context).backgroundColor.withOpacity(0.1),
            Colors.transparent,
            Colors.transparent,
            Colors.transparent,
          ],
        ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
      },
      blendMode: BlendMode.lighten,
      child: child,
    );
  }
}
