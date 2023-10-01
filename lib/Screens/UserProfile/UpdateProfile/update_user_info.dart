
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:send_libra/Components/keyboard_utils.dart';
import 'package:send_libra/Screens/Authentication/SignUp/sign_up_user_info2.dart';
import 'package:send_libra/Screens/UserProfile/UpdateProfile/update_email.dart';
import 'package:send_libra/constants.dart';

class UpdateUserInfoScreen extends StatefulWidget {
  final data;
  const UpdateUserInfoScreen({Key? key, required this.data}) : super(key: key);

  @override
  State<UpdateUserInfoScreen> createState() => _UpdateUserInfoScreenState();
}

class _UpdateUserInfoScreenState extends State<UpdateUserInfoScreen> {
  TextEditingController controller = TextEditingController(text: "");

  final _formKey = GlobalKey<FormState>();
  String? first_name;
  String? last_name;
  String? middle_name;

  bool hasError = false;


  @override
  Widget build(BuildContext context) {

    print("####################");
    print("####################");
    print("####################");
    print(widget.data);



    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(

            height: MediaQuery.of(context).size.height,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
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
                              text: "Update",
                              style: TextStyle(fontSize: 75,  ),

                            )
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    flex: 7,
                    child:  SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Let’s help you\nupdate your profile", style: TextStyle(fontSize: 36),),
                              SizedBox(
                                height: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("First Name on ID", style: TextStyle(fontSize: 12),),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                      //color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: Colors.white.withOpacity(0.1))),
                                    child: TextFormField(
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        //hintText: 'Enter Username/Email',

                                        hintStyle: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.normal),
                                        labelText: "First Name",
                                        labelStyle:
                                        TextStyle(fontSize: 13, color: bodyText2),
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: libraPrimary)),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: libraPrimary)),
                                        border: InputBorder.none,),
                                      initialValue: widget.data!.firstname.toString(),
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(225),
                                        PasteTextInputFormatter(),
                                      ],
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'First Name is required';
                                        }
                                        return null;
                                      },
                                      textInputAction: TextInputAction.next,
                                      autofocus: false,
                                      onSaved: (value) {
                                        setState(() {
                                          first_name = value;
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Middle Name on ID", style: TextStyle(fontSize: 12),),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                      //color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: Colors.white.withOpacity(0.1))),
                                    child: TextFormField(
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        //hintText: 'Enter Username/Email',

                                        hintStyle: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.normal),
                                        labelText: "Middle Name",
                                        labelStyle:
                                        TextStyle(fontSize: 13, color: bodyText2),
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: libraPrimary)),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: libraPrimary)),
                                        border: InputBorder.none,),
                                      initialValue: widget.data!.middlename.toString(),
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(225),
                                        PasteTextInputFormatter(),
                                      ],
                                      textInputAction: TextInputAction.next,
                                      autofocus: false,
                                      onSaved: (value) {
                                        setState(() {
                                          middle_name = value;
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Last Name on ID", style: TextStyle(fontSize: 12),),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                      //color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: Colors.white.withOpacity(0.1))),
                                    child: TextFormField(
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        //hintText: 'Enter Username/Email',

                                        hintStyle: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.normal),
                                        labelText: "Last Name",
                                        labelStyle:
                                        TextStyle(fontSize: 13, color: bodyText2),
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: libraPrimary)),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: libraPrimary)),
                                        border: InputBorder.none,),
                                      initialValue: widget.data!.lastname.toString(),

                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(225),
                                        PasteTextInputFormatter(),
                                      ],
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Last Name is required';
                                        }
                                        return null;
                                      },
                                      textInputAction: TextInputAction.next,
                                      autofocus: false,
                                      onSaved: (value) {
                                        setState(() {
                                          last_name = value;
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),


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

                                            if (_formKey.currentState!.validate()) {
                                              _formKey.currentState!.save();
                                              KeyboardUtil.hideKeyboard(context);

                                              var _update_data = {
                                                'firstname':first_name,
                                                'lastname':last_name,
                                                'middlename':middle_name,
                                              };


                                              print("#######################");
                                              print(_update_data);

                                              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => UpdateEmailScreen(data: widget.data, update_data: _update_data,)));

                                            }

                                          },
                                          child: Align(
                                            child: Container(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    "Next",
                                                    style: TextStyle(
                                                        fontSize: 15, color: Colors.white),
                                                  ),
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


                            ],
                          ),
                        ),
                      ),
                    )),



              ],
            ),
          ),
        ),
      ),
    );
  }




}

