import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:send_libra/Screens/Receiver/models/all_receivers_model.dart';
import 'package:send_libra/Screens/Transactions/models/all_transactions.dart';
import 'package:send_libra/Screens/UserProfile/models/user_profile_model.dart';
import 'package:send_libra/constants.dart';

class MyHomePlayground extends StatefulWidget {
  @override
  _MyHomePlaygroundState createState() => _MyHomePlaygroundState();
}


class _MyHomePlaygroundState extends State<MyHomePlayground> {
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
      print("######### USER DATA");
      print(json.decode(response.body));
      return UserProfileModel.fromJson(jsonDecode(response.body));
    } else {
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
    print(email);

    final response = await http.get(
      Uri.parse(hostName + "/api/v1/transactions?username=" + email.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Bearer': (await getApiPref()).toString()
      },

    );

    if (response.statusCode == 200) {
      print("######### HISTORY");
      print(json.decode(response.body));
      return AllTransactionsModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch history');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Display'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: Future.wait([
          _fetchUserData(),
          _fetchReceivers(),
          _fetchHistory(),
        ]),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
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


            return Container(
              child: Column(
                children: [
                  Text(userData.data.firstname.toString() + " " + userData.data.lastname.toString()),
                  Text(receivers.message.toString()),
                  Text(history.message.toString())
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
}
