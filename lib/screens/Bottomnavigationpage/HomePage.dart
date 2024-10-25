import 'package:cnemax/components/botton/mysmall_button.dart';
import 'package:cnemax/components/screen_widget/myMovieContaner.dart';
import 'package:cnemax/controller/allController.dart';
import 'package:cnemax/screens/viewAllPage/nowPlaying.dart';
import 'package:cnemax/services/app_icon&image.dart';
import 'package:cnemax/services/app_services.dart';
import 'package:cnemax/services/text_styleSheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home_page extends StatelessWidget {
  const Home_page({super.key});

  @override
  Widget build(BuildContext context) {
    var moviedata = Provider.of<AllController>(context);
    final nowplayingmovie = moviedata.nowplayingmovie(true);
    final commingsoon = moviedata.nowplayingmovie(false);
    // print(nowplayingmovie.length);
    // print(commingsoon.length);
    // print(moviedata.userdata?.name);
    // print(moviedata.userdata?.email);
    // print(moviedata.userdata?.password);
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Icon(
            Icons.notifications_none_outlined,
            color: Colors.black,
            size: 30,
          )
        ],
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Location',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w100),
            ),
            Text(
              'New York',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
            )
          ],
        ),
        leading: Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black), shape: BoxShape.circle),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              Appimages.banner,
              fit: BoxFit.cover,
              width: App_Service.getscreenwidth(context),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Now Playing',
                  style: AppTextStyle.fs20Medium,
                ),
                My_small_button(
                  ontap: () {
                    App_Service.push_to_screen(
                        Now_playing(
                          model: nowplayingmovie,
                        ),
                        context);
                  },
                )
              ],
            ),
            App_Service.add_Height(10),
            AspectRatio(
              aspectRatio: 1.1,
              child: ListView.builder(
                itemCount:
                    nowplayingmovie.length >= 3 ? 3 : nowplayingmovie.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: My_movie_contaner(
                      model: nowplayingmovie[index],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Comming soon',
                  style: AppTextStyle.fs20Medium,
                ),
                My_small_button(
                  ontap: () {
                    App_Service.push_to_screen(
                        Now_playing(model: commingsoon), context);
                  },
                )
              ],
            ),
            App_Service.add_Height(10),
            AspectRatio(
              aspectRatio: 1.1,
              child: ListView.builder(
                itemCount: commingsoon.length >= 3 ? 3 : commingsoon.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: My_movie_contaner(
                      model: commingsoon[index],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
