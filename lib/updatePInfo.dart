import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:pulkittyagi/api_models/SpecialResponse.dart' as s;
import 'package:pulkittyagi/api_models/SpecialResponse.dart';
import 'package:pulkittyagi/api_models/Token_Response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'api_models/Bed_Response.dart' as b;
import 'api_models/Bed_Response.dart';
import 'api_models/PatDatiale_Response.dart' as d;
import 'api_models/hospitalResponse.dart' as h;
import 'api_models/hospitalResponse.dart';
import 'api_models/wardResponse_page.dart' as w;
import 'api_models/wardResponse_page.dart';

class updateInfo extends StatefulWidget {
  // const updateInfo({super.key});
  d.Data? dataa;
  String names;
  updateInfo(this.dataa, this.names);

  @override
  State<updateInfo> createState() => _updateInfoState();

}

class _updateInfoState extends State<updateInfo> {

  @override
  void initState(){
    // TODO: implement initState
     super.initState();
    debugPrint('Data from modal ::: ${widget.dataa?.hospital?.reversed.first.sId}');
    debugPrint('Medical List :: ${widget.dataa?.hospital}');
    getdata();
    api();

  }


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
          'Authorization' : 'Token $token',
        },
        body: {
          'userId' : id,
        },
      );
      var decodedData = jsonDecode(response.body);
      TokenResponse tokenResponse = TokenResponse.fromJson(decodedData);

      if(tokenResponse.success == true){
        debugPrint('hospitalIdList :: ${jsonEncode(tokenResponse.data!.hospital)}');
        var hlist = jsonEncode(tokenResponse.data!.hospital);
        tyagi(hlist);
        specialty(hlist);

      }

    }catch(e){
      debugPrint(e.toString());
    }
  }

  void tyagi(var getHlist)async{
    try{

      var prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('Token');

      Response response = await http.post(
          Uri.parse('http://18.224.233.81:4000/api/user/getAssignhospitalsList'),
          headers: {
            'Authorization' : 'Token $token',
          },
          body: {
            'hospitalId' : getHlist,
          }

      );

      var decodedData = await jsonDecode(response.body);
      listResponse listresponse = listResponse.fromJson(decodedData);

      if(listresponse.success == true){
        debugPrint('data :: ${listresponse.data}');

        setState(() {
           hosplist = listresponse.data;
        });

      }else{
        debugPrint(listresponse.message);
      }
      setState(() {
        isLoading=false;
      });

    }catch(e){
      debugPrint(e.toString());
    }
  }

  wardListApi(var gethpId)async{

    try{
      var prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('Token');

      Response response = await http.post(
        Uri.parse('http://18.224.233.81:4000/api/user/getUserWards'),
          headers: {
            'Authorization' : 'Bearer $token',
          },
          body: {
            'hospitalId' : gethpId,
            'type' : '0',
          }
      );
      var decodedData = jsonDecode(response.body);
      WardApiResponse wardResponse = await WardApiResponse.fromJson(decodedData);

      if(wardResponse.success==true){
        debugPrint('WardsList ::: ${wardResponse.data}');
        setState(() {
          wardList = wardResponse.data;
          debugPrint(gethpId);

        });
      }

    }catch(e){
      debugPrint(e.toString());
    }
  }

  bedApi(var bediid)async{
    try{
      var prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('Token');

      Response response = await http.post(
          Uri.parse('http://18.224.233.81:4000/api/user/getbedsList'),
          headers: {
            'Authorization' : 'Bearer $token',
          },
          body: {
            'wardId' : bediid,
          }
      );
      var decodedData = await jsonDecode(response.body);
      BedApiResponse bedApiResponse = BedApiResponse.fromJson(decodedData);

      if(bedApiResponse.success==true){
        debugPrint('bedkaData :: ${bedApiResponse.data}');
        setState(() {
          bedList = bedApiResponse.data;
        });
      }else{
        debugPrint(bedApiResponse.message);
      }

    }catch(e){
      debugPrint(e.toString());
    }
  }

  void specialty(var iid) async{
    try {
      var prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('Token');

      Response response = await http.post(
          Uri.parse('http://18.224.233.81:4000/api/user/getmedicalsList'),
        headers: {
          'Authorization'  : 'Bearer $token'
        },
        body: {
            'hospitalId' : iid,
        },
      );

      var decodedData = await jsonDecode(response.body);
      SpecialtyResponse specialtyResponse = SpecialtyResponse.fromJson(decodedData);

      if(specialtyResponse.success==true){
        debugPrint('Division ::: ${specialtyResponse.data}');
        setState(() {
          specialList = specialtyResponse.data;

        });
      }else{
        debugPrint(specialtyResponse.message);
      }

    }catch(e){
      debugPrint(e.toString());
    }
  }

  var clr = const Color(0xFF12739b);
  List<h.Data>? hosplist = [];
  var defaulthosp ;
  List<w.Data>? wardList = [];
  var defaultward;
  List<String> gender = ['Male','Female','Others'];
  String? defaultValue;
  List<b.Data>? bedList = [];
  String? defaultbed ;
  List<s.Data>? specialList = [];
  var defaultSpecialty;
  var isLoading = false;
  var datePicker = TextEditingController();
  var namee = TextEditingController();
  var phone = TextEditingController();
  var email = TextEditingController();
  var hospId = TextEditingController();
  var dob = TextEditingController();
  var rId = TextEditingController();
  var admitDate = TextEditingController();

  getdata() {
    setState(() {

      namee.text = '${widget.dataa?.name}';
      hospId.text = '${widget.dataa?.hospital?.reversed.single.sId}';
      defaultValue = '${widget.dataa?.gender}'; //gender
      rId.text = '${widget.dataa?.medicalId?.sId}';
      datePicker.text = '${widget.dataa?.dob}';
      admitDate.text = '${widget.dataa?.admissionDate}';

      defaulthosp = widget.dataa?.hospital?[0].sId;
      wardListApi(defaulthosp);
      // defaultwardName = widget.dataa?.wardId?.wardname;
      defaultward = widget.dataa?.wardId?.sId;
      bedApi(defaultward);

      defaultbed = widget.dataa?.bedId?.bedNumber;

      defaultSpecialty = widget.dataa?.medicalId?.division;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Update Patient Info',style: TextStyle(color: Colors.white,fontSize: 16),),
        centerTitle: true,
        backgroundColor: clr,
      ),
      body: loader(),
    );
  }


  loader() {
    if(isLoading==true){
      return Center(child: CircularProgressIndicator(
        color: clr,
        // backgroundColor: Colors.green,
      ));
    }else{
      return ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(6.0),
            child: Text("Patient's Info "),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              color: Colors.white30,
              child: Column(
                children: [
                  DropdownButtonFormField(
                      decoration: const InputDecoration(
                          labelText: "Hospital's name"
                      ),
                      isDense: true,
                      isExpanded: true,
                      hint: const Text('Development'),
                      items: hosplist?.map((value){
                        return DropdownMenuItem(
                            value: value.sId,
                            child: Text('${value.name}'));
                      }).toList(),
                      value: defaulthosp,
                      onChanged: (val){
                        setState(() {
                          defaulthosp=val;

                          wardList?.clear(); //default(phele wali) wardlist remove honi chaiye
                          defaultward = null; //defaultname remove  denge(because,the defaultname no. is not enter in wardList)
                          wardListApi(val);

                          bedList?.clear(); //defaultBedList(phele wala) yhi remove kr denge
                          defaultbed=null; //defaultBedNumber remove kr denge(because,the defaultbed no. is not enter in bedList)

                          specialList?.clear();
                          defaultSpecialty=null;

                          hospId.clear();

                        });
                      }),
                  const SizedBox(height: 13,),
                  TextField(
                    controller: namee,
                    decoration: InputDecoration(
                      labelText: "Patient's name",
                      fillColor: clr,
                    ),
                  ),
                  const SizedBox(height: 13,),
                  TextField(
                    controller: phone,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                    ),
                  ),
                  const SizedBox(height: 13,),
                  TextField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        labelText: 'Email'
                    ),
                  ),
                  const SizedBox(height: 13,),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: hospId,
                          decoration: const InputDecoration(
                              labelText: 'Hosp-Id'
                          ),
                        ),
                      ),
                      const SizedBox(width: 40,),
                      Expanded(
                        child: TextField(
                          controller: rId,
                          decoration: const InputDecoration(
                              labelText: 'R-ID'
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 13,),
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField(
                          decoration: const InputDecoration(
                              labelText: 'Gender'
                          ),
                          isExpanded: true,
                          isDense: true,
                          iconEnabledColor: Colors.white,
                          value: defaultValue,
                          items: gender.map((e) {
                            return DropdownMenuItem(
                                value: e,
                                child: Text(e));
                          }).toList(),
                          onChanged: (val){
                            defaultValue = val;
                            setState(() {
                              defaultValue = val;
                              // gendEr=defaultValue;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 40,),
                      Expanded(
                          child: TextField(
                            controller: datePicker,
                            onTap: ()async{
                              DateTime? datepick = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2024));

                              if(datepick != null){
                                setState(() {
                                  datePicker.text = DateFormat('yyyy-MM-dd').format(datepick);
                                });
                              }
                            },
                            decoration: InputDecoration(
                              labelText: 'D.O.B',
                              suffixIcon: Icon(Icons.date_range,color: clr,size: 36,),
                            ),
                          )
                      ),
                    ],
                  ),
                  const SizedBox(height: 13,),
                  DropdownButtonFormField(
                      decoration: const InputDecoration(
                        labelText: 'Select Ward',
                      ),
                      iconEnabledColor: Colors.white,
                      isExpanded: true,
                      isDense: true,
                      value: defaultward,
                      items: wardList?.map((e){
                        return DropdownMenuItem(
                            value: e.sId,
                            child: Text('${e.wardname}'));
                      }).toList(),
                      onChanged: (val){
                         defaultward=val;
                          setState(() {
                            defaultward = val;
                            bedApi(val);
                            bedList?.clear(); //defaultBedList(phele wala) yhi remove kr denge
                            defaultbed=null; //defaultBedNumber remove kr denge(because,the defaultbed no. is not enter in bedList)

                            specialList?.clear(); //specialList(phele wala) yhi remove kr denge
                            defaultSpecialty=null; //defaultSpecialty remove kr denge(because,the defaultSpecialty is not enter in bedList)

                          });
                      }),
                  const SizedBox(height: 13,),
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField(
                          decoration: const InputDecoration(
                              labelText: 'Bed'
                          ),
                          isExpanded: true,
                          isDense: true,
                          iconEnabledColor: Colors.white,
                          value: defaultbed,
                          items: bedList?.map((e) {
                            return DropdownMenuItem(
                                value: e.bedNumber,
                                child: Text('${e.bedNumber}'));
                          }).toList(),
                          onChanged: (val){
                            defaultbed = val;
                            setState(() {
                              defaultbed = val;
                              specialty(val);
                              specialList?.clear(); //specialList(phele wala) yhi remove kr denge
                              defaultSpecialty=null; //defaultSpecialty remove kr denge(because,the defaultSpecialty is not enter in bedList)

                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 40,),
                      Expanded(
                          child: TextField(
                            controller: admitDate,
                            onTap: ()async{
                              DateTime? datepick = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2024));

                              if(datepick != null){
                                setState(() {
                                  admitDate.text = DateFormat('yyyy-MM-dd').format(datepick);
                                });
                              }
                            },
                            decoration: InputDecoration(
                              labelText: 'Admit date',
                              suffixIcon: Icon(Icons.date_range,color: clr,size: 36,),
                            ),
                          )
                      ),
                    ],
                  ),
                  const SizedBox(height: 13,),
                  DropdownButtonFormField(
                      decoration: const InputDecoration(
                        labelText: 'Specialty',
                      ),
                      iconEnabledColor: Colors.white,
                      isExpanded: true,
                      isDense: true,
                      items: specialList?.map((e){
                        return DropdownMenuItem(
                            value: e.division,
                            child: Text('${e.division}'));
                      }).toList(),
                      value: defaultSpecialty,
                      onChanged: (val){
                        defaultSpecialty=val;
                        setState(() {
                          defaultSpecialty = val;

                        });
                      }),
                ],
              ),
            ),
          ),
        ],
      );
    }
  }

}
