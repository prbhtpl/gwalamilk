import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gwalamilk/Auth/LoginScreen.dart';
import 'package:gwalamilk/Auth/otpScreen.dart';
import 'package:gwalamilk/Constants/appConstants.dart';
import 'package:http/http.dart' as http;
import '../HelperFunctions/HelperFunctions.dart';
import '../homePage.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen(this.toggle);
  final Function toggle;
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();

  TextEditingController number = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController referralCode = TextEditingController();
  TextEditingController email = TextEditingController();

  Future Register() async {
    await HelperFunctions.saveuserLoggedInSharedPreference(true);
    if (formKey.currentState!.validate()) {
      EasyLoading.show(status: 'Loading');

      var api = Uri.parse(AppConstants.user_register);

      Map mapeddate = {
        'name': name.text.toString(),
        'mobile': number.text.toString(),
        'email': email.text.toString()
      };

      final response = await http.post(
        api,
        body: mapeddate,
      );

      var res = await json.decode(response.body);
      print("response" + response.body);
      var msg = res['message'].toString();

      try {
        if (response.statusCode == 200) {
          EasyLoading.dismiss();
          if (msg == 'success') {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LoginPage(widget.toggle)));
          } else {
            EasyLoading.dismiss();
            Fluttertoast.showToast(msg: msg.toString());
          }
        } else {
          EasyLoading.dismiss();
          Fluttertoast.showToast(msg: 'Something went Wrong');
        }
      } catch (e) {
        print(e);
      }
    } else {
      EasyLoading.dismiss();
      Fluttertoast.showToast(msg: 'Fill all fields First');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: new DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.white.withOpacity(0.8), BlendMode.dstATop),
                    image: AssetImage(
                      'assets/banner.jpg',
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Column(
                    children: <Widget>[
                      SizedBox(
                        height: 110,
                      ),
                      Column(
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                border: Border.all(
                                    color: Colors.black, width: 0.5)),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white70,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    border: Border.all(
                                        color: Colors.black, width: 0.5)),
                                width: 300,
                                height: 350,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Register',
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Form(
                                        key: formKey,
                                        child: Column(
                                          children: [
                                            TextFormField(
                                              controller: number,
                                              keyboardType:
                                                  TextInputType.number,
                                              validator: (val) {
                                                return val!.length == 10
                                                    ? null
                                                    : "Please enter 10 digit mobile Number";
                                              },
                                              /*controller: mobileNumber, */ inputFormatters: [
                                                LengthLimitingTextInputFormatter(
                                                    10),
                                              ],
                                              style: TextStyle(
                                                  color: Colors.black),
                                              decoration: InputDecoration(
                                                  hintText: 'Mobile number',
                                                  hintStyle: TextStyle(
                                                      color: Colors.black54)),
                                            ),
                                            TextFormField(
                                              controller: name,
                                              style: TextStyle(
                                                  color: Colors.black),
                                              decoration: InputDecoration(
                                                  hintText: 'Full Name',
                                                  hintStyle: TextStyle(
                                                      color: Colors.black54)),
                                            ),
                                            TextFormField(
                                              validator: (val) {
                                                return RegExp(
                                                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                        .hasMatch(val!)
                                                    ? null
                                                    : "Please provide a valid email";
                                              },
                                              controller: email,
                                              style: TextStyle(
                                                  color: Colors.black),
                                              decoration: InputDecoration(
                                                  hintText: 'Email',
                                                  hintStyle: TextStyle(
                                                      color: Colors.black54)),
                                            ),
                                            TextFormField(
                                              controller: referralCode,
                                              style: TextStyle(
                                                  color: Colors.black),
                                              decoration: InputDecoration(
                                                  hintText:
                                                      'Refferal Code (Optional)',
                                                  hintStyle: TextStyle(
                                                      color: Colors.black54)),
                                            ),
                                          ],
                                        ),
                                      ),
                                      ButtonTheme(
                                        minWidth: 150.0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            side: BorderSide(
                                                color: Colors.white, width: 1)),
                                        child: RaisedButton(
                                          elevation: 1.0,
                                          hoverColor: Colors.green,
                                          color: Colors.white,
                                          child: Text(
                                            "Get OTP",
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.teal,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          onPressed: () {
                                            Register();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                              'Register means you are agree to our Terms and Privacy Policy',
                              style: GoogleFonts.patrickHand(fontSize: 15)),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: new Container(
                                    margin: const EdgeInsets.only(
                                        left: 10.0, right: 20.0),
                                    child: Divider(
                                      thickness: 1,
                                      color: Colors.white,
                                      indent: 30,
                                      height: 36,
                                    )),
                              ),
                              Text(
                                "OR",
                                style: TextStyle(color: Colors.black),
                              ),
                              Expanded(
                                child: new Container(
                                    margin: const EdgeInsets.only(
                                        left: 20.0, right: 10.0),
                                    child: Divider(
                                        thickness: 1,
                                        color: Colors.white,
                                        height: 36,
                                        endIndent: 30)),
                              ),
                            ],
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return LoginPage(widget.toggle);
                          }));
                        },
                        child: Text('Login?',
                            style: GoogleFonts.patrickHand(
                              fontSize: 25,
                              color: Colors.black,
                            )),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
