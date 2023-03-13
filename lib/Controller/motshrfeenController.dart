import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class motshrfeenController extends GetxController {
  List<Map> AllMotshrfeen = [];
  int visibleItems = 3;

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
}
