import 'package:cnemax/components/botton/icon_button.dart';
import 'package:cnemax/components/textField.dart';
import 'package:cnemax/services/app_icon&image.dart';
import 'package:cnemax/services/app_services.dart';
import 'package:cnemax/services/text_styleSheet.dart';
import 'package:flutter/material.dart';

class New_password extends StatefulWidget {
  const New_password({super.key});

  @override
  State<New_password> createState() => _New_passwordState();
}

class _New_passwordState extends State<New_password> {
  bool obsecuse = false;
  bool obsecuse2 = false;
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Creat New Password',
                      style: AppTextStyle.fs24Bold,
                    ),
                    Image.asset(AppIcons.lock)
                  ],
                ),
                Text(
                    'Creat your New password if you forgot it then you have to reset your pssoword'),
                App_Service.add_Height(15),
                Text('New Password'),
                My_TextField(
                  prefixIcon: Icons.lock,
                  obsecuse: obsecuse,
                  onpressed: () => setState(
                    () => obsecuse = !obsecuse,
                  ),
                  suffixIcon:
                      obsecuse ? Icons.visibility_off : Icons.visibility,
                ),
                App_Service.add_Height(15),
                Text('Confirm Password'),
                My_TextField(
                  prefixIcon: Icons.lock,
                  obsecuse: obsecuse2,
                  onpressed: () => setState(
                    () => obsecuse2 = !obsecuse2,
                  ),
                  suffixIcon:
                      obsecuse2 ? Icons.visibility_off : Icons.visibility,
                ),
              ],
            ),
            Icon_Button(
              btnName: 'Continue',
              onpressed: () {},
              bgcolor: Appcolor.orange,
              textclr: Appcolor.white,
            )
          ],
        ),
      ),
    );
  }
}
