import 'package:flutter/material.dart';
class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({Key? key}) : super(key: key);

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  int val=-1;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(elevation:0.5,title: Text('Add Address'),backgroundColor: Colors.white,foregroundColor: Colors.black,actions: [ ElevatedButton(
        style:
        ElevatedButton.styleFrom(primary: Color(0xff1fbdcd)),
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text(
          'Save',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      )],),
      body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
Image.asset('assets/addAddress.png'),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 0.03)),
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(border: InputBorder.none,
                        fillColor: Colors.transparent,
                        filled: true,
                        hintText: 'Full Address',
                      ),
                  ),
                ),


                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 45,  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 0.03)),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        fillColor: Colors.transparent,
                        filled: true,
                        hintText: 'Enter your city',
                        border: InputBorder.none),
                  ),
                ),

                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 0.03)),
                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: InputDecoration(
                        fillColor: Colors.transparent,
                        filled: true,
                        hintText: 'Enter your state',
                        border:InputBorder.none),
                  ),
                ),
                 SizedBox(
                   height: 15,
                ),

                Container(
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 0.03)),
                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: InputDecoration(
                        fillColor: Colors.transparent,
                        filled: true,
                        hintText: 'Enter your pinCode',
                        border:InputBorder.none),
                  ),
                ),

                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 0.03)),
                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: InputDecoration(
                        fillColor: Colors.transparent,
                        filled: true,
                        hintText: 'Enter your country',
                        border: InputBorder.none),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),

                Row(
                  children: [ Radio(
                    value: 1,
                    groupValue: val,
                    onChanged: (value) {
                      setState(() {
                        val = value as int;
                      });
                    },
                    activeColor: Color(0xff73c803),
                  ),Text("Home"),
          Radio(
            value: 2,
            groupValue: val=-1,
            onChanged: (value) {
              setState(() {
                val = value as int;
              });
            },
            activeColor: Color(0xff73c803),
          ), Text("Office"),

                  ],
                ),
                const SizedBox(
                  height: 20,
                ),

              ],
            ),
          ),

    );
  }
}
