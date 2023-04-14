import 'package:ataba/color/color.dart';
import 'package:ataba/ineed/ineed.dart';
import 'package:ataba/view/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restart_app/restart_app.dart';

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
      update();
      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email + '@1.1', password: pass)
            .then((value) {
          loding = false;
          update();
          Get.offAll(() => home());

          Get.defaultDialog(
              backgroundColor: color.postContener,
              title: 'يجب اعادة تشغيل التطبيق',
              titleStyle: TextStyle(
                  fontFamily: 'kufi',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              content: TextButton(
                  onPressed: () {
                    Restart.restartApp();
                  },
                  child: ineed.custmText(data: ' اضغط هنا')));
        });
      } on FirebaseAuthException catch (e) {
        loding = false;
        update();
        Get.defaultDialog(title: 'حدث خطا', content: Text(e.code));
      }
    }
  }
}
