import 'package:ataba/color/color.dart';
import 'package:ataba/ineed/ineed.dart';
import 'package:ataba/view/auth/newAcuont.dart';
import 'package:ataba/view/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class newAcuontController extends GetxController {
  GlobalKey<FormState> st = new GlobalKey<FormState>();
  String email = '', pass = '', name = '', loction = '';
  bool loding = false;
  bool lodingimag = false;

  GlobalKey<FormState> form = new GlobalKey<FormState>();
  bool lodeing = false;
  String? image, imageUrlToDisply, urll;
  bool isTabOnAddImage = false;

  Reference? referenceimageUAplod;
  XFile? file;
  @override
  void onInit() {
    super.onInit();
  }

  void newAcuont() async {
    if (st.currentState!.validate()) {
      st.currentState!.save();
      loding = true;
      update();
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: email + '@1.1', password: pass)
            .then((value) async {
          String uid1 = await FirebaseAuth.instance.currentUser!.uid;
          await FirebaseFirestore.instance.collection('atusers').doc(uid1).set({
            "name": name,
            "rank": 2,
            "uid": uid1,
            "loction": loction,
            "img": imageUrlToDisply
          }).then((value) {
            loding = false;
            Get.defaultDialog(
                backgroundColor: color.postContener,
                title: 'تم انشاء الحساب',
                titleStyle: TextStyle(fontFamily: 'kufi', color: Colors.white),
                content: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ineed.custmText(
                      data:
                          'لقد تم تسجيل خروجك من حساب الادمن اعد تسجيل الدخول من جديد',
                      color: Colors.white),
                ));

            update();
          });
        });
      } on FirebaseAuthException catch (e) {
        loding = false;
        update();
        Get.defaultDialog(title: 'حدث خطا', content: Text(e.code));
      }
    }
  }
}
