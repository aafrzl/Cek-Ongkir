import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profil_controller.dart';

class ProfilView extends GetView<ProfilController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: controller.streamUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.yellowAccent,
              ),
            );
          }
          if (snapshot.hasData && snapshot.data!.exists) {
            Map<String, dynamic> user =
                snapshot.data!.data() as Map<String, dynamic>;
            String defaultImages =
                "https://ui-avatars.com/api/?name=${user['name'].toString()}";
            return Center(
              child: ListView(
                padding: EdgeInsets.all(30),
                children: [
                  Text(
                    'About Me',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipOval(
                        child: Container(
                          width: 100,
                          height: 100,
                          child: Image.network(
                            user["photoUrl"] != null && user["photoUrl"] != ""
                                ? user["photoUrl"]
                                : defaultImages,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                  ListTile(
                    tileColor: Colors.white,
                    leading: Icon(
                      CupertinoIcons.person,
                      color: Colors.black,
                    ),
                    title: Text(
                      "${user["name"].toString().toUpperCase()}",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    tileColor: Colors.white,
                    leading: Icon(
                      CupertinoIcons.mail,
                      color: Colors.black,
                    ),
                    title: Text(
                      "${user["email"]}",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: 120),
                    child: ElevatedButton(
                      child: Text(
                        "Logout",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      onPressed: () {
                        controller.logout();
                      },
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: Text("Tidak dapat mengambil data User"),
            );
          }
        },
      ),
    );
  }
}
