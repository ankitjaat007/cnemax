import 'package:cnemax/controller/allController.dart';
import 'package:cnemax/screens/viewAllPage/BookNow.dart';
import 'package:cnemax/services/app_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Passmovie extends StatelessWidget {
  const Passmovie({super.key});

  @override
  Widget build(BuildContext context) {
    final filtermovie = Provider.of<AllController>(context);
    final commingMovie = filtermovie.nowplayingmovie(true);
    return Column(
      children: List.generate(
          commingMovie.length,
          (index) => ListTile(
                onTap: () {
                  App_Service.push_to_screen(
                      Book_now(model: commingMovie[index]), context);
                },
                leading: Image.asset(
                  commingMovie[index].movie_img,
                ),
                title: Center(child: Text(commingMovie[index].movie_name)),
                subtitle: Center(child: Text('Dec 22 - 23        7:30 pm')),
                trailing: Icon(Icons.arrow_forward_ios_sharp),
              )),
    );
  }
}
