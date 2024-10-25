import 'package:cnemax/components/botton/icon_button.dart';
import 'package:cnemax/components/textField.dart';
import 'package:cnemax/screens/AllLoginPage/signup/CreatProfile.dart';

import 'package:cnemax/services/app_services.dart';
import 'package:cnemax/services/text_styleSheet.dart';
import 'package:flutter/material.dart';

class Creat_acount extends StatefulWidget {
  const Creat_acount({super.key});

  @override
  State<Creat_acount> createState() => _SignIn_With_PaswordState();
}

class _SignIn_With_PaswordState extends State<Creat_acount> {
  var obsecuse = false;
  bool check = false;
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
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Creat Account',
                        style: AppTextStyle.fs24Bold,
                      ),
                      Icon(Icons.person_add_alt_outlined)
                    ],
                  ),
                  Center(
                    child: Text(
                      'Creat your New password if you forgot it then you have to reset your pssoword ',
                      style: AppTextStyle.fs16Normal,
                    ),
                  ),
                  App_Service.add_Height(10),
                  Text(
                    'Email',
                    style: AppTextStyle.fs16Normal,
                  ),
                  My_TextField(
                    hintText: 'Email',
                    prefixIcon: Icons.lock,
                  ),
                  App_Service.add_Height(20),
                  Text(
                    'Password',
                    style: AppTextStyle.fs16Normal,
                  ),
                  My_TextField(
                    hintText: 'Password',
                    prefixIcon: Icons.lock,
                    obsecuse: obsecuse,
                    onpressed: () => setState(
                      () => obsecuse = !obsecuse,
                    ),
                    suffixIcon:
                        obsecuse ? Icons.visibility_off : Icons.visibility,
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Checkbox(
                              side:
                                  BorderSide(color: Appcolor.orange, width: 2),
                              activeColor: Appcolor.skin_clr,
                              value: check,
                              onChanged: (bool? check) {
                                setState(() {
                                  this.check = check!;
                                });
                              }),
                          Text(
                            'I agree to Cinemax',
                          )
                        ],
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Terms & Conditions.',
                            style: TextStyle(color: Appcolor.orange),
                          ))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already Have an Account ?'),
                        TextButton(
                            onPressed: () {
                              App_Service.pop_screen(context);
                            },
                            child: Text(
                              'Sign In',
                              style: TextStyle(color: Appcolor.orange),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Icon_Button(
              btnName: 'Sign Up',
              onpressed: () {
                App_Service.push_and_replace(CreatProfile(), context);
              },
              bgcolor: Appcolor.orange,
              textclr: Appcolor.white,
            ),
          ],
        ),
      ),
    );
  }
}
