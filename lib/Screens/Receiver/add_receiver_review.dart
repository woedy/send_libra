import 'dart:convert';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:send_libra/Screens/Receiver/add_receiver1.dart';
import 'package:send_libra/Screens/Receiver/models/addReceiverModel.dart';

import 'package:send_libra/constants.dart';
import 'package:http/http.dart' as http;

import '../HomeScreen/HomeScreen.dart';



Future<AddReceiverModel> add_receiver(data) async {

  final response = await http.post(
    Uri.parse(hostName + "/api/v1/beneficiaries"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Bearer': (await getApiPref()).toString()
      //'Bearer': "bf7d2cdd037c865b3a8a62792d0d72bf"

    },
    body: jsonEncode(data),
  );

  if (response.statusCode == 201) {

    return AddReceiverModel.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 422) {

    return AddReceiverModel.fromJson(jsonDecode(response.body));
  }  else {

    throw Exception('Failed to load');
  }
}


class AddReceiverReview extends StatefulWidget {
  final data;
  const AddReceiverReview({Key? key, required this.data}) : super(key: key);

  @override
  State<AddReceiverReview> createState() => _AddReceiverReviewState();
}

class _AddReceiverReviewState extends State<AddReceiverReview> with SingleTickerProviderStateMixin {

  Future<AddReceiverModel>? _futureAddReceiver;

  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    )..repeat();
  }


  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    return (_futureAddReceiver == null) ? buildColumn() : buildFutureBuilder();

  }


  buildColumn() {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child:    InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: libraPrimary,
                            width: 1,
                          ),
                          color: clay
                      ),
                      child: Icon(Icons.arrow_back, color: Colors.white,),
                    ),
                  ),
                ),
                Container(

                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        SizedBox(
                          height: 10,
                        ),
                        Text.rich(TextSpan(
                          text: "Beneficiary",
                          style: TextStyle(
                            fontSize: 60,
                          ),
                        )),
                        SizedBox(
                          height: 40,
                        ),

                        Row(
                          children: [
                            if (widget.data['avatar'] != "")...[
                              DottedBorder(
                                borderType: BorderType.RRect,
                                radius: Radius.circular(20),
                                dashPattern: [10, 10],
                                color: Colors.grey,
                                strokeWidth: 2,
                                child: Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: MemoryImage(base64Decode(widget.data['avatar'])),
                                        fit: BoxFit.cover,
                                      )
                                  ),

                                ),
                              ),
                            ]else...[
                              DottedBorder(
                                borderType: BorderType.RRect,
                                radius: Radius.circular(20),
                                dashPattern: [10, 10],
                                color: Colors.grey,
                                strokeWidth: 2,
                                child: Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      widget.data['firstname'].toString().substring(0, 1) + widget.data['lastname'].toString().substring(0, 1),
                                      style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
                                    ),
                                  ),

                                ),
                              ),
                            ],
                            SizedBox(
                              width: 20,
                            ),

                            Text(
                              widget.data['firstname'] + " " + widget.data['lastname'],
                              style: TextStyle(fontSize: 22),
                            ),




                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          children: [

                            if(widget.data['mobile_transfer_network'] == "MTN Ghana")...[
                              Container(
                                height: 80,
                                width: 80,
                                //color: Colors.red,
                                child: Image(
                                  height: 80,
                                  width: 80,

                                  image: AssetImage("assets/images/mtn2.png"),),
                              ),
                            ]else if(widget.data['mobile_transfer_network'] == "vodafone")...[
                              Container(
                                height: 80,
                                width: 80,
                                //color: Colors.red,
                                child: Image(
                                  height: 80,
                                  width: 80,

                                  image: AssetImage("assets/images/voda2.png"),),
                              )

                            ]else if(widget.data['mobile_transfer_network'] == "AirtelTigo")...[
                              Container(
                                height: 80,
                                width: 80,
                                //color: Colors.red,
                                child: Image(
                                  height: 80,
                                  width: 80,

                                  image: AssetImage("assets/images/tigo2.png"),),
                              )

                            ],



                            SizedBox(
                              width: 20,
                            ),

                            Text(
                              "Payment Method",
                              style: TextStyle(fontSize: 18),
                            ),




                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          children: [
                            Text("Phone Number", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                            SizedBox(
                              width: 20,
                            ),
                            Text(widget.data['mobile_transfer_number'], style: TextStyle(fontSize: 18),)
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          children: [
                            Text("Gender *", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                            SizedBox(
                              width: 20,
                            ),
                            Text(widget.data['gender'], style: TextStyle(fontSize: 18),)
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          children: [
                            Text("How do  you know the person", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                            SizedBox(
                              width: 20,
                            ),
                            Text(widget.data['relation'], style: TextStyle(fontSize: 18),)
                          ],
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        Column(
                          children: [
                            Align(
                              child: Container(
                                width: 384,
                                height: 55,
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    color: libraBlue,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () async {


                                      widget.data['username'] = await getUserIDPref();
                                      widget.data['country_id'] = "999";
                                      widget.data['telephone'] = widget.data['mobile'];

                                      setState(() {
                                        _futureAddReceiver = add_receiver(widget.data);
                                      });

                                    },
                                    child: Align(
                                      child: Container(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "Next",
                                              style: TextStyle(
                                                  fontSize: 15, color: Colors.white),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Icon(
                                              Icons.arrow_forward,
                                              color: Colors.white,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      ],
                    )),



              ],
            ),
          ),
        ),
      ),
    );

  }

  FutureBuilder<AddReceiverModel> buildFutureBuilder() {
    return FutureBuilder<AddReceiverModel>(
        future: _futureAddReceiver,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Dialog(
                backgroundColor: Colors.transparent,
                child: Container(
                    height: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), color: Colors.white),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image(image: AssetImage("assets/images/libra-dialog.png")),
                        SizedBox(
                          height: 30,
                        ),
                        Text("is updating your \nbeneficiary info",
                          style: TextStyle(fontSize: 30, color: libraPrimary),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            RotationTransition(
                                turns: _controller!,
                                child: Image(image: AssetImage("assets/icons/loading.png"))),
                          ],
                        ),
                      ],
                    )


                )

            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            if(snapshot.hasData) {

              var data = snapshot.data!;

              if(data.message == "Beneficiary created successfully") {

                WidgetsBinding.instance.addPostFrameCallback((_) {
                  showDialog(
                      barrierDismissible: true,
                      context: context,
                      builder: (BuildContext context){
                        return Dialog(
                            backgroundColor: Colors.transparent,
                            child: Container(

                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10), color: Colors.white),

                              child: Stack(
                                children: [
                                  //Image(image: AssetImage("assets/images/sprinkles.png")),
                                  Container(
                                      height: 300,

                                      padding: EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Image(image: AssetImage("assets/images/libra-dialog.png")),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Text("Beneficiary info \nupdated",
                                            style: TextStyle(fontSize: 36, color: libraPrimary),
                                          ),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Image(image: AssetImage("assets/icons/verify_check.png")),
                                            ],
                                          ),
                                        ],
                                      )

                                  ),
                                ],
                              ),
                            )

                        );
                      }
                  );

                });

                Future.delayed(const Duration(seconds: 2), () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                        (route) => false,
                  );
                });


              }else {


                WidgetsBinding.instance.addPostFrameCallback((_) {
                  showDialog(
                      barrierDismissible: true,
                      context: context,
                      builder: (BuildContext context){
                        return Dialog(
                            backgroundColor: Colors.transparent,
                            child: Container(

                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10), color: Colors.white),

                              child: Stack(
                                children: [
                                  Container(
                                      height: 270,

                                      padding: EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Image(image: AssetImage("assets/images/libra-dialog.png")),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Text(data.message!,
                                            style: TextStyle(fontSize: 23, color: libraPrimary),
                                          ),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Icon(Icons.error_outline, color: Colors.red, size: 40,)
                                            ],
                                          ),
                                        ],
                                      )


                                  ),
                                ],
                              ),
                            )

                        );
                      }
                  );

                });


                Future.delayed(const Duration(seconds: 2), () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                        (route) => false,
                  );
                });


              }

            }
          }

          return Scaffold(
            body: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /*CircularProgressIndicator(),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Please Wait...")*/
                ],
              ),
            ),
          );


        }
    );
  }







}

