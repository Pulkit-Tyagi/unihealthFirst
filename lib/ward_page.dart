import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:pulkittyagi/api_models/wardResponse_page.dart' as w;
import 'package:shared_preferences/shared_preferences.dart';

import 'api_models/wardResponse_page.dart';
import 'beds_page.dart';

class Wards extends StatefulWidget {
  // const Wards({super.key});

  String id;
  String name;
  Wards(this.id,this.name);

  @override
  State<Wards> createState() => _WardsState();
}

class _WardsState extends State<Wards> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('Hospital id:h: ${widget.id}');
    wardApi();

  }

  List<w.Data>? data = [];
  var isLoading = false;
  var clr = const Color(0xFF12739b);

  wardApi()async{
    try{

      setState(() {
        isLoading = true;
      });

      var prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('Token');

      debugPrint('Token for wardApi :: $token');
      debugPrint('Id for wardApi :: ${widget.id}');
      
      Response response = await http.post(
        Uri.parse('http://18.224.233.81:4000/api/user/getUserWards'),
        headers: {
          'Authorization' : 'Bearer $token',
        },
        body: {
          'hospitalId' : widget.id,
          'type' : '0',
        }
      );


      var decodedData = jsonDecode(response.body);
      WardApiResponse wardResponse = WardApiResponse.fromJson(decodedData);

      if(wardResponse.success == true){

        debugPrint('WardResponse Data :: ${wardResponse.data}');

        setState(() {

          data = wardResponse.data;
          isLoading = false;

        });


      }


    }catch(e){
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Wards/Departments',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: clr,
      ),
      body: loader(),
    );
  }
  loader(){
    if(isLoading == true){
      return const Center(child: CircularProgressIndicator());
    }
    else{
      return Column(
        children: [
          Expanded(
            flex: 13,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Center(
                        child: Text(widget.name,style: TextStyle(fontSize: 20),)),
                  ),
                  Expanded(
                    flex: 12,
                    child: ListView.builder(itemBuilder: (context,index){
                      return  Column(
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return Bed('${data?[index].sId}',widget.name);
                              }));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(color: clr,width: 2),
                              ),
                              child:  Padding(
                                padding:  const EdgeInsets.all(3.0),
                                child: Row(
                                  children: [
                                    Text('${data?[index].wardname}',style: const TextStyle(color: Colors.black,fontSize: 18),),

                                    const Spacer(),

                                    Container(
                                      alignment: Alignment.topRight,
                                      child:  Row(
                                        children: [
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Row(
                                                children: [
                                                  const Text('Number of Beds',style: TextStyle(fontSize: 15),),
                                                  const SizedBox(
                                                    width: 6,
                                                  ),
                                                  CircleAvatar(
                                                    minRadius: 8,
                                                    maxRadius: 10,
                                                    backgroundColor: const Color(0xFF12739b),
                                                    child: Text('${data?[index].bedsCount}'),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                children: [
                                                  const Text('Occupied beds',style: TextStyle(fontSize: 15),),
                                                  const SizedBox(width: 6,),
                                                  CircleAvatar(
                                                    minRadius: 8,
                                                    maxRadius: 10,
                                                    backgroundColor: const Color(0xFF12739b),
                                                    child: Text('${data?[index].activeBeds}'),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                children: [
                                                  const Text('Scheduled for Today',style: TextStyle(fontSize: 15),),
                                                  const SizedBox(width: 6,),
                                                  CircleAvatar(
                                                    minRadius: 8,
                                                    maxRadius: 10,
                                                    backgroundColor: const Color(0xFF12739b),
                                                    child: Text('${data?[index].todayschedule}'),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      );
                    },
                      itemCount: data?.length,
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
                  height: 40,
                  width: double.infinity,
                  color: clr,
                  child: const Icon(Icons.home,color: Colors.white,size: 36,),
                ),
              ))
        ],
      );
    }
  }
}
