import 'package:cnemax/services/text_styleSheet.dart';
import 'package:flutter/material.dart';

class Watchlist_save extends StatelessWidget {
  const Watchlist_save({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              TabBar(
                indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
                indicatorColor: Appcolor.orange,
                labelColor: Appcolor.black,
                labelStyle: AppTextStyle.fs18Medium,
                tabs: [Tab(text: 'Watchlist'), Tab(text: 'Watched')],
              ),
              Expanded(
                child: TabBarView(children: [
                  Column(
                    children: [Text('data')],
                  ),
                  Column(
                    children: [Text('data2')],
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
