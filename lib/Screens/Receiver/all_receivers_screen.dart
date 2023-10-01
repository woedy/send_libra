import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:send_libra/Screens/Receiver/add_receiver1.dart';
import 'package:send_libra/Screens/Receiver/models/all_receivers_model.dart';
import 'package:send_libra/Screens/SendMoney/QuickSend/quick_send_money_screen.dart';
import 'package:send_libra/Screens/SendMoney/SendNormal/send_money_screen.dart';
import 'package:send_libra/constants.dart';
import 'package:http/http.dart' as http;



Future<AllReceiversModel> getAllReceivers() async {
  var email = await getUserIDPref();

  final response = await http.get(
    Uri.parse(hostName + "/api/v1/beneficiaries?username=" + email.toString()),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Bearer': (await getApiPref()).toString()
    },

  );

  if (response.statusCode == 200) {
    return AllReceiversModel.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 422) {
    return AllReceiversModel.fromJson(jsonDecode(response.body));
  }  else {

    throw Exception('Failed to Sign In');
  }
}

class AllReceiversScreen extends StatefulWidget {
  final user_init;
  final image;
  const AllReceiversScreen({Key? key, required this.user_init, this.image}) : super(key: key);

  @override
  State<AllReceiversScreen> createState() => _AllReceiversScreenState();
}

class _AllReceiversScreenState extends State<AllReceiversScreen> with SingleTickerProviderStateMixin  {
  Future<AllReceiversModel>? _futureGetAllReceivers;
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _futureGetAllReceivers = getAllReceivers();
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
    return (_futureGetAllReceivers == null) ? buildColumn() : buildFutureBuilder();


  }

  buildColumn(){
    return Scaffold(
      body: SafeArea(
        child: Container(),
      ),
    );
  }


  FutureBuilder<AllReceiversModel> buildFutureBuilder() {
    return FutureBuilder<AllReceiversModel>(
        future: _futureGetAllReceivers,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {

            return Dialog(
                backgroundColor: Colors.transparent,
                child: Container(
                    height: 280,
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
                        Text("is loading beneficiaries..",
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

          }
          else if(snapshot.hasData) {

            var data = snapshot.data!;



            if(data.message == "Beneficiaries retrieved successfully") {

              return Scaffold(
                body: SafeArea(
                  child: SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                            child:    InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.all(0),
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
                          SizedBox(
                            height: 20,
                          ),

                          Text.rich(TextSpan(
                            text: "Send Money",
                            style: TextStyle(
                              fontSize: 75,
                            ),
                          )),

                          SizedBox(
                            height: 20,
                          ),

                          Text("Select your beneficiaries", style: TextStyle(fontSize: 36),),
                          SizedBox(
                            height: 20,
                          ),

                          InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      AddReceiver1()));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(25),
                                      decoration: BoxDecoration(
                                          color: clay.withOpacity(0.3),
                                          borderRadius: BorderRadius.circular(10)

                                      ),
                                      child: Center(
                                        child: Icon(Icons.add, color: Colors.white,),
                                      ),
                                    ),
                                    SizedBox(
                                        width: 20
                                    ),
                                    Text("Create new beneficiary", style: (TextStyle(fontSize: 15)),),
                                  ],
                                ),
                                Icon(Icons.arrow_forward_ios, color: Colors.white, size: 12,)

                              ],
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  if(widget.image.toString() == "" || widget.image.toString() == null)...[
                                    Container(
                                      height: 82,
                                      width: 82,
                                      decoration: BoxDecoration(
                                          color: libraBlue,
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: Center(
                                        child: Text(widget.user_init, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                                      ),
                                    ),
                                  ]else...[
                                    Container(
                                      height: 82,
                                      width: 82,
                                      decoration: BoxDecoration(
                                          color: libraBlue,
                                          borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                          image: MemoryImage(widget.image)
                                        )
                                      ),

                                    ),
                                  ],
                                  SizedBox(
                                      width: 20
                                  ),
                                  Text("Me", style: (TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),),
                                ],
                              ),
                              Icon(Icons.arrow_forward_ios, color: Colors.white, size: 12,)

                            ],
                          ),


                          Container(
                            height: MediaQuery.of(context).size.height,
                            child: ListView.builder(
                              itemCount: data.data!.length,
                                itemBuilder: (context, index){
                              return Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  InkWell(
                                    onTap: (){
                                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => SendMoneyScreen(
                                        beneficiary_id: data.data![index].beneficiaryId,
                                        fname: data.data![index].fname,
                                        lname: data.data![index].lname,
                                        phone: data.data![index].mobile,
                                        avatar: data.data![index].avatarContent!.trim().toString(),
                                      )));


                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            if(data.data![index].avatar == "")...[
                                              Container(
                                                height: 82,
                                                width: 82,
                                                //padding: EdgeInsets.all(25),
                                                decoration: BoxDecoration(
                                                    color: clay.withOpacity(0.3),
                                                    borderRadius: BorderRadius.circular(10)

                                                ),
                                                child: Center(child: Text(
                                                  data.data![index].fname.toString().substring(0, 1)
                                                      + " " +
                                                      data.data![index].lname.toString().substring(0, 1),
                                                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20)
                                                  ,)),
                                              ),
                                            ]else...[
                                              Container(
                                                height: 82,
                                                width: 82,
                                                //margin: EdgeInsets.symmetric(horizontal: 10),
                                                decoration: BoxDecoration(
                                                    color: libraLight.withOpacity(0.3),
                                                    borderRadius: BorderRadius.circular(15),
                                                    image: DecorationImage(
                                                      image: MemoryImage(base64Decode(data.data![index].avatarContent!.trim().toString())), fit: BoxFit.cover,
                                                    )
                                                ),

                                              ),
                                            ],

                                            SizedBox(
                                                width: 20
                                            ),
                                            Text(data.data![index].fname.toString() + " " + data.data![index].lname.toString(), style: (TextStyle(fontSize: 15,)),),
                                          ],
                                        ),
                                        Icon(Icons.arrow_forward_ios, color: Colors.white, size: 12,)

                                      ],
                                    ),
                                  ),
                                ],
                              );
                            }),
                          )


                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
       }



          return Scaffold(
            body: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /*   CircularProgressIndicator(),
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
