import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../BuyOnce/addAddress1.dart';
import '../CartItems/CartScreen.dart';
import '../Constants/appConstants.dart';
class BuyRegular extends StatefulWidget {
  const BuyRegular({Key? key}) : super(key: key);

  @override
  State<BuyRegular> createState() => _BuyRegularState();
}

class _BuyRegularState extends State<BuyRegular> {
  int value1 = -1;

  DateTime currentEndDate = DateTime.now();
TextEditingController searchBoxEditor =TextEditingController();
  Future<void> _selectEndtDate(BuildContext context) async {
    final DateTime? pickedEndDate = await showDatePicker(
        context: context,
        initialDate: currentEndDate,
        firstDate: DateTime(2021),
        lastDate: DateTime(2090));
    if (pickedEndDate != null && pickedEndDate != currentEndDate)
      setState(() {
        currentEndDate = pickedEndDate;
      });
  }
  String selectedValue='Daily';
  List<String> items = [
    'Daily',
    'Alternate Days',
    'Select Days',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Schedule Calendar'),backgroundColor: Colors.white,foregroundColor: Colors.black,elevation: 0.0,),

   body: SingleChildScrollView(
     child: Padding(
       padding: const EdgeInsets.all(8.0),
       child: Column(crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Padding(
             padding: const EdgeInsets.only(top: 7, left: 8),
             child: Text(
               'Item ',
               style: TextStyle(
                   fontSize: 18,
                   color: Colors.black,
                   fontWeight: FontWeight.w600),
             ),
           ),
           SizedBox(height: 10,),
           Card(
             elevation: 0.5,shape:  RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(15.0),
           ),
             child: Row(children: [
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Card( elevation: 2,shape:  RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(15.0),
                 ),
                   child: ClipRRect(borderRadius: BorderRadius.circular(15),
                     child: Image.asset('assets/milk.jpg',height: 120,width: 120,fit: BoxFit.fill,),
                   ),
                 ),
               ),
               Column(crossAxisAlignment: CrossAxisAlignment.start,
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
                   Container(width: 180,
                     child: Text(
                       'Full Cream Milkeam Milkeam Milkeam Milkeam Milkeam Milk,',
                       overflow: TextOverflow.fade,
                       maxLines: 1,
                       softWrap: false,
                         style: TextStyle(

                           color: Colors.black,
                           fontWeight: FontWeight.bold,

                         )
                     ),
                   ),

                   SizedBox(
                     height: 15,
                   ),
                   Text(
                     '500 ML',
                     style: TextStyle(
                         fontSize: 12,

                         color: Colors.black54),
                   ), SizedBox(
                     height: 15,
                   ),
                   Row(
                     children: <Widget> [

                       Text(
                         '₹ 240.00',
                         style: TextStyle(
                             fontSize: 14,

                             color: Colors.blue),
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
                 ],
               ),
             ],),
           ),
           SizedBox(height: 25,),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: [
               Padding(
                 padding: const EdgeInsets.only(left: 10),
                 child: InkWell(
                   onTap: () {
                     _selectEndtDate(context);
                   },
                   child: Container(
                     height: 50,
                     width: 120,
                     decoration: BoxDecoration(
                       color: Color(0xFFF5F5F5),
                       borderRadius: BorderRadius.circular(5),
                       border: Border.all(color: Color(0xFFF5F5F5)),
                     ),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Padding(
                               padding: const EdgeInsets.only(top: 7, left: 8),
                               child: Text(
                                 'Start Date',
                                 style: TextStyle(
                                     fontSize: 12,
                                     color: Colors.black,
                                     fontWeight: FontWeight.w600),
                               ),
                             ),
                             Padding(
                               padding: const EdgeInsets.only(top: 2, left: 8),
                               child: Text(
                                 '${currentEndDate.day}/${currentEndDate.month}/${currentEndDate.year}',
                                 style: TextStyle(
                                   fontSize: 13,
                                   color: Colors.black54,
                                 ),
                               ),
                             )
                           ],
                         ),
                         Padding(
                           padding: const EdgeInsets.only(right: 7),
                           child: Icon(
                             Icons.keyboard_arrow_down,
                             color: Colors.grey,
                           ),
                         )
                       ],
                     ),
                   ),
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.only(right: 10),
                 child: Container(
                   // height: 50,
                   width: 200,
                   decoration: BoxDecoration(
                     color: Color(0xFFF5F5F5),
                     borderRadius: BorderRadius.circular(5),
                     border: Border.all(color: Color(0xFFF5F5F5)),
                   ),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Padding(
                         padding: const EdgeInsets.only(top: 7, left: 8),
                         child: Text(
                           'Days',
                           style: TextStyle(
                               fontSize: 12,
                               color: Colors.black,
                               fontWeight: FontWeight.w600),
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(left: 8),
                         child: DropdownButtonHideUnderline(
                           child: DropdownButton(iconSize: 28.0,elevation: 1,isDense: true,
                             items: items
                                 .map((item) =>
                                 DropdownMenuItem<String>(
                                   value: item,
                                   child: Text(
                                     item,
                                     style: const TextStyle(
                                       fontSize: 13,
                                       color: Colors.black54,

                                     ),
                                   ),
                                 ))
                                 .toList(),
                             value: selectedValue,
                             onChanged: (value) {
                               setState(() {
                                 selectedValue = value as String;
                                 print(selectedValue);
                               });
                             },
                           ),
                         ),
                       ),
                     ],
                   ),
                 ),
               ),
             ],
           ),
           SizedBox(height: 25,),
           Visibility(visible: selectedValue=='Select Days'?false:true,
             child: Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20.0),
               child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                 Text('Quantity'),
                 Container(width: 80,
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
                 )
               ],),
             ),
           ),  SizedBox(height: 25,),
           Visibility(visible:selectedValue== 'Select Days'?true:false,
             child: Container(height: 350,
               decoration: BoxDecoration(border: Border.all(width: 0.2),borderRadius: BorderRadius.circular(10)),
               child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                   Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                     Text('Monday'),
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
                     )
                   ],),
                   Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                     Text('Tuesday'),
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
                     )
                   ],),
                   Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                     Text('Wednesday'),
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
                     )
                   ],),
                   Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                     Text('Thrusday'),
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
                     )
                   ],),
                   Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                     Text('Friday'),
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
                     )
                   ],),
                   Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                     Text('Saturday'),
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
                     )
                   ],),
                   Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                     Text('Sunday'),
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
                     )
                   ],),
                 ],),
               ),
             ),
           ), SizedBox(height: 25,),
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
           ), SizedBox(height: 25,),
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
           FloatingButton()
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
      physics: NeverScrollableScrollPhysics(),
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
  Widget FloatingButton(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.end,crossAxisAlignment: CrossAxisAlignment.stretch,children: [

        ElevatedButton(style: ElevatedButton.styleFrom(primary: AppConstants.buttonColor),onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen()));
        }, child: Text('Subscribe'))

      ],),
    );
  }
}
