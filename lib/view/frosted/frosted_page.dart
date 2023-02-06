import 'dart:ui';

import 'package:flutter/material.dart';

class FrostedPage extends StatelessWidget {
  const FrostedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ConstrainedBox(
              constraints: const BoxConstraints.expand(),
              child: const FlutterLogo()),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 15.0),
                child: Container(
                  width: 200.0,
                  height: 200.0,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300.withOpacity(0.5),
                  ),
                  child: Center(
                      child: Icon(
                    Icons.shopping_cart,
                    size: 50,
                  )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
