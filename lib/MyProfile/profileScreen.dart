
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gwalamilk/MyProfile/ScheduleVacation.dart';
import 'package:gwalamilk/MyProfile/editProfilleScreen.dart';

import '../DrawerWidget/drawerWidget.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:DrawerWidget(),appBar: AppBar(backgroundColor: Colors.white,foregroundColor: Colors.black,elevation: 0.0,title: const Text('Profile'),
    actions: [TextButton(onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfile()));
    }, child: Text('Edit'))],

    ),
body: SafeArea(
  child:   Column(crossAxisAlignment: CrossAxisAlignment.center,
  
    children: [
  
  Center(
  
    child:    InkWell(
      onTap: () {
        /*  _showMyDialog();*/
      },
      child: Container(
        width: 125,
        height: 125,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: Colors.blue, width: 1),
        ),
        child: ClipOval(
            child:  Image.asset(
              'assets/person1.jpg',
              fit: BoxFit.cover,
            )),
      ),
    ),
  
  ),
  
      Text('Prabhat Kumar Pal'),
  
      Padding(
  
        padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 5),
  
        child: Text('Chandan Hospital- Best Hospital in Lucknow | Cardiac Hospital, Cancer Hospital in Lucknow | IVF Hospital Lucknow ',style: TextStyle(color: Colors.blue),),
  
      ),
  
      Text('7777777777'),
  
  Divider(),
  
      InkWell(onTap: (){},
        child: Padding(

          padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 15),

          child: Row(children: [

            Icon(CupertinoIcons.location_solid),SizedBox(width: 10,),Text('My Address')

          ],),

        ),
      ),
  
      Divider(),
  
      InkWell(onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ScheduleVacation()));
      },
        child: Padding(

          padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 15),

          child: Row(children: [

            Icon(CupertinoIcons.calendar_badge_minus),SizedBox(width: 10),Text('Schedule Vacation')

          ],),

        ),
      ),

  
    ],
  
  ),
),
    );
  }
}
