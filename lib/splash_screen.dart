import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';
import 'login_page.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => SplashState();
}

class SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    getValue();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          // color: Colors.black,
          child: Center(
              child: Text('UniHealth',
                  style: TextStyle(
                      color: Color(0xFF12739b),
                      fontSize: 50,
                      fontWeight: FontWeight.bold)))),
    );
  }
  void getValue()async{

    Future.delayed( const Duration(seconds: 2), ()async{

      var prefs = await SharedPreferences.getInstance();
      var isLoggedin = prefs.getBool('loggin') ?? false;

      if(isLoggedin){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
          return intro();
        }));
      }else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
          return LoginPage();
        }));
      }
    }
    );
  }
}