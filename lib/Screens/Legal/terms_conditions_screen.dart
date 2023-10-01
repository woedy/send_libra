import 'package:flutter/material.dart';
import 'package:send_libra/constants.dart';

class TermsAndConditionsScreen extends StatefulWidget {
  const TermsAndConditionsScreen({Key? key}) : super(key: key);

  @override
  State<TermsAndConditionsScreen> createState() => _TermsAndConditionsScreenState();
}

class _TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(


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
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Text.rich(
                          TextSpan(
                            text: "Terms & Conditions",
                            style: TextStyle(fontSize: 60,  ),

                          )
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("1. OVERVIEW", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("1.1.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("These terms and conditions (“Terms and Conditions”) govern the terms under which you may access and use the website (and for these Terms and Conditions “website” will include the Libra App (where applicable) and the services associated with it (together, the “Service”). By accessing, registering with and using the Service, you agree to be bound by the terms of this Terms and Conditions. If you do not wish to be bound by the Terms and Conditions, do not access, register with or use the Service. The language of these Terms and Conditions is English and all Services, instructions and transactions carried out in connection with it shall be in English.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("1.2.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("In these Terms and Conditions, the terms 'LIBRA Money Transfer', 'we', 'us', and 'our' refer to FORTUNE PORTFOLIO Limited trading as LIBRA Money Transfer, together with its employees, directors, affiliates, successors, and assigns. FORTUNE PORTFOLIO Limited is a company registered number 732984 in England and Wales, with its registered office at 8-11 St John’s Lane, London EC1M 4BF, United Kingdom. It is granted registration to carry on payment services activities as a Payment Institution under the Payment Services Regulations 2009 (PSRs). Registration number: 9080906.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("1.3.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("The terms 'you' and 'your' refer to users of the Service, whether in their capacity as Senders, Recipients, or visitors to this website", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("1.4.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("These Terms and Conditions are effective from the date on which you first access, register or use the Service. The Terms and Conditions may change from time to time, but changes will only be effective 2 months from the date they are first notified to you and will not change the terms on which you previously used the Service.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("1.5.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("The Service was created to assist customers to send money to their family and friends, and to receive money from family and friends, around the world. For security reasons, we recommend that you only send money through the Service to people you know personally. You must not use the Service to send money to strangers for example sellers of goods and/or services, private or retail.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),


                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("2. DEFINITIONS", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),),
                      SizedBox(
                        height: 20,
                      ),
                      Text("In this Terms and Conditions:", style: TextStyle(fontSize: 17, ),),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('"App"', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                height: 10,
                              ),
                              Text("means LIBRA Money Transfer’s mobile application for the sending of Payment Requests and/or transaction requests.", style: TextStyle(fontSize: 17,),),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('"Business Day"', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                height: 10,
                              ),
                              Text("means any day on which we are open for business for the execution of Transaction requests and/or payment requests.", style: TextStyle(fontSize: 17,),),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('"Destination Country"', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                height: 10,
                              ),
                              Text("means the country in which the Recipient receives money through the Service.", style: TextStyle(fontSize: 17,),),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('"Instruction"', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                height: 10,
                              ),
                              Text("means a payment request and/or a transaction request", style: TextStyle(fontSize: 17,),),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('"Local Taxes"', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                height: 10,
                              ),
                              Text("means any taxes or charges payable in the Destination Country.", style: TextStyle(fontSize: 17,),),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('"Payee"', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                height: 10,
                              ),
                              Text("means someone who receives money through the service.", style: TextStyle(fontSize: 17,),),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('"Payment Instrument"', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                height: 10,
                              ),
                              Text("means a valid instrument of payment such as a bank account, debit card or credit card.", style: TextStyle(fontSize: 17,),),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('"Payment Request"', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                height: 10,
                              ),
                              Text("means a specific instruction from you to a Sender requesting a Transaction.", style: TextStyle(fontSize: 17,),),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('"Payout Amount"', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                height: 10,
                              ),
                              Text("means the amount paid out, after any foreign exchange conversion, to the Payee’s account exclusive of the Service Fee.", style: TextStyle(fontSize: 17,),),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('"Prohibited"', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                height: 10,
                              ),
                              Text("means activities which involve narcotics, steroids, pharmaceuticals, chemicals, drug paraphernalia, tobacco, seeds, plants, animals, military or semi-military goods or services, weapons (including dual-use goods), adult services or content, gambling services or any other activities that are prohibited by LIBRA Money Transfer’s policies as amended from time to time.", style: TextStyle(fontSize: 17,),),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('"Recipient"', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                height: 10,
                              ),
                              Text("means someone who receives money through the Service.", style: TextStyle(fontSize: 17,),),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('"Sender"', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                height: 10,
                              ),
                              Text("means someone who uses the Service to send money.", style: TextStyle(fontSize: 17,),),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('"Service Fee"', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                height: 10,
                              ),
                              Text("means the fee plus any additional charges applicable to each Transaction.", style: TextStyle(fontSize: 17,),),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('"Service Provider"', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                height: 10,
                              ),
                              Text("means a local bank, money exchange house, or other third-party service providers in the Destination Country with whom LIBRA Money Transfer works in providing the Service.", style: TextStyle(fontSize: 17,),),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('"Transaction"', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                height: 10,
                              ),
                              Text("means a specific instruction to send money through the Service.", style: TextStyle(fontSize: 17,),),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('"Transaction Amount"', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                height: 10,
                              ),
                              Text("means the amount of money that the Sender wishes to send to the Recipient, excluding any applicable fees and prior to any foreign exchange conversion.", style: TextStyle(fontSize: 17,),),
                            ],
                          ),
                        ],
                      ),

                    ],
                  ),
                ),


                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("3. OUR OBLIGATIONS", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("3.1.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("Subject to these Terms and Conditions, we agree to provide the Service to you using reasonable care. The Service may not be available in whole or in part in certain regions, countries, or jurisdictions.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("3.2.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("We are not obliged to process any particular Transaction. When you submit a Transaction Request, you are requesting that we process the Transaction on your behalf and consenting to the execution of the Transaction. We may, in our sole discretion, choose whether to accept the offer to process that Transaction. If we decide not to process the Transaction, we will notify you promptly of that decision and repay to you the Transaction Amount received by us, provided that we are not prohibited by law from doing so. If we choose to proceed with the Transaction we may still suspend or cancel it in our discretion.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("3.3.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("LIBRA Money Transfer reserves the right to modify or discontinue the service or any part of the Service without notice, at any time and from time to time. We may, in our absolute discretion, refuse any Transaction or limit the amount to be transferred, either on a per transaction basis or on an aggregate basis, and either on individual accounts or on related accounts.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("3.4.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("We may, in our sole discretion, refuse Transactions from certain Senders or to certain Recipients, including but not limited to entities and individuals on restricted or prohibited lists issued from time to time by the UK Government and the European Union. In addition, not all Payment Instruments are available to all customers at all times and we may, in our sole discretion, refuse Transactions funded from certain Payment Instruments.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("3.5.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("Delivery times quoted on our service levels or elsewhere on our website are representative for the “normal” / average service and are not a guarantee of an individual Service or Transaction time.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("3.6.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("We will attempt to process Transactions promptly, but any Transaction may be delayed or cancelled for a number of reasons including but not limited to: our efforts to verify your identity; to validate your Transaction instructions; to contact you; or otherwise, to comply with applicable law; or due to variations in business hours and currency availability.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("3.7.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("We will attempt to provide Senders and Recipients with up-to-date information regarding the location and opening hours of our Service Providers by means of information on our website. However, you agree that LIBRA Money Transfer shall not be held responsible for any inaccuracies that may appear in that information or any consequential loss which may result from incorrect or incomplete information.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("3.8.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("We may send and receive notifications in relation to Transactions by email and SMS. We will provide you with information after receipt of a Transaction Request enabling you to identify the Transaction, along with details of the amount of the Transaction in the currency used in the Transaction Request, our Service Fee, exchange rate and the date on which the Transaction Request was received.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("3.9.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("For the purpose of the Payment Services Regulations 2017, the following fields either in totality or a subset thereof can be unique identifiers:", style: TextStyle(fontSize: 17,),),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Bank Transfers", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800),),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text("Bank Name\nBranch Name\nAccount Number\nBank Code\nIBAN\nBIC (or SWIFT)\nAccount Type", style: TextStyle(fontSize: 17,),),
                                          SizedBox(
                                            height: 30,
                                          )
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Cash Pick Up", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800),),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text("Payee Full Name", style: TextStyle(fontSize: 17,),),
                                          SizedBox(
                                            height: 30,
                                          )
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Mobile Wallet", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800),),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text("Mobile Wallet Account Number\nMobile Network\nMobile Wallet Name", style: TextStyle(fontSize: 17,),),
                                          SizedBox(
                                            height: 30,
                                          )
                                        ],
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("3.10", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("In the event you have provided us with an incorrect unique identifier in respect of a Transaction which falls under the Payment Services Regulations 2017 and your Transaction has been misdirected, you may make a written request for the full details of the Payee by contacting us using one of the channels listed at the end of these Terms and Conditions and we will provide you with such details to the extent required and permitted by law.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("3.11", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("Mobile Top Up/money – A number of countries around the world have chosen to apply local taxes to incoming Airtime Top Ups and mobile wallets. When sending to a Recipient in these countries the corresponding deduction will be made from the Transaction Amount. Meaning the Recipient will get a lower amount of Airtime Top Up/Mobile Money.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),

                    ],
                  ),
                ),



                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("4. YOUR OBLIGATIONS", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),),
                      SizedBox(
                        height: 20,
                      ),
                      Text("You agree that:", style: TextStyle(fontSize: 17, ),),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("4.1.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("You will not access, use or attempt to use the Service as a Sender unless you are at least 18 years old, and that you have the legal capacity to form a binding legal contract in the relevant jurisdiction;", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("4.2.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("for each Transaction that you submit, you will pay us the Service Fee in addition to the Transaction Amount. Payment becomes due at the time that you submit your Transaction. If you submit a Transaction that results in LIBRA Money Transfer becoming liable for charges including but not limited to chargeback or other fees, you agree to reimburse us for all such fees;", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("4.3.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("In connection with your registration and use of the Service, you will:", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("4.3.1", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("Provide us with true, accurate, current and complete evidence of your identity, and promptly update your personal information if and when it changes;", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("4.3.2", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("Provide our merchant with details of one or more Payment Instruments; and", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("4.3.3", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("Provide us with true, accurate, current and complete information for all Transactions.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("We do not accept any liability for damages resulting from non-payment or delay in payment of a money transfer to a Recipient or failure to perform a transaction under the Service by reason of any of these matters.",style: TextStyle(fontSize: 17, ),),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("4.4.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("When you pay for a Transaction in one currency and the Recipient is paid in another currency, there will be a difference between the exchange rate at which we buy foreign currency and the exchange rate provided to you. LIBRA Money Transfer and its Service Providers usually make a small profit in these circumstances. If such account is denominated in another currency the amount to be received by the Recipient will be reduced by the amount of extra charges incurred by reason of the incorrect information given by you and we will have no obligation to make good such reduction;", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("4.5.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("When you are sending money under these Terms and Conditions, it is your responsibility to make sure all the Transaction details are accurate before submission. Once a Transaction has been submitted for processing it is not normally possible to change any of its details. You will be given the opportunity to confirm Transactions before submission and you must check the details carefully.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("4.6.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("LIBRA Money Transfer will have no responsibility for any fees or charges you may incur by the use of a particular Payment Instrument to fund a Transaction. These may include but are not limited to unauthorised overdraft fees imposed by banks if there are insufficient funds in your bank account or 'cash advance' fees and additional interest which may be imposed by credit card providers if they treat use of the Service as a cash transaction rather than a purchase transaction;", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("4.7.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("You will only use the Service to send money to people that you know personally and not to pay for goods or services. If, in breach of this clause, you choose to pay third parties for goods and services using the Service, you acknowledge that LIBRA Money Transfer has no control over, and is not responsible for, the quality, safety, legality, or delivery of such goods or services and that any such use of the Service is entirely at your own risk. If LIBRA Money Transfer reasonably believes you are using the Service to purchase goods or services, we reserve the right to cancel your Transaction(s);", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("4.8.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("Both you and the Recipients will only act on your own behalf. You may not submit or receive a Transaction on behalf of a third person. If you intend to submit or receive a Transaction on behalf of a company, business or any entity other than a human individual, you must first inform LIBRA Money Transfer of your desire to do so and provide us with any additional information about the entity we may request in order that we may decide whether to permit the Transaction;", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("4.9.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("In using the Service you will comply with these Terms and Conditions as well as any applicable laws, rules or regulations. It is a breach of these Terms and Conditions to use the Service to send money (a) to a Recipient who has violated the Terms and Conditions, or (b) in connection with illegal activity including without limitation money laundering, fraud and the funding of terrorist organisations. If you use the Service in connection with illegal activity, LIBRA Money Transfer may report you to the appropriate legal authorities;", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("4.10", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("When using our website or the Service or when interacting with LIBRA Money Transfer, with another user or with a third party, you will not: breach this Terms and Conditions, or any other agreement between you and LIBRA Money Transfer; open more than one account, without our prior written permission; provide false, inaccurate, or misleading information; allow anyone else access to your registration details, and will keep those details secure; refuse to provide confirmation of any information you provide to us, including proof of identity, or refuse to cooperate in any investigation; use an anonymising proxy (a tool that attempts to make activity untraceable); or copy or monitor our website using any robot, spider, or other automatic device or manual process, without our prior written permission.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("4.11", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("LIBRA Money Transfer may, as necessary in providing the Service, store all information required of a Recipient to prove his or her identity or associated with their specific Transaction. Such proofs may include a suitable form of valid, unexpired identification from a list of acceptable papers provided by the Service Provider, and/or a Transaction tracking number, a personal identification number (PIN), a 'password', a 'secret word', or other similar identifiers.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),

                    ],
                  ),
                ),



                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("5. REFUSAL, SUSPENSION AND CANCELLATION", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),),

                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("5.1.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("We may refuse any Transaction Request, Payment Request or Transaction at any time for any reason (or cancel it where relevant). Notwithstanding this, we set out here some examples of when that may occur.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("5.1.1", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("We may, in our absolute discretion, refuse or cancel Transaction Requests or Transactions where we believe that the Service is being used, whether by you or the Recipient, in furtherance of illegal, fraudulent or Prohibited activities.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("5.1.2", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("We may, in our absolute discretion, refuse or cancel Transaction Requests or Transactions from certain Senders or to certain Payees, including but not limited to entities and individuals on restricted or prohibited lists issued from time to time by any government authorities, if we are required to do so by law, or where we have reason to believe processing the Transaction Requests would violate anti- money laundering or counter-terrorism financing laws and regulations. We may refuse to process a Transaction funded from certain Payment Instruments where we have reason to believe the security of the Payment Instrument has been compromised or where we suspect the unauthorised or fraudulent use of the Payment Instrument.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("5.1.3", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("We may, in our absolute discretion, refuse or cancel Transaction Requests or Transactions if LIBRA Money Transfer believes you are using the Service to purchase goods or services from third parties you do not know or trust.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("5.1.4", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Column(
                                    children: [
                                      Text("We may, in our absolute discretion, refuse or cancel Transaction Requests, Payment Requests or Transactions if:", style: TextStyle(fontSize: 17,),),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text("a. LIBRA Money Transfer is unable to verify your identity;", style: TextStyle(fontSize: 17,),),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text("b. You do not comply with information requests pursuant to clause 5.4; or", style: TextStyle(fontSize: 17,),),
                                     SizedBox(
                                        height: 20,
                                      ),
                                      Text("c. LIBRA Money Transfer reasonably believes you are using the Service, or allowing it to be used, in breach of these Terms and Conditions or any applicable laws, rules or regulations.", style: TextStyle(fontSize: 17,),),
                                    ],
                                  )),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("5.2.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("Where LIBRA Money Transfer has refused or cancelled a Transaction Request, Transaction or Payment Request, LIBRA Money Transfer may also, at its discretion, temporarily or permanently suspend your Registration", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("5.3.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("Where LIBRA Money Transfer temporarily or permanently suspends your Registration, or refuses or cancels a Transaction Request, Payment Requestor a Transaction in accordance with this clause 5, LIBRA Money Transfer shall be entitled to retain any Service Fees already incurred.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("5.4.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("In order to comply with our obligations under relevant laws, we reserve the right to ask for further information or evidence relating to the purpose of a Transaction.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),

                    ],
                  ),
                ),


                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("6. YOUR RIGHT TO CANCELLATION AND REFUNDS", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),),

                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("6.1.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("To the extent permitted by law, once we have received your Instruction, you do not have the automatic right to revoke it.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("6.2.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("Notwithstanding clause 6.1 above, LIBRA Money Transfer may, in its absolute discretion, or shall if required by law, attempt to cancel or recall your Instruction if you have informed us that you wish to revoke it. In some cases, LIBRA Money Transfer may have initiated an irreversible request for funds to be paid out to your Payee by a Service Provider and therefore cannot guarantee cancellation will be successful. For successful revocations LIBRA Money Transfer will normally refund your money, less any reasonable revocation, recall or tracing charges and any Service Fees already charged, within four(4) Business Days.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("6.3.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Column(
                                    children: [
                                      Text("If you have any problems using the Service; or you are aware of any unauthorised or incorrectly executed Transactions:", style: TextStyle(fontSize: 17,),),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text("You should contact us through the channels listed at the end of these Terms and Conditions without delay and in any event no later than 13 months after the date the Transaction Amount was debited, upon becoming aware of the unauthorised or incorrectly executed Transaction. A request for a refund must be submitted in writing (including by email) to one of the contact points listed at the bottom of these Terms and Conditions, giving the Sender’s full name, address, and phone number, together with the Transaction tracking number, Transaction Amount, and the reason for your refund request.", style: TextStyle(fontSize: 17,),),
                                    ],
                                  )),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("6.4.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("If we have executed the Transaction in accordance with the instructions you have provided to us, and that information proves to have been incorrect, we are not liable for the incorrect execution of the Transaction. We will however make reasonable efforts to recover the funds. We may charge you a reasonable fee, reflective of our efforts, to do so.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("6.5.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("Where LIBRA Money Transfer has executed the Transaction otherwise than in accordance with your Instruction, subject to clause 11.2, LIBRA Money Transfer will refund the full amount debited. Unless there are exceptional circumstances, no adjustment will be made for any currency fluctuations which may have occurred between the time you paid us the Transaction Amount and the time of credit.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("6.6.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("Any refunds will be credited back to the same Payment Instrument used to fund the Transaction and in the same currency used to fund the transaction. If required to process your refund, we may request additional details from you at the relevant time.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("6.7.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("Refund claims due to refusal or inability to provide additional information, requiring you to take steps to confirm ownership of your Payment Instruments or email address; or by verifying your information against third party databases; or through other sources will be subject to a cancellation charge as may be determined by the Company.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),

                    ],
                  ),
                ),

                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("7. PAYMENT REQUEST", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),),

                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("7.1.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("You agree that you will not send Payment Requests to strangers i.e. people you do not know personally.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("7.2.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("You acknowledge that the Service may not be available, in whole or in part, in certain regions, countries, or jurisdictions.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("7.3.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("We are not obliged to process any Payment Request. When you submit a Payment Request, you are requesting that we process the Payment Request on your behalf. and consenting to us contacting the Recipient if we need to for these purposes. An SMS text message will be sent to the Sender that can be forwarded to the recipient at the sender’s discretion. We may, in our sole discretion, choose whether to process that Payment Request, or impose limits on Payment Requests. In particular, we may, in our absolute discretion, refuse Payment Requests and/or suspend or cancel your account with us where (i) you are in breach of clause 4, (ii) we believe that the Service is being used, whether by you, the Sender or the Recipient in furtherance of illegal, fraudulent or Prohibited activities, or (iii) we are required to do so by law (including applicable anti-money laundering and counter-terrorism legislation) or (iv) we are unable to verify either your identity or that of the Recipient,(vi) the payer is unavailable to make payment to the beneficiary(vii)The above list is not exhaustive. However, LIBRA Money Transfer will generally inform you before or immediately after the rejection, suspension, cancellation ,refund of your payment instruction, and/or use of the services, and will provide our reasons for doing so. However, we will not provide reasons or any information if doing so would violate the law or compromise our security measures.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("7.4.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("All Transactions that result from a Payment Request will be handled in accordance with these Terms and Conditions, which the Sender will need to accept prior to any Transaction proceeding.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("7.5.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("Cancellation of Payment Requests. Once we have received your Payment Request, you may not cancel it. In such circumstances you would need to contact the Sender separately and explain that you require the Payment Request to be treated as cancelled. Please therefore ensure that your Payment Requests are legitimate, accurate and complete.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("7.6.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("Cancellation of Transactions. The cancellation of Transactions shall be governed by and dealt in accordance with these Terms and Conditions. You shall assist and co-operate with us in relation to all cancellation requests we receive from Senders after a Transaction has been initiated following your Payment Request. You shall, upon request from us, promptly refund to us or a third party of our choice (including the Sender) all monies you receive from Transactions where we reasonably believe that such Transactions have resulted from your use of the Services in contravention of these Terms and Conditions.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),


                    ],
                  ),
                ),



                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("8. COLLECTION OF INFORMATION", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),),

                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("8.1.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("Customer Identification Program. UK law and all European countries require all financial institutions to assist in the fight against money laundering activities and the funding of terrorism by obtaining, verifying, and recording identifying information about all customers. We may therefore require you to supply us with personal identifying information and we may also legally consult other sources to obtain information about you.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("8.2.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("Verification and Checks. We will verify your residential address and personal details in order to confirm your identity. We may also pass your personal information to a credit reference agency, which may keep a record of that information. You can be rest assured that this is done only to confirm your identity, that a credit check is not performed and that your credit rating will be unaffected. All information provided by you will be treated securely and strictly in accordance with the Data Protection Act 1998.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("8.3.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("By accepting these Terms and Conditions you authorise us to make any inquiries we consider necessary to validate the information that you provide to us. We may do this directly, for example by asking you for additional information, requiring you to take steps to confirm ownership of your Payment Instruments or email address; or by verifying your information against third party databases; or through other sources.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("8.4.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("Data Privacy Policy. You consent to our processing your personal information for the purposes of providing the Service, including for verification purposes as set out in this clause. You also consent to the use of such data for communicating with you, and for statutory, accounting and archival purposes. You acknowledge that you have read and consented to LIBRA Money Transfer's Data Privacy Policy.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("8.5.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("Government Disclosures. We may be required by law to provide information about you and your Transactions to government or other competent authorities as described in our Data Privacy Policy. You acknowledge and consent to our doing this.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),



                    ],
                  ),
                ),



                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("9. INTELLECTUAL PROPERTY", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),),

                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("9.1.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("The LIBRA Money Transfer website and the LIBRA Money Transfer Service, the content, and all intellectual property relating to them and contained in them (including but not limited to copyrights, patents, database rights, trademarks and service marks) are owned by us, our affiliates, or third parties. All right, title and interest in and to the LIBRA Money Transfer Online Site and the LIBRA Money Transfer Online Service shall remain our property and/or the property of such other third parties.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("9.2.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("The LIBRA Money Transfer website and the LIBRA Money Transfer Service may be used only for the purposes permitted by these Terms and Conditions or described on this website. You are authorised solely to view and to retain a copy of the pages of the LIBRA Money Transfer website for your own personal use. You may not duplicate, publish, modify, create derivative works from, participate in the transfer or sale of, post on the internet, or in any way distribute or exploit the LIBRA Money Transfer website, the LIBRA Money Transfer Service or any portion thereof for any public or commercial use without our express written permission. You may not: (a) use any robot, spider, scraper or other automated device to access the LIBRA Money Transfer website or the LIBRA Money Transfer Service; and/or (b) remove or alter any copyright, trademark or other proprietary notice or legend displayed on the LIBRA Money Transfer website (or printed pages of the website). The name LIBRA Money Transfer and other names and indicia of ownership of LIBRA Money Transfer's products and/or services referred to on the LIBRA Money Transfer website are our exclusive marks or the exclusive marks of other third parties. Other product, service and company names appearing on the website may be trademarks of their respective owners.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),




                    ],
                  ),
                ),




                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("10. WARRANTIES AND LIABILITY", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),),

                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("10.1.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("We will refund to you any benefit which we receive as a result of any breach of our agreement with you (this means that, for example, where a money transfer has failed in such circumstances we will refund to you the Transaction Amount and the Service Fee).", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("10.2.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("If a money transfer is delayed or fails, you may have a right to receive a refund or compensation under laws relating to the provision of international money transfer services. We will provide you with the details of your rights to a refund or compensation if you contact us using the contact details at the end of this agreement.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("10.3.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("Any claim for compensation made by you and/or a Recipient (who is not registered with us) must be supported by any available relevant documentation.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("10.4.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("If any loss which you or a Recipient (who is not registered with us) suffers is not covered by a right to payment under the laws referred to in clause 8.2, we will only accept liability for that loss up to a limit which is the greater of: (a) the amount of any service charge; and (b) £200, unless otherwise agreed by us in writing. Our cap on our liability only limits a claim for loss arising out of any single transaction or related transactions, or (if a loss does not arise out of a transaction or transactions) any single act, omission or event or related acts, omissions or events. This means that if, for example, you suffer loss by reason of our failure to perform our agreement with you under two unrelated transactions, you might be able to claim up to £500.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("10.5.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("If any loss which you or a Recipient (who is not registered with us) suffers is not covered by a right to payment under the laws referred to in clause 8.2, we will only accept liability for that loss up to a limit which is the greater of: (a) the amount of any service charge; and (b) £200, unless otherwise agreed by us in writing. Our cap on our liability only limits a claim for loss arising out of any single transaction or related transactions, or (if a loss does not arise out of a transaction or transactions) any single act, omission or event or related acts, omissions or events. This means that if, for example, you suffer loss by reason of our failure to perform our agreement with you under two unrelated transactions, you might be able to claim up to £500.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("10.6.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("We do not, in any event, accept responsibility for: any failure to perform your instructions as a result of circumstances which could reasonably be considered to be outside our control; malfunctions in communications facilities which cannot reasonably be considered to be under our control and that may affect the accuracy or timeliness of messages you send to us; any losses or delays in transmission of messages arising out of the use of any internet service provider or caused by any browser or other software which is not under our control; errors on the website or with the Service caused by incomplete or incorrect information provided to us by you or a third party.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("10.7.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("Nothing in this clause 8 shall (a) exclude or limit liability on our part for death or personal injury resulting from our negligence; or (b) exclude liability for our fraud.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("10.8.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("Where you are sending a money transfer to a Recipient who is not registered with us, you agree to accept the provisions of this clause 11 not only for yourself, but also on behalf of the Recipient.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("10.9.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("Your relationship is with LIBRA Money Transfer only. You agree that no affiliate or agent of LIBRA Money Transfer owes you any duty of care when performing a task which would otherwise have to be performed by LIBRA Money Transfer under its agreement with you.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("10.10", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("You agree to indemnify and hold harmless LIBRA Money Transfer, our subsidiaries, affiliates, officers, directors, employees, agents, independent contractors, advertisers, partners, and cobranders from all loss, damage, claims, actions or demands, including reasonable legal fees, arising out of your use or misuse of this website or Service, all activities that occur under your password or account email login, your violation of this Terms and Conditions or any other violation of the rights of another person or party.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),




                    ],
                  ),
                ),


                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("11. USE OF THE LIBRA MONEY TRANSFER APP", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),),

                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("11.1.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("In consideration of you agreeing to abide by these Terms and Conditions, we grant you a non- transferable, non-exclusive licence to use the App, subject to these Terms and Conditions, our Privacy Policy and the applicable app-store terms (incorporated into these Terms and Conditions by reference) as may be amended from time to time. We reserve all other rights.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("11.2.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("Except as expressly set out in these Terms and Conditions or as permitted by any local law, you agree:", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("11.2.1", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("not to copy the App (except where such copying is incidental to normal use of the App, or where it is necessary for back-up or operational security); and", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("11.2.2", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("not to rent, lease, sub-license, loan, alter, translate, merge, adapt, vary or modify the App.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("11.3", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("You acknowledge that the App has not been developed to meet your individual requirements, and that it is therefore your responsibility to ensure that the facilities and functions of the App meet your requirements.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("11.4", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("We only supply the App for domestic and private use. You agree not to use the App for any commercial, business or resale purposes, and we have no liability to you for any loss of profit, loss of business, business interruption, or loss of business opportunity. Specifically (but without limitation), we do not accept any liability for loss or damages to you or any third party resulting from any delay in us processing an Instruction or refusal by us to execute a Transaction pursuant to these Terms and Conditions.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("11.5", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("The App is provided to you free of charge and as a result no representations, conditions, warranties or other terms of any kind are given in respect of the App, and all statutory warranties and conditions are excluded to the fullest extent possible under applicable law.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("11.6", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("In relation to your use of the App, we do not, in any event, to the extent permitted by law, accept responsibility for:", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("11.6.1", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("any failure to perform the Services, or any losses or delays in the transmission of messages, due to circumstances outside our control or due to our obligations under any applicable laws, rules or regulations;", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("11.6.2", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("malfunctions in communications facilities which cannot reasonably be under our control and that may affect the accuracy or timeliness of messages we send to one another;", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("11.6.3", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("errors in the App or with the Service caused by incomplete or incorrect information provided to us by you or a third party; or", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("11.6.4", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("any loss or damage you suffered by you as a result of you using our App on a ‘jailbroken’, ‘rooted’ or otherwise modified device.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),




                    ],
                  ),
                ),




                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("12. ELECTRONIC COMMUNICATIONS", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),),

                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("12.1.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("You acknowledge that this Terms and Conditions shall be entered into electronically, and that the following categories of information ('Communications') may be provided by electronic means: This Terms and Conditions and any amendments, modifications or supplements to it. Your records of transactions through the Service. Any initial, periodic or other disclosures or notices provided in connection with the Service, including without limitation those required by law. Any customer service communications, including without limitation communications with respect to claims of error or unauthorised use of the Service. Any other communication related to the Service or LIBRA Money Transfer.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("12.2.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("The Service does not allow for Communications to be provided in paper format or through other non- electronic means. You may withdraw your consent to receive Communications electronically, but if you do, your use of the Service shall be terminated. In order to withdraw your consent, you must contact us using our contact information at the end of this Terms and Conditions.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("12.3.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("In order to access and retain Communications, you must have or have access to the following: An Internet browser that supports 128bit encryption, such as Internet Explorer version 4.0 or above; An email account and email software capable of interfacing with LIBRA Money Transfer's email servers; A personal computer, operating system and telecommunications connections to the Internet capable of supporting the foregoing; Sufficient electronic storage capacity on your computer's hard drive or other data storage unit; and A printer that is capable of printing from your browser and email software. In addition, you must promptly update us with any change in your email address by updating your profile at www.sendlibra.com.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),




                    ],
                  ),
                ),


                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("13. TERMINATION", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),),

                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("13.1.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("Either party may terminate this Terms and Conditions on one day's written notice.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("13.2.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("We may terminate this Terms and Conditions with immediate effect if you: become, or are likely to become, insolvent or are declared bankrupt; are in breach of any provision of this Terms and Conditions; your use of the Service or the website is disruptive to our other customers, or you do anything which in our opinion is likely to bring us into disrepute; breaches or attempts to breach the security of the website (including but not limited to: modifying or attempting to modify any information; unauthorised logins, unauthorised data access or deletion; interfering with the service, system, host or network; reverse engineering of any kind; spamming; hacking; falsifying data; introducing viruses, Trojan horses, worms or other destructive or damaging programs or engines; or testing security in any way);", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),




                    ],
                  ),
                ),



                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("14. COMPLAINTS", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),),

                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("14.1.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("If you wish to make a complaint about any aspect of the LIBRA Money Transfer service, please send your complaint in writing to the address shown on the Contact Us page or by email to info@sendlibra.com.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("14.2.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("We will acknowledge receipt of your complaint within 2 business days. We will investigate your complaint and come back to you with the results of our investigation no later than 7 business days of receipt of your complaint. If you are not satisfied with the manner in which we have dealt with your complaint, or the outcome, then you may refer the matter to the Financial Ombudsman Service, South Quay Plaza, 183 Marsh Wall, London E14 9SR, Tel No 0800 0234 567, Email:complaint.info@financial-ombudsman.org.uk", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),




                    ],
                  ),
                ),

                
                
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("15. GENERAL", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),),

                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("15.1.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("Governing law: this Agreement will be governed by English law and the parties submit to the exclusive jurisdiction of the English Courts.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("15.2.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("No Waiver: The failure of LIBRA Money Transfer to exercise or enforce any right or provision of the Terms and Conditions shall not constitute a waiver of such right or provision.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("15.3.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("Modification: We may modify this Terms and Conditions from time to time without notice to you, except as may be required by law. You can review the most current version of the Terms and Conditions at any time by reviewing this website. You may terminate your use of the Service if you do not agree with any modification or amendment. If you use the Service after the effective date of an amendment or modification, you shall be deemed to have accepted that amendment or modification. You agree that you shall not modify this Terms and Conditions and acknowledge that any attempts by you to modify this Terms and Conditions shall be void.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("15.4.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("Entire Agreement: This agreement constitutes the entire agreement between the parties and supersedes all prior understandings or agreements relating to the subject matter of this agreement.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("15.5.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("Severability: If any provision of the Terms and Conditions is found by an arbitrator or court of competent jurisdiction to be invalid, the parties nevertheless agree that the arbitrator or court should endeavour to give appropriately valid effect to the intention of the Terms and Conditions as reflected in the provision, and the other provisions of the Terms and Conditions shall remain in full force and effect.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("15.5.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text("Any external links to third-party websites on the website are provided as a convenience to you. These sites are not controlled by us in any way and we are not responsible for the accuracy, completeness, legality or any other aspect of these other sites including any content provided on them. You access such websites at your own risk.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),



                    ],
                  ),
                ),

                
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Security", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),),

                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: Text("We take security very seriously at LIBRA Money Transfer, and we work hard, using state-of-the-art security measures, to make sure that your information remains secure. The LIBRA Money Transfer Service is a safe and convenient way to send money to friends and family and to other people that you trust. However, we do advise you to consider very carefully before sending money to anyone that you do not know well. In particular, you should be very cautious of deals or offers that seem too good to be true as they may be scams. If you are aware of anyone or any entity that is using the Service inappropriately, please email us using our contact form. Similarly, if you receive any emails, purporting to be from LIBRA Money Transfer, which you suspect may be 'phishing' (fake) emails, please forward them to us.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),



                    ],
                  ),
                ),


                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Contact Information", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),),

                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: Text("Questions, notices, and requests for refunds or further information should be sent to LIBRA Money Transfer, as follows:", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: Text("By telephone at +44 7384 317833", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: Text("By email at info@sendlibra.com", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: Text("By mail at: Fortune Portfolio Ltd, 8-11 St John’s Lane, London EC1M 4BF, United Kingdom", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),



                    ],
                  ),
                ),

                SizedBox(
                  height: 50,
                ),






              ],
            ),
          ),
        ),
      ),
    );
  }
}
