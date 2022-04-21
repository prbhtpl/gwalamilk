import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gwalamilk/Constants/appConstants.dart';
import 'package:gwalamilk/HelperFunctions/HelperFunctions.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:http/http.dart' as http;
import '../homePage.dart';
class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key,required this.number}) : super(key: key);
final String number;
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final formKey =GlobalKey<FormState>();
  TextEditingController otp = TextEditingController();
  Future otpSend() async {
    if (formKey.currentState!.validate()) {
      EasyLoading.show(status: 'Loading');

      var api = Uri.parse(AppConstants.user_login1);

      Map mapeddate = {
        'number':widget.number.toString(),
        'otp':otp.text.toString()
      };

      final response = await http.post(
        api,
        body: mapeddate,
      );

      var res = await json.decode(response.body);
      print("response" + response.body);
      var msg = res['message'].toString();
      try {
        if (response.statusCode == 200) {     EasyLoading.dismiss();
        if(msg=='Login Successfull'){
          HelperFunctions.saveuserCurrentUserIdSharedPreference( res['user_id']);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => homePage(),
              ));

        }else{  EasyLoading.dismiss();
        Fluttertoast.showToast(msg: msg.toString());
        }

        }else{
          EasyLoading.dismiss();
          Fluttertoast.showToast(msg: 'Something went Wrong');
        }
      } catch (e) {
        print(e);
      }
    }else{
      EasyLoading.dismiss();
      Fluttertoast.showToast(msg: 'Fill all fields First');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:SingleChildScrollView(
        child: SafeArea(
          child: Stack(children: [
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 70.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  SizedBox(
                    height: 40,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      "assets/otp.png",
                      fit: BoxFit.fill,
                      height: 200,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Center(
                      child: Text(
                        'Phone Verification',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Enter the code sent to +91  ',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black54),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        widget.number,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Form(key: formKey,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: PinCodeTextField(validator: (value){
                          if(value!.isEmpty){
                            return "Please Enter Valid OTP";
                          }
                        },inputFormatters: [LengthLimitingTextInputFormatter(6)],
                          controller:otp,obscuringCharacter:'*',
                          appContext: context,backgroundColor: Colors.transparent,
                          pastedTextStyle: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w400,
                          ),
                          length: 6,
                         obscureText: true,

                          blinkWhenObscuring: true,
                          pinTheme: PinTheme(
                            borderWidth: 0.5,
                            //errorBorderColor: Colors.red,
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(5),
                            fieldHeight: 40,
                            fieldWidth: 40,
                            activeFillColor: Colors.white,
                          ),
                          cursorColor: Colors.black,
                          animationDuration: const Duration(milliseconds: 300),
                          enableActiveFill: true,
                          keyboardType: TextInputType.number,
                          boxShadows: const [
                            BoxShadow(
                              offset: Offset(0, 1),
                              color: Colors.black12,
                              blurRadius: 0.1,
                            )
                          ],
                          onCompleted: (v) {
                            debugPrint("Completed");
                          },
                          // onTap: () {
                          //   print("Pressed");
                          // },
                          onChanged: (value) {
                            debugPrint(value);
                            setState(() {
                              // currentText = value;
                            });
                          },
                          beforeTextPaste: (text) {
                            debugPrint("Allowing to paste $text");
                            return true;
                          },
                        )),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Do not receive the Code ?',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        InkWell(
                            onTap: () {
                              //
                            },
                            child: Text(
                              '  RESEND',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.red),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 26,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary:AppConstants.buttonColor),
                      onPressed: () {
                       otpSend();
                      },
                      child: const Text(
                        'Verify Phone Number',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),);
  }
}
