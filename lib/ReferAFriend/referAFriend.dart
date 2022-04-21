import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gwalamilk/DrawerWidget/drawerWidget.dart';

import '../Constants/appConstants.dart';

class ReferAFriend extends StatefulWidget {
  const ReferAFriend({Key? key}) : super(key: key);

  @override
  State<ReferAFriend> createState() => _ReferAFriendState();
}

class _ReferAFriendState extends State<ReferAFriend> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),

      appBar: AppBar(
        elevation: 0.0,
        foregroundColor: Colors.black,
        backgroundColor: AppConstants.themeColor,
        title: Text('Refer a Friend'),
      ),
      body: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Stack(
          children: [
            Container(
              height: 400,
              width: MediaQuery.of(context).size.width,
              color: AppConstants.themeColor,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TabBar(
                      labelColor: Colors.black,
                      tabs: [
                        Tab(
                          text: 'Howo to Refer',
                        ),
                        Tab(
                          text: 'My Referrals',
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(children: [
                        HowtoRefer(),
                        ViewYouReferels(),
                      ]),
                    )
                  ],
                ),
              ),
            ),
            Container(
                height: 110,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Total Earning',
                          style: TextStyle(fontSize: 22),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Text('₹ 50', style: TextStyle(fontSize: 18)),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

class HowtoRefer extends StatefulWidget {
  const HowtoRefer({Key? key}) : super(key: key);

  @override
  State<HowtoRefer> createState() => _HowtoReferState();
}

class _HowtoReferState extends State<HowtoRefer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(   floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [Stack(children: [
            Container(height: 50,color: Colors.white,),
            Column(crossAxisAlignment: CrossAxisAlignment.stretch,

              children: [
                ElevatedButton(onPressed: () {}, child: Text('Share Now')),
              ],
            )
          ],)

          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              InkWell(
                onTap: () {},
                child: Container(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/invite.png',
                        height: 120,
                        width: 90,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Invite',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Share Referral invite with '),
                      SizedBox(
                        height: 10,
                      ),
                      Text('friends'),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/earn.png',
                        height: 120,
                        width: 90,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Earn Rewards',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Share Referral invite with '),
                      SizedBox(
                        height: 10,
                      ),
                      Text('friends'),
                    ],
                  ),
                ),
              ),
            ]),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    'assets/repeat.png',
                    height: 40,
                    width: 40,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Repeat',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Refer upto 5 Times!'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ViewYouReferels extends StatefulWidget {
  const ViewYouReferels({Key? key}) : super(key: key);

  @override
  State<ViewYouReferels> createState() => _ViewYouReferelsState();
}

class _ViewYouReferelsState extends State<ViewYouReferels> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 15,
        itemBuilder: (BuildContext, int index) {
          return Card(margin: EdgeInsets.symmetric(vertical: 5),
            child: ListTile(
              leading: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    'assets/invite.png',
                    height: 50,
                    width: 50,
                  )),
              title: Column(mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rahul',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('13/4/2022',style: TextStyle(color: Colors.black54,),),
                ],
              ),
              trailing: ElevatedButton(
                onPressed: () {},
                child: const Text('Redeem'),
              ),
            ),
          );
        });
  }
}
