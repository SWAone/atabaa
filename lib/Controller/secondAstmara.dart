import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:image_picker/image_picker.dart';

import 'package:firebase_storage/firebase_storage.dart';

class secondAstmara extends GetxController {
  GlobalKey<FormState> form = new GlobalKey<FormState>();
  bool lodeing = false;
  String? image, imageUrlToDisply, urll;
  bool loding = false, isTabOnAddImage = false;

  Reference? referenceimageUAplod;
  XFile? file;
  final List<String> items = [
    'بغداد',
    'البصرة',
    'النجف',
    'كربلاء',
    'دهوك',
    'أربيل',
    'السليمانية',
    'نينوى',
    'واسط',
    'صلاح الدين',
    'ديالى',
    'الأنبار',
    'ميسان',
    'ذي قار',
    'بابل',
    'المثنى',
    'القادسية',
    'الديوانية',
    'كركوك',
  ];
  final List<String> study = [
    'يقرأ ويكتب',
    'ابتداىية',
    'متوسطة',
    'اعدادية',
    'دبلوم',
    'دبلوم عالي',
    'بكالوريوس',
    'ماجستير',
    'دكتوراه',
  ];
  final List<String> work = [
    'كاسب',
    'طالب ثانوي',
    'طالب جامعي',
    'موظف حكومي',
    'موظف اهلي',
  ];
  String? selectedValue, selectedStadyValue, selectedWorkValue;
  String? Fname,
      berthdy,
      loction,
      //new
      card,
      //محل الولادة
      born,

      // الاب محل الولادة
      fborn,

      // ا لتومينية
      numberTwmen,
      // ا رقم بطاقة السكن
      sakin,
      // ا رقم بطاقة السكن
      childNumber,
      // ا رقم بطاقة السكن
      mared,
      // ا رقم بطاقة السكن
      qada, // ا رقم بطاقة السكن
      nahea, // ا رقم بطاقة السكن
      stady, // التحصيل الرداسي
      worrk, // التحصيل الرداسي
      mhna, //  المهنة
      lunguth, // المتقنه اللغات

      haay,
      loctionAndwhere,
      phoneNumber,
      didWorkWithatba,
      whayYouuNedTashrf,
      radeyTo40,
      havaTato,
      anySice,
      roulse;
  String? uid;
  @override
  void onInit() async {
    uid = await FirebaseAuth.instance.currentUser!.uid;
    print(uid);
    super.onInit();
  }

  void UplodMotshref() async {
    lodeing = true;
    update();
    if (form.currentState!.validate()) {
      form.currentState!.save();

      await FirebaseFirestore.instance
          .collection('atusers')
          .doc(uid)
          .collection('users')
          .add({
        "Fname": Fname,
        "berthdy": berthdy,
        "cardNumber": card,
        "loction": loction,
        "loctionAndwhere": loctionAndwhere,
        "phoneNumber": phoneNumber,
        "didWorkWithatba": 'لا',
        "whayYouuNedTashrf": whayYouuNedTashrf,
        "radeyTo40": 'نعم',
        "havaTato": 'لا',
        "anySice": 'لا',
        "roulse": 'نعم',
        "need": 0,
        "born": born,
        "fatherborn": fborn,
        "numberTwmen": numberTwmen,
        "sakin": sakin,
        "childNumber": childNumber,
        "mared": mared,
        "qada": qada,
        "nahea": nahea,
        "stady": stady,
        "worrk": worrk,
        "mhna": mhna,
        "lunguth": lunguth,
        "imge": imageUrlToDisply,
      }).then((value) {
        lodeing = false;
        AwesomeDialog(
            context: Get.context!,
            dialogType: DialogType.success,
            animType: AnimType.rightSlide,
            title: 'شكرا لك ',
            desc: 'نجحت الاضافة',
            titleTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 20.sp,
                fontFamily: 'kufi',
                fontWeight: FontWeight.bold),
            descTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 20.sp,
                fontFamily: 'kufi',
                fontWeight: FontWeight.bold))
          ..show();
        update();
      });
    }
  }
}
