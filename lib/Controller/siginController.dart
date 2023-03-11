import 'package:ataba/view/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class siginController extends GetxController {
  GlobalKey<FormState> st = new GlobalKey<FormState>();
  String email = '', pass = '';
  bool loding = false;

  @override
  void onInit() {
    super.onInit();
  }

  void sing() async {
    if (st.currentState!.validate()) {
      st.currentState!.save();
      loding = true;
      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: pass)
            .then((value) {
          loding = false;
          update();
          Get.offAll(() => home());
        });
      } on FirebaseAuthException catch (e) {
        loding = false;
        update();
        Get.defaultDialog(title: 'حدث خطا', content: Text(e.code));
      }
    }
  }
}
