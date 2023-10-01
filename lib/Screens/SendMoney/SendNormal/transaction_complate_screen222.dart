import 'package:flutter/material.dart';

class TransactionCompleteScreen extends StatefulWidget {
  const TransactionCompleteScreen({Key? key}) : super(key: key);

  @override
  State<TransactionCompleteScreen> createState() => _TransactionCompleteScreenState();
}

class _TransactionCompleteScreenState extends State<TransactionCompleteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Your transaction is being processed by WorldPay.", textAlign: TextAlign.center, style: TextStyle(fontSize: 18),)

          ],
        ),
      ),
    );
  }
}
