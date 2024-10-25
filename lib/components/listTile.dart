import 'package:cnemax/services/text_styleSheet.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MylistTile extends StatelessWidget {
  String? title;
  Function? onpress;
  String? logo;
  Color? bgclr;
  bool? boderclr;
  double? scale;

  MylistTile(
      {super.key,
      this.title,
      this.onpress,
      this.logo,
      this.bgclr,
      this.boderclr,
      this.scale});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: bgclr,
      onTap: () => onpress == null ? null : onpress!(),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: boderclr == false
              ? BorderSide.none
              : BorderSide(color: Colors.black)),
      title: title == null ? SizedBox() : Center(child: Text(title!)),
      leading: logo == null
          ? SizedBox()
          : Image.asset(
              logo!,
              scale: scale,
            ),
    );
  }
}

// -------------------------------
//---acount list tile
// ignore: must_be_immutable
class MyacountListTile extends StatelessWidget {
  String? title;
  IconData? Leading, Trailing;
  Function? arowforwad;
  MyacountListTile(
      {super.key, this.title, this.Leading, this.arowforwad, this.Trailing});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => arowforwad == null ? null : arowforwad!(),
      leading: Leading == null
          ? SizedBox()
          : Icon(
              Leading,
              color: Appcolor.orange,
            ),
      title: title == null ? SizedBox() : Text(title!),
      textColor: Appcolor.black,
      titleTextStyle: AppTextStyle.fs16Normal,
      trailing: Trailing == null
          ? SizedBox()
          : Icon(
              Trailing,
              color: Appcolor.black,
            ),
    );
  }
}

// ---------------------------------
// listTile payement and language
// ignore: must_be_immutable
class MypayementListTile extends StatefulWidget {
  String? title;
  String? logo;
  Color? bgclr;
  double? scale;
  String activeValue;
  Function(String)? onCheck;

  MypayementListTile(
      {super.key,
      this.title,
      this.logo,
      this.bgclr,
      this.scale,
      this.activeValue = "",
      this.onCheck});

  @override
  State<MypayementListTile> createState() => _MypayementListTileState();
}

class _MypayementListTileState extends State<MypayementListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: widget.bgclr,
      onTap: () {
        widget.onCheck!(widget.title!);
      },
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: widget.activeValue == widget.title
              ? BorderSide(color: Appcolor.orange)
              : BorderSide(color: Colors.transparent)),
      title: widget.title == null
          ? SizedBox()
          : Center(child: Text(widget.title!)),
      leading: widget.logo == null
          ? SizedBox()
          : Image.asset(
              widget.logo!,
              scale: widget.scale,
            ),
      trailing: widget.activeValue == widget.title
          ? Icon(Icons.check_circle_outlined)
          : SizedBox(),
    );
  }
}
