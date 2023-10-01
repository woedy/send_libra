import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:send_libra/Screens/Authentication/SignIn/sign_in_screen.dart';
import 'package:send_libra/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyItem {
  final String title;
  final String details;

  MyItem(this.title, this.details);
}

List<MyItem> myItems = [
  MyItem(
      'How do I send money?',
      'Enter your transfer details (country you want to send to, amount you want to send, how you want the money to be delivered, and how you will pay). Check the price and hit “Send Now” if you would like to proceed. Provide your recipient’s information including first and last name (be sure it’s the same as their government-issued ID), and their email address or phone number. Enter your payment information and your money is on its way!'
  ),

  MyItem(
      'How long does a transfer take?',
      'The majority of our transactions are immediate but some larger amounts might take up to 24 hours. Transactions will be cancelled if there was no transfer and your card will not be charged.'
  ),

  MyItem(
      'What documents do I need to pick up cash?',
      'To pick up cash you will be required to provide proof of ID which includes a valid passport, your National ID card, or a driver’s license.'
  ),

  MyItem(
      'What documents do I need to make a transfer?',
      'Most of the time when you’re transferring money to another country you won’t need to provide any documents. But sometimes, depending on the amount of your money transfer, we may need extra information. This could mean providing proof of identity and proof of address. Proof of identity could be a passport, national ID card, or a driver’s licence. Proof of address could be a utility bill, bank statement or credit card statement'
  ),

  MyItem(
      'How do I cancel my money transfer and ask for a refund?',
      'You can cancel a money transfer only if it has not been picked up by your receiver. If you send money to a bank account, you can cancel it if the transfer has not been completed by your receiver’s bank. To request a refund, please call Customer Care, or if you sent the money in person, return to the agent location.'
  ),


  MyItem(
      'What details do you need to transfer money?',
      "Name of the person you're paying , Mobile money or bank account number you are paying into, Correct name of the recipient that matches their ID"
  ),

  // Add more items here
];




class FAQMoneyTransfer extends StatefulWidget {
  const FAQMoneyTransfer({Key? key}) : super(key: key);

  @override
  State<FAQMoneyTransfer> createState() => _FAQMoneyTransferState();
}

class _FAQMoneyTransferState extends State<FAQMoneyTransfer> {
  late List<bool> _isExpandedList;

  @override
  void initState() {
    super.initState();
    _isExpandedList = List.generate(myItems.length, (index) => false);
  }

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
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        child: Text("Money Transfer", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        child: ExpansionPanelList(
                          elevation: 1,
                          expandedHeaderPadding: EdgeInsets.all(0),
                          expansionCallback: (int index, bool isExpanded) {
                            setState(() {
                              _isExpandedList[index] = !isExpanded;
                            });
                          },
                          children: myItems.asMap().entries.map<ExpansionPanel>((entry) {
                            final index = entry.key;
                            final item = entry.value;

                            return ExpansionPanel(
                              headerBuilder: (BuildContext context, bool isExpanded) {
                                return ListTile(
                                  title: Text(item.title, style: TextStyle(fontWeight: FontWeight.bold),),
                                );
                              },
                              body: Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: ListTile(
                                  title: Text(item.details),
                                ),
                              ),
                              isExpanded: _isExpandedList[index],
                            );
                          }).toList(),
                        ),
                      ),
                    )

                  ],
                ),
                SizedBox(
                  height: 20,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }


  Future<void> clearApiKey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("API_Key");
    await prefs.remove("quickSendList");
    await prefs.remove("USER_ID");
  }


}

