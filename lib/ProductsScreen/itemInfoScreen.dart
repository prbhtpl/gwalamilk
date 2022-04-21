import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gwalamilk/BuyOnce/buyOnceScreen.dart';
import 'package:http/http.dart' as http;
import '../BuyRegular/BuyRegular.dart';
import '../Constants/appConstants.dart';

class ItemInfoScreen extends StatefulWidget {
  const ItemInfoScreen({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  State<ItemInfoScreen> createState() => _ItemInfoScreenState();
}

class _ItemInfoScreenState extends State<ItemInfoScreen> {
  bool loading = false;
  List productList = [];
  List topSeellingList = [];

  Future GetTopSellingProducts() async {
    var api = Uri.parse(AppConstants.trending_product1);

    final response = await http.get(
      api,
    );

    var res = await json.decode(response.body);
    print("response12" + response.body);

    if (response.statusCode == 200) {
      setState(() {
        topSeellingList = res['data'];
        loading = true;
      });
    }
  }

  @override
  void initState() {
    visible = false;
    GetTopSellingProducts();

    super.initState();
  }

  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingButton(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.blue,
          elevation: 0.1,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart,
                ))
          ],
        ),
        body: loading
            ? SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.network(
                            topSeellingList[widget.index]['image'],
                            fit: BoxFit.fitWidth,height: 250,),
                      ),
                      Text(
                        topSeellingList[widget.index]['product_name'] ,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                            fontSize: 20),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            ' ${topSeellingList[widget.index]['details'][0]['unit']} ML',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.redAccent,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            ' ₹ ${topSeellingList[widget.index]['details'][0]['sell_price']} ',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        indent: 30,
                        endIndent: 30,
                      ),
                      Text(
                        'Nutritional Information',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                            fontSize: 18),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text('Energy (kcal)',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black54)),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('Fat (g)',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black54)),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('Carbohydrates (g)',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black54))
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text('87'),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('6'),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('4.8'),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            setState(() {
                              visible = !visible;
                            });
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('View ',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold)),
                              visible
                                  ? Text(' Less',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold))
                                  : Text(' More',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold)),
                            ],
                          )),
                      Visibility(
                        visible: visible,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('Adding SUgar (kcal)',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black54)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('Protein ',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black54)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('87'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('6'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        indent: 30,
                        endIndent: 30,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Key Features', style: TextStyle(fontSize: 15)),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                          'Milk is an excellent source of vitamins and minerals, including “nutrients of concern,” which are under-consumed by many populations. It provides potassium, B12, calcium and vitamin D, which are lacking in many diets. Milk is also a good source of vitamin A, magnesium, zinc and thiamine (B1)',
                          style:
                              TextStyle(fontSize: 13, color: Colors.black54)),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Description', style: TextStyle(fontSize: 15)),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                       topSeellingList[widget.index] ['description'],   style:
                              TextStyle(fontSize: 13, color: Colors.black54)),
                      SizedBox(
                        height: 60,
                      ),
                    ],
                  ),
                ),
              )
            : Container(
                child: Center(
                  child: CupertinoActivityIndicator(),
                ),
              ),
      ),
    );
  }

  Widget FloatingButton() {
    return Container(
      color: Colors.white,
      height: 55,
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.white),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>BuyOnce()));
              },
              child: Text(
                'Buy Once',
                style: TextStyle(color: Colors.black),
              )),
          ElevatedButton(style: ElevatedButton.styleFrom(primary: AppConstants.buttonColor),onPressed: () {

            Navigator.push(context, MaterialPageRoute(builder: (context)=>BuyRegular()));

          }, child: Text('Buy Regular'))
        ],
      ),
    );
  }
}
