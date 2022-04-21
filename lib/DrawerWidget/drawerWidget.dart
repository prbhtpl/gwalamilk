import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gwalamilk/AccountHistory/AccountHhistory.dart';
import 'package:gwalamilk/Auth/LoginScreen.dart';
import 'package:gwalamilk/HelpSupport/Help&SupportScreen.dart';
import 'package:gwalamilk/MyProfile/profileScreen.dart';
import 'package:gwalamilk/ProductCategory/productCategory.dart';
import 'package:gwalamilk/ProductsScreen/productsScreen.dart';
import 'package:http/http.dart' as http;
import '../AddMoney/addMoney.dart';
import '../Constants/appConstants.dart';
import '../HelperFunctions/HelperFunctions.dart';
import '../OrderHistory/OrderHistory.dart';
import '../ReferAFriend/referAFriend.dart';
import '../homePage.dart';
import 'Authenticate.dart';
class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {

String name='';
String email='';
String number='';
  Future GetUserInfo() async {


var userId=await HelperFunctions.getCurrentUserIdSharedPreference();

      var api = Uri.parse(AppConstants.get_user);

      Map mapeddate = {
        'user_id':userId.toString()
      };

      final response = await http.post(
        api,
        body: mapeddate,
      );

      var res = await json.decode(response.body);
      print("response" + response.body);

      try {
        if (response.statusCode == 200) {
setState(() {
  name=res["user_name"];
  email=res["user_email"];
  number=res["user_contact"];
});

        }else{

          Fluttertoast.showToast(msg: 'Something went Wrong');
        }
      } catch (e) {
        print(e);
      }
    }



  Future<void> logout_Dialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Are you sure to Log Out ?',
            style: TextStyle(fontSize: 18),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black54),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 28),
                    child: const Text('Logout',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.red)),
                  ),
                  onPressed: () async {
                    await HelperFunctions.saveuserLoggedInSharedPreference(
                        false);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Authenticate()));
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    GetUserInfo();
    super.initState();
  }
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
                padding: const EdgeInsets.all(12),
                child: Container(height: 80,
                  child: Center(
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ClipRRect(borderRadius: BorderRadius.circular(15),
                          child: Image.asset('assets/invite.png',height: 60,),
                        ),
                        Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(name,style: GoogleFonts.anonymousPro(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.blueAccent),),
                            Text(email),
                            Text(number),
                          ],
                        ),
                      ],
                    ),
                  ),
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
              InkWell(onTap: (){
                logout_Dialog();
              },
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0, top: 10),
                  child: Row(
                    children: [
                      Icon(Icons.exit_to_app),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Log Out',
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
