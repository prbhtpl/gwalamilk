
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../DrawerWidget/drawerWidget.dart';
class HelpAndSupportScreen extends StatefulWidget {
  const HelpAndSupportScreen({Key? key}) : super(key: key);

  @override
  State<HelpAndSupportScreen> createState() => _HelpAndSupportScreenState();
}

class _HelpAndSupportScreenState extends State<HelpAndSupportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        drawer:DrawerWidget(),appBar: AppBar(backgroundColor: Colors.white,foregroundColor: Colors.black,elevation: 0.0,title: const Text('Help & Support'),


    ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Text('Contact Us',style: TextStyle(color: Colors.black54,fontSize: 18),),
            Card( shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),child: ListTile(onTap: (){},leading: Icon(Icons.call,color: Colors.blueAccent,size: 35,),title: Text('Call Us'),)),
            Card( shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),child: ListTile(onTap: (){},leading: Icon(FontAwesomeIcons.whatsapp,color: Colors.lightGreen,size: 35,),title: Text('Contact Us on Whats App'),)),
            Card( shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),child: ListTile(onTap: (){},leading: Icon(CupertinoIcons.text_bubble_fill,color: Colors.orange,size: 35,),title: Text('Send Us Feedback'),)),
            Card( shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),child: ListTile(onTap: (){},leading: Icon(Icons.email,color: Colors.red,size: 35,),title: Text('Email'),)),


      ],),
        ),
    );
  }
}
