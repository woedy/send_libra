import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:send_libra/Screens/Authentication/EditProfile/edit_profile_id_card_5.dart';
import 'package:send_libra/Screens/UserProfile/UpdateProfile/update_user_info2.dart';
import 'package:send_libra/constants.dart';

class UpdateProfileCountry extends StatefulWidget {
  final data;
  final update_data;

  const UpdateProfileCountry({Key? key, required this.data, required this.update_data}) : super(key: key);

  @override
  State<UpdateProfileCountry> createState() => _UpdateProfileCountryState();
}

class _UpdateProfileCountryState extends State<UpdateProfileCountry> {

  var _selectedCountry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5,),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                  /*  Container(
                      height: 190,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/ed_back3.png"),
                          fit: BoxFit.cover
                        )
                      ),
                    ),*/

                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Text.rich(
                          TextSpan(
                            text: "Update",
                            style: TextStyle(fontSize: 75,  ),

                          )
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Let’s help you\nupdate your profile", style: TextStyle(fontSize: 36),),
                          SizedBox(
                            height: 30,
                          ),

                          Text("Select Country", style: TextStyle(fontSize: 12),),
                          SizedBox(
                            height: 10,
                          ),

                          InkWell(
                            onTap: (){
                              showCountryPicker(

                                  context: context,
                                  showPhoneCode: true,
                                  onSelect: (Country country) {
                                    setState(() {
                                      _selectedCountry = country;
                                    });
                                  },
                                  countryListTheme: CountryListThemeData(
                                      textStyle: TextStyle(color: Colors.black),
                                      searchTextStyle: TextStyle(color: Colors.black),

                                  )

                              );
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                //color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: Colors.white.withOpacity(0.1))),
                              child: TextFormField(
                                //controller: searchController,
                                style: TextStyle(color: Colors.white),
                                enabled: false,
                                decoration: InputDecoration(
                                  hintText: 'Search...',

                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.normal),
                                  labelText: "Search...",
                                  suffixIcon: Icon(Icons.search, color: Colors.white,),
                                  labelStyle:
                                  TextStyle(fontSize: 13, color: bodyText2),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: libraPrimary)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: libraPrimary)),
                                  border: InputBorder.none,),

                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(225),
                                  PasteTextInputFormatter(),
                                ],
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    //return 'Verification code is required';
                                  }
                                  if (value.length < 3) {
                                    //return 'Verification code too short';
                                  }

                                  return null;
                                },
                                textInputAction: TextInputAction.next,
                                autofocus: false,
                                onChanged: (value){
                                  setState(() {
                                    //searchQuery = value;
                                  });
                                },
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 10,
                          ),


                          Container(
                            height: 100,
                            //color: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if(_selectedCountry != null)...[
                                  Row(
                                    children: [
                                      Text(_selectedCountry.flagEmoji, style: TextStyle(fontSize: 54, fontWeight: FontWeight.w300),),
                                      SizedBox(
                                        width: 10,
                                      ),

                                      Text(_selectedCountry.name + ' (' + _selectedCountry.countryCode + ')', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),),
                                    ],
                                  ),
                                ]

                              ],
                            ),
                          )




                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    if(_selectedCountry != null)...[
                      Align(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
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
                                widget.update_data['country_of_birth'] = _selectedCountry.name;
                                widget.update_data['country_of_birth'] = _selectedCountry.name;
                                widget.update_data['nationality'] = _selectedCountry.name;
                                print(widget.update_data);
                                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => UpdateUserInfo2Screen(data: widget.data, update_data: widget.update_data,)));


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
                    ]

                  ],
                ),
             



              ],
            ),
          ),
        ),
      ),
    );
  }
}
