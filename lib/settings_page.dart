import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_page.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getName();
  }

  getName()async{
    var prefs  = await SharedPreferences.getInstance();
   var nam = prefs.getString('naam');
   setState(() {
     name = nam!;
   });
  }
//for DropDownButton
  List<String> language = ['English(US)' , 'Hindi',];
  String? defaultValue;
  //

  var clr = const Color(0xFF12739b);
  var name = '';
  File? imageFile;
  var isLoading = false;

  
  alrtDilog(){
    return AlertDialog(
      title: const Text('Take Image',style: TextStyle(fontSize: 24),),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                IconButton(onPressed: (){
                  return imagePicker(source: ImageSource.camera);
                },
                    icon: const Icon(Icons.camera_enhance_outlined)),
                const SizedBox(height: 4,),
                const Text('Camera'),
              ],
            ),

            const SizedBox(width: 12,),

            Column(
              children: [
                IconButton(onPressed: (){
                  return imagePicker(source: ImageSource.gallery);
                },
                    icon: const Icon(Icons.browse_gallery_rounded)),
                const SizedBox(height: 4,),
                const Text('Gallery'),
              ],
            ),
            const SizedBox(width: 12,),
            Column(
              children: [
                IconButton(onPressed: (){
                  setState(() {
                    imageFile =null;
                  });
                },
                    icon: const Icon(Icons.delete)),
                const SizedBox(height: 4,),
                const Text('Remove'),
              ],
            ),
          ],
        ),
      ],
    );
  }

  void imagePicker({required ImageSource source})async{
    final image = await ImagePicker().pickImage(source: source);

    if(image==null) return ;
    final imagepath = File(image.path);
      setState(() {
        imageFile=imagepath;
      });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: ListView(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              padding: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                color: clr,
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            height: 150,
                           constraints: const BoxConstraints(
                             minWidth: 100,
                             maxWidth: 160
                           ),
                            color: Colors.white,
                            child: imageFile!=null ? Image.file(imageFile!) : Image.asset('assets/images/d.jpg')),
                        ),
                        Positioned(
                          bottom: -10,
                          right: -10,
                          child: IconButton(
                            onPressed: () {
                              showDialog(context: context, builder: (_) {
                                return alrtDilog();
                              });
                            }, icon: const Icon(Icons.camera_enhance_outlined, size: 28,),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10,),
                    Text(name,style: const TextStyle(fontSize: 26,color: Colors.white),),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25,),

            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                children: [
                  const TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_off),
                      hintText: 'Name',
                    ),
                  ),
                  const SizedBox(height: 35,),

                  const TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined),
                      hintText: 'Email',
                    ),
                  ),
                  const SizedBox(height: 27,),

//Reference Unit

                  Container(
                    width: double.infinity,
                    height: 48,
                    decoration: BoxDecoration(
                      color: clr,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: InkWell(onTap: () {

                    },
                        child: const Center(
                            child: Text('Reference Unit', style: TextStyle(
                                fontSize: 16, color: Colors.white),))),
                  ),
                  const SizedBox(height: 22,),


//KG & METERS

                  const Text('KG & METERS'),
                  const SizedBox(height: 22,),

//Save

                  Container(
                    width: double.infinity,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: clr,
                    ),
                    child: InkWell(onTap: () {

                    },
                        child: const Center(
                            child: Text('Save', style: TextStyle(fontSize: 16,
                                color: Colors.white),))),
                  ),
                  const SizedBox(height: 22,),

//English

                InputDecorator(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(width:1,color: Colors.black),
                    ),
                    contentPadding: const EdgeInsets.all(2),
                    fillColor: clr,
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      isExpanded: true,
                        iconEnabledColor: Colors.black,
                        iconSize: 30,
                        isDense: true,
                        items: language.map((String val){
                            return DropdownMenuItem(
                              value: val,
                               child: Padding(
                                 padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(val),
                                ));
                           }).toList(),

                      value: defaultValue,
                      onChanged: (lan){
                          setState(() {
                           defaultValue = lan;
                          });
                        },

                      hint: const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text("Select Language",style: TextStyle(color: Colors.black,fontSize: 15),),
                      ),
                    ),
                  ),
                ),

                  const SizedBox(height: 22,),

//Log Out

                  Container(
                    width: double.infinity,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: clr,
                    ),
                    child: InkWell(onTap: () {
                      showDialog(context: context, builder: (_) =>
                          AlertDialogWidget(),);
                    },
                        child: const Center(
                            child: Text('Log Out', style: TextStyle(
                                fontSize: 16, color: Colors.white),))),
                  ),
                  const SizedBox(height: 30,),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text('Version- 1.0.0',style: TextStyle(color: Colors.grey),),
            ),
            const SizedBox(height: 10,),
            InkWell(onTap: () {
              Navigator.pop(context);
            },
              child: Container(
                  width: double.infinity,
                  color: clr,
                  height: 50,

                  child: const Icon(
                    Icons.home, size: 25, color: Colors.white,)),
            )
          ],
        ),
      ),
    );
  }
  
}


    class AlertDialogWidget extends StatefulWidget {
//const AlertDialogWidget({Key? key, }) : super(key: key);

    @override
    State<AlertDialogWidget> createState() => _AlertDialogWidgetState();
    }

    class _AlertDialogWidgetState extends State<AlertDialogWidget> {

// final logout = FirebaseAuth.instance;

    @override
    Widget build(BuildContext context) {
    return  AlertDialog(
     title: const Text('LogOut Confirmation'),
     content: const Text('Are you want to Log Out?'),
     actions: <Widget>[
            TextButton(onPressed: ()async{

              var prefs = await SharedPreferences.getInstance();
              prefs.remove('loggin');

                Navigator.pushReplacement(context, MaterialPageRoute(builder:(context){
                return LoginPage();
                 }));
            }, child: const Text('Yes',style: TextStyle(color: Color(0xFF12739b)),),),

            const SizedBox(width: 6,),

            TextButton(
            onPressed: (){
            return Navigator.pop(context);
            },
            child: const Text('No',style: TextStyle(color: Color(0xFF12739b)))),
            const SizedBox(width: 4,),
    ],
    );
    }

}



