import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:send_libra/Screens/BankDetails/payment_mode_form.dart';
import 'package:send_libra/constants.dart';

class AddCardPaymentMode extends StatefulWidget {
  const AddCardPaymentMode({Key? key}) : super(key: key);

  @override
  State<AddCardPaymentMode> createState() => _AddCardPaymentModeState();
}

class _AddCardPaymentModeState extends State<AddCardPaymentMode> {
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
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: (context) => AddCardPaymentModeForm(),
                              ));
                            },
                            child: Container(

                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Icon(Icons.credit_card, color: Colors.white, size: 31,),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Bank")
                        ],
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
