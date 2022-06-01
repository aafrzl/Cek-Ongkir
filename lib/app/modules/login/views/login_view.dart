import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.all(25),
          children: [
            Hero(
              tag: "Logo",
              child: Container(
                height: 200,
                width: 200,
                child: Image.asset(
                  "assets/images/logo.png",
                ),
              ),
            ),
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
              onPressed: () => controller.login(),
              child: Text(
                "Masuk",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            Divider(height: 10),
            TextButton(
              onPressed: () => Get.toNamed(Routes.REGISTER),
              child: Text("Tidak punya akun? Register disini."),
            ),
            Divider(
              height: 30,
              color: Colors.grey,
            ),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              child: SignInButton(
                Buttons.Google,
                onPressed: () => controller.loginGoogle(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
