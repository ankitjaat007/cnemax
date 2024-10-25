import 'package:cnemax/components/botton/icon_button.dart';
import 'package:cnemax/components/screen_widget/movie_image_contaner.dart';
import 'package:cnemax/models/allModel.dart';
import 'package:cnemax/services/app_services.dart';
import 'package:cnemax/services/text_styleSheet.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Movie_payment extends StatelessWidget {
  Movie_model model;
  List<String> selectedSeats;
  Movie_payment(
      {super.key, required this.model, this.selectedSeats = const []});

  @override
  Widget build(BuildContext context) {
    var hour = DateTime.now().hour;
    var min = DateTime.now().minute;
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Icon_Button(
          btnName: 'Continue to Payment',
          onpressed: () {},
          textclr: Appcolor.white,
          bgcolor: Appcolor.orange,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Appcolor.black,
        title: Text("Review Summary"),
        centerTitle: true,
        actions: [
          Center(
              child: Text(
            '$hour:$min',
            style: AppTextStyle.fs16Normal,
          )),
        ],
      ),
      body: Column(
        children: [
          Movie_datile_contanter(model: model),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(color: Color(0xffF4F4F4)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Booking Details',
                  style: AppTextStyle.fs20Medium,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('Cinema'), Text(model.movie_name)],
                      ),
                      App_Service.add_Height(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('Package'), Text('data')],
                      ),
                      App_Service.add_Height(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Seatlist'),
                          App_Service.add_Width(20),
                          Expanded(
                              child: Text(
                            "${selectedSeats.join(",F")}",
                            textAlign: TextAlign.right,
                          ))
                        ],
                      ),
                      App_Service.add_Height(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('Auditorium'), Text('data')],
                      ),
                      App_Service.add_Height(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('Date'), Text('data')],
                      ),
                      App_Service.add_Height(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('Hours'), Text('data')],
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
