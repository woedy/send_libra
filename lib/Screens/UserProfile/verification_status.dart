import 'package:flutter/material.dart';
import 'package:send_libra/constants.dart';

class VerificationStatusScreen extends StatefulWidget {
  final data;
  const VerificationStatusScreen({Key? key, required this.data}) : super(key: key);

  @override
  State<VerificationStatusScreen> createState() => _VerificationStatusScreenState();
}

class _VerificationStatusScreenState extends State<VerificationStatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(

            //height: MediaQuery.of(context).size.height,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

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
                    SizedBox(
                      height: 20,
                    ),

                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Text.rich(
                          TextSpan(
                            text: "Your verification status",
                            style: TextStyle(fontSize: 40,  ),

                          )
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),

                if(widget.data.verified == "t")...[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.check_circle_outline, color: Colors.green, size: 150,),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Verified", style: TextStyle(fontSize: 20),)

                      ],
                    ),
                  ),
                ]else...[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.close_outlined, color: Colors.red, size: 150,),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Not verified", style: TextStyle(fontSize: 20),),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Please update your user profile to get verified.", style: TextStyle(fontSize: 16),)

                      ],
                    ),
                  )
                ],

                SizedBox(
                  height: 50,
                ),
                if(widget.data.status == "valid")...[
                  Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     /* Icon(Icons.check_circle_outline, color: Colors.green, size: 150,),
                      SizedBox(
                        height: 10,
                      ),*/
                      Text("You are a valid Libra User", style: TextStyle(fontSize: 20),)

                    ],
                  ),
                ),
                ]else...[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /* Icon(Icons.check_circle_outline, color: Colors.green, size: 150,),
                      SizedBox(
                        height: 10,
                      ),*/
                        Text("You are not a valid Libra User", style: TextStyle(fontSize: 20, color: Colors.red),)

                      ],
                    ),
                  ),
                ]





          ],
            ),
          ),
        ),
      ),
    );
  }
}
