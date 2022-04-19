
import 'package:flutter/material.dart';
import 'package:gwalamilk/Constants/appConstants.dart';
import 'package:gwalamilk/DrawerWidget/drawerWidget.dart';
import 'package:gwalamilk/ProductsScreen/itemInfoScreen.dart';
class AllProductScreen extends StatefulWidget {
  const AllProductScreen({Key? key}) : super(key: key);

  @override
  State<AllProductScreen> createState() => _AllProductScreenState();
}

class _AllProductScreenState extends State<AllProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(drawer: DrawerWidget(),
      appBar: AppBar(foregroundColor: Colors.black,elevation: 0.5,
        title: Text('Milk'),backgroundColor: Colors.white,
      ),
      body:  GridView.builder(

        itemCount: 10,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 2.9 / 3.9,
            mainAxisSpacing: 4,
            crossAxisSpacing: 3,
            crossAxisCount: 2),
        itemBuilder: (BuildContext, int index) {
          return Card(
            color: Color(0xffDEF1F8),
            elevation: 0.2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: InkWell(onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ItemInfoScreen()));
            },
              child: GridTile(
                header: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                          child: Image.asset(
                            'assets/milk.jpg',
                            fit: BoxFit.fitWidth,
                          )),
                      Text('Full Cream Milkeam Milkeam Milkeam Milkeam Milkeam Milk,',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis,),),
                      Text('500 ML',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis,),),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [

                          Text(' ₹ 30'),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5.0),
                            child: FlatButton(height: 30,
                              onPressed: (){},
                              child: Text('Buy Once', style: TextStyle(
                                  color: Colors.black,
                              )
                              ),
                              textColor: Colors.black,
                              shape: RoundedRectangleBorder(side: BorderSide(
                                  color:Colors.black,
                                  width: 1,
                                  style: BorderStyle.solid
                              ), borderRadius: BorderRadius.circular(15)),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                child: Container(child: Text(' '),
                ),
                footer: Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 5, horizontal: 15.0),
                  child: ElevatedButton(style: ElevatedButton.styleFrom(primary: AppConstants.buttonColor),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>AllProductScreen()));
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
}
