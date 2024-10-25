import 'package:carousel_slider/carousel_slider.dart';
import 'package:cnemax/components/botton/icon_button.dart';
import 'package:cnemax/models/dummydata.dart';
import 'package:cnemax/screens/AllLoginPage/signIn/SignIn_acount.dart';
import 'package:cnemax/services/app_icon&image.dart';
import 'package:cnemax/services/app_services.dart';
import 'package:cnemax/services/text_styleSheet.dart';
import 'package:flutter/material.dart';

class Slider_screen extends StatefulWidget {
  const Slider_screen({super.key});

  @override
  State<Slider_screen> createState() => _Slider_screenState();
}

class _Slider_screenState extends State<Slider_screen> {
  CarouselController carouselController = CarouselController();

  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.orange,
      body: SafeArea(
        child: Stack(children: [
          Center(
              child: CarouselSlider(
                  carouselController: carouselController,
                  items: Dummydata()
                      .Sliderdata
                      .map((e) => Image.asset(e['images']))
                      .toList(),
                  options: CarouselOptions(
                      onPageChanged: (i, r) {
                        setState(() {
                          activeIndex = i;
                        });
                      },
                      // autoPlay: true,

                      aspectRatio: 0.5,
                      enlargeCenterPage: false,
                      viewportFraction: 1)
                      )
              //  Image.asset(
              //   Appimages.slide1,
              // ),
              ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                width: App_Service.getscreenwidth(context),
                height: App_Service.getscreenheight(context) * 0.4,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 31),
                        child: Column(
                          children: [
                            Text(
                              Dummydata().Sliderdata[activeIndex]['text'],
                              style: AppTextStyle.fs24Bold,
                              textAlign: TextAlign.center,
                            ),
                            App_Service.add_Height(15),
                            Text(
                              'For athletes, high altitude produces two contradictory effects on performance. For explosive events ',
                              style: AppTextStyle.fs16Normal,
                              textAlign: TextAlign.center,
                            ),
                            App_Service.add_Height(15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ...List.generate(
                                    3,
                                    (index) => Container(
                                          height: 10,
                                          width: activeIndex == index ? 20 : 15,
                                          decoration: BoxDecoration(
                                              color: index == activeIndex
                                                  ? Appcolor.orange
                                                  : Appcolor.wire_frame_clr,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(100))),
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 3),
                                        ))
                              ],
                            )
                          ],
                        ),
                      ),
                      activeIndex == 2
                          ? Icon_Button(
                              btnName: 'Continue',
                              onpressed: () {
                                App_Service.push_to_screen(
                                    SignIn_With_acount(), context);
                              },
                              textclr: Appcolor.white,
                              bgcolor: Appcolor.orange,
                            )
                          : Row(
                              children: [
                                Expanded(
                                  child: Icon_Button(
                                    btnName: 'Skip',
                                    onpressed: () {
                                      carouselController.nextPage();
                                      // App_Service.push_remove_screen(
                                      //     Bottomnavigationpage(), context);
                                    },
                                    textclr: Appcolor.black,
                                    bgcolor: Appcolor.skin_clr,
                                    iconimages: AppIcons.heart,
                                  ),
                                ),
                                App_Service.add_Width(10),
                                Expanded(
                                  child: Icon_Button(
                                    btnName: 'Continue',
                                    onpressed: () {
                                      App_Service.push_to_screen(
                                          SignIn_With_acount(), context);
                                    },
                                    textclr: Appcolor.white,
                                    bgcolor: Appcolor.orange,
                                    iconimages: AppIcons.heart,
                                  ),
                                ),
                              ],
                            )
                    ],
                  ),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
