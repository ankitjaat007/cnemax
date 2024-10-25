import 'package:cnemax/models/allModel.dart';
import 'package:cnemax/screens/cinema/bookCinema.dart';
import 'package:cnemax/screens/cinema/bookcinema2.dart';
import 'package:cnemax/services/app_services.dart';
import 'package:cnemax/services/text_styleSheet.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Allcinema_page extends StatefulWidget {
  List<Cinema_model> model;
  Movie_model? moviemodel;
  bool movietimepagebool;
  Allcinema_page(
      {super.key,
      required this.model,
      this.movietimepagebool = false,
      this.moviemodel});

  @override
  State<Allcinema_page> createState() => _Allcinema_pageState();
}

class _Allcinema_pageState extends State<Allcinema_page> {
  List<bool> color1 = List.filled(8, false);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...List.generate(
              widget.model.length,
              (index) => ListTile(
                    onTap: () {
                      App_Service.push_to_screen(
                          widget.movietimepagebool
                              ? Book_cenema_page2(
                                  cinemaModel: widget.model[index],
                                  moviemodel: widget.moviemodel,
                                )
                              : Book_Cinema_page(
                                  cinemaModel: widget.model[index],
                                ),
                          context);
                    },
                    leading: IconButton(
                        color: color1[index] ? Appcolor.orange : Appcolor.black,
                        onPressed: () {
                          setState(() {
                            color1[index] = !color1[index];
                          });
                        },
                        icon: Icon(Icons.star_border)),
                    title: Text(widget.model[index].cinema_name),
                    trailing: Icon(Icons.arrow_forward),
                  ))
        ],
      ),
    );
  }
}
