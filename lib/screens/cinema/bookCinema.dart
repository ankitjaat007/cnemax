// import 'package:cnemax/components/my_chip.dart';
import 'package:cnemax/components/screen_widget/movie_image_contaner.dart';
import 'package:cnemax/controller/allController.dart';
import 'package:cnemax/models/allModel.dart';
import 'package:cnemax/screens/viewAllPage/BookNow.dart';
import 'package:cnemax/services/app_icon&image.dart';
import 'package:cnemax/services/app_services.dart';
import 'package:cnemax/services/text_styleSheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Book_Cinema_page extends StatefulWidget {
  Cinema_model cinemaModel;
  Book_Cinema_page({super.key, required this.cinemaModel});

  @override
  State<Book_Cinema_page> createState() => _Book_Cinema_pageState();
}

class _Book_Cinema_pageState extends State<Book_Cinema_page> {
  var dateindex = 0;
  var timeindex = 0;
  @override
  Widget build(BuildContext context) {
    var date = List.generate(
        4, (index) => DateTime.now().add(Duration(days: index)).day);
    var weekned = List.generate(
        6, (index) => DateTime.now().add(Duration(days: index)).weekday);

    // print(weekned);
    // print(date);
    //============================================
    //==========

    var aa = Provider.of<AllController>(context);
    var allmovie = aa.getallmovie;

    //============================================
    //==========

    // var filter = allmovie
    //     .where((element) =>
    //         element.movie_id ==
    //         cinemaModel.cinema_detlis.map((e) => e.movie_id))
    //     .toList();
    // print(filter);

    List<Movie_model> filter() {
      List<Movie_model> data = [];
      for (var i = 0; i < widget.cinemaModel.cinema_detlis.length; i++) {
        cinema_detlis_model db = widget.cinemaModel.cinema_detlis[i];
        List<Movie_model> alldata = allmovie
            .where((element) => element.movie_id == db.movie_id)
            .toList();
        data.addAll(alldata);
      }
      return data;
    }

    //==============================================
    //=================

    // ignore: unused_local_variable
    var filter2 = allmovie
        .where(
          (element) => element.cinema_name == widget.cinemaModel.cinema_name,
        )
        .toList();
    // print(filter2);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Appcolor.black,
        title: Text(widget.cinemaModel.cinema_name),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
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
                filter().length,
                (index) => Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                widget.cinemaModel.cinema_detlis[index].screen),
                            Text(
                                "auditorium ${widget.cinemaModel.cinema_detlis[index].auditorium}"),
                          ],
                        ),
                        Wrap(
                          spacing: 45,
                          children: [
                            ...List.generate(
                                widget.cinemaModel.cinema_detlis[index]
                                    .play_time.length,
                                (i) => GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          timeindex = i;
                                        });
                                      },
                                      child: Chip(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              side: BorderSide(
                                                  color: timeindex == i
                                                      ? Appcolor.orange
                                                      : Colors.black)),
                                          backgroundColor: timeindex == i
                                              ? Appcolor.orange
                                              : Colors.transparent,
                                          label: Text(
                                            widget
                                                .cinemaModel
                                                .cinema_detlis[index]
                                                .play_time[i]
                                                .toString(),
                                            style: TextStyle(
                                                color: timeindex == i
                                                    ? Appcolor.white
                                                    : Appcolor.black),
                                          )),
                                    ))
                          ],
                        ),
                        GestureDetector(
                            onTap: () {
                              App_Service.push_to_screen(
                                  Book_now(model: filter()[index]), context);
                            },
                            child:
                                Movie_datile_contanter(model: filter()[index])),
                      ],
                    ))
          ],
        ),
      ),
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

      default:
    }
  }
}
