import 'package:cnemax/services/text_styleSheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OnOffButton extends StatefulWidget {
  String title;
  bool Value;
  OnOffButton({super.key, required this.title, required this.Value});

  @override
  State<OnOffButton> createState() => _OnOffButtonState();
}

class _OnOffButtonState extends State<OnOffButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.title, style: AppTextStyle.fs16Normal),
        Transform.scale(
          scale: 0.7,
          child: CupertinoSwitch(
              activeColor: Color(0xffB73328),
              trackColor: Color(0xff9D9D9D),
              thumbColor: Colors.white,
              value: widget.Value,
              onChanged: (value) {
                setState(() {
                  widget.Value = value;
                });
              }),
        ),
      ],
    );
  }
}
