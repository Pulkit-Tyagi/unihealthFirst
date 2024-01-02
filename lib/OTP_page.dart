import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pulkittyagi/home_page.dart';

class OTPscreen extends StatefulWidget {
  //const OTPscreen({super.key});

  var otp;
  OTPscreen(this.otp);

  @override
  State<OTPscreen> createState() => _OTPscreenState();
}

class _OTPscreenState extends State<OTPscreen> {
  var a= TextEditingController();
  var b= TextEditingController();
  var c= TextEditingController();
  var d= TextEditingController();
  var e= TextEditingController();
  var f= TextEditingController();

  var clr = const Color(0xFF12739b);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verification'),
        centerTitle: true,
        backgroundColor: clr,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(widget.otp,style: const TextStyle(color: Colors.black,fontSize: 10),),
              const Text('Enter OTP, which is already send on your Email.'),
              const SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 56,
                    width: 44,
                    child: TextFormField(
                      controller: a,
                      onChanged: (value){
                        if(value.length==1){
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,  //use for exclude to operators
                    ],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 56,
                    width: 44,
                    child: TextFormField(
                      controller: b,
                      onChanged: (value){
                        if(value.length == 1){
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 56,
                    width: 44,
                    child: TextFormField(
                      controller: c,
                      onChanged: (value){
                        if(value.length == 1){
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 56,
                    width: 44,
                    child: TextFormField(
                      controller: d,
                      onChanged: (value){
                        if(value.length == 1){
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 56,
                    width: 44,
                    child: TextFormField(
                      controller: e,
                      onChanged: (value){
                        if(value.length == 1){
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 56,
                    width: 44,
                    child: TextFormField(
                      controller: f,
                      onChanged: (value){
                        if(value.length == 1){
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),

                ],
              ),
              const SizedBox(height: 15,),
              Container(
                width: 175,
                height: 45,
                child: InkWell(onTap: (){
                  var userotp = a.text.toString()
                      + b.text.toString()
                      + c.text.toString()
                      + d.text.toString()
                      + e.text.toString()
                      + f.text.toString();

                  if(userotp.isNotEmpty){
                    //Future.delayed(Duration(seconds: 3));
                    showDialog(context: context, builder: (context){
                      return const Center(
                          child: Center(child: CircularProgressIndicator()));
                    });

                    if(userotp==widget.otp){

                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return intro();
                      }));
                      Fluttertoast.showToast(msg: 'Successfully Login',backgroundColor: Colors.blueGrey,gravity: ToastGravity.BOTTOM);

                    }else{
                      Fluttertoast.showToast(msg: 'Invalid OTP',textColor: Colors.orange,backgroundColor: Colors.green,gravity: ToastGravity.BOTTOM);
                    }

                  }else{
                    Fluttertoast.showToast(msg: 'Enter OTP',backgroundColor: Colors.green,gravity: ToastGravity.BOTTOM_LEFT);
                  }

                },
                    child: Center(
                      child: Container(
                        //height: 40,
                        //width: 200,
                        decoration: BoxDecoration(
                          color: clr,
                          borderRadius: BorderRadius.circular(10),
                        ),
                          child: const Center(child: Text('Verify OTP',style: TextStyle(color: Colors.white,fontSize: 18),))),
                    )),
              ),


            ],
          ),
        ),
      ),
    );;
  }
}
