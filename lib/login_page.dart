import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:pulkittyagi/OTP_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'api_models/login_response.dart';


class LoginPage extends StatefulWidget {

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    // getValue();
  }


  var clr = const Color(0xFF12739b);
 // var result = " ";
  var isLoading = false;

  void onLoginClick(String email) async {
    try {
      setState(() {
        isLoading = true;
      });

      Response response = await http.post(
          Uri.parse('http://18.224.233.81:4000/api/user/signin'),
          body: {
        'email': email,
        'password': '12345',
      });

      debugPrint('response.body::: ${response.body}');

      var decodedData = jsonDecode(response.body);
      LoginApiResponse loginApiResponse = LoginApiResponse.fromJson(decodedData);
      debugPrint('response.body::: ${loginApiResponse.message}');


      if (loginApiResponse.success == true) {

        print('Token :: ${loginApiResponse.data!.accessToken}');
        print('Id = ${loginApiResponse.data?.sId}');

        // print('data from model ${loginApiResponse.toJson()}');
        debugPrint('otp :: ${loginApiResponse.data?.otp}');


        var prefs = await SharedPreferences.getInstance();
        prefs.setBool('loggin', true);
        prefs.setString('userId', '${loginApiResponse.data!.sId}');
        prefs.setString('Token', '${loginApiResponse.data!.accessToken}');


        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return OTPscreen(loginApiResponse.data!.otp);
        }));


      } else {
        print(loginApiResponse.message);
        Fluttertoast.showToast(msg: 'Your email is does not exist',gravity: ToastGravity.BOTTOM);
      }

      setState(() {
        isLoading = false;
      });

    } catch (e) {
      print(e.toString());
    }
  }


   // GlobalKey<FormState> formkey = GlobalKey<FormState>();

  validate() {
    //var otptext = result;

    final bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(emailController.text);
    if (emailValid == true) {
      onLoginClick(emailController.text);

    } else {
      Fluttertoast.showToast(msg: 'Invalid email',gravity: ToastGravity.BOTTOM);
      print('Invalid email');
    }
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(

    body: Container(
    child: _mainWidget(),
    )),
    );
  }

  Widget _mainWidget() {
    if (isLoading == true) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(left: 14, right: 14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome,',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
            const Text(
              'Sign in to continue',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: emailController,
              //controller: email,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Email',
                //hintStyle: TextStyle(color: Colors.green),
                prefixIcon: Icon(Icons.email_outlined),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: (){
                if(emailController.text.isEmpty){
                  Fluttertoast.showToast(msg: 'Enter Email',gravity: ToastGravity.BOTTOM);
                }else{
                  validate();
                }
              },
              child: Container(
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: clr,
                  // color: Colors.red,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                    child: Text(
                      'SEND OTP',
                      style: TextStyle(fontSize: 28, color: Colors.white),
                    )),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'About us',
                      style: TextStyle(color: Colors.grey),
                    )),
                const Text(
                  '&',
                  style: TextStyle(color: Colors.grey),
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Support',
                      style: TextStyle(color: Colors.grey),
                    )),
              ],
            ),
            Center(
              child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Terms & Privacy',
                    style: TextStyle(color: Colors.grey),
                  )),
            ),

            // Text(result),
            //Text(result),
            // Text(nameValue),
          ],
        ),
      );
    }
  }




}


