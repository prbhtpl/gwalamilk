
import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gwalamilk/AddMoney/addMoney.dart';
import 'package:gwalamilk/BuyRegular/BuyRegular.dart';
import 'package:gwalamilk/CartItems/CartScreen.dart';
import 'package:gwalamilk/DrawerWidget/drawerWidget.dart';
import 'package:gwalamilk/NotificationScreen/Notification.dart';
import 'package:gwalamilk/ProductsScreen/productsScreen.dart';
import 'package:gwalamilk/SearchScreen/SearchProductScreen.dart';
import 'package:http/http.dart' as http;
import 'Constants/appConstants.dart';
import 'ProductsScreen/itemInfoScreen.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(  leading: Builder(
        builder: (context) => IconButton(
          icon: Icon(Icons.clear_all_sharp,size: 35,),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
        elevation: 0.1,
        toolbarHeight: 55,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: IconButton(icon: Icon(Icons.search), onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchProductScreen()));
        }),
        actions: [
          InkWell(onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AddMoney()));
          },
            child: Container(
              margin: EdgeInsets.symmetric(
                vertical: 10,
              ),
              decoration: BoxDecoration(
                  color: Color(0xffDEF1F8),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.blue)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.wallet,
                      color: Colors.deepOrange.shade300,
                      size: 15,
                    ),
                    Text(' ₹ 0')
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationScreen()));
          },
            child: Padding(
              padding: const EdgeInsets.only(top: 12.0,left: 10,right: 10),
              child: Stack(
                children: [

                  Icon(Icons.notifications_active_outlined, color: Colors.blue,size: 30,),
                  Positioned(

                      left: 15,

                      child: Container(height: 15,width:15,decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(50)) ,child: Center(child: Text('1',style: TextStyle(fontSize: 12,color: Colors.white),)),)),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen()));
          },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.shopping_cart,
                color: Colors.blue,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5,
              ),
              BannerSlider(),
              SizedBox(
                height: 5,
              ),
              Text(
                'Top Selling Products',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
              SizedBox(
                height: 5,
              ),
              TopSellingProducts(),
              SizedBox(
                height: 5,
              ),
              Text(
                'Products',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
              SizedBox(
                height: 5,
              ),
              Categories(),
            ],
          ),
        ),
      ),
    );
  }

  Widget TopSellingProducts() {
    return Container(
      height: 250,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 2.7 / 1.9,
            mainAxisSpacing: 4,
            crossAxisSpacing: 3,
            crossAxisCount: 1),
        itemBuilder: (BuildContext, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ItemInfoScreen()));
            },
            child: Card(
              color: Color(0xffDEF1F8),
              elevation: 0.2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: GridTile(
                header: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(0),
                        child: Image.asset(
                          'assets/milk.jpg',
                          height: 100,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Full Cream Milkeam Milkeam Milkeam Milkeam Milkeam Milk,',
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
                          Text(' ₹ 30'),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            child: FlatButton(
                              height: 28,
                              onPressed: () {},
                              child: Text('Buy Once',
                                  style: TextStyle(
                                    color: Colors.black,
                                  )),
                              textColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: Colors.black,
                                      width: 0.3,
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
                    child: Text(
                  ' ',
                )),
                footer: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary:AppConstants.buttonColor,
                    ),
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
      ),
    );
  }

  Widget Categories() {
    return Container(
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 4,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 4.5 / 4,
            mainAxisSpacing: 4,
            crossAxisSpacing: 3,
            crossAxisCount: 2),
        itemBuilder: (BuildContext, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AllProductScreen()));
            },
            child: Card(
              color: Color(0xffDEF1F8),
              elevation: 0.2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: GridTile(
                header: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/milk.jpg',
                        height: 135,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: Text(
                        'Milk',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                    ),
                  ],
                ),
                child: Container(),
              ),
            ),
          );
        },
      ),
    );
  }
}

class BannerSlider extends StatefulWidget {
  const BannerSlider({
    Key? key,
  }) : super(key: key);

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  final List<String> imageList = [
    'assets/1.jpg',
    'assets/2.jpg',
    'assets/1.jpg',
    'assets/2.jpg',
    'assets/1.jpg',
    'assets/2.jpg', 'assets/1.jpg',
    'assets/2.jpg',

  ];
  Future GetBanner() async {
    // await HelperFunctions.saveuserLoggedInSharedPreference(true);



      var api = Uri.parse(AppConstants.get_banner);



      final response = await http.post(
        api,

      );

      var res = await json.decode(response.body);
      print("response" + response.body);
      var msg = res['message'].toString();



    }

  var currentPage = 0;

  @override
  void initState() {
    super.initState();
    GetBanner();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: CarouselSlider(
            options: CarouselOptions(
                autoPlayAnimationDuration: const Duration(milliseconds: 1000),
                autoPlayInterval: const Duration(seconds: 4),
                aspectRatio: 10 / 9,
                // aspectRatio: 2.0,
                viewportFraction: 0.97,
                height: 130,
                //reverse: false,
                enlargeCenterPage: true,
                autoPlay: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentPage = index ;
                  });
                }),
            items: imageList
                .map((e) => ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Image.asset(
                    e,
                    width: 900,
                    height: 120,
                    fit: BoxFit.cover,
                  )
                ],
              ),
            ))
                .toList(),
          ),
        ),

        DotsIndicator(dotsCount: imageList.length,position: currentPage.toDouble(), decorator: DotsDecorator(
          size: const Size.square(9.0),
          activeSize: const Size(18.0, 9.0),
          activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        ),)
      ],
    );
  }
}
