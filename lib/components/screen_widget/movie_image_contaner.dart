import 'package:cnemax/models/allModel.dart';
import 'package:cnemax/services/app_services.dart';
import 'package:cnemax/services/text_styleSheet.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Movie_datile_contanter extends StatelessWidget {
  Movie_model model;
  Movie_datile_contanter({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: App_Service.getscreenheight(context) * 0.3,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            model.movie_img,
            fit: BoxFit.cover,
            height: App_Service.getscreenheight(context) * 0.3,
            width: App_Service.getscreenwidth(context) * 0.45,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    model.movie_name,
                    style: AppTextStyle.fs20Medium,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Duration'),
                      Text(
                          '${model.duration!.hours}hr : ${model.duration!.min}min')
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('Director'), Text(model.director)],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Likes'),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                              color: Appcolor.red,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            '${model.likes}k',
                            style: TextStyle(color: Appcolor.white),
                          ))
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Cenes'),
                      App_Service.add_Width(20),
                      Expanded(
                          child: Text(
                        model.cenes.join(", "),
                        textAlign: TextAlign.right,
                        softWrap: true,
                      )),
                      // ...List.generate(
                      //     model.cenes.length,
                      //     (index) => Expanded(
                      //           child: Text(
                      //             model.cenes[index].toString(),
                      //             // style: TextStyle(),
                      //             // overflow: TextOverflow.ellipsis,
                      //             // maxLines: 4,
                      //           ),
                      //         ))

                      // AspectRatio(
                      //   aspectRatio: 0.1,
                      //   child: ListView.builder(
                      //     itemCount: model.cenes.length,
                      //     itemBuilder: (context, index) {
                      //       return Text(
                      //         model.cenes[index].toString(),
                      //         style: TextStyle(),
                      //         overflow: TextOverflow.ellipsis,
                      //         maxLines: 4,
                      //       );
                      //     },
                      //   ),
                      // )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
