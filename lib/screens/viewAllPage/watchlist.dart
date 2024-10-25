import 'package:cnemax/components/botton/icon_button.dart';
import 'package:cnemax/components/screen_widget/movie_image_contaner.dart';
import 'package:cnemax/models/allModel.dart';
import 'package:cnemax/services/app_icon&image.dart';
import 'package:cnemax/services/app_services.dart';
import 'package:cnemax/services/text_styleSheet.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Watchlist_page extends StatelessWidget {
  Movie_model model;
  Watchlist_page({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        actions: [Icon(Icons.share)],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Movie_datile_contanter(model: model),
          App_Service.add_Height(10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Icon_Button(
              btnName: 'Watchlist',
              onpressed: () {},
              borderclr: Appcolor.orange,
              textclr: Appcolor.black,
              iconimages: AppIcons.heart,
              imagecolor: Appcolor.orange,
            ),
          ),
          App_Service.add_Height(10),
          Text(
            'Watch Trailor',
            style: AppTextStyle.fs20Medium,
          ),
          App_Service.add_Height(10),
          Stack(alignment: Alignment.bottomCenter, children: [
            Image.asset(
              model.movie_img,
              fit: BoxFit.cover,
              height: App_Service.getscreenheight(context) * 0.25,
              width: App_Service.getscreenwidth(context),
            ),
            Column(
              children: [
                Icon(
                  Icons.play_circle_outlined,
                  size: 50,
                  color: Appcolor.white,
                ),
                Text('TEASER TRAILOR',
                    style: TextStyle(
                        color: Appcolor.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700))
              ],
            )
          ]),
          App_Service.add_Height(10),
          Text(
            'Synopsis',
            style: AppTextStyle.fs20Medium,
          ),
          Text(
              'Nibh nisl condimentum id venenatis a condimentum vitae sapien pellentesque. Phasellus vestibulum lor'),
        ],
      ),
    );
  }
}
