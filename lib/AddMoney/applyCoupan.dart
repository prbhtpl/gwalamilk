
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Constants/appConstants.dart';
class ApplyCoupanScreen extends StatefulWidget {
  const ApplyCoupanScreen({Key? key}) : super(key: key);

  @override
  State<ApplyCoupanScreen> createState() => _ApplyCoupanScreenState();
}

class _ApplyCoupanScreenState extends State<ApplyCoupanScreen> {
  TextEditingController searchBoxEditor=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Apply Coupan'),
        backgroundColor:AppConstants.themeColor,
        foregroundColor: Colors.black,elevation: 0,
      ),
      body:Stack(
        children: [
          Container(
            height: 400,
            width: MediaQuery.of(context).size.width,
            color:AppConstants.themeColor,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40)),
              ),
              child:Column(
                children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),border: Border.all(color: Colors.blue,width: 0.5)),
                    child: Row(
                      children: [
                        Expanded(
                            child: TextFormField(
                              controller: searchBoxEditor,
                              decoration: InputDecoration(   contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(color: Colors.grey),
                                  hintText: 'Enter Coupan Code'),
                            )),
                        InkWell(
                          onTap: (){
                            searchBoxEditor.clear();
                          },
                          child: Icon(Icons.clear,size: 20,),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: ElevatedButton(   style: ElevatedButton.styleFrom(
                            primary:AppConstants.buttonColor,
                          ),onPressed: (){}, child: Text('Search')),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 30,width: MediaQuery.of(context).size.width,child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
                  child: Text('Available Offers',),
                ),color:Color(0xffc8eff6),),
                Container(child: Center(child: Text('You do not have any active coupan.'),),)
              ],),
            ),
          ),

        ],
      ),
    );
  }
}
