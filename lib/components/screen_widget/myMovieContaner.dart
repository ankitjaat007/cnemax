import 'package:cnemax/models/allModel.dart';
import 'package:cnemax/screens/viewAllPage/BookNow.dart';
import 'package:cnemax/screens/viewAllPage/watchlist.dart';
import 'package:cnemax/services/app_services.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class My_movie_contaner extends StatelessWidget {
  Movie_model model;

  My_movie_contaner({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            model.movie_img,
          ),
          Center(
            child: Text(
              model.movie_name,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
          ),
          model.ismovierelease == true
              ? Center(
                  child: TextButton(
                    onPressed: () {
                      App_Service.push_to_screen(
                          Book_now(
                            model: model,
                          ),
                          context);
                    },
                    child: const Text(
                      'Book Now',
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ButtonStyle(
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            side: const BorderSide(color: Color(0xffFF6C22)),
                            borderRadius: BorderRadius.circular(10)))),
                  ),
                )
              : Center(
                  child: TextButton(
                    onPressed: () {
                      App_Service.push_to_screen(
                          Watchlist_page(model: model), context);
                    },
                    child: Row(
                      children: [
                        Text('😊'),
                        const Text(
                          'Watchlist',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    style: ButtonStyle(
                        fixedSize:
                            MaterialStatePropertyAll(Size.fromWidth(100)),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            side: const BorderSide(color: Color(0xffFF6C22)),
                            borderRadius: BorderRadius.circular(10)))),
                  ),
                )
        ],
      ),
    );
  }
}
