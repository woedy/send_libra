import 'package:flutter/material.dart';
import 'package:send_libra/constants.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
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
                            text: "Data Protection & Privacy Policy",
                            style: TextStyle(fontSize: 50,  ),

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

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("INTRODUCTION", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("The Data Protection Act (DPA) regulates the ‘processing’ of ‘personal data’. Its definition of ‘personal data’ covers all information relating to identifiable living individuals which is held on computer, in another 'automatically-processable' format or in a manual filing system which is structured so as to facilitate access to information relating to particular individuals. (Information relating to companies and other ‘legal’ persons is not caught). Its definition of ‘processing’ covers any conceivable activity in relation to personal data, including collection, analysis, processing in the ordinary sense of the word, storage, disclosure, international transfer and deletion.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("On a day-to-day basis we have to process personal data in various circumstances and in relation to various categories of individual. This Policy deals specifically with personal data collected in the context of the establishment and management of our customer relationships and the execution of transactions on the instructions of our customers (‘Customer and/or Transaction Management’).", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("It is important to remember that the DPA regulates processing of personal data relating to all individuals, not just relating to customers. Information relating to individual representatives of corporate customers, or to individuals (or individual representatives of corporate entity) elsewhere in a payment chain – for example, an ultimate payee or an individual representative of a payment institutions - is also protected by the DPA.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("It is important to remember that the DPA regulates processing of personal data relating to all individuals, not just relating to customers. Information relating to individual representatives of corporate customers, or to individuals (or individual representatives of corporate entity) elsewhere in a payment chain – for example, an ultimate payee or an individual representative of a payment institutions - is also protected by the DPA.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("The UK Information Commissioner (the ‘Commissioner’) is responsible for enforcement of the DPA and has published a range of guidance on data protection issues, all of which is available on the Commissioner's website at www.ico.gov.uk.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("Fortune Portfolio’s principal obligations under the DPA include:", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("- processing personal data fairly, legitimately, lawfully and proportionately;\n- informing individuals regarding our processing of their personal data;\n- abiding by restrictions on the international transfer of personal data;\n- keeping personal data secure, taking steps to ensure that they are accurate and up-to-date and deleting them when they are no longer needed;\n- maintaining an appropriate registration with the Commissioner's office; and\n- responding appropriately when data subjects seek to exercise their statutory rights of access, correction and objection.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("**A copy of our Policy will be supplied to each employee***", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("The requirements set out in this Policy are mandatory unless otherwise stated and must be followed by all our employees. It is the responsibility of each such person to acquaint themselves with the requirements of this Policy.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("Failure to comply with this Policy may constitute a serious disciplinary offence and could result in dismissal.", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800),)),
                            ],
                          ),
                        ],
                      ),

                    ],
                  ),
                ),


                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Data Protection Officer: Kofi Asiedu", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("The company Nominated Officer (MLRO) is charged as the designated data protection officer (the ‘Data Protection Officer’).", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("Employees with any questions about our Data Protection Policy or application in particular circumstances should consult the Data Protection Officer.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),


                    ],
                  ),
                ),


                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("FAIR AND PROPORTIONATE PROCESSING", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("The DPA requires that all of our processing of personal data should be fair and lawful and should meet one of various specified conditions. In designing and implementing each procedure for Customer and/or Transaction Management involving the processing of personal data, we will take these requirements into account and ensure that they are met.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("We expect that our routine processing of personal data for Customer and/or Transaction Management procedure will generally meet the most general of the available conditions, which is known as the ‘legitimate interests’ condition. The ‘legitimate interests’ condition will apply, and allow us to process personal data, if both:", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("- The processing is necessary for the purposes of legitimate interests that we, or a person to whom we disclose the data, pursue (these may be business, compliance or other purposes); and", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("- The processing is not ‘unwarranted’ because it prejudices the rights, freedoms or legitimate interests of the data subjects.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("Each processing operation will, therefore, be assessed to ensure that part A of this condition is met meaning that we have a legitimate business, compliance or other purpose for carrying out the processing.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("If part A is met, employees should then consider whether the processing will prejudice the data subjects in any way our expectation is that, provided the other rules in this Policy are followed, our ordinary processing for Customer and/or Transaction Management purposes will not prejudice data subjects' rights, freedoms or legitimate interests. If an employee considers that there is a potential for prejudice to be caused in a particular case, the prejudice should be balanced against our interests and a view taken on whether our interests outweigh the prejudice to the data subjects.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("If employees are in any doubt as to whether the ‘legitimate interests’ condition is met, employees should consider whether the processing can be justified on the basis that it meets any of the other statutory conditions available in the DPA.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("The other conditions most likely to apply are as follows:", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("- Processing is justified if it is necessary to fulfil a UK legal obligation. This will include, for example, processing in order to carry out legally-required anti-money-laundering checks; or in response to a UK court order. Foreign legal requirements are not automatically sufficient to justify disclosure or other processing of personal data.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("- Processing is justified if it is necessary for the performance of a contract with the data subject or to take steps at the data subject's request with a view to entering into such a contract. This will justify some processing of personal data relating to individual customers.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("- Processing can be justified on the basis of data subject consent. Our customer contracts should, therefore, include consents to the processing of individual customer data that will be necessary as part of our Customer and/or Transaction Management procedures.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("- The requirement that personal data should be processed lawfully can be breached in a number of circumstances, not covered by this Policy because in themselves they fall outside the scope of the DPA – for example, processing for fraudulent purposes would be unlawful and would therefore breach the DPA.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("The DPA also prohibits the processing of excessive, irrelevant or inadequate personal data. Our systems and procedures have been designed so as not to collect personal data which are excessive or irrelevant (in particular: personal data should not be collected on a ‘just-in-case’ basis) and, of course, employees should ensure that the data collected is adequate for the relevant purposes. Personal data collected for any given purpose should not then be used for a purpose which is incompatible with that purpose – we do not expect this to be an issue in the ordinary course of Customer and/or Transaction Management.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("Fortune Portfolio expect the general requirement that processing of personal data should be fair to be met if all the other requirements are met.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),


                    ],
                  ),
                ),


                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("TRANSPARENCY / INFORMATION-PROVISION", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("We are required under the DPA to ensure that data subjects have various information readily available to them. This requirement is subject to exceptions, however, and these exceptions are of relatively wide application in the context of Customer and/or Transaction Management.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("In particular:", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("- Information only needs to be made available where it is practicable to do so;", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("- In the case of personal data which are not collected directly from the data subject (for example, payee data collected from a payer customer), we are not obliged to provide information if to do so would involve disproportionate effort", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("- We take the view that we can assume that data subjects have, and need not therefore make available, information which should reasonably be obvious to them.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("The information to be made available is:", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("- Our identity", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("- The purposes for which we expect to process the data; and", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("- Any further information that needs to be provided to ensure that our processing of the data is fair.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("We must ensure that our customer contracts inform our individual customers of the following:", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("- Our identity", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("- The purposes for which we process their information (including know-your-client and related compliance purposes as well as the execution of transactions and customer management generally)", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("- The following further information, which, we consider, needs to be provided to ensure that our processing of customer data is fair", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("- The categories of person to whom we may disclose customer data (including, for example, noncustomer payers and payees, aggregators, any persons with whom we might share data for fraud prevention purposes, and regulatory and prosecuting authorities", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("- The fact that, if payments are made to persons outside the European Economic Area, this may involve transfers of the customer's personal data to jurisdictions which do not have data protection laws as strict as those in the UK", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("- Information as to the customer's rights of access and correction under the DPA, and contact details so that they can contact the Data Protection Officer if they want to exercise those rights", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("Our customer contracts also require customers to pass this information on to any individuals whose personal data they provide to us.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("We take the view that we do not need to provide information to data subjects other than individual customers to justify our processing of their personal data for routine Customer and/or Transaction Management purposes.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("In particular:", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("- We take the view that the effort involved in contacting an individual non-customer payer or payee, whose personal data are given to us by a customer, in order to provide him or her with information about our processing of his or her personal data, would be disproportionate given that we process his or her information only in order to facilitate a transaction of which he or she will in any case be aware.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("- We take the same view in relation to individual representatives of our customers – having required our customers to pass the required information on to their representatives we take the view that the effort involved in contacting the representatives directly would be disproportionate.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),


                    ],
                  ),
                ),


                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("INTERNATIONAL TRANSFER", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("The DPA restricts transfers of personal data to most countries and other territories outside the European Economic Area (the European Union plus Iceland, Liechtenstein and Norway).", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("However, transfer of data can be made as necessary to facilitate a transaction, on the basis that they are necessary to perform a contract with the data subject (where the data relate to a customer) or entered into in the interests of the data subject (where they relate to an overseas payee).", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("Except for transfers necessary to facilitate a transaction, personal data should not be transferred to countries or territories outside the European Economic Area unless the Data Protection Officer has considered the proposed transfer and concluded, on the basis of legal advice, if necessary, that it can be made without breach of the DPA.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),



                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("SECURITY, ACCURACY AND DATA DELETION", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("We have in place appropriate technical and organisational security measures to protect the personal data that we process for Customer and/or Transaction Management purposes against unauthorised or unlawful processing and accidental loss, destruction or damage.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("We identify the particular security measures that are ‘appropriate’ in the context of our business. They must deliver a level of security which is appropriate to the nature of the data and the risks associated with unauthorised or unlawful processing and accidental loss, destruction or damage. We will, in particular, take reasonable steps to ensure the reliability of our employees who have access to the data.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("If any aspect of our processing of personal data for Customer and/or Transaction Management purposes is outsourced to a third party service provider now or in the future, including the outsourcing of any wider function which includes the processing of personal data.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("We must:", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("- Satisfy ourselves that the service provider will have appropriate technical and organisational security measures in place", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("- Ensure that the arrangement is governed by a written agreement which requires the service provider to process the data only on our instructions and imposes on the service provider obligations equivalent to our obligations", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("- While the arrangement is in place, take reasonable steps from time to time to ensure that the service provider is meeting its security obligations in practice.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("We will take reasonable steps to ensure that the personal data that we process is accurate and, where relevant, up to date.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),




                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("DELETION OF DATA", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("Deleting of personal data will only take place when we no longer have need of it, given the purposes for which they were processed. This does not, for example, prevent us from keeping records containing personal data which may be relevant if there is a future dispute with a customer or another person, but it does require us to delete those records when a dispute is no longer a real possibility unless we have another legitimate purpose for continuing to keep the personal data.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),

                    ],
                  ),
                ),



                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("SENSITIVE PERSONAL DATA", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("Whilst we do not seek to collect or process personal data identified by the DPA as ‘sensitive’ for Customer and/or Transaction Management purposes. Employees should not collect or process sensitive personal data for these purposes and should delete them if employees become aware that we have collected them, except with the approval of the Data Protection Officer given on the basis of an assessment of the requirements of the DPA.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("The DPA's definition of ‘sensitive personal data’ covers personal data consisting of information as to: racial or ethnic origin; political opinions; religious or other similar beliefs; trade union membership; physical or mental health or condition; sexual life; the commission or alleged commission of any offence; or any proceedings for any offence committed or alleged to have been committed, the disposal of such proceedings or the sentence of any court in such proceedings.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),

                    ],
                  ),
                ),



                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("AUTOMATED DECISION-TAKING", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("Whilst we do not use so-called ‘automated decision-taking’ techniques for Customer and/or Transaction Management processes. Employees should not use such techniques except with the approval of the Data Protection Officer given on the basis of an assessment of the requirements of the DPA.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("The DPA's restrictions on the use of ‘automated decision-taking’ cover systems which make decisions which significantly affect individuals solely on the basis of the automated processing of their personal data, without any human intervention", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),

                    ],
                  ),
                ),




                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("REGISTRATION", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("We maintain a registration with the Commissioner's office which covers our processing of personal data for Customer and/or Transaction Management (and other) purposes.", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800),)),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("Employees should keep the Data Protection Officer aware of material changes to the purposes for which we process personal data or, within any given purpose, the categories of personal data that we process, the categories of data subject to whom the data relate, the categories of person to whom we disclose the data or the countries or territories outside the European Economic Area to which we transfer the data, so that they can ensure that the registration is amended accordingly.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),

                    ],
                  ),
                ),



                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("RIGHTS OF ACCESS, DATA CORRECTION AND OBJECTION", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                  child: Text("Data subjects have statutory rights of access to and correction of the personal data that we hold about them. They also have a statutory right to object to our processing of their personal data, including their request to stop processing their data, although only in very limited circumstances. If a data subject attempts to exercise any of these statutory rights employees are required to immediately pass on this information by formal communication to the Data Protection Officer so that they can ensure that we respond appropriately and within the timescale laid down under the DPA. In recording and processing personal data for Customer and/or Transaction Management purposes employees should bear in mind data subjects' rights of access. Employees should not record personal data that employees would not want the data subject to see.", style: TextStyle(fontSize: 17,),)),
                            ],
                          ),
                        ],
                      ),


                    ],
                  ),
                ),




              ],
            ),
          ),
        ),
      ),
    );
  }
}
