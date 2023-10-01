import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:send_libra/Screens/Authentication/IncreasingPower/3Stars/3_star_information_needed.dart';
import 'package:send_libra/constants.dart';


class SilverPowerBreakdown extends StatefulWidget {
  const SilverPowerBreakdown({Key? key}) : super(key: key);

  @override
  State<SilverPowerBreakdown> createState() => _SilverPowerBreakdownState();
}

class _SilverPowerBreakdownState extends State<SilverPowerBreakdown> {
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
                              "Silver",
                              style: TextStyle(fontSize: 32),
                            )),
                          ],
                        ),
                        Positioned(
                            top: 80,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: 700,
                              padding: EdgeInsets.all(20),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  )),

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text("Silver", style: TextStyle(fontSize: 32, color: libraPrimary),),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Row(
                                        children: [
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
                                  Text("Power Breakdown", style: TextStyle(fontSize: 16, color: libraPrimary),),

                                  SizedBox(
                                    height: 30,
                                  ),


                                  Container(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(15),
                                              border: Border.all(
                                                width: 1,
                                                color: libraPrimary.withOpacity(0.3)
                                              )
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("1 Day", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: libraPrimary),),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text("Used", style: TextStyle(fontSize: 12, color: libraBlue),),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text("£10,000", style: TextStyle(fontSize: 16, color: libraPrimary),),

                                                      ],
                                                    ),

                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text("Left", style: TextStyle(fontSize: 12, color: libraBlue),),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text("£10,000", style: TextStyle(fontSize: 16, color: libraPrimary),),

                                                      ],
                                                    ),

                                                  ],
                                                )

                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(15),
                                              border: Border.all(
                                                width: 1,
                                                color: libraPrimary.withOpacity(0.3)
                                              )
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("1 Month", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: libraPrimary),),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text("Used", style: TextStyle(fontSize: 12, color: libraBlue),),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text("£25,000", style: TextStyle(fontSize: 16, color: libraPrimary),),

                                                      ],
                                                    ),

                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text("Left", style: TextStyle(fontSize: 12, color: libraBlue),),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text("£25,000", style: TextStyle(fontSize: 16, color: libraPrimary),),

                                                      ],
                                                    ),

                                                  ],
                                                )

                                              ],
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(15),
                                              border: Border.all(
                                                width: 1,
                                                color: libraPrimary.withOpacity(0.3)
                                              )
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("3 Month", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: libraPrimary),),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text("Used", style: TextStyle(fontSize: 12, color: libraBlue),),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text("£25,000", style: TextStyle(fontSize: 16, color: libraPrimary),),

                                                      ],
                                                    ),

                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text("Left", style: TextStyle(fontSize: 12, color: libraBlue),),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text("£25,000", style: TextStyle(fontSize: 16, color: libraPrimary),),

                                                      ],
                                                    ),

                                                  ],
                                                )

                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(15),
                                              border: Border.all(
                                                width: 1,
                                                color: libraPrimary.withOpacity(0.3)
                                              )
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("6 Month", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: libraPrimary),),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text("Used", style: TextStyle(fontSize: 12, color: libraBlue),),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text("£50,000", style: TextStyle(fontSize: 16, color: libraPrimary),),

                                                      ],
                                                    ),

                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text("Left", style: TextStyle(fontSize: 12, color: libraBlue),),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text("£50,000", style: TextStyle(fontSize: 16, color: libraPrimary),),

                                                      ],
                                                    ),

                                                  ],
                                                )

                                              ],
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(15),
                                                border: Border.all(
                                                    width: 1,
                                                    color: libraPrimary.withOpacity(0.3)
                                                )
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("12 Month", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: libraPrimary),),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text("Used", style: TextStyle(fontSize: 12, color: libraBlue),),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text("£50,000", style: TextStyle(fontSize: 16, color: libraPrimary),),

                                                      ],
                                                    ),

                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text("Left", style: TextStyle(fontSize: 12, color: libraBlue),),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text("£50,000", style: TextStyle(fontSize: 16, color: libraPrimary),),

                                                      ],
                                                    ),

                                                  ],
                                                )

                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Expanded(
                                          child: Container(),
                                        ),

                                      ],
                                    ),
                                  ),

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
                                            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => SilverInformation()));

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
