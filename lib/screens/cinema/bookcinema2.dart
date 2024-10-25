import 'package:cnemax/components/botton/icon_button.dart';
import 'package:cnemax/models/allModel.dart';
import 'package:cnemax/screens/cinema/selectseat.dart';
import 'package:cnemax/services/app_icon&image.dart';
import 'package:cnemax/services/app_services.dart';
import 'package:cnemax/services/text_styleSheet.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Book_cenema_page2 extends StatefulWidget {
  Cinema_model cinemaModel;
  Movie_model? moviemodel;
  Book_cenema_page2({super.key, required this.cinemaModel, this.moviemodel});

  @override
  State<Book_cenema_page2> createState() => _Book_cenema_page2State();
}

class _Book_cenema_page2State extends State<Book_cenema_page2> {
  int dateindex = 0;
  int timeindex = 0;
  @override
  Widget build(BuildContext context) {
    final movietime = widget.cinemaModel.cinema_detlis
        .where((element) => element.movie_id == widget.moviemodel!.movie_id)
        .toList();

    var date = List.generate(
        5, (index) => DateTime.now().add(Duration(days: index)).day);
    var weekned = List.generate(
        6, (index) => DateTime.now().add(Duration(days: index)).weekday);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Appcolor.black,
        title: Text(widget.cinemaModel.cinema_name),
        centerTitle: true,
      ),
      body:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                Appimages.map,
                fit: BoxFit.cover,
                width: App_Service.getscreenwidth(context),
              ),
              Text(
                widget.cinemaModel.cinema_name,
                style: AppTextStyle.fs20Medium,
              ),
              Row(children: [
                ...List.generate(
                    widget.cinemaModel.rating,
                    (index) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        )),
                Text(
                  'Body Text Regular _16 ',
                  style: AppTextStyle.fs16Normal,
                )
              ]),
              Row(
                children: [
                  Icon(Icons.location_on),
                  Text(
                    widget.cinemaModel.address,
                    style: AppTextStyle.fs16Normal,
                  )
                ],
              ),
              Row(
                children: [
                  Icon(Icons.call),
                  Text(
                    widget.cinemaModel.phn_number,
                    style: AppTextStyle.fs16Normal,
                  )
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                        date.length,
                        (index) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  dateindex = index;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.all(5),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: dateindex == index
                                        ? Appcolor.orange
                                        : Colors.transparent,
                                    border: Border.all(
                                        color: dateindex == index
                                            ? Appcolor.orange
                                            : Appcolor.black),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  children: [
                                    Text(
                                      date[index].toString(),
                                      style: TextStyle(
                                          color: dateindex == index
                                              ? Appcolor.white
                                              : Appcolor.black),
                                    ),
                                    Text(
                                        weakend(
                                          weekned[index],
                                        ),
                                        style: TextStyle(
                                            color: dateindex == index
                                                ? Appcolor.white
                                                : Appcolor.black)),
                                  ],
                                ),
                              ),
                            ))
                  ],
                ),
              ),
              ...List.generate(
                  movietime.length,
                  (index) => Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(movietime[index].screen),
                              Text("auditorium ${movietime[index].auditorium}"),
                            ],
                          ),
                          Wrap(
                            spacing: 45,
                            children: [
                              ...List.generate(
                                  movietime[index].play_time.length,
                                  (i) => Chip(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          side:
                                              BorderSide(color: Colors.black)),
                                      backgroundColor: Colors.transparent,
                                      label: Text(movietime[index]
                                          .play_time[i]
                                          .toString())))
                            ],
                          ),
                        ],
                      ))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Icon_Button(
            btnName: "Continue",
            onpressed: () {
              App_Service.push_to_screen(
                  Select_seat(model: widget.moviemodel!), context);
            },
            textclr: Appcolor.white,
            bgcolor: Appcolor.orange,
          ),
        )
      ]),
    );
  }

  weakend(int i) {
    switch (i) {
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
        return 'Sunday';
    }
  }
}
