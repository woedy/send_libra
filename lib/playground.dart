import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Transaction {
  String? transRef;
  String? transType;
  String? status;
  String? creationDate;
  String? processedDate;
  String? originatingCountry;
  String? destinationCountry;
  String? sourceCurrency;
  String? sourceAmount;
  String? destCurrency;
  String? destAmount;
  String? paymentMethod;
  String? benefId;
  String? benefName;
  String? benefMobile;
  String? complianceNeeded;
  String? complianceChecked;
  String? extComplianceNeeded;
  String? extComplianceChecked;

  Transaction(
      {this.transRef,
        this.transType,
        this.status,
        this.creationDate,
        this.processedDate,
        this.originatingCountry,
        this.destinationCountry,
        this.sourceCurrency,
        this.sourceAmount,
        this.destCurrency,
        this.destAmount,
        this.paymentMethod,
        this.benefId,
        this.benefName,
        this.benefMobile,
        this.complianceNeeded,
        this.complianceChecked,
        this.extComplianceNeeded,
        this.extComplianceChecked});

  Transaction.fromJson(Map<String, dynamic> json) {
    transRef = json['trans_ref'];
    transType = json['trans_type'];
    status = json['status'];
    creationDate = json['creation_date'];
    processedDate = json['processed_date'];
    originatingCountry = json['originating_country'];
    destinationCountry = json['destination_country'];
    sourceCurrency = json['source_currency'];
    sourceAmount = json['source_amount'];
    destCurrency = json['dest_currency'];
    destAmount = json['dest_amount'];
    paymentMethod = json['payment_method'];
    benefId = json['benef_id'];
    benefName = json['benef_name'];
    benefMobile = json['benef_mobile'];
    complianceNeeded = json['compliance_needed'];
    complianceChecked = json['compliance_checked'];
    extComplianceNeeded = json['ext_compliance_needed'];
    extComplianceChecked = json['ext_compliance_checked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['trans_ref'] = this.transRef;
    data['trans_type'] = this.transType;
    data['status'] = this.status;
    data['creation_date'] = this.creationDate;
    data['processed_date'] = this.processedDate;
    data['originating_country'] = this.originatingCountry;
    data['destination_country'] = this.destinationCountry;
    data['source_currency'] = this.sourceCurrency;
    data['source_amount'] = this.sourceAmount;
    data['dest_currency'] = this.destCurrency;
    data['dest_amount'] = this.destAmount;
    data['payment_method'] = this.paymentMethod;
    data['benef_id'] = this.benefId;
    data['benef_name'] = this.benefName;
    data['benef_mobile'] = this.benefMobile;
    data['compliance_needed'] = this.complianceNeeded;
    data['compliance_checked'] = this.complianceChecked;
    data['ext_compliance_needed'] = this.extComplianceNeeded;
    data['ext_compliance_checked'] = this.extComplianceChecked;
    return data;
  }
}


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transaction App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Transaction> transactions = [];

  @override
  void initState() {
    super.initState();
    _loadTransactions();
  }

  Future<void> _loadTransactions() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final transactionsJson = prefs.getStringList('transactions');
    if (transactionsJson != null) {
      List<Transaction> loadedTransactions = transactionsJson
          .map((transactionJson) =>
          Transaction.fromJson(json.decode(transactionJson)))
          .toList();
      setState(() {
        transactions = loadedTransactions;
      });
    }
  }

  void _saveTransactions(List<Transaction> transactions) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> transactionsJson =
    transactions.map((transaction) => json.encode(transaction.toJson())).toList();
    prefs.setStringList('transactions', transactionsJson);
    setState(() {
      this.transactions = transactions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction App'),
      ),
      body: Center(
        child: transactions.isNotEmpty
            ? ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Beneficiary Name: ${transactions[index].benefName}'),
              subtitle: Text('Beneficiary Mobile: ${transactions[index].benefMobile}'),
              trailing: Text('Status: ${transactions[index].status}'),
            );
          },
        )
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('No data'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Open the form to add new data
          _openTransactionForm(transactions);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _openTransactionForm(List<Transaction> transactions) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TransactionForm(
          onSave: _saveTransactions,
          transactions: transactions,
        ),
      ),
    );
  }
}

class TransactionForm extends StatefulWidget {
  final Function(List<Transaction>) onSave;
  final List<Transaction> transactions;

  TransactionForm({required this.onSave, required this.transactions});

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  TextEditingController _benefNameController = TextEditingController();
  TextEditingController _benefMobileController = TextEditingController();
  TextEditingController _statusController = TextEditingController();

  void _saveTransaction() {
    Transaction newTransaction = Transaction(
      benefName: _benefNameController.text,
      benefMobile: _benefMobileController.text,
      status: _statusController.text,
      // Fill in other fields as needed
    );

    List<Transaction> updatedTransactions = List.from(widget.transactions)
      ..add(newTransaction);

    // Save the updated list of transactions
    widget.onSave(updatedTransactions);

    // Return to the previous screen
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Transaction Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _benefNameController,
              decoration: InputDecoration(labelText: 'Beneficiary Name'),
            ),
            TextField(
              controller: _benefMobileController,
              decoration: InputDecoration(labelText: 'Beneficiary Mobile'),
            ),
            TextField(
              controller: _statusController,
              decoration: InputDecoration(labelText: 'Status'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveTransaction,
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _benefNameController.dispose();
    _benefMobileController.dispose();
    _statusController.dispose();
    super.dispose();
  }
}
