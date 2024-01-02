import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:pulkittyagi/CID_page.dart';
import 'package:pulkittyagi/PatientsList_page.dart';
import 'package:pulkittyagi/api_models/Token_Response.dart';
import 'package:pulkittyagi/hostitals_page.dart';
import 'package:pulkittyagi/settings_page.dart';
import 'package:shared_preferences/shared_preferences.dart';


class intro extends StatefulWidget {
  const intro({Key? key}) : super(key: key);

  @override
  State<intro> createState() => _introState();
}

class _introState extends State<intro> {
  var time = DateTime.now();

  @override
  void initState() {
    super.initState();
    //getValue();
    tokenApi();
    //getToken();
  }

  var userName = '';
  var userEmail = '';
  var clr = const Color(0xFF12739b);

  bool isLoading = false;

 List tab = [
      Hospitals(),
      CID(),
      PatientList(),
      const SettingPage(),
 ];
  var _currentIndex = 0;

  void tokenApi() async {
    try {

      var prefs = await SharedPreferences.getInstance();
      var id = prefs.getString('userId');
      var token = prefs.getString('Token');

      debugPrint('id ::$id');
      debugPrint('token ::$token');

      setState(() {
        isLoading = true;
      });

      Response response = await http.post(
          Uri.parse("http://18.224.233.81:4000/api/user/getUserDetails"),
          headers: {
            'Authorization': "Bearer $token"
          },
          body: {
            'userId': id,
          });

      var decodedData = jsonDecode(response.body);
      debugPrint('decodedData ::$decodedData');
      TokenResponse tokenResponse = TokenResponse.fromJson(decodedData);
      debugPrint('tokenResponse ::${tokenResponse.toJson()}');

      // var list = tokenResponse.data!.hospital;
      var email = tokenResponse.data?.email;
      var name = tokenResponse.data?.name;

      if (tokenResponse.success == true) {

        var prefs = await SharedPreferences.getInstance();
        prefs.setString('naam', '$name');


        setState(() {
          userEmail = email!;
          userName = name!;
        });
      } else {
        debugPrint(tokenResponse.message);
      }

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: clr,
          unselectedItemColor: Colors.black,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedFontSize: 16,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.local_hospital_sharp),label: 'Hospitl'),
            BottomNavigationBarItem(icon: Icon(Icons.access_time),label: 'Cid'),
            BottomNavigationBarItem(icon: Icon(Icons.local_hospital),label: 'Patient'),
            BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Settings'),
          ],
          currentIndex: _currentIndex,
          onTap: (index){
            setState(() {
              _currentIndex = index;
            });
          },
        ),
          body: Container(
        child: _Loader(),
      )),
    );
  }

  Widget _Loader() {
    if (isLoading == true) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Column(
        children: [
          Flexible(
            flex: 5,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: clr,
                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(12)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Row(
                      children: [
                         const CircleAvatar(
                           radius: 52,
                           backgroundImage: NetworkImage(
                               'https://www.getillustrations.com/photos/pack/3d-avatar-male_lg.png'),
                         ),
                        const SizedBox(width: 7,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(userName, style: const TextStyle(fontSize: 30, color: Colors.white),
                            ),
                            Text(userEmail, style: const TextStyle(color: Colors.white),
                            ),
                            Text('Last update = ${DateFormat('H:m:s, d MMMM,y').format(time)}',
                              style: const TextStyle(color: Colors.white, fontSize: 12),),
                          ],
                        ),
                      ],
                    ),
                  ),
                   const Spacer(),
                   const Row(
                     mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Spacer(),
                      Text('version: 1.0.0', style: TextStyle(color: Colors.white,fontSize: 10)),
                      SizedBox(width: 5,),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // const SizedBox(height: 5,),
          Flexible(
            flex: 11,
            child: tab[_currentIndex],
          ),
          //Text(userToken),
        ],
      );
    }
  }
}



// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// SingleChildScrollView(
// scrollDirection: Axis.vertical,
// child: Column(
// children: [
// InkWell(
// onTap: () {
// Navigator.push(context,
// MaterialPageRoute(builder: (context) {
// return Hospitals();
// }));
// },
// child: const SizedBox(
// height: 40,
// width: double.infinity,
// child: Row(
// children: [
// Icon(
// Icons.local_hospital_sharp,
// color: Color(0xFF12739b),
// size: 28,
// ),
// SizedBox(
// width: 15,
// ),
// Text('Patients/ Hospitals',style: TextStyle(fontSize: 18, color: Colors.black),
// ),
// ],
// ),
// ),
// ),
// const SizedBox(
// height: 15,
// ),
// SizedBox(
// height: 40,
// width: double.infinity,
// child: InkWell(
// onTap: () {},
// child: const Row(
// children: [
// Icon(
// Icons.notification_add,
// color: Color(0xFF12739b),
// size: 28,
// ),
// SizedBox(
// width: 15,
// ),
// Text('Notifications', style: TextStyle(fontSize: 18, color: Colors.black),
// ),
// ],
// ),
// ),
// ),
// const SizedBox(
// height: 15,
// ),
// SizedBox(
// height: 40,
// width: double.infinity,
// child: InkWell(
// onTap: () {},
// child: const Row(
// children: [
// Icon(
// Icons.drag_indicator,
// color: Color(0xFF12739b),
// size: 28,
// ),
// SizedBox(
// width: 15,
// ),
// Text('Indicators',style: TextStyle(fontSize: 18, color: Colors.black),
// ),
// ],
// ),
// ),
// ),
// const SizedBox(
// height: 15,
// ),
// SizedBox(
// height: 40,
// width: double.infinity,
// //color: Colors.white,
// child: InkWell(
// onTap: () {
// Navigator.push(context,
// MaterialPageRoute(builder: (context) {
// return const settings();
// }));
// },
// child: const Row(
// children: [
// Icon(
// Icons.settings,
// color: Color(0xFF12739b),
// size: 28,
// ),
// SizedBox(
// width: 15,
// ),
// Text('Settings', style: TextStyle(fontSize: 18, color: Colors.black),
// )
// ],
// ),
// ),
// ),
// const SizedBox(
// height: 15,
// ),
// SizedBox(
// height: 40,
// width: double.infinity,
// child: InkWell(
// onTap: () {},
// child: const Row(
// children: [
// Icon(
// Icons.support,
// color: Color(0xFF12739b),
// size: 28,
// ),
// SizedBox(
// width: 15,
// ),
// Text('Support',style: TextStyle(fontSize: 18, color: Colors.black),
// ),
// ],
// ),
// ),
// ),
// const SizedBox(
// height: 15,
// ),
// InkWell(
// onTap: (){
//
// },
// child: const SizedBox(
// height: 40,
// width: double.infinity,
// child:  Row(
// children: [
// Icon(
// Icons.policy,
// color: Color(0xFF12739b),
// size: 28,
// ),
// SizedBox(
// width: 15,
// ),
// Text('Terms & Policy', style: TextStyle(fontSize: 18, color: Colors.black),
// ),
// ],
// ),
//
// ),
// ),
// const SizedBox(height: 15,),
// InkWell(
// onTap: (){
// Navigator.push(context, MaterialPageRoute(builder: (context){
// return CID();
// }));
// },
// child: Container(
// width: double.infinity,
// height: 40,
// child: Row(
// children: [
// Icon(Icons.circle,size: 28,color: clr,),
// const SizedBox(width: 15,),
// const Text('CID',style: TextStyle(fontSize: 18,),),
// ],
// ),
// ),
// ),
// const SizedBox(height: 16,),
// InkWell(
// onTap: (){
// Navigator.push(context, MaterialPageRoute(builder: (context){
// return PatientList();
// }));
// },
// child: Container(
// width: double.infinity,
// height: 40,
// child: Row(
// children: [
// Icon(Icons.local_hospital,size: 28,color: clr,),
// const SizedBox(width: 15,),
// const Text('Patient List',style: TextStyle(fontSize: 18,),),
// ],
// ),
// ),
// ),
// ],
// ),
// ),