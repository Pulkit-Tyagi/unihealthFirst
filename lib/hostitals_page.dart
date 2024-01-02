import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:pulkittyagi/api_models/Token_Response.dart';
import 'package:pulkittyagi/api_models/hospitalResponse.dart' as h;
import 'package:pulkittyagi/ward_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api_models/hospitalResponse.dart';

class Hospitals extends StatefulWidget {
  //const Hospitals({super.key});

  @override
  State<Hospitals> createState() => _HospitalsState();
}

class _HospitalsState extends State<Hospitals> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    api();

  }

  List<h.Data>? data = [];
  var isLoading = false;

  void api()async{
    try{
      setState(() {
        isLoading = true;
      });

      var prefs = await SharedPreferences.getInstance();
      var id = prefs.getString('userId');
      var token = prefs.getString('Token');

      Response response = await post(
        Uri.parse('http://18.224.233.81:4000/api/user/getUserDetails'),
        headers: {
          'Authorization' : 'Bearer $token',
        },
        body: {
          'userId' : id,
      },
      );
      var decodedData = jsonDecode(response.body);
      TokenResponse tokenResponse = TokenResponse.fromJson(decodedData);

      if(tokenResponse.success == true){
        print('hospitalIdList :: ${jsonEncode(tokenResponse.data!.hospital)}');
        var iid = jsonEncode(tokenResponse.data!.hospital);
        tyagi(iid);

      }

    }catch(e){
      print(e.toString());
    }
  }
  
  void tyagi(var gethospId)async{
    
    try{

      var prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('Token');
      debugPrint('Token for hospList :: $token');
      debugPrint('id for hospList :: $gethospId');
      
      Response response = await http.post(
        Uri.parse('http://18.224.233.81:4000/api/user/getAssignhospitalsList'),
        headers: {
          'Authorization' : 'Token $token',
        },
        body: {
          'hospitalId' : gethospId,
        }
        
      );

      var decodedData = await jsonDecode(response.body);
      listResponse listresponse = listResponse.fromJson(decodedData);

      if(listresponse.success == true){
        print('data :: ${listresponse.data}');

        setState(() {
          data = listresponse.data;
          isLoading = false;
        });

      }else{
        print(listresponse.message);
      }

      
    }catch(e){
      print(e.toString());
    }
    
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   toolbarHeight: 24,
      //   title: const Text('Hospitals',style: TextStyle(fontSize: 25),),
      //   centerTitle: true,
      //   backgroundColor: Color(0xFF12739b),
      // ),
      body: loader(),
    );
  }
  loader(){
    if(isLoading==true){
      return  const Center(child: CircularProgressIndicator());
    }else{
      return Column(
        children: [
          Expanded(
              flex: 10,
              child: ListView.builder(itemBuilder: (context,index){
                return Padding(
                  padding:  const EdgeInsets.symmetric(horizontal: 6.0),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return Wards('${data?[index].sId}','${data?[index].name}');
                          }));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: const Color(0xFF12739b)),
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 30,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(6),topRight: Radius.circular(6)),
                                  color: Color(0xFF12739b),
                                ),
                                child: Center(child: Text('${data?[index].name}',style: const TextStyle(color: Colors.white,fontSize: 22),)),
                              ),
                              const SizedBox(height: 8,),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Text('Hospital Network - ',style: TextStyle(color: Colors.grey),),
                                        InkWell(onTap: (){

                                        },
                                          child:  Text('${data?[index].city}',style: const TextStyle(color: Color(0xFF12739b)),),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text('Phone Number - ${data?[index].number}',style: const TextStyle(color: Colors.grey),),
                                      ],
                                    ),
                                    const SizedBox(height: 10,),
                                    Row(
                                      children: [
                                        const Text('Zip Code - ',style: TextStyle(color: Colors.grey),),
                                        InkWell(onTap: (){

                                        },
                                          child:  Text('${data?[index].zipCode}',style: const TextStyle(color: Color(0xFF12739b)),),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10,),
                                    Row(
                                      children: [
                                        const Text('City & State - ',style: TextStyle(color: Colors.grey),),
                                        InkWell(onTap: (){

                                        },
                                          child: Text('${data?[index].state}',style: const TextStyle(color: Color(0xFF12739b)),),
                                        ),
                                      ],
                                    ),
                                    // const SizedBox(height: 10,),
                                    Row(

                                      children: [
                                        const Text('Country - ',style: TextStyle(color: Colors.grey),),
                                        InkWell(onTap: (){

                                        },
                                          child:  Text('${data?[index].country}',style: const TextStyle(color: Color(0xFF12739b)),),),

                                        const Spacer(),

                                        InkWell(onTap: (){

                                        },
                                          child: const CircleAvatar(
                                            radius: 18,
                                            backgroundColor: Colors.green,
                                            child: Center(child: Icon(Icons.download,color: Colors.white,)),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10,),
                                    Row(
                                      children: [
                                        const Spacer(),
                                        const Text('Last Update - ',style: TextStyle(color: Colors.grey,fontSize: 12),),
                                        InkWell(onTap: (){

                                        },
                                          child:  Text('${data?[index].updatedAt}',style: const TextStyle(fontSize: 9),),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 8,),
                    ],
                  ),
                );
              },
                itemCount: data?.length,)),
          Expanded(
            flex: 1,
            child: Container(
              height: 42,
              width: double.infinity,
              color: const Color(0xFF12739b),
              child: InkWell(onTap: (){
                Navigator.pop(context);
              },
                child: const Icon(Icons.home,color: Colors.white,size: 38,),
              ),
            ),
          )
        ],
      )
      ;

    }
  }
}
