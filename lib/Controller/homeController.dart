import 'package:ataba/Controller/loginController.dart';
import 'package:ataba/view/auth/signin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_storage/firebase_storage.dart';

class homeController extends GetxController {
  Reference? referenceimageUAplod;
  XFile? file;

  String? title, image, imageUrlToDisply, uid, urll;
  bool loding = false, isTabOnAddImage = false;

  GlobalKey<FormState> form = new GlobalKey<FormState>();
  int rank = 0;
  RxBool shouldReloadPage = false.obs;

  @override
  void onInit() async {
    uid = await FirebaseAuth.instance.currentUser!.uid;
    // FirebaseAuth.instance.signOut();
    super.onInit();

    checkRank();

    await Future.delayed(Duration(seconds: 3));
    shouldReloadPage.value = false;

    print(uid);
  }

  void reloadPage() {
    shouldReloadPage.value = true;
  }

  checkRank() async {
    await FirebaseFirestore.instance
        .collection('atusers')
        .doc(uid)
        .get()
        .then((value) {
      rank = value.data()!['rank'];
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

  Future dielog({required void Function()? btnOkOnPress}) {
    return AwesomeDialog(
      context: Get.context!,
      dialogType: DialogType.info,
      animType: AnimType.rightSlide,
      title: 'هل انت متأكد',
      desc: 'سوف يتم حذف الصورة',
      btnOkOnPress: btnOkOnPress,
      btnCancelOnPress: () {},
      btnCancelText: 'تراجع',
      btnOkText: 'حذف',
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

  //admin
  void delet({required String docId}) async {
    dielog(
      btnOkOnPress: () async {
        await FirebaseFirestore.instance
            .collection('atposts')
            .doc(docId)
            .delete()
            .then((value) {
          update();
        });
      },
    );
  }

  singOt() async {
    await FirebaseAuth.instance.signOut().then((value) {
      Get.off(() => signin());
      update();
    });
  }
}
