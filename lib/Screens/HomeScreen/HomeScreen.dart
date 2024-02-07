import 'dart:convert';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:send_libra/Screens/Authentication/IncreasingPower/plan_screen.dart';
import 'package:send_libra/Screens/Authentication/SignIn/sign_in_screen.dart';
import 'package:send_libra/Screens/Notifications/notification_screen.dart';
import 'package:send_libra/Screens/Receiver/add_receiver1.dart';
import 'package:send_libra/Screens/Receiver/all_receivers_screen.dart';
import 'package:send_libra/Screens/Receiver/models/all_receivers_model.dart';
import 'package:send_libra/Screens/SendMoney/QuickSend/quick_send_money_screen.dart';
import 'package:send_libra/Screens/Settings/settings_screen.dart';
import 'package:send_libra/Screens/Transactions/all_transactions.dart';
import 'package:send_libra/Screens/Transactions/models/all_transactions.dart';
import 'package:send_libra/Screens/Transactions/transaction_history_details.dart';
import 'package:send_libra/Screens/UserProfile/UpdateProfile/update_user_info.dart';
import 'package:send_libra/Screens/UserProfile/models/user_profile_model.dart';
import 'package:send_libra/Screens/UserProfile/user_profile.dart';
import 'package:http/http.dart' as http;

import 'package:send_libra/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../SendMoney/SendNormal/send_money_screen.dart';

class HomeScreen extends StatefulWidget {
  final message;
  const HomeScreen({Key? key, this.message}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin  {


  Future<UserProfileModel> _fetchUserData() async {
    final response = await http.post(
      Uri.parse(hostName + "/api/v1/profile/user"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json'
      },
      body: jsonEncode({
        "email": await getUserIDPref(),
        "token": await getApiPref(),
      }),
    );


    if (response.statusCode == 200) {

      return UserProfileModel.fromJson(jsonDecode(response.body));
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => SignInScreen()));

      throw Exception('Failed to fetch user data');
    }
  }


  Future<AllReceiversModel> _fetchReceivers() async {
    var email = await getUserIDPref();
    print(email);

    final response = await http.get(
      Uri.parse(hostName + "/api/v1/beneficiaries?username=" + email.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Bearer': (await getApiPref()).toString()
      },

    );

    if (response.statusCode == 200) {
      print("######### RECEIVERS");
      print(json.decode(response.body));
      return AllReceiversModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch receivers');
    }
  }



  Future<AllTransactionsModel> _fetchHistory() async {
    var email = await getUserIDPref();


    final response = await http.get(
      Uri.parse(hostName + "/api/v1/transactions?username=" + email.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Bearer': (await getApiPref()).toString()
      },

    );

    if (response.statusCode == 200) {

      return AllTransactionsModel.fromJson(jsonDecode(response.body));
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => SignInScreen()));
      throw Exception('Failed to fetch history');
    }
  }


  AnimationController? _controller;

  List<Map<String, dynamic>> quickSendList = [];
  String _greeting = '';




  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    )..repeat();

    _updateGreeting();
  }

  void _updateGreeting() {
    final currentTime = DateTime.now();
    if (currentTime.hour < 12) {
      setState(() {
        _greeting = 'Good Morning';
      });
    } else if (currentTime.hour < 18) {
      setState(() {
        _greeting = 'Good Afternoon';
      });
    } else {
      setState(() {
        _greeting = 'Good Evening';
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<dynamic>>(
        future: Future.wait([
          _fetchUserData(),
          _fetchReceivers(),
          _fetchHistory(),
        ]),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Dialog(
                backgroundColor: Colors.transparent,
                child: Container(
                    height: 280,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), color: Colors.white),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image(image: AssetImage("assets/images/libra-dialog.png")),
                        SizedBox(
                          height: 30,
                        ),
                        Text("is loading home data..",
                          style: TextStyle(fontSize: 30, color: libraPrimary),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            RotationTransition(
                                turns: _controller!,
                                child: Image(image: AssetImage("assets/icons/loading.png"))),
                          ],
                        ),
                      ],
                    )


                )

            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            final userData = snapshot.data![0];
            final receivers = snapshot.data![1];
            final history = snapshot.data![2];

            // Check if any of the data is null (indicating an error)
            if (userData == null || receivers == null || history == null) {
              return Center(
                child: Text('Error: Some data could not be fetched'),
              );
            }


            return SafeArea(
              child: Stack(
                children: [
                  Container(
                    //color: Colors.blue, // Replace with your desired color
                    width: double.infinity,
                    height: double.infinity,
                    child: SingleChildScrollView(
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        child: Column(
                          children: [
                            Expanded(
                                flex: 2,
                                child: Container(
                                  //color: Colors.red,
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.all(5),
                                  child: Container(

                                    decoration: BoxDecoration(
                                        color: clay,
                                        borderRadius: BorderRadius.circular(30)
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.all(30),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image(
                                            image: AssetImage('assets/images/home-logo.png',), fit: BoxFit.cover,
                                          ),
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(
                                                  children: [


                                                    if(userData.data.avatar == "")...[

                                                      InkWell(
                                                        onTap: (){
                                                          Navigator.of(context).push(MaterialPageRoute(
                                                            builder: (context) => UserProfile(),
                                                          ));
                                                        },
                                                        child: Container(
                                                          height: 59,
                                                          width: 59,
                                                          decoration: BoxDecoration(
                                                              color: libraPrimary,
                                                              borderRadius: BorderRadius.circular(10)
                                                          ),
                                                          child: Center(
                                                            child: Text(userData.data.firstname.toString().substring(0, 1) + userData.data.lastname.toString().substring(0, 1), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                                          ),
                                                        ),
                                                      ),

                                                    ]else...[
                                                      InkWell(
                                                        onTap: (){
                                                          Navigator.of(context).push(MaterialPageRoute(
                                                            builder: (context) => UserProfile(),
                                                          ));
                                                        },
                                                        child: Container(
                                                            height: 59,
                                                            width: 59,
                                                            decoration: BoxDecoration(
                                                              color: libraPrimary,
                                                              borderRadius: BorderRadius.circular(10),
                                                              image: DecorationImage(
                                                                  image: MemoryImage(base64Decode(userData.data.avatarContent.trim().toString())
                                                                  )
                                                              ),

                                                            )),
                                                      ),
                                                    ],
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(_greeting, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white.withOpacity(0.5)),),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(userData.data.firstname.toString() + " " + userData.data.lastname.toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.white),),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Expanded(
                                                          child: Row(
                                                            children: [
                                                              Icon(Icons.star, size: 15, color: Colors.yellow,),
                                                              Icon(Icons.star, size: 15, color: Colors.yellow,),
                                                              Icon(Icons.star, size: 15, color: Colors.yellow,),
                                                              Icon(Icons.star, size: 15, color: Colors.yellow,),
                                                              Icon(Icons.star, size: 15, color: Colors.yellow,),
                                                            ],
                                                          ),
                                                        )

                                                      ],
                                                    )
                                                  ],
                                                ),
                                                InkWell(
                                                  onTap: (){


                                                    Navigator.of(context).push(MaterialPageRoute(
                                                        builder: (BuildContext context) =>
                                                            NotificationScreen()));


                                                  },
                                                    child: Icon(Icons.notifications_none_sharp, color: Colors.white, size: 30,))
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                            ),
                            Expanded(
                                flex: 2,
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  //color: Colors.blue,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            margin: EdgeInsets.symmetric(horizontal: 10),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text("Quick send", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                                                InkWell(
                                                    onTap: (){
                                                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => AllReceiversScreen(
                                                        user_init: userData.data.firstname.toString().substring(0, 1) + userData.data.lastname.toString().substring(0, 1), image: base64Decode(userData.data.avatarContent.trim().toString()),

                                                      )));

                                                    },
                                                    child: Text("View All", style: TextStyle(color: Colors.grey),)
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        child: Container(
                                          width: MediaQuery.of(context).size.width,
                                          height: 78,
                                          margin: EdgeInsets.all(10),
                                          child: Row(
                                            children: [
                                              InkWell(
                                                onTap: (){
                                                  Navigator.of(context).push(MaterialPageRoute(
                                                    builder: (context) => AddReceiver1(),
                                                  ));
                                                },
                                                child: Container(
                                                  height: 78,
                                                  width: 78,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Icon(Icons.add, color: Colors.white,),
                                                      Center(child: Text("Add receiver", style: TextStyle(fontSize: 11),))
                                                    ],
                                                  ),
                                        
                                                  decoration: BoxDecoration(
                                                      color: libraLight.withOpacity(0.3),
                                                      borderRadius: BorderRadius.circular(15)
                                                  ),
                                                ),
                                              ),
                                        
                                              if(receivers.data.length != 0)...[
                                                Expanded(
                                                    child:ListView.builder(
                                                        scrollDirection: Axis.horizontal,
                                                        itemCount: receivers.data.length,
                                                        itemBuilder: (context, index){
                                        
                                                          print("#############");
                                                          print("##########################");
                                                          print("#############");
                                                          print(receivers.data[0].name.toString());
                                        
                                                          if(receivers.data[index].avatar == ""){
                                                            return InkWell(
                                                              onTap: (){
                                        
                                                                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => QuickSendMoneyScreen(
                                                                  beneficiary_id: receivers.data![index].beneficiaryId,
                                                                  fname: receivers.data![index].fname,
                                                                  lname: receivers.data![index].lname,
                                                                  nickname: receivers.data![index].nickname,
                                                                  phone: receivers.data![index].mobile,
                                                                  avatar: receivers.data![index].avatarContent.trim().toString(),
                                                                )));
                                        
                                        
                                                              },
                                                              child: Row(
                                                                children: [
                                                                  SizedBox(
                                                                    width: 10,
                                                                  ),
                                        
                                                                  if(receivers.data[index].nickname == "")...[
                                                                    Container(
                                                                      height: 78,
                                                                      width: 78,
                                                                      decoration: BoxDecoration(
                                                                          color: libraLight.withOpacity(0.3),
                                                                          borderRadius: BorderRadius.circular(15)
                                                                      ),
                                                                      child: Center(
                                                                        child: Text(receivers.data[index].fname.toString().substring(0, 1) + receivers.data[index].lname.toString().substring(0, 1), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                                                      ),
                                                                    ),
                                                                  ]else...[
                                                                    Container(
                                                                      height: 78,
                                                                      width: 78,
                                                                      decoration: BoxDecoration(
                                                                          color: libraLight.withOpacity(0.3),
                                                                          borderRadius: BorderRadius.circular(15)
                                                                      ),
                                                                      child: Center(
                                                                        child: Text(receivers.data[index].nickname.toString().substring(0, 1), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                                                      ),
                                                                    ),
                                                                  ]
                                        
                                                                ],
                                                              ),
                                                            );
                                                          }else {
                                                            return InkWell(
                                                              onTap: (){
                                                                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => QuickSendMoneyScreen(
                                                                  beneficiary_id: receivers.data![index].beneficiaryId,
                                                                  fname: receivers.data![index].fname,
                                                                  lname: receivers.data![index].lname,
                                                                  phone: receivers.data![index].mobile,
                                                                  avatar: receivers.data![index].avatarContent.trim().toString(),
                                                                )));
                                        
                                                              },
                                                              child: Row(
                                                                children: [
                                                                  SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  Container(
                                                                    height: 78,
                                                                    width: 78,
                                                                    margin: EdgeInsets.symmetric(horizontal: 10),
                                                                    decoration: BoxDecoration(
                                                                        color: libraLight.withOpacity(0.3),
                                                                        borderRadius: BorderRadius.circular(15),
                                                                        image: DecorationImage(
                                                                            image: MemoryImage(base64Decode(receivers.data[index].avatarContent.trim().toString()),),
                                                                            fit: BoxFit.cover
                                                                        )
                                                                    ),
                                        
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          }
                                        
                                        
                                                        }
                                                    )
                                                ),
                                              ]else...[
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 30,
                                                    ),
                                                    Center(child: Text("No receivers available")),
                                                  ],
                                                )
                                              ]
                                        
                                        
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                            ),
                            if(history.data.length != 0)...[
                              Expanded(
                                  flex: 5,
                                  child: Stack(
                                    children: [
                                      Container(
                                        //color: Colors.green,

                                        child: Column(
                                          children: [

                                            SizedBox(
                                              height: 20,
                                            ),

                                            Container(
                                              margin: EdgeInsets.symmetric(horizontal: 10),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text("History", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                                                  InkWell(
                                                      onTap: (){
                                                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => AllTransactions()));

                                                      },
                                                      child: Text("View All", style: TextStyle(color: Colors.grey),)),
                                                ],
                                              ),
                                            ),

                                            SizedBox(
                                              height: 20,
                                            ),
                                            Expanded(
                                              child: GridView.builder(
                                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2, // Number of columns
                                                ),
                                                itemCount: history.data.length,
                                                itemBuilder: (BuildContext context, int index) {
                                                  return InkWell(
                                                    onTap: (){
                                                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => TransactionDetailsScreen(data: history.data[index])));

                                                    },
                                                    child: SizedBox(
                                                      // height: 100, // Set your desired height
                                                      child: Container(
                                                        margin: EdgeInsets.all(10),
                                                        padding: EdgeInsets.all(10),
                                                        decoration: BoxDecoration(
                                                          color: libraLight.withOpacity(0.3),
                                                          borderRadius: BorderRadius.circular(30),
                                                        ),
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            SizedBox(height: 10),
                                                            Row(
                                                              children: [
                                                                /*Image(
                                                                image: AssetImage('assets/images/user1.png'),
                                                                fit: BoxFit.cover,
                                                                height: 37,
                                                                width: 37,
                                                              ),*/

                                                                Container(
                                                                  height: 37,
                                                                  width: 37,
                                                                  decoration: BoxDecoration(
                                                                      color: libraPrimary,
                                                                      borderRadius: BorderRadius.circular(10)
                                                                  ),
                                                                  child: Center(
                                                                    child: Text(history.data[index].benefName.toString().substring(0, 1), style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                                                                  ),
                                                                ),


                                                                Expanded(
                                                                  child: Row(
                                                                    children: [
                                                                      SizedBox(
                                                                        width: 5,
                                                                      ),
                                                                      Expanded(
                                                                        child: Column(
                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                          children: [
                                                                            Container(
                                                                              width: 110,
                                                                              child: Text(
                                                                                history.data[index].benefName.toString(),
                                                                                style: TextStyle(fontWeight: FontWeight.w500),
                                                                              ),
                                                                            ),
                                                                            SizedBox(height: 5),
                                                                            Text(
                                                                              DateFormat("dd-MM-yy").format(DateTime.parse(history.data[index].creationDate)),
                                                                              style: TextStyle(
                                                                                fontWeight: FontWeight.w500,
                                                                                color: Colors.grey,
                                                                                fontSize: 9,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                if(history.data[index].paymentMethod == "41" && history.data[index].status == "PENDING_CLEARANCE")...[

                                                                  CircleAvatar(
                                                                  backgroundColor: Colors.red,
                                                                  radius: 10,
                                                                )

                                                                ]
                                                              ],
                                                            ),
                                                            SizedBox(height: 50),
                                                            Text(
                                                              "-\£" + history.data[index].sourceAmount.toString(),
                                                              style: TextStyle(
                                                                fontWeight: FontWeight.w600,
                                                                fontSize: 26,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),



                                          ],
                                        ),
                                      ),
                                      if(userData.data.address1 == "" || userData.data.address1 == null)...[
                                        Positioned(
                                          bottom: 80,
                                          child: Container(
                                            //height: 80,
                                            padding: EdgeInsets.all(10),
                                            width: MediaQuery.of(context).size.width,
                                            color: libraPrimary,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text("Your current send limit")
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text("£500", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),)
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Align(
                                                  child: Container(

                                                    //height: 55,
                                                    padding: EdgeInsets.all(10),
                                                    decoration: BoxDecoration(
                                                        color: libraBlue,
                                                        borderRadius: BorderRadius.circular(10)),
                                                    child: Material(
                                                      color: Colors.transparent,
                                                      child: InkWell(
                                                        onTap: () {
                                                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => UpdateUserInfoScreen(data: userData.data,)));


                                                        },
                                                        child: Align(
                                                          child: Container(
                                                            child: Row(
                                                              mainAxisSize: MainAxisSize.min,
                                                              children: [
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Text(
                                                                  "Complete Profile",
                                                                  style: TextStyle(
                                                                      fontSize: 15, color: Colors.white),
                                                                ),
                                                                SizedBox(
                                                                  width: 20,
                                                                ),
                                                                Icon(
                                                                  Icons.arrow_forward,
                                                                  color: Colors.white,
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ]

                                    ],
                                  )
                              )
                            ] else...[
                              Expanded(
                                  flex: 6,
                                  child: Container(
                                    //color: Colors.green,

                                    child: Column(
                                      children: [


                                        Container(
                                          margin: EdgeInsets.symmetric(horizontal: 10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("History", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                                              InkWell(
                                                  onTap: (){
                                                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => AllTransactions()));

                                                  },
                                                  child: Text("View All", style: TextStyle(color: Colors.grey),)),
                                            ],
                                          ),
                                        ),

                                        SizedBox(
                                          height: 20,
                                        ),
                                        DottedBorder(
                                          borderType: BorderType.RRect,
                                          radius: Radius.circular(20),
                                          dashPattern: [20, 20],
                                          color: Colors.grey,
                                          strokeWidth: 2,
                                          child: Container(
                                            width: MediaQuery.of(context).size.width,
                                            height: 150,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),


                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [

                                                Text("No History", style: TextStyle(fontSize: 24),)
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 40,
                                        ),


                                        if((userData.data.address1 != "" || userData.data.address1 != null) && userData.data.verified == 'f')...[
                                          Container(
                                            child: Center(
                                              child: Text("Account awaiting verification by admin.", style: TextStyle(color: Colors.red),),
                                            ),
                                          )
                                        ]else if(userData.data.address1 == "" || userData.data.address1 == null)...[
                                          Column(
                                            children: [
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text("Your current send limit")
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Row(
                                                    children: [
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text("£500", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),)
                                                    ],
                                                  ),
                                                ],
                                              ),

                                              SizedBox(
                                                height: 30,
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
                                                          borderRadius: BorderRadius.circular(15)),
                                                      child: Material(
                                                        color: Colors.transparent,
                                                        child: InkWell(
                                                          onTap: () {
                                                            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => UpdateUserInfoScreen(data: userData.data,)));


                                                          },
                                                          child: Align(
                                                            child: Container(
                                                              child: Row(
                                                                mainAxisSize: MainAxisSize.min,
                                                                children: [
                                                                  SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  Text(
                                                                    "Complete Profile",
                                                                    style: TextStyle(
                                                                        fontSize: 15, color: Colors.white),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 20,
                                                                  ),
                                                                  Icon(
                                                                    Icons.arrow_forward,
                                                                    color: Colors.white,
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 50,
                                                  )
                                                ],
                                              ),

                                            ],
                                          ),
                                        ],




                                      ],
                                    ),
                                  )
                              )
                            ]

                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      color: libraPrimary,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.home, color: libraBlue,),
                              ),
                              Text('Home', style: TextStyle(color: libraBlue),),
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {

                                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => AllTransactions()));

                                },
                                icon: Icon(Icons.wallet, color: Colors.white,),
                              ),
                              Text('Transactions'),
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          AllReceiversScreen(

                                              user_init: userData.data.firstname.toString().substring(0, 1) + userData.data.lastname.toString().substring(0, 1),
                                            image: base64Decode(userData.data.avatarContent.trim().toString())
                                          )));
                                },
                                icon: Icon(Icons.near_me_sharp, size: 35, color: Colors.white,),
                              ),
                              Text('Send Money', ),
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {


                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          SettingsScreen()));


                                },
                                icon: Icon(Icons.settings, color: Colors.white,),
                              ),
                              Text('settings'),
                            ],
                          ),

                          if(userData.data.avatar == "")...[
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        UserProfile()));
                              },
                              child: Column(
                                children: [
                                  /*CircleAvatar(
                                  radius: 15,
                                  backgroundImage: AssetImage('assets/images/profilepic.png'), // Replace with your profile image path
                                ),*/
                                  CircleAvatar(
                                    radius: 15,
                                    backgroundColor: libraBlue,
                                    child: Text(userData.data.firstname.toString().substring(0, 1) + userData.data.lastname.toString().substring(0, 1), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('Profile'),
                                ],
                              ),
                            ),
                          ]else...[
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        UserProfile()));
                              },
                              child: Column(
                                children: [
                                  /*CircleAvatar(
                                  radius: 15,
                                  backgroundImage: AssetImage('assets/images/profilepic.png'), // Replace with your profile image path
                                ),*/
                                  CircleAvatar(
                                    radius: 15,
                                    backgroundColor: libraBlue,
                                    backgroundImage: MemoryImage(base64Decode(userData.data.avatarContent.trim().toString())),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('Profile'),
                                ],
                              ),
                            ),
                          ]

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: Text('No data available'),
            );
          }
        },
      ),
    );
  }


  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

}
