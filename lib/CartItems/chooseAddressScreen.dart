import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gwalamilk/CartItems/reviewOrderScreen.dart';
import 'package:gwalamilk/Constants/appConstants.dart';

import 'addAddress.dart';
class ChooseAddressScreen extends StatefulWidget {
  const ChooseAddressScreen({Key? key}) : super(key: key);

  @override
  State<ChooseAddressScreen> createState() => _ChooseAddressScreenState();
}

class _ChooseAddressScreenState extends State<ChooseAddressScreen> {

  int value1 = -1;
  int val = -1;
  DateTime currentEndDate = DateTime.now();

  Future<void> _selectEndtDate(BuildContext context) async {
    final DateTime? pickedEndDate = await showDatePicker(
        context: context,
        initialDate: currentEndDate,
        firstDate: DateTime(2021),
        lastDate: DateTime(2090));
    if (pickedEndDate != null && pickedEndDate != currentEndDate)
      setState(() {
        currentEndDate = pickedEndDate;
      });
  }
  String selectedValue='09:00AM - 10:00AM';
  List<String> items = [
    '09:00AM - 10:00AM',
    '11:00AM - 12:00PM',
    '12:30PM - 02:00PM',
    '03:00PM - 05:00PM',
    '06:00PM - 08:00PM'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(floatingActionButton: FloatingButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0.0,
          title: const Text('Choose Address'),
        ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Delivery Details',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                    color: Colors.black),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            ListViewofAddress(),
            SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: ElevatedButton(onPressed: (){
                
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AddAddressScreen()));

              },
                style: ElevatedButton.styleFrom(primary: AppConstants.buttonColor),
                child: Text(
                  'Add New Address',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Preferred delivery time',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                )),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: InkWell(
                    onTap: () {
                      _selectEndtDate(context);
                    },
                    child: Container(
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Color(0xFFF5F5F5)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 7, left: 8),
                                child: Text(
                                  'Date',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 2, left: 8),
                                child: Text(
                                  '${currentEndDate.day}/${currentEndDate.month}/${currentEndDate.year}',
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black54,
                                      ),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 7),
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Container(
                    // height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Color(0xFFF5F5F5)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 7, left: 8),
                          child: Text(
                            'Time',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(iconSize: 28.0,elevation: 1,isDense: true,
                              items: items
                                  .map((item) =>
                                  DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                          fontSize: 13,
                                          color: Colors.black54,

                                      ),
                                    ),
                                  ))
                                  .toList(),
                              value: selectedValue,
                              onChanged: (value) {
                                setState(() {
                                  selectedValue = value as String;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
Center(child: Image.asset('assets/logo.png',height: 200,))
          ],
        ),
      )
    );
  }
  Widget ListViewofAddress() {
    return ListView.builder(
      itemCount: 2,
      shrinkWrap: true,
      itemBuilder: (BuildContext, int index) {
        return Card(margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
         shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
        ),
          child: ListTile(leading:  Text(
            'Home',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
                fontSize: 15),
          ) ,
              title:  Padding(
                padding: const EdgeInsets.all(8.0),
                child:Text(
                  'Harihar nagar, Indira nagar,Lucknow 227305',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              subtitle:  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  InkWell(onTap: (){}, child:  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
                    child: Text('Edit',style: TextStyle(fontSize: 12,color: Colors.green),),
                  )),
                  InkWell(onTap: (){}, child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
                    child: Text('Remove',style: TextStyle(fontSize: 12,color: Colors.red),),
                  )),
                ],
              ),

              trailing:   Column(
                children: [
                  Radio(
            value: index,
            groupValue: value1,
            onChanged: (value) {
                  setState(() {
                    value1 = value as int;
                  });
            },
            activeColor: AppConstants.buttonColor,
          ),
                ],
              )

          ),
        );
      },
    );
  }
  Widget FloatingButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Material(
          elevation: 10,
          shadowColor: Colors.green,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.0),
                topLeft: Radius.circular(20.0),
              ),
            ),
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 10),
                      child: Text(
                        'Total items : 4',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15, top: 10),
                      child: Text(
                        '₹ 245',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 14, vertical: 3),
                  child: ElevatedButton(
style: ElevatedButton.styleFrom(primary: AppConstants.buttonColor),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ReviewOrder()));
                    },
                    child: const Text(
                      'Review Order',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
