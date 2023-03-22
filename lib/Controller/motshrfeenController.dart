import 'package:ataba/view/model/admin.dart';
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
  int visibleItems = 3;
  List<aadminModel> adminspepole = [];
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();

    getMotshrffen();
    getAdmins();
    GetpeopleFormAdminAcuneent(docid: 'IQSDJ7imsGgm7oHUVjYVAlV0ROo1');
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

  void GetpeopleFormAdminAcuneent(
      {String docid = 'IQSDJ7imsGgm7oHUVjYVAlV0ROo1'}) async {
    await FirebaseFirestore.instance
        .collection('atusers')
        .doc(docid)
        .collection('people')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        adminspepole
            .add(aadminModel.jsoin({"d": "d", "dd": "dd"}, element.data()));
      });
    }).then((value) {
      print('============');
      print(adminspepole[0].peopel['name']);
      print(adminspepole[1].peopel['name']);
    });
  }

  void getAdmins() async {
    await FirebaseFirestore.instance
        .collection('atusers')
        .where('rank', isEqualTo: 2)
        .get()
        .then((value) => value.docs.forEach((element) {
              admins.add(element.data());
            }))
        .then((value) {
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
