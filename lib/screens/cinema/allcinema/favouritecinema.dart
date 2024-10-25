import 'package:cnemax/controller/allController.dart';
import 'package:cnemax/models/allModel.dart';
import 'package:cnemax/screens/cinema/bookcinema2.dart';
import 'package:cnemax/services/app_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Favourites_cinema extends StatelessWidget {
  List<Cinema_model> model;
  Favourites_cinema({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    var cinemadata = Provider.of<AllController>(context);
    var cinema = cinemadata.getallmovie;
    return SingleChildScrollView(
      child: Column(
        children: [
          ...List.generate(
              model.length,
              (index) => ListTile(
                    leading: IconButton(
                        onPressed: () {}, icon: Icon(Icons.star_border)),
                    title: Text(model[index].cinema_name),
                    trailing: IconButton(
                        onPressed: () {
                          App_Service.push_to_screen(
                              Book_cenema_page2(
                                  cinemaModel: model[index],
                                  moviemodel: cinema[index]),
                              context);
                        },
                        icon: Icon(Icons.arrow_forward)),
                  ))
        ],
      ),
    );
  }
}
