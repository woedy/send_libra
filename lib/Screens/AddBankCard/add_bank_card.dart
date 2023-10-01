import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:send_libra/Screens/AddBankCard/add_card_form.dart';
import 'package:send_libra/constants.dart';

class AddBankCardScreen extends StatefulWidget {
  const AddBankCardScreen({Key? key}) : super(key: key);

  @override
  State<AddBankCardScreen> createState() => _AddBankCardScreenState();
}

class _AddBankCardScreenState extends State<AddBankCardScreen> {

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Text.rich(
                          TextSpan(
                            text: "Add Bank\ncard",
                            style: TextStyle(fontSize: 60,  ),

                          )
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Select your card", style: TextStyle(fontSize: 36),),



                        ],
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),

                    Center(
                      child: Column(
                        children: [
                          Image(image: AssetImage("assets/icons/cardcard.png")),
                          SizedBox(
                            height: 30,
                          ),

                          Text("You have no cards saved up")
                        ],
                      ),
                    )




                  ],
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

                              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => AddBankCardForm()));

                            },
                            child: Align(
                              child: Container(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text("Add new card", style: TextStyle(fontSize: 15, color: Colors.white),),

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
