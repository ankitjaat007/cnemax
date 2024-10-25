import 'package:cnemax/components/botton/icon_button.dart';
import 'package:cnemax/components/botton/mysmall_button.dart';
import 'package:cnemax/components/screen_widget/movie_image_contaner.dart';
import 'package:cnemax/controller/allController.dart';
import 'package:cnemax/models/allModel.dart';
import 'package:cnemax/screens/Bottomnavigationpage/CinemaPage.dart';
import 'package:cnemax/services/app_services.dart';
import 'package:cnemax/services/text_styleSheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Book_now extends StatefulWidget {
  Movie_model model;
  Book_now({super.key, required this.model});

  @override
  State<Book_now> createState() => _Book_nowState();
}

class _Book_nowState extends State<Book_now> {
  double rating = 0;
  @override
  Widget build(BuildContext context) {
    var aa = Provider.of<AllController>(context);
    var db = aa.getallcinema;
    filter() {
      List<Cinema_model> data = [];
      for (var i = 0; i < db.length; i++) {
        Cinema_model cd = db[i];
        final bb = cd.cinema_detlis
            .any((element) => element.movie_id == widget.model.movie_id);
        if (bb == true) {
          data.add(db[i]);
        }
      }
      return data;
    }

    // print(filter().length);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        actions: [Icon(Icons.share)],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Movie_datile_contanter(model: widget.model),
            App_Service.add_Height(10),
            Text(
              'Watch Trailor',
              style: AppTextStyle.fs20Medium,
            ),
            App_Service.add_Height(10),
            Text(
              'Synopsis',
              style: AppTextStyle.fs20Medium,
            ),
            App_Service.add_Height(10),
            Stack(alignment: Alignment.bottomCenter, children: [
              Image.asset(
                widget.model.movie_img,
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
                'Nibh nisl condimentum id venenatis a condimentum vitae sapien pellentesque. Phasellus vestibulum lor'),
            App_Service.add_Height(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Cast',
                  style: AppTextStyle.fs20Medium,
                ),
                My_small_button(ontap: () {})
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                  widget.model.actor.length,
                  (index) => Column(
                        children: [
                          widget.model.actor[index].image == ''
                              ? Container(
                                  height: 50,
                                )
                              : Image.asset(widget.model.actor[index].image),
                          Text(widget.model.actor[index].name),
                          Text(widget.model.actor[index].work)
                        ],
                      )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Video',
                  style: AppTextStyle.fs20Medium,
                ),
                My_small_button(ontap: () {})
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Stack(alignment: Alignment.bottomCenter, children: [
                    Image.asset(
                      widget.model.movie_img,
                      fit: BoxFit.cover,
                      height: App_Service.getscreenheight(context) * 0.2,
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
                                fontSize: 20,
                                fontWeight: FontWeight.w700))
                      ],
                    )
                  ]),
                ),
                App_Service.add_Width(5),
                Expanded(
                  child: Image.asset(
                    widget.model.movie_img,
                    fit: BoxFit.cover,
                    height: App_Service.getscreenheight(context) * 0.2,
                    width: App_Service.getscreenwidth(context),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Photo',
                  style: AppTextStyle.fs20Medium,
                ),
                My_small_button(ontap: () {})
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Stack(alignment: Alignment.bottomCenter, children: [
                    Image.asset(
                      widget.model.movie_img,
                      fit: BoxFit.cover,
                      height: App_Service.getscreenheight(context) * 0.2,
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
                                fontSize: 20,
                                fontWeight: FontWeight.w700))
                      ],
                    )
                  ]),
                ),
                App_Service.add_Width(5),
                Expanded(
                  child: Image.asset(
                    widget.model.movie_img,
                    fit: BoxFit.cover,
                    height: App_Service.getscreenheight(context) * 0.2,
                    width: App_Service.getscreenwidth(context),
                  ),
                ),
              ],
            ),
            App_Service.add_Height(10),
            Text(
              'Rating',
              style: AppTextStyle.fs20Medium,
            ),
            Center(
                child: Text(
              rating.toString(),
              style: AppTextStyle.fs24Bold,
            )),
            Center(
              child: RatingBar.builder(
                itemSize: 25,
                itemCount: 5,
                updateOnDrag: true,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Appcolor.orange,
                ),
                onRatingUpdate: (value) {
                  setState(() {
                    rating = value;
                  });
                },
              ),
            ),
            Center(child: Text('2.4 k Review')),
            App_Service.add_Height(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  Icon_Button(
                    btnName: 'Rate this Movie',
                    onpressed: () {
                      showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(30))),
                        context: context,
                        builder: (context) {
                          return Container(
                            padding: EdgeInsets.all(5),
                            height: App_Service.getscreenheight(context) * 0.25,
                            child: Column(
                              children: [
                                Text(
                                  'Rating',
                                  style: AppTextStyle.fs24Bold,
                                ),
                                App_Service.add_Height(10),
                                Text(
                                  'You can’t give a score now',
                                  style: AppTextStyle.fs20Medium,
                                ),
                                App_Service.add_Height(10),
                                Text(
                                  'Due to our policy currrently only those who sucessfully purchased tickets for the movie can give a score',
                                  style: AppTextStyle.fs16Normal,
                                  textAlign: TextAlign.center,
                                ),
                                App_Service.add_Height(10),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40),
                                  child: Icon_Button(
                                    btnName: "Okay",
                                    onpressed: () {
                                      showModalBottomSheet(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.vertical(
                                                top: Radius.circular(30))),
                                        context: context,
                                        builder: (context) {
                                          return Container(
                                            padding: EdgeInsets.all(5),
                                            height: App_Service.getscreenheight(
                                                    context) *
                                                0.25,
                                            child: Column(
                                              children: [
                                                Text(
                                                  'Rate this Movie',
                                                  style: AppTextStyle.fs24Bold,
                                                ),
                                                App_Service.add_Height(10),
                                                Text(
                                                  'Did you enjoy the movie ?',
                                                  style:
                                                      AppTextStyle.fs20Medium,
                                                ),
                                                App_Service.add_Height(10),
                                                RatingBar.builder(
                                                  itemSize: 35,
                                                  itemCount: 5,
                                                  direction: Axis.horizontal,
                                                  itemPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 2.0),
                                                  itemBuilder: (context, _) =>
                                                      Icon(Icons.star,
                                                          color: Colors.amber),
                                                  onRatingUpdate: (value) {},
                                                ),
                                                App_Service.add_Height(10),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 40),
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        child: Icon_Button(
                                                          btnName: 'Cancel',
                                                          onpressed: () {
                                                            App_Service
                                                                .pop_screen(
                                                                    context);
                                                          },
                                                          textclr:
                                                              Appcolor.orange,
                                                          bgcolor:
                                                              Appcolor.skin_clr,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Icon_Button(
                                                          btnName: 'Rate Now',
                                                          onpressed: () {},
                                                          textclr:
                                                              Appcolor.white,
                                                          bgcolor:
                                                              Appcolor.orange,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    textclr: Appcolor.white,
                                    bgcolor: Appcolor.orange,
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      );
                    },
                    borderclr: Appcolor.black,
                    textclr: Appcolor.black,
                  ),
                  App_Service.add_Height(10),
                  Icon_Button(
                    btnName: 'Book Now',
                    onpressed: () {
                      App_Service.push_to_screen(
                          Cinema_Page(
                              cinemamodel: filter(),
                              movietimepagebool: true,
                              moviemodel: widget.model),
                          context);
                    },
                    bgcolor: Appcolor.orange,
                    textclr: Appcolor.white,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
