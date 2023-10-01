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
      'How often are exchange rates updated?',
      'Exchange rates are in real time. As such, they may differ from any exchange rate listed by another provider. You’ll always get provided with the most up to date exchange rate at the point of transaction.'
  ),

  MyItem(
      'How long does it take to receive a refund?',
      'Refunds typically take up to 10 business days from the date they are completed'
  ),

  MyItem(
      'How fast is my transfer?',
      'Money can be received as fast as 1 minute if the sender is using a debit card to pay for the transfer and sent to a mobile wallet account. It could take the same day for cash pick up at our partner bank and locations and less than 2 business days into a bank account.'
  ),

  MyItem(
      'What payment methods can I use?',
      'You can securely send money using your: Debit Card: Using a debit card to pay for your transfer may require a fee but the money usually arrives within 1 minute. Credit Card: Using a credit card to pay for your transfer may require a fee but the money usually arrives within 15 minutes. Keep in mind that your credit card company may charge you a cash advance fee. To find out whether you might be charged a cash advance fee, please contact your credit card issuer. Bank Account: Using a bank account to pay for your transfer is usually the least expensive option but may take up to 4 business days for the money to arrive. You will need to know your routing and bank account number and complete our easy bank account confirmation process. Cash: You can pay with cash by visiting one of our agent locations. Use our Find a Location tool to find a Libra location closest to you.'
  ),

  // Add more items here
];




class FAQGeneral extends StatefulWidget {
  const FAQGeneral({Key? key}) : super(key: key);

  @override
  State<FAQGeneral> createState() => _FAQGeneralState();
}

class _FAQGeneralState extends State<FAQGeneral> {
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
                        child: Text("General Questions", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
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
                              body: ListTile(
                                title: Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: Text(item.details),
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

