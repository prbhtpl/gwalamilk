import 'package:flutter/material.dart';
import 'package:gwalamilk/DrawerWidget/drawerWidget.dart';

import '../ProductsScreen/productsScreen.dart';
class ProductCategory extends StatefulWidget {
  const ProductCategory({Key? key}) : super(key: key);

  @override
  State<ProductCategory> createState() => _ProductCategoryState();
}

class _ProductCategoryState extends State<ProductCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(drawer: DrawerWidget(),
      appBar: AppBar(title: Text('Product List'),
      backgroundColor: Colors.white,
        foregroundColor: Colors.black,elevation: 0.5,
      ),
      body: Stack(
        children: [
          Container(height: 80,width: MediaQuery.of(context).size.width,color: Color(0xff29AAE3),),

         Padding(
           padding: const EdgeInsets.only(top: 40.0),
           child: Container(  decoration: BoxDecoration(color: Colors.white,
             borderRadius: BorderRadius.only(
               topRight: Radius.circular(40),
               topLeft:  Radius.circular(40)
             ),

           ),child:Padding(
             padding: const EdgeInsets.only(top: 40.0),
             child: GridView.builder(
               shrinkWrap: true,
               physics: const NeverScrollableScrollPhysics(),
               itemCount: 4,
               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                   childAspectRatio: 4.2 / 4,
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
           ),),
         )
        ],
      ),
    );
  }
}
