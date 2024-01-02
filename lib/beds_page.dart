import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:pulkittyagi/api_models/Bed_Response.dart' as b;
import 'package:pulkittyagi/patient_datail.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api_models/Bed_Response.dart';

class Bed extends StatefulWidget {
  // Bed({super.key});

  var Id;
  var naam;
  Bed(this.Id,this.naam);

  @override
  State<Bed> createState() => _BedState();

}

class _BedState extends State<Bed> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    debugPrint('Beds Id :: ${widget.Id}');
    bedApi();
  }


  List<b.Data>? data = [];
  var clr = const Color(0xFF12739b);
  var isloading = false;

  bedApi()async{
    try {
setState(() {
  isloading = true;
});
      var prefs =await SharedPreferences.getInstance();
      var token = prefs.getString('Token');
      debugPrint('Token for bedApi :: $token');
      debugPrint('id for bedApi :: ${widget.Id}');

      Response response = await http.post(
        Uri.parse('http://18.224.233.81:4000/api/user/getbedsList'),
        headers: {
          'Authorization' : 'Bearer $token',
        },
        body: {
          'wardId' : widget.Id,
        }
      );

      var decodedData = jsonDecode(response.body);
      BedApiResponse bedApiResponse = BedApiResponse.fromJson(decodedData);

      if(bedApiResponse.success == true){
        debugPrint('Data from modal :: ${bedApiResponse.data}');

        setState(() {
          data = bedApiResponse.data;
        });

      }else{
        debugPrint(bedApiResponse.message);
      }
      setState(() {
        isloading=false;
      });

    }catch(e){
      debugPrint(e.toString());
    }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(widget.naam,style: const TextStyle(color: Colors.white),),
        backgroundColor: clr,
        centerTitle: true,
      ),
      body: loader(),
    );
  }


  Pname(index) {
    if(data?[index].patientId?.name==null){
     return 'No data found';
    }else{
      return data?[index].patientId?.name;
    }
  }

  pAppoint(index) {
    if(data?[index].patientId?.scheduleDate==null){
      return 'Not found';
    }
    else{
      return  data?[index].patientId?.scheduleDate;
    }
  }

  loader() {
    if(isloading == true){
      return const Center(child: CircularProgressIndicator());
    }else{
      return Column(
        children: [
          const Expanded(
              flex: 1,
              child: Center(child: Text('Beds',style: TextStyle(color: Colors.black,fontSize: 22),))),

          Expanded(
            flex: 10,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){
                      if(data?[index].patientId?.name!=null){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return  PatDetail('${widget.naam}','${data?[index].patientId?.sId}');
                        }));
                      }

                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: clr,width: 2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('Number of beds - ${data?[index].bedNumber}'),
                                const Spacer(),
                                Icon(Icons.clear,color: clr,),
                              ],
                            ),
                            Text('Patients - ${Pname(index)}',style: const TextStyle(color: Colors.black),),
                            Row(
                              children: [
                                Text('Next Appointment - ${pAppoint(index)}'),
                                const Spacer(),
                                Icon(Icons.delete,color: clr,),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
                itemCount: data?.length,
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
                  height: 40,
                  color: clr,
                  child: const Center(child: Icon(Icons.home,color: Colors.white,size: 36,)),
                ),
              ))
        ],
      );
    }
  }

}


