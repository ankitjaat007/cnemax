import 'package:cnemax/components/botton/icon_button.dart';
import 'package:cnemax/components/listTile.dart';
import 'package:cnemax/controller/allController.dart';
import 'package:cnemax/screens/AllLoginPage/signIn/SignIn_acount.dart';
import 'package:cnemax/screens/AllLoginPage/signup/presonlize.dart';
import 'package:cnemax/screens/acount/Language.dart';
import 'package:cnemax/screens/acount/NotificationSetting.dart';
import 'package:cnemax/screens/acount/PersonalInfo.dart';
import 'package:cnemax/screens/acount/Security.dart';
import 'package:cnemax/screens/acount/Watchlist.dart';
import 'package:cnemax/screens/acount/payment.dart';
import 'package:cnemax/services/app_services.dart';
import 'package:cnemax/services/text_styleSheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Account_page extends StatelessWidget {
  const Account_page({super.key});

  @override
  Widget build(BuildContext context) {
    final usermodel = Provider.of<AllController>(context);
    // 5WDI3153
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Appcolor.black,
        title: Text("Account "),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ListTile(
            leading: usermodel.userdata.image == ""
                ? Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Appcolor.black),
                        shape: BoxShape.circle),
                    height: 50,
                    width: 50,
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(usermodel.userdata.image)),
            trailing: Icon(Icons.qr_code_2),
            title: Center(child: Text(usermodel.userdata.name)),
            subtitle: Text(usermodel.userdata.email),
          ),
          Divider(
            thickness: 1,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyacountListTile(
                    Leading: Icons.favorite,
                    title: 'watchlist',
                    Trailing: Icons.arrow_forward,
                    arowforwad: () {
                      App_Service.push_to_screen(Watchlist_save(), context);
                    },
                  ),
                  MyacountListTile(
                    Leading: Icons.interests_sharp,
                    title: 'Moive Interst',
                    Trailing: Icons.arrow_forward,
                    arowforwad: () {
                      App_Service.push_to_screen(Presonlize(), context);
                    },
                  ),
                  MyacountListTile(
                    Leading: Icons.payment,
                    title: 'Payment Methods',
                    Trailing: Icons.arrow_forward,
                    arowforwad: () {
                      App_Service.push_to_screen(Payment_page(), context);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text('General'),
                  ),
                  MyacountListTile(
                    Leading: Icons.person_rounded,
                    title: 'Personal info',
                    Trailing: Icons.arrow_forward,
                    arowforwad: () {
                      App_Service.push_to_screen(Personal_Info(), context);
                    },
                  ),
                  MyacountListTile(
                    Leading: Icons.notifications,
                    title: 'Notification',
                    Trailing: Icons.arrow_forward,
                    arowforwad: () {
                      App_Service.push_to_screen(
                          Notification_setting(), context);
                    },
                  ),
                  MyacountListTile(
                    Leading: Icons.security,
                    title: 'Security',
                    Trailing: Icons.arrow_forward,
                    arowforwad: () {
                      App_Service.push_to_screen(Security_page(), context);
                    },
                  ),
                  MyacountListTile(
                    Leading: Icons.circle_outlined,
                    title: 'Language',
                    Trailing: Icons.arrow_forward,
                    arowforwad: () {
                      App_Service.push_to_screen(Language_page(), context);
                    },
                  ),
                  MyacountListTile(
                    Leading: Icons.circle_outlined,
                    title: 'Dark Mode',
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text('About'),
                  ),
                  MyacountListTile(
                    Leading: Icons.help,
                    title: 'Help center',
                    Trailing: Icons.arrow_forward,
                  ),
                  MyacountListTile(
                    Leading: Icons.help,
                    title: 'Logout',
                    Trailing: Icons.arrow_forward,
                    arowforwad: () {
                      showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(30))),
                        context: context,
                        builder: (context) => Container(
                            padding: EdgeInsets.all(5),
                            height: App_Service.getscreenheight(context) * 0.25,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Logout',
                                  style: TextStyle(
                                      color: Appcolor.orange,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  'Are you sure you want to Logout?',
                                  style: AppTextStyle.fs20Medium,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Icon_Button(
                                          btnName: 'Cancel',
                                          onpressed: () {
                                            App_Service.pop_screen(context);
                                          },
                                          textclr: Appcolor.orange,
                                          bgcolor: Appcolor.skin_clr,
                                        ),
                                      ),
                                      App_Service.add_Width(10),
                                      Expanded(
                                        child: Icon_Button(
                                          btnName: 'Yes Logout',
                                          onpressed: () {
                                            App_Service.push_remove_screen(
                                                SignIn_With_acount(), context);
                                          },
                                          textclr: Appcolor.white,
                                          bgcolor: Appcolor.orange,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
