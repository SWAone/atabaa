import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class secondAstmara extends GetxController {
  GlobalKey<FormState> form = new GlobalKey<FormState>();
  bool lodeing = false;

  String? Fname,
      berthdy,
      loction,
      loctionAndwhere,
      phoneNumber,
      didWorkWithatba,
      whayYouuNedTashrf,
      radeyTo40,
      havaTato,
      anySice,
      roulse;
  String? uid;
  @override
  void onInit() async {
    uid = await FirebaseAuth.instance.currentUser!.uid;
    print(uid);
    super.onInit();
  }

  void UplodMotshref() async {
    lodeing = true;
    update();
    if (form.currentState!.validate()) {
      form.currentState!.save();

      await FirebaseFirestore.instance
          .collection('atusers')
          .doc(uid)
          .collection('users')
          .add({
        "Fname": Fname,
        "berthdy": berthdy,
        "loction": loction,
        "loctionAndwhere": loctionAndwhere,
        "phoneNumber": phoneNumber,
        "didWorkWithatba": didWorkWithatba,
        "whayYouuNedTashrf": whayYouuNedTashrf,
        "radeyTo40": radeyTo40,
        "havaTato": havaTato,
        "anySice": anySice,
        "roulse": roulse,
        "need": 0
      }).then((value) {
        lodeing = false;
        AwesomeDialog(
            context: Get.context!,
            dialogType: DialogType.success,
            animType: AnimType.rightSlide,
            title: 'شكرا لك ',
            desc: 'نجحت الاضافة',
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
}
