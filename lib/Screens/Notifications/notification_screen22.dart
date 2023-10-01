import 'package:flutter/material.dart';
import 'package:send_libra/constants.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
                            text: "Notifications",
                            style: TextStyle(fontSize: 50,  ),

                          )
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 20,
                      itemBuilder: (context, index) {
                        return  ListTile(
                          title: Text("You sent \£ to Sandra Mensah", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                          subtitle: Text("25/07/2023", style: TextStyle(color: Colors.grey),),
                          leading: Icon(Icons.notifications_active, color: Colors.white,),
                        );
                      }
                  ),
                )

        




              ],
            ),
          ),
        ),
      ),
    );
  }
}
