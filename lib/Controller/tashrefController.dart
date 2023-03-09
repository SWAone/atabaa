import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class tasherf extends GetxController {
  GlobalKey<FormState> form = new GlobalKey<FormState>();
  bool lodeing = false;
  String? Fname, Lname, Gname, Familyname, berthdy, boren;
  @override
  void onInit() {
    super.onInit();
  }

  void UplodMotshref() async {
    lodeing = !lodeing;
    await FirebaseFirestore.instance.collection('tasherf').add({"": ""});
  }
}
