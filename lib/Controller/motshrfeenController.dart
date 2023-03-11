import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class motshrfeenController extends GetxController {
  List<Map> AllMotshrfeen = [];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    getMotshrffen();
  }

  void getMotshrffen() async {
    await FirebaseFirestore.instance.collection('tasherf').get().then((value) {
      value.docs.forEach((element) {
        AllMotshrfeen.add(element.data());
      });
    }).then((value) {
      update();
      AwesomeDialog(
          context: Get.context!,
          dialogType: DialogType.noHeader,
          animType: AnimType.rightSlide,
          title: 'مرحبا',
          desc: 'عدد الطلبات ${AllMotshrfeen.length}',
          titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 20.sp,
              fontFamily: 'kufi',
              fontWeight: FontWeight.bold),
          descTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 20.sp,
              fontFamily: 'kufi',
              fontWeight: FontWeight.bold))
        ..show();
      update();
    });
  }
}
