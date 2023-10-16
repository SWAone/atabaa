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
    'ايران',
    'لبنان',
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
  final List<String> mosamaTandemi = [
    'منتسب',
    'المعاون الاداري لرئيس المجموعة',
    'المعاون الفني لرئيس المجموعة',
    'معاون رئيس قسم',
    'رئيس مجموعة',
    'رئيس قسم',
    'المعاون الاداري لرئيس الفرع',
    'المعاون الفني لرئيس الفرع',
    'رئيس فرع',
    'المعاون الاداري لرئيس المؤسسة',
    'المعاون الفني لرئيس المؤسسة',
    'رئيس المؤسسة',
    'الامين العام',
  ];
  final List<String> work = [
    'كاسب',
    'طالب ثانوي',
    'طالب جامعي',
    'موظف حكومي',
    'موظف اهلي',
  ];
  final List<String> maredList = [
    'اعزب / عزباء',
    ' متزوج / متزوجة',
    ' ارمل / ارملة',
    ' مطلق / مطلقة',
  ];
  String? selectedValue,
      selectedStadyValue,
      selectedWorkValue,
      mosamaTandemiValue,
      selectedMaredValue;
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
      //المساهمات

      //اللقب
      familyName,
      mosama,
      moaref,
      join,
      roulse;

  int contributions = 0;

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
        "contributions": 0,
        "familyName": familyName,
        "mosama": mosama,
        "moaref": moaref,
        "join": join,
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
