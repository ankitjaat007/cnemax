import 'package:flutter/material.dart';

class My_appBar extends StatelessWidget {
  My_appBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: const [
        Icon(
          Icons.notifications_none_outlined,
          color: Colors.black,
          size: 30,
        )
      ],
      title: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Location',
            style: TextStyle(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.w100),
          ),
          Text(
            'New York',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
          )
        ],
      ),
      leading: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black), shape: BoxShape.circle),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }
}
