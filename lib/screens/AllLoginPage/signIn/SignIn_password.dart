import 'package:cnemax/components/botton/icon_button.dart';
import 'package:cnemax/components/textField.dart';
import 'package:cnemax/controller/allController.dart';
import 'package:cnemax/screens/AllLoginPage/ForgotPage/resetPasword.dart';
import 'package:cnemax/screens/AllLoginPage/signup/CreatAccount.dart';
import 'package:cnemax/screens/Bottomnavigationpage/Bottomnavigationpage.dart';
import 'package:cnemax/services/app_icon&image.dart';
import 'package:cnemax/services/app_services.dart';
import 'package:cnemax/services/text_styleSheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignIn_With_Pasword extends StatefulWidget {
  const SignIn_With_Pasword({super.key});

  @override
  State<SignIn_With_Pasword> createState() => _SignIn_With_PaswordState();
}

class _SignIn_With_PaswordState extends State<SignIn_With_Pasword> {
  var obsecuse = false;
  bool check = false;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<AllController>(context);
    // print(emailcontroller.text);
    return Scaffold(
      backgroundColor: Appcolor.white,
      appBar: AppBar(
        backgroundColor: Appcolor.white,
        elevation: 0,
        foregroundColor: Appcolor.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Welcome Back',
                    style: AppTextStyle.fs24Bold,
                  ),
                  Image.asset(AppIcons.human_welcome)
                ],
              ),
              Center(
                child: Text(
                  'Please enter your email & Password to Sign in',
                  style: AppTextStyle.fs16Normal,
                ),
              ),
              App_Service.add_Height(10),
              Text(
                'Email',
                style: AppTextStyle.fs16Normal,
              ),
              My_TextField(
                controller: emailcontroller,
                hintText: 'Email',
                prefixIcon: Icons.check_circle,
              ),
              App_Service.add_Height(20),
              Text(
                'Password',
                style: AppTextStyle.fs16Normal,
              ),
              My_TextField(
                controller: passwordcontroller,
                hintText: 'Password',
                prefixIcon: Icons.lock,
                obsecuse: obsecuse,
                onpressed: () => setState(
                  () => obsecuse = !obsecuse,
                ),
                suffixIcon: obsecuse ? Icons.visibility_off : Icons.visibility,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                          activeColor: Appcolor.black,
                          value: check,
                          onChanged: (bool? check) {
                            setState(() {
                              this.check = check!;
                            });
                          }),
                      Text(
                        'Remember Me',
                      )
                    ],
                  ),
                  TextButton(
                      onPressed: () {
                        App_Service.push_to_screen(ResetPasword(), context);
                      },
                      child: Text(
                        'Forgot Password ?',
                        style: TextStyle(color: Appcolor.orange),
                      ))
                ],
              ),
              App_Service.add_Height(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
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
                    ),
                    App_Service.add_Height(20),
                    Icon_Button(
                      btnName: 'Sign In',
                      onpressed: () {
                        data.login(
                          emailcontroller.text,
                          passwordcontroller.text,
                        );
                        // print(data.userdata.name);
                        data.loding
                            ? {
                                showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return SimpleDialog(
                                            shape: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            children: [
                                              Column(
                                                children: [
                                                  Image.asset(
                                                      Appimages.dialog_img),
                                                  Text(
                                                    'Sign in successfull',
                                                    style:
                                                        AppTextStyle.fs24Bold,
                                                  ),
                                                  Text('Please Wait'),
                                                  Text(
                                                      'You willbe dircted to  Home page'),
                                                  CircularProgressIndicator(
                                                      color: Appcolor.orange),
                                                ],
                                              ),
                                            ],
                                          );
                                        }):
                                    Future.delayed(Duration(seconds: 2), () {
                                  App_Service.push_remove_screen(
                                      Bottomnavigationpage(), context);
                                })
                              }
                            : SizedBox();
                      },
                      bgcolor: Appcolor.orange,
                      textclr: Appcolor.white,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
