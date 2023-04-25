// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:perfect_app_delivery/models/language.dart';

import 'package:perfect_app_delivery/resources/auth_method.dart';
import 'package:perfect_app_delivery/widgets/big_text.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  static const keyDarkMode = "key-dark-mode";

  @override
  State<SettingPage> createState() => _SettingPageState();
}

String username = "";
String _image = "";
String phone = "";
String email = "";

class _SettingPageState extends State<SettingPage> {
  Future<void> getUserName() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    setState(() {
      username = (snap.data() as Map<String, dynamic>)['username'];
      _image = (snap.data() as Map<String, dynamic>)['photoUrl'];
      email = (snap.data() as Map<String, dynamic>)['email'];
      phone = (snap.data() as Map<String, dynamic>)['phone'];
      // ignore: avoid_print,
    });
  }

  @override
  void initState() {
    super.initState();
    getUserName();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              DropdownButton<Language>(
                icon: Icon(Icons.language),
                onChanged: (Language? language) {},
                items: Language.languageList()
                    .map<DropdownMenuItem<Language>>((e) =>
                        DropdownMenuItem<Language>(
                          value: e,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                e.id.toString(),
                              ),
                              Text(e.name)
                            ],
                          ),
                        ))
                    .toList(),
              )
            ],
          ),
          SizedBox(
            height: 110,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(150),
                    image: DecorationImage(
                        image: NetworkImage(_image), fit: BoxFit.cover)),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                color: Colors.grey[100],
                child: ListTile(
                  title: Text(username),
                  trailing: Icon(Icons.person),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                color: Colors.grey[100],
                child: ListTile(
                  title: Text(phone),
                  trailing: Icon(Icons.phone),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                color: Colors.grey[100],
                child: ListTile(
                  title: Text(email),
                  trailing: Icon(Icons.email),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () => AuthMethod().signOut(),
                child: Container(
                  height: 50,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: BigText(
                      text: "SignOut",
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              // SwitchSettingsTile(
              //   onChange: (isDarkMode) {},
              //   title: "Dark Mode",
              //   settingKey: keyDarkMode,
              //   leading: Icon(Icons.dark_mode),
              // )
            ],
          ),
        ],
      ),
    );
  }
}
