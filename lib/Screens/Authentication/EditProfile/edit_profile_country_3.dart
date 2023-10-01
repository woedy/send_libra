import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:send_libra/Screens/Authentication/EditProfile/edit_profile_id_card_5.dart';
import 'package:send_libra/constants.dart';

class EditProfileCountry extends StatefulWidget {
  final reg_data;
  final profile_data;

  const EditProfileCountry({Key? key, required this.reg_data, required this.profile_data}) : super(key: key);

  @override
  State<EditProfileCountry> createState() => _EditProfileCountryState();
}

class _EditProfileCountryState extends State<EditProfileCountry> {

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

                  children: [

                    Container(
                      height: 190,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/ed_back3.png"),
                          fit: BoxFit.cover
                        )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Now, let's travel a bit!", style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600),),
                          SizedBox(
                            height: 20,
                          ),
                          Text("Where do you hail from? We mean your nationality as on your passport", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),),
                          SizedBox(
                            height: 20,
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
                                      textStyle: TextStyle(color: Colors.black)
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
                      height: 5,
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
                                widget.profile_data['nationality'] = _selectedCountry.name;
                                print(widget.profile_data);
                                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => EditProfileIDCard(reg_data: widget.reg_data, profile_data: widget.profile_data,)));


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
