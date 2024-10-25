import 'package:cnemax/components/ticket_listTile/upcomingListTile.dart';
import 'package:cnemax/controller/allController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Upmovie extends StatelessWidget {
  const Upmovie({super.key});

  @override
  Widget build(BuildContext context) {
    final filtermovie = Provider.of<AllController>(context);
    final commingMovie = filtermovie.nowplayingmovie(false);
    return Column(
      children: List.generate(commingMovie.length,
          (index) => UpcomingListTile(model: commingMovie[index])),
    );
  }
}
