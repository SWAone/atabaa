import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class tasherfController extends GetxController {
  GlobalKey<FormState> form = new GlobalKey<FormState>();
  bool lodeing = false;
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
    'لبنان',
    'ايران'
  ];
  String? selectedValue;

  String? Fname,
      berthdy,
      loction,
      loctionAndwhere,
      phoneNumber,
      didWorkWithatba,
      whayYouuNedTashrf,
      radeyTo40,
      havaTato,
      anySice,
      roulse;
  @override
  void onInit() {
    super.onInit();
  }

  void UplodMotshref() async {
    lodeing = true;
    update();
    if (form.currentState!.validate()) {
      form.currentState!.save();

      await FirebaseFirestore.instance.collection('tasherf').add({
        "Fname": Fname,
        "berthdy": berthdy,
        "loction": loction,
        "loctionAndwhere": loctionAndwhere,
        "phoneNumber": phoneNumber,
        "didWorkWithatba": didWorkWithatba,
        "whayYouuNedTashrf": whayYouuNedTashrf,
        "radeyTo40": radeyTo40,
        "havaTato": havaTato,
        "anySice": anySice,
        "roulse": roulse,
        "born": 'طلب خارجي',
        "fatherborn": 'طلب خارجي',
        "numberTwmen": 'طلب خارجي',
        "sakin": 'طلب خارجي',
        "childNumber": 'طلب خارجي',
        "mared": 'طلب خارجي',
        "qada": 'طلب خارجي',
        "nahea": 'طلب خارجي',
        "stady": 'طلب خارجي',
        "worrk": 'طلب خارجي',
        "mhna": 'طلب خارجي',
        "lunguth": 'طلب خارجي',
        "imge": 'طلب خارجي',
        "cardnuber": 'طلب خارجي'
      }).then((value) {
        lodeing = false;
        AwesomeDialog(
            context: Get.context!,
            dialogType: DialogType.success,
            animType: AnimType.rightSlide,
            title: 'شكرا لك ',
            desc: 'تم ارسال طلبك',
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
