import 'package:cnemax/models/allModel.dart';
import 'package:cnemax/screens/viewAllPage/watchlist.dart';
import 'package:cnemax/services/app_services.dart';
import 'package:cnemax/services/text_styleSheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UpcomingListTile extends StatefulWidget {
  Movie_model model;
  UpcomingListTile({super.key, required this.model});

  @override
  State<UpcomingListTile> createState() => _UpcomingListTileState();
}

class _UpcomingListTileState extends State<UpcomingListTile> {
  bool change = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            App_Service.push_to_screen(
                Watchlist_page(model: widget.model), context);
          },
          leading: Image.asset(
            widget.model.movie_img,
          ),
          title: Center(child: Text(widget.model.movie_name)),
          subtitle: Center(child: Text('Dec 22 - 23        7:30 pm')),
          trailing: Icon(Icons.arrow_forward_ios_sharp),
        ),
        App_Service.add_Height(10),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Appcolor.black),
              borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Remind me 30 min early'),
              Transform.scale(
                scale: 0.7,
                child: CupertinoSwitch(
                    activeColor: Color(0xffB73328),
                    trackColor: Color(0xff9D9D9D),
                    thumbColor: Colors.white,
                    value: change,
                    onChanged: (value) {
                      setState(() {
                        change = value;
                      });
                    }),
              ),
            ],
          ),
        )
      ],
    );
  }
}
