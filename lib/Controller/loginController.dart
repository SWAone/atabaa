import 'package:ataba/view/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class loginControllr extends GetxController {
  String? name;
  bool loding = false;
  String? uid1;
  GlobalKey<FormState> st = new GlobalKey<FormState>();

  void newUser() async {
    update();
    //rank 0 = يوزر عادي ليس ادمن
    if (st.currentState!.validate()) {
      loding = true;
      st.currentState!.save();
      await FirebaseAuth.instance.signInAnonymously();

      uid1 = await FirebaseAuth.instance.currentUser!.uid;
      await FirebaseFirestore.instance
          .collection('atusers')
          .doc(uid1)
          .set({"name": name, "rank": 0, "uid": uid1}).then((value) {
        Get.off(() => home());
        loding = false;
      });
    }
  }
}
