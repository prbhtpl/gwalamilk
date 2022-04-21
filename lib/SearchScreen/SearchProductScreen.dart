import 'package:flutter/material.dart';

import '../Constants/appConstants.dart';
import '../ProductsScreen/itemInfoScreen.dart';
import '../ProductsScreen/productsScreen.dart';
class SearchProductScreen extends StatefulWidget {
  const SearchProductScreen({Key? key}) : super(key: key);

  @override
  State<SearchProductScreen> createState() => _SearchProductScreenState();
}

class _SearchProductScreenState extends State<SearchProductScreen> {
  TextEditingController searchBoxEditor=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,foregroundColor: Colors.black,elevation: 0.5,title: Text('Search Product'),),
      body:SingleChildScrollView(
        child: Column(children: [
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
                          hintText: 'Enter Product Name'),
                    )),
                InkWell(
                  onTap: (){
                    searchBoxEditor.clear();
                  },
                  child: Icon(Icons.clear,size: 20,),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ElevatedButton(onPressed: (){}, child: Text('Search')),
                )
              ],
            ),
          ),
        ),
          Container(
            child: GridView.builder(
shrinkWrap: true,physics: NeverScrollableScrollPhysics(),
              itemCount: 10,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 3 / 3.9,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 3,
                  crossAxisCount: 2),
              itemBuilder: (BuildContext, int index) {
                return Card(
                  color: AppConstants.themeColor,
                  elevation: 0.2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: InkWell(onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ItemInfoScreen(index: index,)));
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
                      child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                        children: [


                        ],
                      ),
                      footer: Padding(
                        padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 15.0),
                        child: ElevatedButton(
                          onPressed: () {
                          //  Navigator.push(context, MaterialPageRoute(builder: (context)=>AllProductScreen()));
                          },
                          child: Text('Buy Regular'),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
    ],),
      ),);
  }
}
