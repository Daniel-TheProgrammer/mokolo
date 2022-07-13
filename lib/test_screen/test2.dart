// ignore: depend_on_referenced_packages
import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';

class EditPro extends StatefulWidget {
  const EditPro({Key? key}) : super(key: key);

  @override
  EditProState createState() => EditProState();
}

class EditProState extends State<EditPro> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit profile', style: TextStyle(fontSize: 18.0)),
        leading: const Icon(Icons.arrow_back_sharp),
        elevation: 0,
      ),
      body: const editProfile(),
    );
  }
}

class editProfile extends StatefulWidget {
  const editProfile({Key? key}) : super(key: key);

  @override
  State<editProfile> createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  String? countryValue;
  String? stateValue;
  String? cityValue;
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 0,
            child: Container(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 27),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'What do people call you?',
                        contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                        labelText: 'Username',
                        // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)))
                      ),
                      onSaved: (String? value) {
                        // This optional block of code can be used to run
                        // code when the user saves the form.
                      },
                      validator: (String? value) {
                        return (value != null && value.contains('@'))
                            ? 'Do not use the @ char.'
                            : null;
                      },
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'What do people call you?',
                        contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                        labelText: 'Full name',
                        // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)))
                      ),
                      onSaved: (String? value) {
                        // This optional block of code can be used to run
                        // code when the user saves the form.
                      },
                      validator: (String? value) {
                        return (value != null && value.contains('@'))
                            ? 'Do not use the @ char.'
                            : null;
                      },
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    SelectState(
                      // style: TextStyle(color: Colors.red),
                      onCountryChanged: (value) {
                        setState(() {
                          countryValue = value;
                        });
                      },
                      onStateChanged: (value) {
                        setState(() {
                          stateValue = value;
                        });
                      },
                      onCityChanged: (value) {
                        setState(() {
                          cityValue = value;
                        });
                      },
                    ),
                    CountryListPick(
                      appBar: AppBar(
                        backgroundColor: Colors.amber,
                        title: const Text('Pick your country'),
                      ),
                      theme: CountryTheme(
                        isShowFlag: true,
                        isShowTitle: false,
                        isShowCode: true,
                        isDownIcon: true,
                        showEnglishName: false,
                        labelColor: Colors.blueAccent,
                      ),
                      initialSelection: '+237',
                      // or
                      // initialSelection: 'US'
                      onChanged: (CountryCode? code) {
                        print(code);
                        // print(code.code);
                        // print(code.dialCode);
                        // print(code.flagUri);
                      },
                    ),
                  ],
                )),
          ),
          Expanded(
            flex: 0,
            child: Container(child: Text('text2')),
          )
        ]);
  }
}
