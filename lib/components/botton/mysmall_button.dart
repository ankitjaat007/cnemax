import 'package:cnemax/services/text_styleSheet.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class My_small_button extends StatelessWidget {
  Function ontap;
  My_small_button({super.key, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => ontap(),
      child: Row(
        children: [
          Text(
            'View All',
            style: TextStyle(color: Appcolor.black),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Appcolor.black,
            size: 15,
          )
        ],
      ),
    );
  }
}
