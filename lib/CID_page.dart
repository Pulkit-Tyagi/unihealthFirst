import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:pulkittyagi/api_models/cid_Response.dart'as c;
import 'package:pulkittyagi/api_models/cid_Response.dart';

class CID extends StatefulWidget {
 // const CID({super.key});

  @override
  State<CID> createState() => _CIDState();
}

class _CIDState extends State<CID> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CID_API();
  }

  List<c.Data>? data = [];

  var clr = const Color(0xFF12739b);
  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   toolbarHeight: 24,
      //   title: Text('CID',style: TextStyle(fontSize: 24),),
      //   centerTitle: true,
      //   backgroundColor: clr,
      // ),
      body: getBody()
    );
  }
  getBody(){
    if(isLoading == true){
      return const Center(
          child: CircularProgressIndicator());
    }else{
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text('Hello',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          
              ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Container(
                      color: Colors.white10,
                      height: 40,
                      child: Center(child: Text('${data?[index].cidname}',style: const TextStyle(color: Colors.black),)),
                    ),
                  ),
                );
              },
                itemCount: data?.length,
              )
            ],
          ),
        ),
      );
    }
  }

  void CID_API() async {
    try {
      setState(() {
        isLoading = true;
      });

      debugPrint('api calling...');
      Response response = await http.post(
          Uri.parse('http://18.224.233.81:4000/api/user/getCid'),
      );

      var decodedData = jsonDecode(response.body);
      debugPrint('decodedData :: $decodedData');
      CIDresponse cidResponse = CIDresponse.fromJson(decodedData);

      if (cidResponse.success == true) {
        debugPrint('Data from model ${cidResponse.data}');

        setState(() {
          data = cidResponse.data;
        });

      } else {
        debugPrint('Message ${cidResponse.message}');
      }
      setState(() {
        isLoading = false;
      });

    } catch (e) {
      debugPrint(e.toString());
    }
  }
}