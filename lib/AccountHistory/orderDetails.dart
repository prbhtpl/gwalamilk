



import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
class OrderDetails extends StatefulWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

     appBar: AppBar(elevation: 0.5,title: Text('Order Details',),foregroundColor: Colors.black,backgroundColor: Colors.white,),
body: Padding(
  padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 12),
  child:   Column(crossAxisAlignment: CrossAxisAlignment.start,


    children: [

      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [

          Column(crossAxisAlignment: CrossAxisAlignment.start,children: [

            RichText(

              text: TextSpan(

                text: 'Order Id : ',

  style: TextStyle(color: Colors.black),

                children: <TextSpan>[

                  TextSpan(text: '132146543', style: TextStyle(fontWeight: FontWeight.bold)),

                ],

              ),

            ),
SizedBox(height: 5,),
            RichText(

              text: TextSpan(

                text: 'No of Products : ',

                style: TextStyle(color: Colors.black),

                children: <TextSpan>[

                  TextSpan(text: '1', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue)),

                ],

              ),

            ),
            SizedBox(height: 5,),
            RichText(

              text: TextSpan(

                text: 'Amount : ',

                style: TextStyle(color: Colors.black),

                children: <TextSpan>[

                  TextSpan(text: '116', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue)),

                ],

              ),

            ),
            SizedBox(height: 5,),
            RichText(

              text: TextSpan(

                text: 'Delivery Type : ',

                style: TextStyle(color: Colors.black),

                children: <TextSpan>[

                  TextSpan(text: 'Delivery', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue)),

                ],

              ),

            ),





          ],),

          Column(crossAxisAlignment: CrossAxisAlignment.end,children: [

            RichText(

              text: TextSpan(

                text: '12 Apr, ',

                style: TextStyle(color: Colors.black),

                children: <TextSpan>[

                  TextSpan(text: '2022', style: TextStyle(fontWeight: FontWeight.bold)),

                ],

              ),

            ),
            SizedBox(height: 5,),
            RichText(

              text: TextSpan(

                text: 'Total Items : ',

                style: TextStyle(color: Colors.black),

                children: <TextSpan>[

                  TextSpan(text: '1', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue)),

                ],

              ),

            ),
            SizedBox(height: 5,),
            RichText(

              text: TextSpan(

                text: 'Order Type : ',

                style: TextStyle(color: Colors.black),

                children: <TextSpan>[

                  TextSpan(text: 'Subscribe', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue)),

                ],

              ),

            ),







          ],)

        ],

      ),
      SizedBox(height: 15,),

      Text('Ansari Rd, Raj Vihar, Phool Bagh Colony, Lucknow, Uttar Pradesh 226022'),
      SizedBox(height: 5,),
      Divider(),
      SizedBox(height: 5,),
   RichText(

     text: TextSpan(

       text: 'Payment Method : ',

       style: TextStyle(color: Colors.black),

       children: <TextSpan>[

         TextSpan(text: 'Wallet', style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)),

       ],

     ),

   ),
      SizedBox(height: 5,),
   RichText(

     text: TextSpan(

       text: 'Transactio Id : ',

       style: TextStyle(color: Colors.black),

       children: <TextSpan>[

         TextSpan(text: 'asdafasdfasdfsadfasdsdfasdf', style: TextStyle(overflow: TextOverflow.ellipsis,color: Colors.blue,fontWeight: FontWeight.bold)),

       ],

     ),

   ),
      SizedBox(height: 5,),
   RichText(

     text: TextSpan(

       text: 'Status : ',

       style: TextStyle(color: Colors.black),

       children: <TextSpan>[

         TextSpan(text: 'Delivered', style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)),

       ],

     ),

   ),
      SizedBox(height: 5,),
      DottedLine(),
      SizedBox(height: 5,),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [

          Column(crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Text('Category'),
              SizedBox(height: 5,),
              Text('Item'),
              SizedBox(height: 5,),
              Text('Quantity'),
              SizedBox(height: 5,),
              Text('Price'),
              SizedBox(height: 5,),
              Text('Discount'),
              SizedBox(height: 5,),
              Text('Delivery Charges'),
              SizedBox(height: 5,),
              Text(' '),

              Text('Total'),
              SizedBox(height: 5,),
            ],

          ),

          Column(crossAxisAlignment: CrossAxisAlignment.end,

            children: [

              Text('MILK'),
              SizedBox(height: 5,),
              Text('Gyan,Full Cream Milk,2 litre(L)'),
              SizedBox(height: 5,),
              Text('Quantity'),
              SizedBox(height: 5,),
              Text('Price'),
              SizedBox(height: 5,),
              Text('-8',style: TextStyle(color: Colors.green),),
              SizedBox(height: 5,),
              Text('0'),



              Text(' '),
              Text('116'),
              SizedBox(height: 5,),

            ],

          )

        ],

      ),
      SizedBox(height: 5,),
      DottedLine(),
      SizedBox(height: 10,),


      Text('Status',style: TextStyle(decoration: TextDecoration.underline,),),
      SizedBox(height: 10,),
      Row(children: [

        Container(decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(50)),width: 25,height: 25,child: Icon(Icons.done,size: 20,color: Colors.white,)),

        SizedBox(width: 10,),Text('INITIATED',style: TextStyle(fontSize: 15)),  SizedBox(width: 10,),Text('Modnday 12:54 PM',style: TextStyle(color: Colors.grey,fontSize: 12),)

      ],),





    ],

  ),
),
    );
  }
}
