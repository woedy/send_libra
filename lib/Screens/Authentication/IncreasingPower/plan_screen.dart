import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:send_libra/Screens/Authentication/IncreasingPower/2Stars/bronze_break_down.dart';
import 'package:send_libra/Screens/Authentication/IncreasingPower/3Stars/silver_break_down.dart';
import 'package:send_libra/Screens/Authentication/IncreasingPower/4Stars/silver_plus_break_down.dart';
import 'package:send_libra/constants.dart';


class IncreasingPowerPlanScreen extends StatefulWidget {
  const IncreasingPowerPlanScreen({Key? key}) : super(key: key);

  @override
  State<IncreasingPowerPlanScreen> createState() => _IncreasingPowerPlanScreenState();
}

class _IncreasingPowerPlanScreenState extends State<IncreasingPowerPlanScreen> {

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
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Sending power", style: TextStyle(fontSize: 32),),
                      SizedBox(
                        height: 10,
                      ),
                      Text.rich(TextSpan(
                        text: "Increase your sending limit you can only send ",
                        children: [
                          TextSpan(
                            text: "£1500",style: TextStyle(fontWeight: FontWeight.bold)
                          ),
                          TextSpan(
                              text: " a day")
                        ],
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      )),
                      SizedBox(
                        height: 30,
                      ),

                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    child: InkWell(
                                      onTap: (){

                                      },
                                      child: Container(
                                          padding: EdgeInsets.all(20),
                                          height: 150,
                                          width: 150,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(20)
                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Icon(Icons.star, color: Colors.yellow, size: 56,),
                                              Text("Basic", style: TextStyle(fontSize: 24, color: libraPrimary, fontWeight: FontWeight.w600),),

                                              Text("Current Plan", style: TextStyle(fontSize: 15, color: libraPrimary),),

                                            ],
                                          )
                                      ),
                                    )),

                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                    child: InkWell(
                                      onTap: (){
                                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => BronzePowerBreakdown()));

                                      },
                                      child: Container(
                                          padding: EdgeInsets.all(20),
                                          height: 150,
                                          width: 150,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(20)
                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Icon(Icons.star, color: Colors.yellow, size: 35,),
                                                  Icon(Icons.star, color: Colors.yellow, size: 35,),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text("Bronze", style: TextStyle(fontSize: 24, color: libraPrimary, fontWeight: FontWeight.w600),),

                                              Text("", style: TextStyle(fontSize: 15, color: libraPrimary),),

                                            ],
                                          )
                                      ),
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: InkWell(
                                      onTap: (){
                                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => SilverPowerBreakdown()));

                                      },
                                      child: Container(
                                          padding: EdgeInsets.all(20),
                                          height: 150,
                                          width: 150,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(20)
                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Icon(Icons.star, color: Colors.yellow, size: 35,),
                                                  Icon(Icons.star, color: Colors.yellow, size: 35,),
                                                  Icon(Icons.star, color: Colors.yellow, size: 35,),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text("Silver", style: TextStyle(fontSize: 24, color: libraPrimary, fontWeight: FontWeight.w600),),

                                              Text("", style: TextStyle(fontSize: 15, color: libraPrimary),),

                                            ],
                                          )
                                      ),
                                    )),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                    child: InkWell(
                                      onTap: (){
                                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => SilverPlusPowerBreakdown()));

                                      },
                                      child: Container(
                                          padding: EdgeInsets.all(20),
                                          height: 150,
                                          width: 150,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(20)
                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Icon(Icons.star, color: Colors.yellow, size: 27,),
                                                  Icon(Icons.star, color: Colors.yellow, size: 27,),
                                                  Icon(Icons.star, color: Colors.yellow, size: 27,),
                                                  Icon(Icons.star, color: Colors.yellow, size: 27,),

                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text("Silver+", style: TextStyle(fontSize: 24, color: libraPrimary, fontWeight: FontWeight.w600),),

                                              Text("", style: TextStyle(fontSize: 15, color: libraPrimary),),

                                            ],
                                          )
                                      ),
                                    )),



                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),


                SizedBox(
                  height: 100,
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
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Icon(Icons.arrow_forward, color: Colors.white,)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
