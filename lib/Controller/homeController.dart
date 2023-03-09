import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_storage/firebase_storage.dart';

class homeController extends GetxController {
  List<Map> posts = [];
  Reference? referenceimageUAplod;
  XFile? file;
  String? urll;
  String? title, image, imageUrlToDisply;
  bool loding = false, isTabOnAddImage = false;
  GlobalKey<FormState> form = new GlobalKey<FormState>();

  @override
  void onInit() async {
    if (FirebaseAuth.instance.currentUser == null) {
      await FirebaseAuth.instance.signInAnonymously().then((value) {
        print('============');
        print(value.user!.uid);
        FirebaseFirestore.instance
            .collection('atusers')
            .add({'uid': '${value.user!.uid}', 'rank': 0});
      });
    } else {
      print(FirebaseAuth.instance.currentUser!.uid);
    }
    await getPosts();

    super.onInit();
  }

  getPosts() async {
    posts.clear();
    int caunt = 0;
    await FirebaseFirestore.instance.collection('atposts').get().then((value) {
      value.docs.forEach((element) {
        posts.add(element.data());
        posts[caunt]['id'] = element.id;
        caunt++;
      });
    }).then((value) {
      update();
    });
  }

  void addPost() async {
    var st = form.currentState;
    if (st!.validate() && isTabOnAddImage) {
      isTabOnAddImage = false;

      st.save();
      await FirebaseFirestore.instance
          .collection('atposts')
          .add({"title": title, "image": image}).then((value) {
        update();
        getPosts();

        referenceimageUAplod != '';

        update();
        Get.back();
      });
    } else {
      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.info,
        animType: AnimType.rightSlide,
        title: 'انتبه',
        desc: 'يجب اضافة صورة',
        btnOkOnPress: () {},
        btnOkText: 'حسنا',
        titleTextStyle: TextStyle(
            fontFamily: 'kufi',
            fontSize: 20.sp,
            color: Colors.black,
            fontWeight: FontWeight.bold),
        descTextStyle: TextStyle(
            fontFamily: 'kufi',
            fontSize: 20.sp,
            color: Colors.black,
            fontWeight: FontWeight.bold),
        buttonsTextStyle: TextStyle(
            fontFamily: 'kufi',
            fontSize: 20.sp,
            color: Colors.white,
            fontWeight: FontWeight.bold),
      ).show();
    }
  }

  //admin
  void delet({required String docId}) async {
    await FirebaseFirestore.instance
        .collection('atposts')
        .doc(docId)
        .delete()
        .then((value) {
      getPosts();

      update();
    });
  }
}
