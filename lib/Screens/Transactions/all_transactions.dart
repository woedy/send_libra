import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:send_libra/Screens/Transactions/models/all_transactions.dart';
import 'package:send_libra/Screens/Transactions/transaction_history_details.dart';
import 'package:send_libra/constants.dart';
import 'package:http/http.dart' as http;

Future<AllTransactionsModel> getAllTransactions() async {
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
  } else if (response.statusCode == 422) {
    return AllTransactionsModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to Sign In');
  }
}

class AllTransactions extends StatefulWidget {
  const AllTransactions({Key? key}) : super(key: key);

  @override
  State<AllTransactions> createState() => _AllTransactionsState();
}

class _AllTransactionsState extends State<AllTransactions>
    with SingleTickerProviderStateMixin {
  Future<AllTransactionsModel>? _futureGetAllTransactions;
  AnimationController? _controller;

  TextEditingController searchController =
      TextEditingController(); // Add this line

  @override
  void initState() {
    super.initState();
    _futureGetAllTransactions = getAllTransactions();

    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return (_futureGetAllTransactions == null)
        ? buildColumn()
        : buildFutureBuilder();
  }

  buildColumn() {
    return Scaffold(
      body: SafeArea(
        child: Container(),
      ),
    );
  }

  FutureBuilder<AllTransactionsModel> buildFutureBuilder() {
    return FutureBuilder<AllTransactionsModel>(
        future: _futureGetAllTransactions,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Dialog(
                backgroundColor: Colors.transparent,
                child: Container(
                    height: 280,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image(
                            image:
                                AssetImage("assets/images/libra-dialog.png")),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "is loading transactions..",
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
                                child: Image(
                                    image: AssetImage(
                                        "assets/icons/loading.png"))),
                          ],
                        ),
                      ],
                    )));
          } else if (snapshot.hasData) {
            var data = snapshot.data!;

            if (data.message == "Transactions retrieved successfully") {
              return Scaffold(
                body: SafeArea(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    child: SingleChildScrollView(
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      margin: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                Row(
                                  children: [
                                    /*     Icon(Icons.filter_list_alt, color: Colors.white, size: 15,),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text("Filter", style: TextStyle(fontSize: 15,),),
                                    SizedBox(
                                      width: 20,
                                    ),*/
                                  ],
                                ),
                              ],
                            ),
                            Expanded(
                              child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 5),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text.rich(TextSpan(
                                        text: "History",
                                        style: TextStyle(
                                          fontSize: 60,
                                        ),
                                      )),
                                      SizedBox(
                                        height: 40,
                                      ),
                                      Expanded(
                                        child: Container(
                                          height:
                                              MediaQuery.of(context).size.height,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                    decoration: BoxDecoration(
                                                        //color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                5),
                                                        border: Border.all(
                                                            color: Colors.white
                                                                .withOpacity(0.1))),
                                                    child: TextFormField(
                                                      controller:
                                                          searchController, // Connect the controller

                                                      style: TextStyle(
                                                          color: Colors.white),
                                                      decoration: InputDecoration(
                                                        //hintText: 'Enter Password',

                                                        suffixIcon: Icon(
                                                          Icons.search,
                                                          color: Colors.white,
                                                        ),

                                                        hintStyle: TextStyle(
                                                            color: Colors.grey,
                                                            fontWeight:
                                                                FontWeight.normal),
                                                        //labelText: "Password",
                                                        labelStyle: TextStyle(
                                                            fontSize: 13,
                                                            color: bodyText2),
                                                        enabledBorder:
                                                            UnderlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .transparent)),
                                                        focusedBorder:
                                                            UnderlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .transparent)),
                                                        border: InputBorder.none,
                                                      ),
                                                      inputFormatters: [
                                                        LengthLimitingTextInputFormatter(
                                                            225),
                                                        PasteTextInputFormatter(),
                                                      ],
                                                      textInputAction:
                                                          TextInputAction.next,
                                                      autofocus: false,

                                                      //initialValue: " ",

                                                      onChanged: (query) {
                                                        setState(() {});
                                                      },
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 40,
                                                  ),
                                                ],
                                              ),
                                              if (data.data!.length != 0) ...[
                                                Expanded(
                                                  child: ListView.builder(
                                                      itemCount: data.data!.length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        if (searchController
                                                                .text.isEmpty ||
                                                            data.data![index]
                                                                .benefName!
                                                                .toLowerCase()
                                                                .contains(
                                                                    searchController
                                                                        .text
                                                                        .toLowerCase())) {
                                                          // Only show items that match the search query

                                                          return Column(
                                                            children: [
                                                              InkWell(
                                                                onTap: () {
                                                                  Navigator.of(context).push(MaterialPageRoute(
                                                                      builder: (BuildContext
                                                                              context) =>
                                                                          TransactionDetailsScreen(
                                                                              data:
                                                                                  data.data![index])));
                                                                },
                                                                child: Container(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(10),
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .circular(
                                                                                  20),
                                                                      color: Colors
                                                                          .white),
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment
                                                                                .spaceBetween,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment
                                                                                .start,
                                                                        children: [
                                                                          Row(
                                                                            children: [
                                                                              Container(
                                                                                height:
                                                                                    44,
                                                                                width:
                                                                                    44,
                                                                                decoration:
                                                                                    BoxDecoration(color: libraPrimary, borderRadius: BorderRadius.circular(10)),
                                                                                child:
                                                                                    Center(
                                                                                  child: Text(data.data![index].benefName.toString().substring(0, 1)),
                                                                                ),
                                                                              ),
                                                                              SizedBox(
                                                                                width:
                                                                                    10,
                                                                              ),
                                                                              Column(
                                                                                crossAxisAlignment:
                                                                                    CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    data.data![index].benefName.toString(),
                                                                                    style: TextStyle(fontSize: 15, color: libraPrimary, fontWeight: FontWeight.w500),
                                                                                  ),
                                                                                  Text(
                                                                                    DateFormat('dd/MM/yyyy').format(DateTime.parse(data.data![index].creationDate.toString())),
                                                                                    style: TextStyle(fontSize: 9, color: libraPrimary, fontWeight: FontWeight.w500),
                                                                                  ),
                                                                                ],
                                                                              )
                                                                            ],
                                                                          ),
                                                                          Text(
                                                                            "-\£" +
                                                                                data.data![index].sourceAmount.toString(),
                                                                            style: TextStyle(
                                                                                fontSize:
                                                                                    25,
                                                                                color:
                                                                                    libraPrimary,
                                                                                fontWeight:
                                                                                    FontWeight.w500),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      SizedBox(
                                                                        height: 20,
                                                                      ),
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment
                                                                                .spaceBetween,
                                                                        children: [
                                                                          Container(
                                                                              padding: EdgeInsets.all(
                                                                                  10),
                                                                              decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.circular(20),
                                                                                  color: Colors.green),
                                                                              child: Text(
                                                                                data.data![index].status.toString(),
                                                                                style: TextStyle(
                                                                                    fontSize: 9,
                                                                                    color: Colors.white,
                                                                                    fontWeight: FontWeight.w500),
                                                                              )),
                                                                          if (data.data![index].paymentMethod ==
                                                                                  "41" &&
                                                                              data.data![index].status ==
                                                                                  "PENDING_CLEARANCE") ...[
                                                                            Container(
                                                                                padding:
                                                                                    EdgeInsets.all(10),
                                                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.red),
                                                                                child: Text(
                                                                                  "Pay Now",
                                                                                  style: TextStyle(fontSize: 9, color: Colors.white, fontWeight: FontWeight.w500),
                                                                                )),
                                                                          ]
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 10,
                                                              )
                                                            ],
                                                          );
                                                        }
                                                        return SizedBox
                                                            .shrink(); // Hide non-matching items
                                                      }),
                                                )
                                              ] else ...[
                                                Expanded(
                                                  child: Center(
                                                    child: Text(
                                                      "No transactions available",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                )
                                              ]
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }
          }

          return Scaffold(
            body: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /*   CircularProgressIndicator(),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Please Wait...")*/
                ],
              ),
            ),
          );
        });
  }
}
