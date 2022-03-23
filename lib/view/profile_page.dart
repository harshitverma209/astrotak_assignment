import 'package:astrotak_assignment/constants.dart';
import 'package:astrotak_assignment/styles/styles.dart';
import 'package:flutter/material.dart';

import 'my_profile_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actionsIconTheme: IconThemeData(size: 20),
          title: Image.asset(
            iconImage,
            height: 60,
          ),
          bottom: TabBar(indicatorColor: Colors.orange, tabs: [
            Tab(
                child: Text(
              'My Profile',
              style: tabTitleText,
            )),
            Tab(
                child: Text(
              'Order History',
              style: tabTitleText,
            ))
          ]),
          centerTitle: true,
          actions: [
            Center(
              child: OutlinedButton(
                style: outerButtonStyle,
                onPressed: () {},
                child: Text(
                  'Logout',
                  style: TextStyle(color: Colors.orange),
                ),
              ),
            )
          ],
        ),
        body: TabBarView(children: [MyProfilePage(), Container()]),
      ),
    );
  }
}
