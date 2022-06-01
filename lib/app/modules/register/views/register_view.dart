import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: ListView(
          padding: EdgeInsets.all(25),
          children: [
            Hero(
              tag: "Logo",
              child: Container(
                height: 150,
                width: 150,
                child: Image.asset(
                  "assets/images/logo.png",
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Register",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: controller.nameC,
              autocorrect: false,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: "Username",
                hintText: "Masukkan Username",
                contentPadding: EdgeInsets.all(15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                suffixIcon: Icon(
                  CupertinoIcons.person,
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: controller.emailC,
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Email",
                hintText: "Masukkan Email",
                contentPadding: EdgeInsets.all(15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                suffixIcon: Icon(
                  CupertinoIcons.mail,
                ),
              ),
            ),
            SizedBox(height: 10),
            Obx(
              () => TextField(
                controller: controller.passC,
                autocorrect: false,
                obscureText: controller.obsecure.value,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Masukkan password",
                  contentPadding: EdgeInsets.all(15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () => controller.obsecurePass(),
                    icon: Icon(controller.obsecure.isTrue
                        ? CupertinoIcons.eye
                        : CupertinoIcons.eye_slash),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => controller.register(),
              child: Text(
                "Register",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            SizedBox(height: 15),
            TextButton(
              onPressed: () => Get.toNamed(Routes.LOGIN),
              child: Text("Sudah punya akun? Login disini."),
            )
          ],
        ),
      ),
    );
  }
}
