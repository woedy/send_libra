import 'package:flutter/material.dart';
import 'package:send_libra/constants.dart';

class SilverPlusInformation extends StatefulWidget {
  const SilverPlusInformation({Key? key}) : super(key: key);

  @override
  State<SilverPlusInformation> createState() => _SilverPlusInformationState();
}

class _SilverPlusInformationState extends State<SilverPlusInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                  child: InkWell(
                    onTap: () {
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
                          color: clay),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height - 96,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                                child: Text(
                              "Silver+",
                              style: TextStyle(fontSize: 32),
                            )),
                          ],
                        ),
                        Positioned(
                            top: 80,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: 620,
                              padding: EdgeInsets.all(20),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  )),

                              child: ListView(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text("Silver+", style: TextStyle(fontSize: 32, color: libraPrimary),),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Row(
                                            children: [
                                              Icon(Icons.star, color: Colors.yellow, size: 27,),
                                              Icon(Icons.star, color: Colors.yellow, size: 27,),
                                              Icon(Icons.star, color: Colors.yellow, size: 27,),
                                              Icon(Icons.star, color: Colors.yellow, size: 27,),
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 40,
                                      ),
                                      Text("Information needed", style: TextStyle(fontSize: 16, color: libraPrimary),),

                                      SizedBox(
                                        height: 30,
                                      ),


                                      Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all(
                                                width: 1,
                                                color: libraPrimary.withOpacity(0.3)
                                            )
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Basic level information", style: TextStyle(fontSize: 18,color: libraPrimary),),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text("12 Oct 2021 , 4:10pm", style: TextStyle(fontSize: 10,color: libraPrimary),),
                                              ],
                                            ),
                                            Icon(Icons.check_circle, color: Colors.green, size: 22,)


                                          ],
                                        ),
                                      ),

                                      SizedBox(
                                        height: 20,
                                      ),

                                      Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all(
                                                width: 1,
                                                color: libraPrimary.withOpacity(0.3)
                                            )
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Bronze tier Information", style: TextStyle(fontSize: 18,color: libraPrimary),),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text("12 Oct 2021 , 4:10pm", style: TextStyle(fontSize: 10,color: libraPrimary),),
                                              ],
                                            ),
                                            Icon(Icons.check_circle, color: Colors.green, size: 22,)


                                          ],
                                        ),
                                      ),

                                      SizedBox(
                                        height: 20,
                                      ),

                                      Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all(
                                                width: 1,
                                                color: libraPrimary.withOpacity(0.3)
                                            )
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text("Live Photo", style: TextStyle(fontSize: 18, color: libraPrimary,),),
                                                SizedBox(
                                                  height: 10,
                                                ),

                                              ],
                                            ),
                                            Image(image: AssetImage("assets/icons/orange_icon.png"))


                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all(
                                                width: 1,
                                                color: libraPrimary.withOpacity(0.3)
                                            )
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text("Proof of Income", style: TextStyle(fontSize: 18, color: libraPrimary,),),
                                                SizedBox(
                                                  height: 10,
                                                ),

                                              ],
                                            ),
                                            Image(image: AssetImage("assets/icons/orange_icon.png"))


                                          ],
                                        ),
                                      ),

                                      SizedBox(
                                        height: 30,
                                      ),

                                      Text("Additional sending limits may apply depending on your choice of payout partner or receiving locations.", style: TextStyle(fontSize: 12, color: libraPrimary)),

                                      SizedBox(
                                        height: 10,
                                      ),

                                      Text.rich(TextSpan(
                                          text: "Any information your provide securely through our website or app is protected as describe in our ",
                                          style: TextStyle(fontSize: 12, color: libraPrimary),
                                          children: [
                                            TextSpan(
                                              text: "Privacy Policy",
                                              style: TextStyle(fontSize: 12, color: libraBlue, decoration: TextDecoration.underline,),
                                            )
                                          ]
                                      )),

                                      SizedBox(
                                        height: 20,
                                      ),



                                      Align(
                                        child: Container(
                                          width: 384,
                                          height: 55,
                                          padding: EdgeInsets.all(15),
                                          decoration: BoxDecoration(
                                              color: libraBlue,
                                              borderRadius: BorderRadius.circular(15)

                                          ),
                                          child: Material(
                                            color: Colors.transparent,
                                            child: InkWell(
                                              onTap: (){


                                              },
                                              child: Align(
                                                child: Container(
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text("Next", style: TextStyle(fontSize: 15, color: Colors.white),),

                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                    ],
                                  )
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
