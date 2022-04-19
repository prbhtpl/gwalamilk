import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gwalamilk/AccountHistory/AccountHhistory.dart';
import 'package:gwalamilk/Auth/LoginScreen.dart';
import 'package:gwalamilk/HelpSupport/Help&SupportScreen.dart';
import 'package:gwalamilk/MyProfile/profileScreen.dart';
import 'package:gwalamilk/ProductCategory/productCategory.dart';
import 'package:gwalamilk/ProductsScreen/productsScreen.dart';

import '../AddMoney/addMoney.dart';
import '../Constants/appConstants.dart';
import '../OrderHistory/OrderHistory.dart';
import '../ReferAFriend/referAFriend.dart';
import '../homePage.dart';
class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
    child: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8),
                child: InkWell(
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    ElevatedButton(   style: ElevatedButton.styleFrom(
                      primary:AppConstants.buttonColor,
                    ),onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                    }, child: Text('Login')),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Divider(
                thickness: 1,
              ),
              InkWell(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>homePage()));
              },
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0, top: 10),
                  child: Row(
                    children: [
                      Icon(Icons.home_outlined),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Home',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                thickness: 1,
              ),
              InkWell(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductCategory()));
              },
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0, top: 10),
                  child: Row(
                    children: [
                      FaIcon(FontAwesomeIcons.boxArchive,color: Colors.black54,),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Product',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                thickness: 1,
              ),
              InkWell(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AddMoney()));
              },
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0, top: 10),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                   Row(children: [   Icon(Icons.add),
                     SizedBox(
                       width: 10,
                     ),
                     Text(
                       'Add Money',
                       style: TextStyle(fontSize: 15),
                     ),],),
                      Text('₹ 0',style: TextStyle(color: Colors.blue),)
                    ],
                  ),
                ),
              ),
              Divider(
                thickness: 1,
              ),

              InkWell(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AccountHistory()));
              },
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0, top: 10),
                  child: Row(
                    children: [
                      Icon(Icons.shopping_bag_outlined),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Account History',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                thickness: 1,
              ),
              InkWell(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderHistory()));
              },
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0, top: 10),
                  child: Row(
                    children: [
                      Icon(Icons.shopping_bag_outlined),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Order History',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                thickness: 1,
              ),
              InkWell(onTap: (){

                Navigator.push(context, MaterialPageRoute(builder: (context)=>ReferAFriend()));
              },
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0, top: 10),
                  child: Row(
                    children: [
                      Icon(CupertinoIcons.person_2_alt),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Refer a Friend',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                thickness: 1,
              ),
              InkWell(onTap: (){

                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
              },
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0, top: 10),
                  child: Row(
                    children: [
                      Icon(Icons.person_outline_rounded),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'My Profile',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                thickness: 1,
              ),

              InkWell(onTap: (){

                Navigator.push(context, MaterialPageRoute(builder: (context)=>HelpAndSupportScreen()));
              },
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0, top: 10),
                  child: Row(
                    children: [
                      Icon(Icons.call),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Help & Support',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                thickness: 1,
              ),
             /* Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Image.asset('assets/tree.jpg'),
              )*/
            ],
          ),
        ),
      ),
    ),);
  }
}
