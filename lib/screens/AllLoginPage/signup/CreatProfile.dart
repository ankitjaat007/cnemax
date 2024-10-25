import 'dart:io';

import 'package:cnemax/components/botton/icon_button.dart';
import 'package:cnemax/components/textField.dart';
import 'package:cnemax/screens/AllLoginPage/signup/presonlize.dart';
import 'package:cnemax/services/app_services.dart';
import 'package:cnemax/services/text_styleSheet.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class CreatProfile extends StatefulWidget {
  const CreatProfile({super.key});

  @override
  State<CreatProfile> createState() => _CreatProfileState();
}

class _CreatProfileState extends State<CreatProfile> {
  File? imagefile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.white,
      appBar: AppBar(
        backgroundColor: Appcolor.white,
        elevation: 0,
        foregroundColor: Appcolor.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Welcome Back',
                    style: AppTextStyle.fs24Bold,
                  ),
                  Icon(Icons.person_3)
                ],
              ),
              Center(
                child: Text(
                    'Add the finishing touches to your proflie let’s make your movie experience more social'),
              ),
              Center(
                child: Stack(alignment: Alignment.bottomRight, children: [
                  Container(
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    height: 150,
                    width: 150,
                    child: imagefile == null
                        ? Container()
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
              My_TextField(),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Icon_Button(
                  btnName: 'Sign Up',
                  onpressed: () {
                    App_Service.push_to_screen(Presonlize(), context);
                  },
                  bgcolor: Appcolor.orange,
                  textclr: Appcolor.white,
                ),
              )
            ],
          ),
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
  /////////
  ///////
  ///
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
