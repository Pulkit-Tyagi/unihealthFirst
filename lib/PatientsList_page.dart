import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:pulkittyagi/api_models/Token_Response.dart';
import 'package:pulkittyagi/api_models/patientListResponse.dart';
import 'package:pulkittyagi/patientID_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pulkittyagi/api_models/patientListResponse.dart' as p;

class PatientList extends StatefulWidget {
  //const PatientList({super.key});

  @override
  State<PatientList> createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApi();
  }

  List<p.Data>? data = [];


  var isLoading = false;
  var clr = const Color(0xFF12739b);

  void getApi() async {
    try {
      setState(() {
        isLoading = true;
      });

      var prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('Token');
      var id = prefs.getString('userId');

      Response response = await http.post(
          Uri.parse("http://18.224.233.81:4000/api/user/getUserDetails"),
          headers: {
            'Authorization': 'Token $token',
          },
          body: {
            'userId': id,
          });

      var decodedData = jsonDecode(response.body);
      TokenResponse tokenResponse = TokenResponse.fromJson(decodedData);
      debugPrint('${tokenResponse.data!.hospital}');
      if (tokenResponse.success == true) {
        debugPrint('tokenResponse ${tokenResponse.toJson()}');
        debugPrint('tokenResponse.data.hospital :${jsonEncode(tokenResponse.data?.hospital)}');
        var hospital = jsonEncode(tokenResponse.data!.hospital);

        pulkit(hospital);//function call

      }

    } catch (e) {
      debugPrint(e.toString());
    }
  }//getApi

  void pulkit(var getHospital)async{

    try{

      var prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('Token');

      Response response = await http.post(
          Uri.parse("http://18.224.233.81:4000/api/user/getusersList"),
          headers: {
            "Authorization" : "Bearer $token",
          },
          body: {
            "usertype" : '4',
            "hospitalId" : getHospital,
          });

      var decodedData = jsonDecode(response.body);
      PatientResponse patientResponse = PatientResponse.fromJson(decodedData);

      if(patientResponse.success == true){
        debugPrint("Api is running...");
        debugPrint("Data from modal :: ${patientResponse.toJson()}");
        debugPrint("Data :: ${patientResponse.data}");

        setState(() {
          data = patientResponse.data!;

        });


      }else{
        debugPrint(patientResponse.message);
      }
      setState(() {
        isLoading = false;
      });

    }catch(e){
      debugPrint(e.toString());
    }
  }//pulkit

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   toolbarHeight: 24,
      //   title: Text('List of Patients',style: TextStyle(fontSize: 24),),
      //   centerTitle: true,
      //   backgroundColor: clr,
      // ),
      body: Container(
        child: loader(),
      ),
    );
  }
  loader(){
    if(isLoading==true){
      return const Center(child: CircularProgressIndicator());
    }else{
      return Column(
        children: [
          Expanded(
            flex: 13,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Stack(
                children: [
                  ListView.builder(itemBuilder: (context,index){
                    return Column(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return  PatientId(data?[index].sId);
                            }));
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(width: 2,color: clr),

                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  RichText(
                                      text: TextSpan(
                                    style: TextStyle(fontSize: 18,color: clr),
                                    children: [
                                      const TextSpan(text: "Patient's Name -"),
                                      TextSpan(text: " ${data?[index].name}",style: const TextStyle(color: Colors.grey,fontSize: 16)),
                                    ]
                                  )),

                                  RichText(text: TextSpan(
                                      style: TextStyle(fontSize: 18,color: clr),
                                  children: [
                                    const TextSpan(text: "Hospitalized - "),
                                    TextSpan(text: "${data?[index].sId}",style: const TextStyle(color: Colors.grey,fontSize: 16)),
                                  ]
                                  )),
                                  RichText(text: TextSpan(
                                    style: TextStyle(fontSize: 18,color: clr),
                                    children: [
                                      const TextSpan(text: "Status - "),
                                      TextSpan(text: "${data?[index].docVerification}",style: const TextStyle(color: Colors.grey,fontSize: 16)),
                                    ]
                                  ))
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8,),
                      ],
                    );
                  },itemCount: data!.length,

                  ),
                  Positioned(
                    bottom: 3,
                    right: 7,
                    child: SizedBox(
                      child: InkWell(
                        onTap: (){

                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: clr,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Row(
                          children: [
                            Icon(Icons.add,color: Colors.white,),
                            Text('Add new Patient',style: TextStyle(color: Colors.white,fontSize: 15),),
                            SizedBox(width: 4,)
                          ],
                                                ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                color: clr,
                child: const Center(
                    child: Icon(Icons.home, size: 35, color: Colors.white,)),
              ),
            )
          ),
        ],
      );
    }
  }
}
