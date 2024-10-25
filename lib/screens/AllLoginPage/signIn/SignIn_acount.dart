import 'package:cnemax/components/botton/icon_button.dart';
import 'package:cnemax/components/listTile.dart';
import 'package:cnemax/screens/AllLoginPage/signIn/SignIn_password.dart';
import 'package:cnemax/screens/AllLoginPage/signup/CreatAccount.dart';
import 'package:cnemax/services/AppConfig.dart';
import 'package:cnemax/services/app_icon&image.dart';
import 'package:cnemax/services/app_services.dart';
import 'package:cnemax/services/text_styleSheet.dart';
import 'package:flutter/material.dart';

class SignIn_With_acount extends StatelessWidget {
  const SignIn_With_acount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Image.asset(AppConfig.applogo),
                Image.asset(AppConfig.appname),
                Text('lets Dive into Your Account'),
                App_Service.add_Height(10),
                MylistTile(
                  onpress: () {},
                  title: 'Continue with Facebook',
                  logo: AppIcons.facebook,
                ),
                App_Service.add_Height(10),
                MylistTile(
                  onpress: () {},
                  title: 'Continue with Google',
                  logo: AppIcons.google,
                ),
                App_Service.add_Height(10),
                MylistTile(
                  onpress: () {},
                  title: 'Continue with Telegram',
                  logo: AppIcons.telegram,
                ),
                App_Service.add_Height(10),
                MylistTile(
                  onpress: () {},
                  title: 'Continue with Apple',
                  logo: AppIcons.apple,
                ),
                App_Service.add_Height(10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      Icon_Button(
                        btnName: 'Sign in with Pssword',
                        onpressed: () {
                          App_Service.push_to_screen(
                              SignIn_With_Pasword(), context);
                        },
                        bgcolor: Appcolor.orange,
                        textclr: Appcolor.white,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don’t Have an Account ?'),
                          TextButton(
                              onPressed: () {
                                App_Service.push_to_screen(
                                    Creat_acount(), context);
                              },
                              child: Text(
                                'Sign Up',
                                style: TextStyle(color: Appcolor.orange),
                              ))
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
