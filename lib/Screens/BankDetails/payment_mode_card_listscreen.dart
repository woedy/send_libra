import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:send_libra/constants.dart';

class PaymentModeCardList extends StatefulWidget {
  const PaymentModeCardList({Key? key}) : super(key: key);

  @override
  State<PaymentModeCardList> createState() => _PaymentModeCardListState();
}

class _PaymentModeCardListState extends State<PaymentModeCardList> {
  TextEditingController controller = TextEditingController(text: "");

  bool _isVerifying = true;
  bool _isVerified = false;
  bool hasError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(TextSpan(
                        text: "Pay",
                        style: TextStyle(
                          fontSize: 60,
                        ),
                      )),
                      SizedBox(
                        height: 30,
                      ),
                      Text.rich(TextSpan(
                        text: "Mode of payment",
                        style: TextStyle(
                          fontSize: 36,
                        ),
                      )),
                      SizedBox(
                        height: 30,
                      ),
                      Text.rich(TextSpan(
                        text: "Payment Method",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      )),
                      SizedBox(
                        height: 30,
                      ),

                      Container(
                        padding: EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Row(

                          children: [
                            Image(image: AssetImage("assets/icons/visa2.png")),
                            SizedBox(
                              width:20 ,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Barclays Debit Card", style: TextStyle(fontSize: 14, color: libraPrimary),),
                                SizedBox(
                                  height:5 ,
                                ),
                                Text(".... .... .... .... .... .... 2323", style: TextStyle(fontSize: 14, color: libraPrimary, fontWeight: FontWeight.bold),)
                              ],
                            ),
                            SizedBox(
                              width:30 ,
                            ),
                            Text("Change", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),)
                          ],
                        ),
                      )


                    ],
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
