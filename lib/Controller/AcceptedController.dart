import 'package:ataba/color/color.dart';
import 'package:ataba/ineed/ineed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AcceptedController extends GetxController {
  List<Map> AllAccepted = [];
  List<String> AcceptedDocId = [];
  void getAccepted() async {
    await FirebaseFirestore.instance.collection('Accepted').get().then((value) {
      value.docs.forEach((element) {
        AllAccepted.add(element.data());
        AcceptedDocId.add(element.id);
      });
    }).then((value) {
      update();
    });
  }

  deletAcspet(String docid) async {
    await FirebaseFirestore.instance
        .collection('Accepted')
        .doc(docid)
        .delete()
        .then((value) {
      Get.defaultDialog(
          backgroundColor: color.postContener,
          title: 'تم الغاء القبول',
          titleStyle: TextStyle(
              fontFamily: 'kufi',
              color: Colors.white,
              fontWeight: FontWeight.bold),
          content: ineed.custmText(data: 'حدث الصفحة لمشاهدة التغيرات'));
    });
  }

  @override
  void onInit() {
    getAccepted();
    super.onInit();
  }
}
