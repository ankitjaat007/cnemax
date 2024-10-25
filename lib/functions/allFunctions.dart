import 'dart:convert';

import 'package:cnemax/controller/allController.dart';
import 'package:cnemax/models/allModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class AllFunctions {
  static getallmovie(BuildContext context) async {
    final ab = Provider.of<AllController>(context, listen: false);
    List<Movie_model> data = [];
    var respond = await rootBundle.loadString('assets/json/movie.json');
    var jsondata = jsonDecode(respond) as List;
    // print(jsondata.map((e) => e));
    data = jsondata
        .map((
          e,
        ) =>
            Movie_model.FromModelList(e))
        .toList();
    ab.setMovieList(data);
  }

  //========================================
  //========================================
  static getallcinema(BuildContext context) async {
    final ab = Provider.of<AllController>(context, listen: false);
    List<Cinema_model> data = [];
    var respond = await rootBundle.loadString('assets/json/cinema.json');
    var jsondata = jsonDecode(respond) as List;

    // print("Json Data :: ${jsondata}");
    data = jsondata.map((e) => Cinema_model.FromModelList(e)).toList();
    ab.setCinemaList(data);
  }

  //========================================
  //========================================
  static getalluser(BuildContext context) async {
    final ab = Provider.of<AllController>(context, listen: false);
    List<User_model> data = [];
    var respond = await rootBundle.loadString('assets/json/user.json');
    var jsondata = jsonDecode(respond) as List;

    // print("Json Data :: ${jsondata}");
    data = jsondata.map((e) => User_model.FromModelList(e)).toList();
    ab.setUserList(data);
  }
}
