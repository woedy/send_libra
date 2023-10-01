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
      'How can I find out the exchange rate for a specific country?',
      'You can find the exchange rate for a specific country by using our Libra Exchange Calculator. Additionally, the exchange rate will also display during the send money process'
  ),

  MyItem(
      'Will my recipient have to pay any fees?',
      'It depends on their bank. Some recipients will likely need to pay a small fee, while others may not owe a thing. The recipient will need to check with their financial institution beforehand to be sure if there’s a cost to receive an international money transfer.'
  ),
];




class FAQFeeAndCharges extends StatefulWidget {
  const FAQFeeAndCharges({Key? key}) : super(key: key);

  @override
  State<FAQFeeAndCharges> createState() => _FAQFeeAndChargesState();
}

class _FAQFeeAndChargesState extends State<FAQFeeAndCharges> {
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
                        child: Text("Fees And Charges", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
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

