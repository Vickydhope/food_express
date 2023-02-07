import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ImageFullScreenWrapperWidget extends StatelessWidget {
  final Image child;
  final bool? dark;

  const ImageFullScreenWrapperWidget({
    super.key,
    required this.child,
    this.dark,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context, rootNavigator: true).push(
          PageRouteBuilder(
            fullscreenDialog: true,
            transitionDuration: const Duration(milliseconds: 100),
            reverseTransitionDuration: const Duration(milliseconds: 100),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                ScaleTransition(
                  scale: animation,
                  child: child,
                ),
            opaque: false,
            pageBuilder: (BuildContext context, _, __) {
              return FullScreenPage(
                dark: dark ?? MediaQuery
                    .of(context)
                    .platformBrightness == Brightness.dark,
                child: child,
              );
            },
          ),
        );
      },
      child: child,
    );
  }
}

class FullScreenPage extends StatefulWidget {
  const FullScreenPage({
    super.key,
    required this.child,
    required this.dark,
  });

  final Image child;
  final bool dark;

  @override
  _FullScreenPageState createState() => _FullScreenPageState();
}

class _FullScreenPageState extends State<FullScreenPage> {
  @override
  void initState() {
    var brightness = widget.dark ? Brightness.light : Brightness.dark;
    var color = widget.dark ? Colors.black12 : Colors.white70;

    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: color,
      statusBarColor: color,
      statusBarBrightness: brightness,
      statusBarIconBrightness: brightness,
      systemNavigationBarDividerColor: color,
      systemNavigationBarIconBrightness: brightness,
    ));
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      // Restore your settings here...
    ));
    super.dispose();
  }

  var initialControllerValue;

  var controller = TransformationController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.dark ? Colors.black : Colors.white,
      body: Stack(
        children: [
          Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 333),
                curve: Curves.fastOutSlowIn,
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: InteractiveViewer(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  boundaryMargin: const EdgeInsets.all(100),
                  minScale: 0.5,
                  panEnabled: false,
                  maxScale: 4,
                  constrained: true,
                  onInteractionStart: (details) {
                    initialControllerValue = controller.value;
                  },
                  onInteractionEnd: (details) {
                    controller.value = initialControllerValue;
                  },
                  transformationController: controller,
                  child: widget.child,
                ),
              ),
            ],
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topLeft,
              child: MaterialButton(
                padding: const EdgeInsets.all(15),
                elevation: 0,
                color: widget.dark ? Colors.black12 : Colors.white70,
                highlightElevation: 0,
                minWidth: double.minPositive,
                height: double.minPositive,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                onPressed: () => Navigator.of(context).pop(),
                child: Icon(
                  Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
                  color: widget.dark ? Colors.white : Colors.black,
                  size: 25,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
