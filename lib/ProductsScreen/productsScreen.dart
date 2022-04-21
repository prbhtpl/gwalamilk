import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gwalamilk/BuyOnce/buyOnceScreen.dart';
import 'package:gwalamilk/BuyRegular/BuyRegular.dart';
import 'package:gwalamilk/Constants/appConstants.dart';
import 'package:gwalamilk/DrawerWidget/drawerWidget.dart';
import 'package:gwalamilk/ProductsScreen/itemInfoScreen.dart';
import 'package:http/http.dart' as http;

class AllProductScreen extends StatefulWidget {
  const AllProductScreen({Key? key, required this.category_Id,required this.ProductCategoryName})
      : super(key: key);

  final String category_Id;
  final String ProductCategoryName;
  @override
  State<AllProductScreen> createState() => _AllProductScreenState();
}

class _AllProductScreenState extends State<AllProductScreen> {
  List Categorylist = [];
  bool loading = false;
  Future CatergoryItems() async {
    var api = Uri.parse(AppConstants.product_category);

    Map mapeddate = {'category': widget.category_Id.toString()};

    final response = await http.post(api, body: mapeddate);

    var res = await json.decode(response.body);
    print("response12" + response.body);

    if (response.statusCode == 200) {
      setState(() {
        Categorylist = res['data'];
        loading = true;
      });
    }
  }

  @override
  void initState() {
    CatergoryItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        foregroundColor: Colors.black,
        elevation: 0.5,
        title: Text(widget.ProductCategoryName.toString()),
        backgroundColor: Colors.white,
      ),
      body:loading? GridView.builder(
        itemCount: Categorylist==null?0:Categorylist.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 2.9 / 3.9,
            mainAxisSpacing: 4,
            crossAxisSpacing: 3,
            crossAxisCount: 2),
        itemBuilder: (BuildContext, int index) {
          return Card(
            color:AppConstants.themeColor,
            elevation: 0.2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ItemInfoScreen(
                              index: index,
                            )));
              },
              child: GridTile(
                header: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                          child: Image.network(
                        Categorylist[index]['image'],
                        fit: BoxFit.fitWidth,height: 100,
                      )),
                      Text(
                        Categorylist[index]['product_name'],
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        '500 ML',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(' ₹  ${Categorylist[index]['details'][0]['current_price']} '),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            child: FlatButton(
                              height: 30,
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>BuyOnce()));
                              },
                              child: Text('Buy Once',
                                  style: TextStyle(
                                    color: Colors.black,
                                  )),
                              textColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                      style: BorderStyle.solid),
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                child: Container(
                  child: Text(' '),
                ),
                footer: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 15.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: AppConstants.buttonColor),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>BuyRegular()));
                    },
                    child: Text('Buy Regular'),
                  ),
                ),
              ),
            ),
          );
        },
      ):Container(child: Center(child: CupertinoActivityIndicator(),),),
    );
  }
}
