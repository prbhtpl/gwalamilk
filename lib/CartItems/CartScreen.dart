import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gwalamilk/Constants/appConstants.dart';
import '../DrawerWidget/drawerWidget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  TextEditingController searchBoxEditor = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        drawer: DrawerWidget(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0.0,
          title: const Text('Cart Screen'),
        ),
        body: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                TabBar(
                  labelColor: Colors.black,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(50), // Creates border
                      color: Colors.greenAccent),
                  isScrollable: true,
                  tabs: [
                    Tab(child: Text("Today's Orders")),
                    Tab(child: Text('Past Orders')),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: <Widget>[TodaysOrder(), PastOrders()],
                  ),
                ),
              ],
            )));
  }

  Widget TodaysOrder() {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext, int index) {
          return Card(
            elevation: 0.5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        'assets/milk.jpg',
                        height: 120,
                        width: 120,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /* Text(
                     '',   maxLines: 1,
                 softWrap: false
                     ,
                     style: TextStyle(  overflow: TextOverflow.ellipsis,

                       color: Colors.black,
                       fontWeight: FontWeight.bold,

                     ),
                   ),*/
                    Container(
                      width: 160,
                      child: Text(
                          'Full Cream Milkeam Milkeam Milkeam Milkeam Milkeam Milk,',
                          overflow: TextOverflow.fade,
                          maxLines: 1,
                          softWrap: false,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          '500 ML',
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Quantity: 2',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          '₹ 240.00',
                          style: TextStyle(fontSize: 14, color: Colors.green),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Colors.grey,
                            size: 18,
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                            size: 18,
                          ),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }

  Widget PastOrders() {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext, int index) {
          return Card(
            elevation: 0.5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        'assets/milk.jpg',
                        height: 120,
                        width: 120,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /* Text(
                     '',   maxLines: 1,
                 softWrap: false
                     ,
                     style: TextStyle(  overflow: TextOverflow.ellipsis,

                       color: Colors.black,
                       fontWeight: FontWeight.bold,

                     ),
                   ),*/
                    Container(
                      width: 180,
                      child: Text(
                          'Full Cream Milkeam Milkeam Milkeam Milkeam Milkeam Milk,',
                          overflow: TextOverflow.fade,
                          maxLines: 1,
                          softWrap: false,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      '500 ML',
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          '₹ 240.00',
                          style: TextStyle(fontSize: 14, color: Colors.blue),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '₹ 360',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              decoration: TextDecoration.lineThrough),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
