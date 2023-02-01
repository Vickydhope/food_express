import 'package:flutter/material.dart';
import 'package:food_express/res/drawables.dart';

class ScreenBackground extends StatelessWidget {
  const ScreenBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) {
        return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.black,
            Colors.black,
            Colors.black,
            Colors.black,
          ],
        ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
      },
      blendMode: BlendMode.multiply,
      child: Image.asset(
        width: double.infinity,
        height: double.infinity,
        screenBgImage,
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
      ),
    );
  }
}
