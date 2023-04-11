import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class motshrfeenController extends GetxController {
  List<Map> AllMotshrfeen = [];
  List<Map> admins = [];
  List<String> adminsDicid = [];
  List<String> admonId = [];
  String? uid;
  List<String> usersdoicId = [];
  int visibleItems = 0;
  List<Map> adminspepole = [];
  @override
  void onInit() async {
    super.onInit();

    getMotshrffen();
    getAdmins();
    uid = await FirebaseAuth.instance.currentUser!.uid;
  }

  void getMotshrffen() async {
    await FirebaseFirestore.instance.collection('tasherf').get().then((value) {
      value.docs.forEach((element) {
        AllMotshrfeen.add(element.data());
      });
    }).then((value) {
      update();
    });
  }

  void getAdmins() async {
    await FirebaseFirestore.instance
        .collection('atusers')
        .where('rank', isEqualTo: 2)
        .get()
        .then((value) => value.docs.forEach((element) {
              admins.add(element.data());

              adminsDicid.add(element.id);
            }))
        .then((value) {
      update();
    });
  }

  void getAdminpepols({required String docid}) async {
    usersdoicId.clear();
    adminspepole.clear();
    await FirebaseFirestore.instance
        .collection('atusers')
        .doc(docid)
        .collection('users')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        adminspepole.add(element.data());
        usersdoicId.add(element.id);
      });
    }).then((value) {
      update();
    });
  }

  void showMore() {
    if (visibleItems < AllMotshrfeen.length &&
        visibleItems + 5 < AllMotshrfeen.length) {
      visibleItems += 5;
    } else {
      visibleItems = AllMotshrfeen.length;
    }

    update();
  }

  void DleateUserOnTap({required String docid}) async {
    await FirebaseFirestore.instance
        .collection('atusers')
        .doc(uid)
        .collection('users')
        .doc(docid
            //
            )
        .update({'need': 0}).then((value) {
      Get.defaultDialog(
          title: 'تم الغاء الرفع',
          content: Text('حدث الصفحة لمشاهدة التغيرات'));
      update();
    });
  }

  void dleatAdmin({required String docid}) {
    AwesomeDialog(
      descTextStyle: TextStyle(
          fontSize: 15.sp, fontWeight: FontWeight.bold, fontFamily: 'kufi'),
      titleTextStyle: TextStyle(
          fontSize: 15.sp, fontWeight: FontWeight.bold, fontFamily: 'kufi'),
      context: Get.context!,
      dialogType: DialogType.info,
      animType: AnimType.rightSlide,
      title: 'هل انت متاكد',
      desc: 'سوف يتم الغاء الترقية',
      btnCancelText: 'الغاء',
      btnOkText: 'حسنا',
      buttonsTextStyle: TextStyle(
          fontSize: 15.sp, fontWeight: FontWeight.bold, fontFamily: 'kufi'),
      btnCancelOnPress: () {},
      btnOkOnPress: () async {
        await FirebaseFirestore.instance
            .collection('atusers')
            .doc(docid)
            .update({"rank": 99}).then((value) {
          AwesomeDialog(
            descTextStyle: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                fontFamily: 'kufi'),
            titleTextStyle: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                fontFamily: 'kufi'),
            context: Get.context!,
            dialogType: DialogType.success,
            animType: AnimType.rightSlide,
            title: ' تم الغاء الترقية',
            desc: 'اعد تشغيل التطبيق لمشاهدة التغيرات',
            btnOkText: 'حسنا',
            buttonsTextStyle: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                fontFamily: 'kufi'),
            btnOkOnPress: () {},
          )..show();
        });
      },
    )..show();
  }
}
