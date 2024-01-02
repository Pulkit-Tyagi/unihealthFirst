import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:pulkittyagi/api_models/PatDatiale_Response.dart';
import 'package:pulkittyagi/updatePInfo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PatDetail extends StatefulWidget {

String names;
String iid;
PatDetail(this.names,this.iid);

  @override
  State<PatDetail> createState() => _PatDetailState();
}

class _PatDetailState extends State<PatDetail> with TickerProviderStateMixin{ //use Ticker for TabBar

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiDetail();
    debugPrint('Patient iid :: ${widget.iid}');
  }

  var clr = const Color(0xFF12739b);
  PageController pageController = PageController();

  TabController? tabController;

  var isloading = false;
  var naam = '';
  var ward = '';
  var bed = '';
  var division = '';
  var admitted = '';
  var insurance = '';
  var register ='';
  var hospId = '';
  var age = '';
  var gender = '';
  Data? dataa ;


  apiDetail()async{
    try{
      // setState(() {
      //   isloading = true;
      // });
      var prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('Token');
      
      Response response = await http.post(
        Uri.parse('http://18.224.233.81:4000/api/user/getPatientDetails'),
        headers: {
          'Authorization' : 'Bearer $token',
        },
        body: {
          'userId' : widget.iid,
        },
      );
      var decodedData = jsonDecode(response.body);
      patientidapi patientapi = patientidapi.fromJson(decodedData);

      debugPrint("Data of Patient ::: ${patientapi.data}");
      if(patientapi.success==true){
        setState(() {
          dataa = patientapi.data;
          naam = '${patientapi.data?.name}';
          age = '${patientapi.data?.dob}';
          ward = '${patientapi.data?.wardId?.wardname}';
          division = '${patientapi.data?.medicalId?.division}';
          insurance = '${patientapi.data?.discharge}';
          register = '${patientapi.data?.medicalId?.sId}';
          bed = '${patientapi.data?.bedId?.bedNumber}';
          hospId = '${patientapi.data?.sId}';
          admitted = '${patientapi.data?.admissionDate}';
          gender = '${patientapi.data?.gender}';
        });
      }else{
        print(patientapi.message);
      }
      // setState(() {
      //   isloading = false;
      // });
      
    }catch(e){
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {

    tabController = TabController(length: 5, vsync: this);

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(widget.names,style: const TextStyle(color: Colors.white),),
      actions: [
        IconButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return updateInfo(dataa,widget.names);
            }));
          },
            icon: const Icon(Icons.update,color: Colors.white,),),
      ],
      backgroundColor: clr,
        centerTitle: true,
      ),
      body: Column(
          children: [
            Flexible(
                flex: 2,
                fit: FlexFit.loose,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('$naam, $gender'),
                    Text('Age - $age'),
                  ],
                )),
            const SizedBox(height: 8,),
            Flexible(
                flex: 4,
                fit: FlexFit.loose,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(text: TextSpan(
                                style: TextStyle(color: clr),
                                children: [
                                  const TextSpan(text: 'Ward - '),
                                  TextSpan(text: ward,style: const TextStyle(color: Colors.black)),
                                ]
                            )),
                            RichText(text: TextSpan(
                                style: TextStyle(color: clr),
                                children: [
                                  const TextSpan(text: 'M-Division - '),
                                  TextSpan(text: division,style: const TextStyle(color: Colors.black)),
                                ]
                            )),
                            RichText(text: TextSpan(
                                style: TextStyle(color: clr),
                                children: [
                                  const TextSpan(text: 'Insurance - '),
                                  TextSpan(text: insurance,style: const TextStyle(color: Colors.black)),
                                ]
                            )),
                            RichText(text: TextSpan(
                                style: TextStyle(color:clr),
                                children: [
                                  const TextSpan(text: 'Admitted - '),
                                  TextSpan(text: admitted,style: const TextStyle(color: Colors.black)),
                                ]
                            )),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Expanded(
                        flex: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(text: TextSpan(
                                style: TextStyle(color: clr),
                                children: [
                                  const TextSpan(text: 'Bed - '),
                                  TextSpan(text: bed,style: const TextStyle(color: Colors.black)),
                                ]
                            )),
                            RichText(text: TextSpan(
                                style: TextStyle(color: clr),
                                children: [
                                  const TextSpan(text: 'R-ID - '),
                                  TextSpan(text: register,style: const TextStyle(color: Colors.black)),
                                ]
                            )),
                            RichText(text: TextSpan(
                                style: TextStyle(color: clr),
                                children: [
                                  const TextSpan(text: 'Hosp.ID - '),
                                  TextSpan(text: hospId,style: const TextStyle(color: Colors.black)),
                                ]
                            )),

                          ],
                        ),
                      ),
                    ],
                  ),
                )),
            Flexible(
              flex: 16,
              fit: FlexFit.loose,
              child: Column(
                children: [
                  Flexible(
                    flex: 3,
                    fit: FlexFit.loose,
                    child: Card(
                      elevation: 4,
                      child: TabBar(
                        controller: tabController,
                        isScrollable: true,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        labelColor: const Color(0xFF12739b),
                        unselectedLabelColor: Colors.grey,
                        tabs: const [
                          Tab(icon: Icon(FontAwesomeIcons.stethoscope),text: 'DIAGNOSIS',),
                          Tab(icon: Icon(FontAwesomeIcons.handHoldingHeart),text: 'PALLIATIVE',),
                          Tab(icon: Icon(FontAwesomeIcons.sketch),text: 'STATUS',),
                          Tab(icon: Icon(Icons.monitor_sharp),text: 'MONITOR',),
                          Tab(icon: Icon(FontAwesomeIcons.solidNoteSticky),text: 'NT',),
                          
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 10,
                    fit: FlexFit.loose,
                    child:
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TabBarView(
                        controller: tabController,
                        children: [
                          //Tab - 1
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  height: 180,
                                  width: double.infinity,
                                  // padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(width: 2,color: clr)
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                          height: 30,
                                          decoration: BoxDecoration(
                                              color: clr,
                                              borderRadius: const BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8))
                                          ),
                                          child: const Center(
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 14),
                                              child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                              Text('Diagnosis',style: TextStyle(color: Colors.white,fontSize: 15),),
                                              Icon(Icons.refresh,color: Colors.white,)
                                        ],
                                      ),
                                            ),
                                          ),),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                Container(
                                  height: 180,
                                  width: double.infinity,
                                  // padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(width: 2,color: clr)
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 30,
                                        decoration: BoxDecoration(
                                            color: clr,
                                            borderRadius: const BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8))
                                        ),
                                        child: const Center(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 14),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text('Observations / Family History',style: TextStyle(color: Colors.white,fontSize: 15),),
                                                Icon(Icons.refresh,color: Colors.white,)
                                              ],
                                            ),
                                          ),
                                        ),),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //Tab - 2
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  height: 180,
                                  width: double.infinity,
                                  // padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(width: 2,color: clr)
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 30,
                                        decoration: BoxDecoration(
                                            color: clr,
                                            borderRadius: const BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8))
                                        ),
                                        child: const Center(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 14),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text('Goals',style: TextStyle(color: Colors.white,fontSize: 15),),
                                                Icon(Icons.refresh,color: Colors.white,)
                                              ],
                                            ),
                                          ),
                                        ),),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 200,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(12),
                                          border: Border.all(width: 2,color: clr),
                                        ),
                                        child: const Column(
                                          children: [
                                            Align(
                                                alignment: Alignment.topRight,
                                                child: Icon(Icons.refresh,color: Colors.grey,)),
                                            Center(child: Text('AKPS - 100%',style: TextStyle(color: Colors.grey),))
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10,),
                                    Expanded(
                                      child: Container(
                                        height: 200,
                                        decoration: BoxDecoration(
                                          // color: Colors.grey,
                                          borderRadius: BorderRadius.circular(12),
                                          border: Border.all(width: 2,color: clr),
                                        ),
                                        child: const Column(
                                          children: [
                                            Align(
                                                alignment: Alignment.topRight,
                                                child: Icon(Icons.refresh,color: Colors.grey,)),
                                            Center(child: Text('AKPS - 100%',style: TextStyle(color: Colors.white),))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          //Tab - 3
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  height: 220,
                                  width: double.infinity,
                                  // padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(width: 2,color: clr)
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 30,
                                        decoration: BoxDecoration(
                                            color: clr,
                                            borderRadius: const BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8))
                                        ),
                                        child: const Center(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 14),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text('Anthropometry',style: TextStyle(color: Colors.white,fontSize: 15),),
                                                Icon(Icons.refresh,color: Colors.white,)
                                              ],
                                            ),
                                          ),
                                        ),),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                Column(
                                  children: [
                                    Container(
                                      height: 180,
                                      width: double.infinity,
                                      // padding: EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12),
                                          border: Border.all(width: 2,color: clr)
                                      ),
                                      child: PageView(
                                        controller: pageController,
                                        padEnds: true,
                                        pageSnapping: true,
                                        children: [
                                          Column(
                                            children: [
                                              Container(
                                                height: 30,
                                                decoration: BoxDecoration(
                                                    color: clr,
                                                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))
                                                ),
                                                child: const Center(
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 14),
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text('Nutritional Screening',style: TextStyle(color: Colors.white,fontSize: 15),),
                                                        Icon(Icons.refresh,color: Colors.white,)
                                                      ],
                                                    ),
                                                  ),
                                                ),),
                                            ],

                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                height: 30,
                                                decoration: BoxDecoration(
                                                    color: clr,
                                                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))
                                                ),
                                                child: const Center(
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 14),
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text('Nutritional Screening',style: TextStyle(color: Colors.white,fontSize: 15),),
                                                        Icon(Icons.refresh,color: Colors.white,)
                                                      ],
                                                    ),
                                                  ),
                                                ),),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                height: 30,
                                                decoration: BoxDecoration(
                                                    color: clr,
                                                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))
                                                ),
                                                child: const Center(
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 14),
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text('Nutritional Screening',style: TextStyle(color: Colors.white,fontSize: 15),),
                                                        Icon(Icons.refresh,color: Colors.white,)
                                                      ],
                                                    ),
                                                  ),
                                                ),),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                height: 30,
                                                decoration: BoxDecoration(
                                                    color: clr,
                                                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))
                                                ),
                                                child: const Center(
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 14),
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text('Nutritional Screening',style: TextStyle(color: Colors.white,fontSize: 15),),
                                                        Icon(Icons.refresh,color: Colors.white,)
                                                      ],
                                                    ),
                                                  ),
                                                ),),
                                            ],
                                          ),
                                        ],
                                      )
                                    ),
                                    const SizedBox(height: 10,),
                                    SmoothPageIndicator(
                                      controller: pageController,
                                      count: 4,
                                      effect: WormEffect(
                                        dotHeight: 6,
                                        dotWidth: 30,
                                        activeDotColor: clr, // on selected indigator color
                                        dotColor: Colors.grey // other remaining indigator
                                      ),
                                    )

                                  ],
                                ),
                              ],
                            ),
                          ),
                          //Tab - 4
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  height: 180,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(width: 2,color: clr)
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 30,
                                        decoration: BoxDecoration(
                                            color: clr,
                                            borderRadius: const BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8))
                                        ),
                                        child: const Center(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 14),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text('Summary',style: TextStyle(color: Colors.white,fontSize: 15),),
                                                Icon(Icons.refresh,color: Colors.white,)
                                              ],
                                            ),
                                          ),
                                        ),),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                Column(
                                  children: [
                                    Container(
                                      height: 180,
                                      width: double.infinity,
                                      // padding: EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12),
                                          border: Border.all(width: 2,color: clr)
                                      ),
                                      child: PageView(
                                            controller: pageController,
                                            pageSnapping: true,
                                            padEnds: true,
                                            children: [
                                              Column(
                                                children: [
                                                  Container(
                                                    height: 30,
                                                    decoration: BoxDecoration(
                                                        color: clr,
                                                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8))
                                                    ),
                                                    child: const Center(
                                                      child: Padding(
                                                        padding: EdgeInsets.symmetric(horizontal: 14),
                                                        child: Row(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Text('Fluid Balance',style: TextStyle(color: Colors.white,fontSize: 15),),
                                                            Icon(Icons.refresh,color: Colors.white,)
                                                          ],
                                                        ),
                                                      ),
                                                    ),),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Container(
                                                    height: 30,
                                                    decoration: BoxDecoration(
                                                        color: clr,
                                                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8))
                                                    ),
                                                    child: const Center(
                                                      child: Padding(
                                                        padding: EdgeInsets.symmetric(horizontal: 14),
                                                        child: Row(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Text('Fluid Balance',style: TextStyle(color: Colors.white,fontSize: 15),),
                                                            Icon(Icons.refresh,color: Colors.white,)
                                                          ],
                                                        ),
                                                      ),
                                                    ),),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Container(
                                                    height: 30,
                                                    decoration: BoxDecoration(
                                                        color: clr,
                                                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8))
                                                    ),
                                                    child: const Center(
                                                      child: Padding(
                                                        padding: EdgeInsets.symmetric(horizontal: 14),
                                                        child: Row(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Text('Fluid Balance',style: TextStyle(color: Colors.white,fontSize: 15),),
                                                            Icon(Icons.refresh,color: Colors.white,)
                                                          ],
                                                        ),
                                                      ),
                                                    ),),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Container(
                                                    height: 30,
                                                    decoration: BoxDecoration(
                                                        color: clr,
                                                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8))
                                                    ),
                                                    child: const Center(
                                                      child: Padding(
                                                        padding: EdgeInsets.symmetric(horizontal: 14),
                                                        child: Row(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Text('Fluid Balance',style: TextStyle(color: Colors.white,fontSize: 15),),
                                                            Icon(Icons.refresh,color: Colors.white,)
                                                          ],
                                                        ),
                                                      ),
                                                    ),),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Container(
                                                    height: 30,
                                                    decoration: BoxDecoration(
                                                        color: clr,
                                                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8))
                                                    ),
                                                    child: const Center(
                                                      child: Padding(
                                                        padding: EdgeInsets.symmetric(horizontal: 14),
                                                        child: Row(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Text('Fluid Balance',style: TextStyle(color: Colors.white,fontSize: 15),),
                                                            Icon(Icons.refresh,color: Colors.white,)
                                                          ],
                                                        ),
                                                      ),
                                                    ),),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Container(
                                                    height: 30,
                                                    decoration: BoxDecoration(
                                                        color: clr,
                                                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8))
                                                    ),
                                                    child: const Center(
                                                      child: Padding(
                                                        padding: EdgeInsets.symmetric(horizontal: 14),
                                                        child: Row(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Text('Fluid Balance',style: TextStyle(color: Colors.white,fontSize: 15),),
                                                            Icon(Icons.refresh,color: Colors.white,)
                                                          ],
                                                        ),
                                                      ),
                                                    ),),
                                                ],
                                              ),

                                            ]
                                          ),
                                    ),
                                    const SizedBox(height: 10,),
                                    SmoothPageIndicator(
                                      controller: pageController,
                                      count: 6,
                                      effect: WormEffect(
                                          dotWidth: 30,
                                          dotHeight: 6,
                                          activeDotColor: clr
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          //Tab - 5
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  height: 180,
                                  width: double.infinity,
                                  // padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(width: 2,color: clr)
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 30,
                                        decoration: BoxDecoration(
                                            color: clr,
                                            borderRadius: const BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8))
                                        ),
                                        child: const Center(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 14),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text('Needs (Achieved %)',style: TextStyle(color: Colors.white,fontSize: 15),),
                                                Icon(Icons.refresh,color: Colors.white,)
                                              ],
                                            ),
                                          ),
                                        ),),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                Column(
                                  children: [
                                    Container(
                                      height: 180,
                                      width: double.infinity,
                                      // padding: EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12),
                                          border: Border.all(width: 2,color: clr)
                                      ),
                                      child: PageView(
                                        controller: pageController,
                                        padEnds: true,
                                        pageSnapping: true,
                                        children: [
                                          Column(
                                            children: [
                                              Container(
                                                height: 30,
                                                decoration: BoxDecoration(
                                                    color: clr,
                                                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8))
                                                ),
                                                child: const Center(
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 14),
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text('Parenteral Nutrition',style: TextStyle(color: Colors.white,fontSize: 15),),
                                                        Icon(Icons.refresh,color: Colors.white,)
                                                      ],
                                                    ),
                                                  ),
                                                ),),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                height: 30,
                                                decoration: BoxDecoration(
                                                    color: clr,
                                                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8))
                                                ),
                                                child: const Center(
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 14),
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text('Parenteral Nutrition',style: TextStyle(color: Colors.white,fontSize: 15),),
                                                        Icon(Icons.refresh,color: Colors.white,)
                                                      ],
                                                    ),
                                                  ),
                                                ),),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                height: 30,
                                                decoration: BoxDecoration(
                                                    color: clr,
                                                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8))
                                                ),
                                                child: const Center(
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 14),
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text('Parenteral Nutrition',style: TextStyle(color: Colors.white,fontSize: 15),),
                                                        Icon(Icons.refresh,color: Colors.white,)
                                                      ],
                                                    ),
                                                  ),
                                                ),),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                height: 30,
                                                decoration: BoxDecoration(
                                                    color: clr,
                                                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8))
                                                ),
                                                child: const Center(
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 14),
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text('Parenteral Nutrition',style: TextStyle(color: Colors.white,fontSize: 15),),
                                                        Icon(Icons.refresh,color: Colors.white,)
                                                      ],
                                                    ),
                                                  ),
                                                ),),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                height: 30,
                                                decoration: BoxDecoration(
                                                    color: clr,
                                                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8))
                                                ),
                                                child: const Center(
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 14),
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text('Parenteral Nutrition',style: TextStyle(color: Colors.white,fontSize: 15),),
                                                        Icon(Icons.refresh,color: Colors.white,)
                                                      ],
                                                    ),
                                                  ),
                                                ),),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                height: 30,
                                                decoration: BoxDecoration(
                                                    color: clr,
                                                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8))
                                                ),
                                                child: const Center(
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 14),
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text('Parenteral Nutrition',style: TextStyle(color: Colors.white,fontSize: 15),),
                                                        Icon(Icons.refresh,color: Colors.white,)
                                                      ],
                                                    ),
                                                  ),
                                                ),),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                height: 30,
                                                decoration: BoxDecoration(
                                                    color: clr,
                                                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8))
                                                ),
                                                child: const Center(
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 14),
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text('Parenteral Nutrition',style: TextStyle(color: Colors.white,fontSize: 15),),
                                                        Icon(Icons.refresh,color: Colors.white,)
                                                      ],
                                                    ),
                                                  ),
                                                ),),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                height: 30,
                                                decoration: BoxDecoration(
                                                    color: clr,
                                                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8))
                                                ),
                                                child: const Center(
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 14),
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text('Parenteral Nutrition',style: TextStyle(color: Colors.white,fontSize: 15),),
                                                        Icon(Icons.refresh,color: Colors.white,)
                                                      ],
                                                    ),
                                                  ),
                                                ),),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 10,),
                                    SmoothPageIndicator(
                                      controller: pageController,
                                      count: 8,
                                      effect: WormEffect(
                                        dotWidth: 30,
                                        dotHeight: 6,
                                        activeDotColor: clr,
                                        dotColor: Colors.grey,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                  color: clr,
                  width: double.infinity,
                  // height: 42,
                  child: const Icon(Icons.home,size: 40,color: Colors.white,)),
            ),
          ]
      ),
    );
  }
}
