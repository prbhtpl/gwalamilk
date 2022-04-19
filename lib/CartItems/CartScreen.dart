import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gwalamilk/CartItems/chooseAddressScreen.dart';
import 'package:gwalamilk/Constants/appConstants.dart';

import '../DrawerWidget/drawerWidget.dart';
import 'addAddress.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  TextEditingController searchBoxEditor=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 3),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary:AppConstants.buttonColor,
                ),
                onPressed: () {
                   Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ChooseAddressScreen()));
                },
                child: const Text(
                  'Proceed to checkout',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: DrawerWidget(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.0,
        title: const Text('Cart Screen'),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              ListViewofProduct(),

              Container(margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),border: Border.all(color: Colors.blue,width: 0.2)),
                child: Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                          controller: searchBoxEditor,
                          decoration: InputDecoration(
                              prefixIcon: Icon(CupertinoIcons.checkmark_seal_fill,color: AppConstants.buttonColor,),contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Colors.grey),
                              hintText: 'Enter Coupan Code Here'),
                        )),
                    InkWell(
                      onTap: (){
                        searchBoxEditor.clear();
                      },
                      child: Icon(Icons.clear,size: 20,),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ElevatedButton(style: ElevatedButton.styleFrom(primary: AppConstants.buttonColor),onPressed: (){}, child: Text('Apply')),
                    )
                  ],
                ),
              ),

              SelectCoupan(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
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
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              '0',
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Applied Coupon ',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              '0',
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Delivery Charges ',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              '0',
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                        const Divider(
                          thickness: 1,
                        ),
                        Row(
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
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              )
            ],
          ),
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
          elevation: 0.5,shape:  RoundedRectangleBorder(
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
                children: <Widget> [
                  Text(
                    '₹ 240.00',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87),
                  ), SizedBox(
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
              trailing: Column(crossAxisAlignment: CrossAxisAlignment.end,mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(onTap: (){},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Icon(CupertinoIcons.clear_circled,color: Colors.red,size: 18,),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Container(width: 80,
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
                  ),
                ],
              )),
        );
      },
    );
  }
  Widget SelectCoupan(){
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: 2,
      shrinkWrap: true,
      itemBuilder: (BuildContext, int index) {
        return Container(margin: EdgeInsets.all(3),decoration: BoxDecoration(color: Colors.white70,borderRadius: BorderRadius.circular(5),border: Border.all(color: Colors.blue.shade200)),
          child: ListTile(dense: true,
              leading: Container(decoration: BoxDecoration(color: Colors.white70,borderRadius: BorderRadius.circular(5),border: Border.all(color: Colors.blue.shade200,width: 0.2)),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text('#12243'),
                ),
              ),
              title: const Text(
                '40% Off on First Buy',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontSize: 15),
              ),
              subtitle: const Text(
                'Valid Up To 22 April 2022',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.black54),
              ),
              trailing:ElevatedButton(   style: ElevatedButton.styleFrom(
                primary:AppConstants.buttonColor,
              ),onPressed: (){},child: Text('Redeem'),)),
        );
      },
    );
  }
}
