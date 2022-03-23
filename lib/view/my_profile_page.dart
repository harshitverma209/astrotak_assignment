import 'package:flutter/material.dart';

import 'friends_and_family_profile_page.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 1,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              color: Colors.white,
              child: TabBar(
                  unselectedLabelColor: Colors.black54,
                  // indicatorPadding: EdgeInsets.only(left: 30, right: 30),
                  indicator: ShapeDecoration(
                      color: Colors.orange,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            color: Colors.orange,
                          ))),
                  tabs: [
                    Tab(
                      text: 'Basic Profile',
                    ),
                    Tab(
                      text: 'Friends and Family Profile',
                    )
                  ]),
            ),
          ),
          Expanded(
              child: TabBarView(children: [
            Center(
              child: Text('Something Here'),
            ),
            FriendsAndFamilyProfilePage()
          ]))
        ],
      ),
    );
  }
}
