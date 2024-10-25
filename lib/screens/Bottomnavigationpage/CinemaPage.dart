import 'package:cnemax/models/allModel.dart';
import 'package:cnemax/screens/cinema/allcinema/Allcinema.dart';
import 'package:cnemax/screens/cinema/allcinema/favouritecinema.dart';
import 'package:cnemax/services/app_icon&image.dart';
import 'package:cnemax/services/app_services.dart';
import 'package:cnemax/services/text_styleSheet.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Cinema_Page extends StatelessWidget {
  List<Cinema_model> cinemamodel;
  Movie_model? moviemodel;
  bool movietimepagebool;
  Cinema_Page(
      {super.key,
      required this.cinemamodel,
      this.movietimepagebool = false,
      this.moviemodel});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Appcolor.white,
            elevation: 0,
            centerTitle: true,
            title: Column(
              children: [
                Text('Cinema'),
                App_Service.add_Height(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.location_on),
                    Text(
                      'Your Location',
                      style: AppTextStyle.fs20Medium,
                    ),
                    Row(
                      children: [
                        Text(
                          'New York',
                          style: AppTextStyle.fs20Medium,
                        ),
                        Image.asset(
                          AppIcons.heart,
                          color: Appcolor.red,
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
            foregroundColor: Appcolor.black,
            bottom: TabBar(
              indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
              indicatorColor: Appcolor.black,
              labelColor: Appcolor.black,
              labelStyle: AppTextStyle.fs18Medium,
              tabs: [Tab(text: 'All Cinema'), Tab(text: 'Favourites')],
            ),
          ),
          body: TabBarView(children: [
            Allcinema_page(
                model: cinemamodel,
                movietimepagebool: movietimepagebool,
                moviemodel: moviemodel),
            Favourites_cinema(
              model: cinemamodel,
            )
          ]),
        ));
  }
}
