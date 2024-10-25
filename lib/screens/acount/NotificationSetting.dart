import 'package:cnemax/components/onOffButton.dart';
import 'package:cnemax/services/text_styleSheet.dart';
import 'package:flutter/material.dart';

class Notification_setting extends StatelessWidget {
  const Notification_setting({super.key});

  @override
  Widget build(BuildContext context) {
    bool on = true;
    bool off = false;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Appcolor.black,
        title: Text("Notification"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OnOffButton(title: 'Booking Conformation', Value: on),
              OnOffButton(title: 'Movie Releases', Value: on),
              OnOffButton(title: 'Ticket Reminders', Value: on),
              OnOffButton(title: 'Exclusive Offers', Value: on),
              OnOffButton(title: 'seat Avaliidtity Alert', Value: on),
              OnOffButton(title: 'Other Update', Value: off),
              OnOffButton(title: 'Movie Reviews and Ratings ', Value: on),
              OnOffButton(title: 'Nearly Cinema', Value: on),
              OnOffButton(title: 'Acount Activity', Value: off),
              OnOffButton(title: 'App Update', Value: on),
              OnOffButton(title: 'Payment Reminder', Value: on),
              OnOffButton(title: 'Movie Shedule  Change', Value: on),
              OnOffButton(title: 'Refunds  & Cancellations', Value: on),
            ],
          ),
        ),
      ),
    );
  }
}
