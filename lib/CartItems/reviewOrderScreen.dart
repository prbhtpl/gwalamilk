import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:gwalamilk/Constants/appConstants.dart';
import 'package:gwalamilk/homePage.dart';

class ReviewOrder extends StatefulWidget {
  const ReviewOrder({Key? key}) : super(key: key);

  @override
  State<ReviewOrder> createState() => _ReviewOrderState();
}

class _ReviewOrderState extends State<ReviewOrder> {
  int val = -1;
  var value1 = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.0,
        title: const Text('Review Your Orders'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5,
            ),
            Center(
                child: Text(
              'You saved ₹ 40.0',
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500),
            )),
            SizedBox(
              height: 5,
            ),
            ListViewofProduct(),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Delivery Address',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                    color: Colors.black),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 0.5, color: Color(0xff1e61de))),
              child: ListTile(
                leading: Icon(
                  Icons.home,size: 45,
                  color: Colors.lightGreen,
                ),
                title: Text(
                  'Home',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 15),
                ),
                subtitle: Text(
                  'Harihar nagar, Indira nagar,Lucknow 227305',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Colors.black54),
                ),
                trailing: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: AppConstants.buttonColor,
                  ),
                  child: Text(
                    'Change Address',
                    style: TextStyle(fontSize: 13, color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Delivery Time',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                    color: Colors.black),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 0.5, color: Color(0xff1e61de))),
                child: ListTile(
                  title: Text(
                    '10:00AM - 12:00PM',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  trailing: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: AppConstants.buttonColor,
                    ),
                    child: Text(
                      'Change Time',
                      style: TextStyle(fontSize: 13, color: Colors.white),
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            DottedLine(),
            SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Bill Details',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 8,
                      ),
         
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Discount ',
                            style: TextStyle(color: Colors.black54),
                          ),
                          Text(
                            '0',
                            style: TextStyle(color: Colors.black54),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Applied Coupon ',
                            style: TextStyle(color: Colors.black54),
                          ),
                          Text(
                            '0',
                            style: TextStyle(color: Colors.black54),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Delivery Charges ',
                            style: TextStyle(color: Colors.black54),
                          ),
                          Text(
                            '0',
                            style: TextStyle(color: Colors.black54),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border:
                                Border.all(width: 0.25, color: Colors.blue)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Total Payable Amount',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black)),
                              Text(
                                '4100',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Payment Method',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                    color: Colors.black),
              ),
            ),
            Column(
              children: [
                ListTile(trailing: Text('₹ 245',style: TextStyle(color: Colors.black54),),
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  title: const Text("Wallet"),
                  leading: Radio(
                    value: 1,
                    groupValue: val,
                    onChanged: (value) {
                      setState(() {
                        val = value as int;
                      });
                    },
                    activeColor: Colors.blue,
                  ),
                ),
                ListTile(
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  title: Text("Online"),
                  leading: Radio(
                    value: 2,
                    groupValue: val,
                    onChanged: (value) {
                      setState(() {
                        val = value as int;
                      });
                    },
                    activeColor: Colors.blue,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 120,
            ),
          ],
        ),
      ),
    );
  }

  Widget ListViewofProduct() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: 3,
      shrinkWrap: true,
      itemBuilder: (BuildContext, int index) {
        return Card(
          elevation: 0.5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: ListTile(
              leading: ClipRRect(
                child: Image.asset('assets/milk.jpg'),
              ),
              title: Text(
                'Dairy Products',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontSize: 15),
              ),
              subtitle: Row(
                children: <Widget>[
                  Text(
                    '₹ 240.00',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '₹ 360',
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                        decoration: TextDecoration.lineThrough),
                  ),
                ],
              ),
              trailing: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  width: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 0.5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            // visible = !visible;
                          });
                        },
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                              color: Color(0xffDEF1F8),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Icon(
                            Icons.remove,
                            color: Colors.red,
                            size: 17,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: Container(
                          height: 25,
                          width: 25,
                          child: Center(
                              child: Text(
                            '1',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black87,
                            ),
                          )),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                              color: Color(0xffDEF1F8),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Icon(
                            Icons.add,
                            color: Colors.green,
                            size: 17,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )),
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
                  child: ElevatedButton(   style: ElevatedButton.styleFrom(
                    primary:AppConstants.buttonColor,
                  ),
                    onPressed: () {
                      _showMOrderPlacedDialogue();
                    },
                    child: const Text(
                      'Place Order',
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

  Future<void> _showMOrderPlacedDialogue() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => homePage()));
            return true;
          },
          child: AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            contentPadding: EdgeInsets.only(top: 10.0),
            title: const Text(
              'Order Placed Successfully!!',
              style: TextStyle(color: Colors.blue),
            ),
            content: Container(
              margin: EdgeInsets.symmetric(horizontal: 100),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xffDEF1F8)),
              child: Icon(
                CupertinoIcons.check_mark,
                size: 100,
                color: Colors.green,
              ),
            ),
            actions: [
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => homePage()));
                    },
                    style: ElevatedButton.styleFrom(
                        primary: AppConstants.buttonColor),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50.0, vertical: 5),
                      child: Text('Home'),
                    )),
              )
            ],
          ),
        );
      },
    );
  }
}
