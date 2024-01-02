import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:pulkittyagi/api_models/patientIdResponse.dart';
import 'package:pulkittyagi/api_models/patientListResponse.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PatientId extends StatefulWidget {
  //const PatientId({super.key});

  String? id;
  PatientId(this.id);


  @override
  State<PatientId> createState() => _PatientIdState();
}

class _PatientIdState extends State<PatientId> {

  var name = '';
  var age = '';
  var bed = '';
  var regID = '';
  var hosID = '';
  var admData = '';
  var insurance=  '';
  var ward = '';
  var mdivision = '';

  var isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pulkit();
  }
  void pulkit()async{
    try{
      setState(() {
        isLoading = true;
      });
      var prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('Token');
      
      Response response = await http.post(
        Uri.parse('http://18.224.233.81:4000/api/user/getPatientDetails'),
        headers: {
          'Authorization': 'Token $token',
        },
        body: {
          'userId' : widget.id,
        }
      );


      debugPrint(widget.id);


      var decodedData = jsonDecode(response.body);
      PatientApiResponse patientApiResponse = PatientApiResponse.fromJson(decodedData);

      if(patientApiResponse.success == true){
        debugPrint("Data from Modal :: ${patientApiResponse.toJson()}");
        debugPrint("Name :: ${patientApiResponse.data?.name}");


        setState(() {
          name = patientApiResponse.data!.name!;
          age= patientApiResponse.data!.dob!;
          // bed = patientApiResponse.data!.died as String;
          regID = patientApiResponse.data!.sId!;
          // hosID = patientApiResponse.data?.hospital as String;
          admData = patientApiResponse.data!.admissionDate!;
          insurance = patientApiResponse.data!.state!;
         // ward = patientApiResponse.data?.wardId as String;
         //  mdivision = patientApiResponse.data?.medicalId as String;
        });

      }else{
        print(patientApiResponse.message);
      }

      setState(() {
        isLoading = false;
      });

    }catch(e){
      print(e.toString());
    }
  }
  var clr = const Color(0xFF12739b);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: Text('%'),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text("FASTING",style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: const [
          Icon(Icons.info)
        ],
      ),
      body: Container(
        child: Loader(),
      ),
    );
  }
  Loader(){
    if(isLoading == true){
      return const Center(child: CircularProgressIndicator());
    }else{
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('Name - $name',style: const TextStyle(fontSize: 19,color: Colors.black),),
            Text('Age - $age',style: const TextStyle(fontSize: 19),),
            const SizedBox(height: 13,),
            Row(
              children: [
                //first container
                Expanded(
                  flex: 7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: TextStyle(fontSize: 16,color: clr),
                          children: const [
                            TextSpan(text: 'Ward - ',),
                            TextSpan(text: '',style: TextStyle(fontSize: 14,color: Colors.black),),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(fontSize: 16,color: clr),
                          children: const [
                            TextSpan(text: 'M-Division - ',),
                            TextSpan(text: '',style: TextStyle(fontSize: 14,color: Colors.black),),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(fontSize: 16,color: clr),
                          children: [
                            const TextSpan(text: 'Insurance - ',),
                            TextSpan(text: insurance,style: const TextStyle(fontSize: 14,color: Colors.black),),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(fontSize: 16,color: clr),
                          children: [
                            const TextSpan(text: 'Admitted - ',),
                            TextSpan(text: admData,style: const TextStyle(fontSize: 14,color: Colors.black),),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
                //second container
                Expanded(
                  flex: 4,
                  child: Container(
                    // color: Colors.grey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: TextStyle(fontSize: 16,color: clr),
                            children: [
                              const TextSpan(text: 'Bed - ',),
                              TextSpan(text: bed,style: const TextStyle(fontSize: 14,color: Colors.black),),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(fontSize: 16,color: clr),
                            children: [
                              const TextSpan(text: 'R-ID - ',),
                              TextSpan(text: regID,style: const TextStyle(fontSize: 14,color: Colors.black),),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(fontSize: 16,color: clr),
                            children: const [
                              TextSpan(text: 'Hosp-ID - ',),
                              TextSpan(text: '',style: TextStyle(fontSize: 14,color: Colors.black),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),const SizedBox(height: 10,),
            Container(
              color: Colors.white60,
              child: const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Column(
                      children: [
                        Icon(Icons.account_circle,size: 55,),
                        Text('DIAGNOSIS'),
                      ],
                    ),
                    SizedBox(width: 8,),
                    Column(
                      children: [
                        Icon(Icons.account_circle,size: 55,),
                        Text('PALLIATIVE'),
                      ],
                    ),
                    SizedBox(width: 8,),
                    Column(
                      children: [
                        Icon(Icons.account_circle,size: 55,),
                        Text('STATUS'),
                      ],
                    ),
                    SizedBox(width: 8,),
                    Column(
                      children: [
                        Icon(Icons.account_circle,size: 55,),
                        Text('MONITER'),
                      ],
                    ),
                    SizedBox(width: 8,),
                    Column(
                      children: [
                        Icon(Icons.account_circle,size: 55,),
                        Text('NTFSDJFKC'),
                      ],
                    ),
                    SizedBox(width: 8,),
                    Column(
                      children: [
                        Icon(Icons.account_circle,size: 55,),
                        Text('PALLIATIVE'),
                      ],
                    ),SizedBox(width: 8,),
                  ],
                ),
              ),
            ),

            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 2,color: clr),
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: clr,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text("Diagnosis",style: TextStyle(color: Colors.white,fontSize: 18 ),),
                            Spacer(),
                            Icon(Icons.refresh_outlined,size: 30,color: Colors.white,),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
            const SizedBox(height: 12,),
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 2,color: clr),
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: clr,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text("Observations / Family History",style: TextStyle(color: Colors.white,fontSize: 18 ),),
                           Spacer(),
                            Icon(Icons.refresh_outlined,size: 30,color: Colors.white,),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
