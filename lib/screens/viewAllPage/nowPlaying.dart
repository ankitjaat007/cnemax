import 'package:cnemax/components/screen_widget/myMovieContaner.dart';
import 'package:cnemax/models/allModel.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Now_playing extends StatelessWidget {
  List<Movie_model> model;
  Now_playing({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: model[0].ismovierelease == true
            ? Text('Now Playing')
            : Text('Comming Soon'),
      ),
      body: GridView.builder(
        itemCount: model.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 10, mainAxisExtent: 350),
        itemBuilder: (context, index) {
          return My_movie_contaner(model: model[index]);
        },
      ),
    );
  }
}
