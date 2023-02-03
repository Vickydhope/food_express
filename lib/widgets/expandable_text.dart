import 'package:flutter/material.dart';
import 'package:food_express/res/colors.dart';

import 'package:food_express/widgets/small_text.dart';

class ExpandableTextWidgets extends StatefulWidget {
  final String text;
  final double textHeight;

  const ExpandableTextWidgets({
    Key? key,
    required this.text,
    this.textHeight = 200,
  }) : super(key: key);

  @override
  State<ExpandableTextWidgets> createState() => _ExpandableTextWidgetsState();
}

class _ExpandableTextWidgetsState extends State<ExpandableTextWidgets> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > widget.textHeight) {
      firstHalf = widget.text.substring(0, widget.textHeight.toInt());
      secondHalf = widget.text
          .substring(widget.textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(
              text: firstHalf,
              size: 18,
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SmallText(
                  text:
                      hiddenText ? ("$firstHalf...") : (firstHalf + secondHalf),
                  size: 16,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      SmallText(
                        text: hiddenText ? "Show more" : "Show less",
                        color: AppColors.colorMain,
                      ),
                      Icon(
                        hiddenText
                            ? Icons.arrow_drop_down
                            : Icons.arrow_drop_up,
                        color: AppColors.colorMain,
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
