import 'package:flutter/material.dart';
import 'package:send_libra/Screens/SendMoney/SendNormal/BankTransfer/bank_transfer_screen.dart';
import 'package:send_libra/Screens/SendMoney/SendNormal/Card/credit_card_info_screen.dart';
import 'package:send_libra/constants.dart';

class SelectPaymentScreen extends StatefulWidget {
  final data;
  final beneficiary_id;
  final fname;
  final lname;
  final phone;
  final avatar;


  const SelectPaymentScreen({Key? key, required this.data,  required this.beneficiary_id, required this.fname, required this.lname, required this.phone, required this.avatar}) : super(key: key, );

  @override
  State<SelectPaymentScreen> createState() => _SelectPaymentScreenState();
}

class _SelectPaymentScreenState extends State<SelectPaymentScreen> {
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

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
                            text: "Select Payment",
                            style: TextStyle(fontSize: 60,  ),

                          )
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                    child: Column(
                      children: [
                        InkWell(
                          onTap: (){
                            widget.data["payment_method"] = 41;
                            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => CreditCardInfoScreen(
                              data: widget.data,
                              transaction_type: "Credit Card",
                              beneficiary_id: widget.beneficiary_id,
                              fname: widget.fname,
                              lname: widget.lname,
                              phone: widget.phone,
                              avatar: widget.avatar,
                            )));

                          },
                          child: Container(
                            margin: EdgeInsets.all(20),
                            padding: EdgeInsets.all(40),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: clay,
                              borderRadius: BorderRadius.circular(10)

                            ),
                            child: Column(
                              children: [
                                Image(
                                    image: AssetImage("assets/icons/cardcard2.png"),
                                  height: 34,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text("Pay with Credit Card", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),)
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                            onTap: (){
                              widget.data["payment_method"] = 11;


                              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => BankTransferScreen(
                                data: widget.data,
                                transaction_type: "Bank Transfer",
                                beneficiary_id: widget.beneficiary_id,
                                fname: widget.fname,
                                lname: widget.lname,
                                phone: widget.phone,
                                avatar: widget.avatar,
                              )));

                            },
                          child: Container(
                            margin: EdgeInsets.all(20),
                            padding: EdgeInsets.all(40),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: clay.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(10)

                            ),
                            child: Column(
                              children: [
                                Image(
                                    image: AssetImage("assets/icons/banktrans.png"),
                                  height: 34,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text("Pay By Bank Transfer", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),)
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                )



              ],
            ),
          ),
        ),
      ),
    );
  }
}
