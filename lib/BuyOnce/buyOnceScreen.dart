import 'package:flutter/material.dart';
import 'package:gwalamilk/BuyOnce/addAddress1.dart';
import 'package:gwalamilk/Constants/appConstants.dart';

class BuyOnce extends StatefulWidget {
  const BuyOnce({Key? key}) : super(key: key);

  @override
  State<BuyOnce> createState() => _BuyOnceState();
}

class _BuyOnceState extends State<BuyOnce> {
  int value1 = -1;
  int val = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(style: ElevatedButton.styleFrom(primary: AppConstants.buttonColor),
        onPressed: () {},
        child: Text('Pay (₹ 30)'),
      ),
      appBar: AppBar(
        title: Text('Buy'),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0.5,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              Image.asset(
                'assets/milk.jpg',
                height: 280,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Full Cream Milkeam Milkeam Milkeam Milkeam Milkeam Milk,',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,

                  /* overflow: TextOverflow.ellipsis,*/
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '500 ML',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
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
                                  color: AppConstants.themeColor,
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
                                  color: AppConstants.themeColor,
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
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Price',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    '₹ 30',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: ElevatedButton(onPressed: (){

                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AddAddressScreen()));

                },
                  style: ElevatedButton.styleFrom(primary: AppConstants.buttonColor),
                  child: Text(
                    'Add New Address',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              ListViewofAddress(),

            ],
          ),
        ),
      ),
    );
  }
  Widget ListViewofAddress() {
    return ListView.builder(
      itemCount: 2,
      shrinkWrap: true,
      itemBuilder: (BuildContext, int index) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: ListTile(leading:  Text(
            'Home',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
                fontSize: 15),
          ) ,
              title:  Padding(
                padding: const EdgeInsets.all(0.0),
                child:Text(
                  'Harihar nagar, Indira nagar,Lucknow 227305',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              subtitle:  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  InkWell(onTap: (){}, child:  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
                    child: Text('Edit',style: TextStyle(fontSize: 12,color: Colors.green),),
                  )),
                  InkWell(onTap: (){}, child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
                    child: Text('Remove',style: TextStyle(fontSize: 12,color: Colors.red),),
                  )),
                ],
              ),

              trailing:   Column(
                children: [
                  Radio(
                    value: index,
                    groupValue: value1,
                    onChanged: (value) {
                      setState(() {
                        value1 = value as int;
                      });
                    },
                    activeColor: AppConstants.buttonColor,
                  ),
                ],
              )

          ),
        );
      },
    );
  }
}
