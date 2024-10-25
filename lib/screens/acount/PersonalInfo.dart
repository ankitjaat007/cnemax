import 'dart:io';

import 'package:cnemax/components/botton/icon_button.dart';
import 'package:cnemax/components/textField.dart';
import 'package:cnemax/controller/allController.dart';
import 'package:cnemax/models/dummydata.dart';
import 'package:cnemax/services/app_services.dart';
import 'package:cnemax/services/text_styleSheet.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';

class Personal_Info extends StatefulWidget {
  const Personal_Info({super.key});

  @override
  State<Personal_Info> createState() => _Personal_InfoState();
}

class _Personal_InfoState extends State<Personal_Info> {
  File? imagefile;
  String dropdownValue = Dummydata().Gender.first;
  @override
  Widget build(BuildContext context) {
    final usermodel = Provider.of<AllController>(context);
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Icon_Button(
          btnName: "Save",
          onpressed: () {},
          textclr: Appcolor.white,
          bgcolor: Appcolor.orange,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Appcolor.black,
        title: Text('Personal Info'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(alignment: Alignment.bottomRight, children: [
                Container(
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  height: 150,
                  width: 150,
                  child: imagefile == null
                      ? usermodel.userdata.image == ""
                          ? Container()
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(usermodel.userdata.image,
                                  fit: BoxFit.cover))
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.file(
                            imagefile!,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
                Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                      color: Appcolor.orange,
                      borderRadius: BorderRadius.circular(10)),
                  child: IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => SimpleDialog(
                                children: [imagePickerbottomsheet()],
                              ));
                    },
                    icon: Icon(
                      Icons.edit_square,
                      color: Appcolor.white,
                    ),
                  ),
                )
              ]),
            ),
            Text('Full Name'),
            My_TextField(hintText: usermodel.userdata.name),
            App_Service.add_Height(10),
            Text('Phone Number'),
            IntlPhoneField(
              dropdownIcon: Icon(
                Icons.keyboard_arrow_down,
                color: Appcolor.black,
              ),
              dropdownIconPosition: IconPosition.trailing,
              initialCountryCode: 'IN',
              decoration: InputDecoration(
                  hintText: '${usermodel.userdata.phn_num}',
                  fillColor: Color(0xffF3F3F3),
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Color.fromRGBO(0, 0, 0, 0.30))),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Color.fromRGBO(0, 0, 0, 0.30)))),
            ),
            Text('Date of Brith'),
            DateTimeFormField(
              initialEntryMode: DatePickerEntryMode.input,
              decoration: const InputDecoration(
                hintText: 'mm/dd/yyyy',
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:
                        BorderSide(color: Color.fromRGBO(0, 0, 0, 0.30))),
                fillColor: Color(0xffF3F3F3),
                filled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:
                        BorderSide(color: Color.fromRGBO(0, 0, 0, 0.30))),
                suffixIcon: Icon(Icons.event_note),
              ),
              mode: DateTimeFieldPickerMode.date,
            ),
            App_Service.add_Height(10),
            Text('Gender'),
            DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  fillColor: Color(0xffF3F3F3),
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Color.fromRGBO(0, 0, 0, 0.30))),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Color.fromRGBO(0, 0, 0, 0.30))),
                ),
                value: dropdownValue,
                items: Dummydata()
                    .Gender
                    .map((item) => DropdownMenuItem(
                          value: item,
                          child: Text(
                            item,
                          ),
                        ))
                    .toList(),
                onChanged: (item) => setState(() => dropdownValue = item!)),
          ],
        ),
      ),
    );
  }

  getImageFormGallery() async {
    // ignore: invalid_use_of_visible_for_testing_member
    var getImage = await ImagePicker.platform
        .getImageFromSource(source: ImageSource.gallery);

    if (getImage != null) {
      setState(() {
        imagefile = File(getImage.path);
      });
      App_Service.pop_screen(context);
    }
  }

  getImageFormCamra() async {
    // ignore: invalid_use_of_visible_for_testing_member
    var getImage = await ImagePicker.platform
        .getImageFromSource(source: ImageSource.camera);

    if (getImage != null) {
      setState(() {
        imagefile = File(getImage.path);
      });
      Navigator.of(context).pop();
    }
  }

  ////////////////////////////////////////

  imagePickerbottomsheet() {
    return Column(
      children: [
        // Text("Image Picker"),
        ElevatedButton.icon(
            onPressed: () {
              getImageFormCamra();
            },
            style: TextButton.styleFrom(backgroundColor: Appcolor.orange),
            icon: Icon(Icons.camera),
            label: Text("Camera")),
        ElevatedButton.icon(
            onPressed: () {
              getImageFormGallery();
            },
            style: TextButton.styleFrom(backgroundColor: Appcolor.orange),
            icon: Icon(Icons.image),
            label: Text("Gallery")),
        ElevatedButton.icon(
            onPressed: () {
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(backgroundColor: Appcolor.orange),
            icon: Icon(Icons.cancel),
            label: Text("Cancel")),
      ],
    );
  }
}
