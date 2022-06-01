import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ongkirapp/app/modules/home/views/widgets/berat.dart';
import 'package:ongkirapp/app/modules/home/views/widgets/city.dart';
import 'package:ongkirapp/app/modules/home/views/widgets/province.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.all(20),
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
            Provinsi(tipe: "asal"),
            Obx(
              () => controller.hiddenKotaAsal.isTrue
                  ? SizedBox()
                  : Kota(
                      provId: controller.provAsalId.value,
                      tipe: "asal",
                    ),
            ),
            Provinsi(tipe: "tujuan"),
            Obx(
              () => controller.hiddenKotaTujuan.isTrue
                  ? SizedBox()
                  : Kota(
                      provId: controller.provTujuanId.value,
                      tipe: "tujuan",
                    ),
            ),
            BeratBarang(),
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: DropdownSearch<Map<String, dynamic>>(
                mode: Mode.DIALOG,
                showClearButton: true,
                items: [
                  {
                    "code": "jne",
                    "name": "JNE",
                  },
                  {
                    "code": "tiki",
                    "name": "TIKI",
                  },
                  {
                    "code": "pos",
                    "name": "POS",
                  },
                ],
                label: "Pilih Kurir",
                onChanged: (value) {
                  if (value != null) {
                    controller.kurir.value = value["code"];
                    controller.showButton();
                  } else {
                    controller.hiddenButton.value = true;
                    controller.kurir.value = "";
                  }
                },
                itemAsString: (item) => "${item['name']}",
                popupItemBuilder: (context, item, isSelected) => Container(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "${item['name']}",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            Obx(
              () => controller.hiddenButton.isTrue
                  ? SizedBox()
                  : ElevatedButton(
                      onPressed: () => controller.ongkosKirim(),
                      child: Text("Cek Ongkir"),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.redAccent,
                        padding: EdgeInsets.symmetric(
                          vertical: 20,
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
