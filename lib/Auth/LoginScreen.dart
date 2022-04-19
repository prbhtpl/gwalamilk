import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gwalamilk/Auth/RegisterScreen.dart';
import 'package:gwalamilk/Auth/otpScreen.dart';
import 'package:gwalamilk/homePage.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child:Stack(
            children: [
              Container(height: MediaQuery.of(context).size.height,
              width:MediaQuery.of(context).size.width ,
               decoration: BoxDecoration(

                  image: new DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter:
                    ColorFilter.mode(Colors.white.withOpacity(0.8),
                        BlendMode.dstATop),
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
                                border:
                                Border.all(color: Colors.black, width: 0.5)),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                decoration: BoxDecoration(  color: Colors.white70,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                    border:
                                    Border.all(color: Colors.black, width: 0.5)),

                                width: 300,
                                height: 250,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.stretch,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Text(
                                        'Log In',
                                        style: TextStyle( decoration: TextDecoration.underline,

                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Form(
                                      /*    key: formKey,*/
                                        child: Column(
                                          children: [
                                            TextFormField(
                                              keyboardType:
                                              TextInputType.number,
                                              validator: (val) {
                                                return val!.length == 10
                                                    ? null
                                                    : "Please enter 10 digit mobile Number";
                                              },/*controller: mobileNumber, */inputFormatters: [
                                              LengthLimitingTextInputFormatter(10),
                                            ],
                                              style:
                                              TextStyle(color: Colors.black),
                                              decoration: InputDecoration(
                                                  hintText: 'Enter your mobile number',
                                                  hintStyle: TextStyle(
                                                      color: Colors.black)),
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
                                            /*      Login();*/
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpScreen()));
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
                              'Login means you are agree to our Terms and Privacy Policy',
                              style:
                              GoogleFonts.patrickHand(fontSize: 15)),
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
                      InkWell(onTap: (){
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                              return SignUpScreen();
                            }));
                      },
                        child: Text('Create new Account',
                            style:  GoogleFonts.patrickHand(fontSize: 25,color: Colors.black,)),
                      ),

                    ],
                  )],
              )
            ],
          ) ,
        ),
      ),
      
      
    );
  }
}
