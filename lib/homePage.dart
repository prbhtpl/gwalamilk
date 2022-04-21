
import 'dart:convert';
import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gwalamilk/AddMoney/addMoney.dart';
import 'package:gwalamilk/BuyOnce/buyOnceScreen.dart';
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

  bool loading=false;
  List productList=[];
  List topSeellingList=[];
Future GetProducts() async {
  var api = Uri.parse(AppConstants.get_category);



  final response = await http.get(
    api,

  );

  var res = await json.decode(response.body);
  print("response12" + response.body);
  var msg = res['message'].toString();
  if(response.statusCode==200)
  {
    setState(() {
      productList=res['data'];
      loading=true;
    });
  }


}
  Future GetTopSellingProducts() async {
    var api = Uri.parse(AppConstants.trending_product1);



    final response = await http.get(
      api,

    );

    var res = await json.decode(response.body);
    print("response12" + response.body);

    if(response.statusCode==200)
    {
      setState(() {
        topSeellingList=res['data'];
        loading=true;
      });
    }


  }
@override
  void initState() {
  GetTopSellingProducts();
    GetProducts();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;


    return WillPopScope(onWillPop: ()async{
      exit(0);
    },
      child: Scaffold(
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
                    color:AppConstants.themeColor,
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
        body: loading?SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                BannerSlider(),

                Text(
                  'Top Selling Products',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 5,
                ),
                TopSellingProducts(),

                SecondBanner(),
                SizedBox(
                  height: 2,
                ),
                Text(
                  'Products',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                ),
                SizedBox(
                  height: 5,
                ),
                Categories(),
              ],
            ),
          ),
        ):Container(child: Center(child: CupertinoActivityIndicator(),),),
      ),
    );
  }

  Widget TopSellingProducts() {
    return Container(
      height: 250,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: topSeellingList==null?0:topSeellingList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 2.7 / 1.9,
            mainAxisSpacing: 4,
            crossAxisSpacing: 3,
            crossAxisCount: 1),
        itemBuilder: (BuildContext, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ItemInfoScreen(index: index,)));
            },
            child: Card(
              color:AppConstants.themeColor,
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
                        child: Image.network(
                          topSeellingList[index]['image'],
                          height: 100,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        topSeellingList[index]['product_name']  ,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        ' ${topSeellingList[index]['details'][0]['unit']} ML',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(' ₹  ${topSeellingList[index]['details'][0]['current_price']} '),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            child: FlatButton(
                              height: 28,
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
        itemCount: productList==null?0:productList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 4.5 / 4,
            mainAxisSpacing: 4,
            crossAxisSpacing: 3,
            crossAxisCount: 2),
        itemBuilder: (BuildContext, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AllProductScreen(category_Id:productList[index]["cat_id"],ProductCategoryName: productList[index]['cat_name'] ,)));
            },
            child: Card(
              color:AppConstants.themeColor,
              elevation: 0.2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: GridTile(
                header: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    productList[index]['image'],
                    height: 115,
                    fit: BoxFit.fill,
                  ),
                ),footer:   Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                      productList[index]['cat_name'],
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),
                    )),
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
  List imageList = [];bool bannerloading=false;
  Future GetBanner() async {
    // await HelperFunctions.saveuserLoggedInSharedPreference(true);



      var api = Uri.parse(AppConstants.get_banner);



      final response = await http.post(
        api,

      );

      var res = await json.decode(response.body);
      print("response" + response.body);
      var msg = res['message'].toString();
if(response.statusCode==200)
{
  setState(() {
    imageList=res['data'];
    bannerloading=true;
  });
}


    }

  var currentPage = 0;

  @override
  void initState() {
    super.initState();
    GetBanner();
  }

  @override
  Widget build(BuildContext context) {
    return bannerloading?Column(
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
              items: [
                for (var i = 0; i < imageList.length; i++)
                  bannerloading
                      ? Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                          imageList[i]['image'].toString(),
                          fit: BoxFit.fitWidth),
                    ),
                  )
                      : Container(
                    child: Center(
                      child: CupertinoActivityIndicator(
                          color: Colors.green, radius: 30),
                    ),
                  )
              ]/*imageList
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
                .toList(),*/
          ),
        ),

        DotsIndicator(dotsCount: imageList.length,position: currentPage.toDouble(), decorator: DotsDecorator(
          size: const Size.square(9.0),
          activeSize: const Size(18.0, 9.0),
          activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        ),)
      ],
    ):Container(child: const Center(child: CircularProgressIndicator(),),);
  }
}
class SecondBanner extends StatefulWidget {
  const SecondBanner({Key? key}) : super(key: key);

  @override
  State<SecondBanner> createState() => _SecondBannerState();
}

class _SecondBannerState extends State<SecondBanner> {
  List imageList = [];bool bannerloading=false;
  Future GetSecondBanner() async {




    var api = Uri.parse(AppConstants.get_sub_banner);



    final response = await http.post(
      api,

    );

    var res = await json.decode(response.body);
    print("response" + response.body);
    var msg = res['message'].toString();
    if(response.statusCode==200)
    {
      setState(() {
        imageList=res['data'];
        bannerloading=true;
      });
    }


  }

  var currentPage = 0;

  @override
  void initState() {
    super.initState();
    GetSecondBanner();
  }

  @override
  Widget build(BuildContext context) {
    return bannerloading?Column(
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
              items: [
                for (var i = 0; i < imageList.length; i++)
                  bannerloading
                      ? Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                          imageList[i]['image'].toString(),
                          fit: BoxFit.fitWidth),
                    ),
                  )
                      : Container(
                    child: Center(
                      child: CupertinoActivityIndicator(
                          color: Colors.green, radius: 30),
                    ),
                  )
              ]/*imageList
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
                .toList(),*/
          ),
        ),

        DotsIndicator(dotsCount: imageList.length,position: currentPage.toDouble(), decorator: DotsDecorator(
          size: const Size.square(9.0),
          activeSize: const Size(18.0, 9.0),
          activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        ),)
      ],
    ):Container(child: const Center(child: CircularProgressIndicator(),),);
  }
}
