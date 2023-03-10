import 'package:flutter/cupertino.dart';

class SmallText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  double height;

  SmallText(
      {Key? key,
      this.color,
      required this.text,
      this.size = 0,
      this.height = 12})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size == 0 ? 12 : size,
      ),
    );
  }
}
