import 'package:cnemax/components/botton/icon_button.dart';
import 'package:cnemax/components/my_chip.dart';
import 'package:cnemax/models/allModel.dart';
import 'package:cnemax/screens/movie_payment/movie_payment.dart';
import 'package:cnemax/services/app_services.dart';
import 'package:cnemax/services/text_styleSheet.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Select_seat extends StatefulWidget {
  Movie_model model;
  Select_seat({super.key, required this.model});

  @override
  State<Select_seat> createState() => _Select_seatState();
}

class _Select_seatState extends State<Select_seat> {
  List<int> selectVIPseats = [];
  List<int> selectedSeats = [];
  int seatprize = 45;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Icon_Button(
          btnName: "Continue",
          onpressed: () {
            App_Service.push_to_screen(
                Movie_payment(
                    model: widget.model,
                    selectedSeats:
                        selectedSeats.map((e) => e.toString()).toList()),
                context);
          },
          textclr: Appcolor.white,
          bgcolor: Appcolor.orange,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Appcolor.black,
        title: Text('Choose Seat'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Wrap(
              alignment: WrapAlignment.center,
              children: List.generate(
                  10,
                  (index) => Select_seat_chip(
                      bCcolor:
                          selectVIPseats.any((element) => element == index),
                      ontap: () {
                        setState(() {
                          if (selectVIPseats
                              .any((element) => element == index)) {
                            selectVIPseats.remove(index);
                          } else {
                            selectVIPseats.add(index);
                          }
                        });
                      })),
            ),
            Wrap(
              alignment: WrapAlignment.center,
              children: List.generate(
                  63,
                  (index) => Select_seat_chip(
                      bCcolor: selectedSeats.any((element) => element == index),
                      ontap: () {
                        setState(() {
                          if (selectedSeats
                              .any((element) => element == index)) {
                            selectedSeats.remove(index);
                          } else {
                            selectedSeats.add(index);
                          }
                        });
                      })),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Color(0xffD9D9D9))),
                    ),
                    Text(' Availabe')
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                          color: Color(0xffD9D9D9),
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    Text(' Taken ')
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                          color: Appcolor.orange,
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    Text(' Selected')
                  ],
                )
              ],
            ),
            App_Service.add_Height(15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xffD9D9D9))),
                      height: 70,
                      width: App_Service.getscreenwidth(context),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Total Price'),
                          Text('${seatprize * selectedSeats.length}')
                        ],
                      ),
                    ),
                  ),
                  App_Service.add_Width(10),
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffD9D9D9))),
                        // height: 70,
                        width: App_Service.getscreenwidth(context),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Seates'),
                            Wrap(
                                children: List.generate(
                                    selectVIPseats.length,
                                    (index) => Container(
                                        margin: EdgeInsets.all(2),
                                        padding: EdgeInsets.all(2),
                                        color: Appcolor.orange,
                                        child: Text(
                                          "A${selectVIPseats[index]}",
                                          style:
                                              TextStyle(color: Appcolor.white),
                                        )))),
                            // Wrap(
                            //     children: List.generate(
                            //         selectedSeats.length,
                            //         (index) => ))
                            AspectRatio(
                              aspectRatio: 2.9,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: selectedSeats.length,
                                itemBuilder: (context, index) => Wrap(
                                  children: [
                                    Container(
                                        margin: EdgeInsets.all(2),
                                        padding: EdgeInsets.all(2),
                                        color: Appcolor.orange,
                                        child: Text(
                                          "F${selectedSeats[index]}",
                                          style:
                                              TextStyle(color: Appcolor.white),
                                        )),
                                  ],
                                ),
                              ),
                            )

                            // Container(
                            //     color: Appcolor.red,
                            //     child: Text("${selectedSeats.join(",f")}"))
                          ],
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
