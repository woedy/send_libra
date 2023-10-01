import 'package:flutter/material.dart';
import 'package:send_libra/constants.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
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
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Text.rich(
                          TextSpan(
                            text: "About Libra",
                            style: TextStyle(fontSize: 75,  ),

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

                  child: Text("We provide money transfer services to 52 countries across the globe. Transfer quickly and easily to mobile wallets, for cash pick up, and to bank accounts. Use a debit card, send directly from your bank account or send cash at our agent locations. The mode of payment will be initiated by the sender and payments will be made through it. This process is easy, secure and fast.", style: TextStyle(fontSize: 17,),)),




          ],
            ),
          ),
        ),
      ),
    );
  }
}
