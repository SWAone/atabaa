import 'dart:math';

import 'package:ataba/Controller/homeController.dart';
import 'package:ataba/Controller/motshrfeenController.dart';
import 'package:ataba/ineed/ineed.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class motshref_info extends StatelessWidget {
  String? userdocId;

  homeController ss = Get.put(homeController());
  motshrfeenController sss = Get.put(motshrfeenController());
  int contributions;
  String? Fname,
      berthdy,
      loction,
      fborn,
      loctionAndwhere,
      phoneNumber,
      didWorkWithatba,
      whayYouuNedTashrf,
      radeyTo40,
      havaTato,
      anySice,
      roulse,
      born,
      cardd,
      sakin,
      childNumber,
      mared,
      qada,
      numberTwmen,
      nahea,
      stady,
      worrk,
      mhna,
      lunguth,
      imageUrlToDisply;

  String? mosma, famlyName, moaref, join, doic;
  int need;

  motshref_info({
    super.key,
    required this.contributions,
    required this.need,
    required this.cardd,
    required this.Fname,
    required this.berthdy,
    required this.loction,
    required this.loctionAndwhere,
    required this.phoneNumber,
    required this.didWorkWithatba,
    required this.whayYouuNedTashrf,
    required this.radeyTo40,
    required this.havaTato,
    required this.anySice,
    required this.roulse,
    required this.doic,
    required this.born,
    required this.fborn,
    required this.numberTwmen,
    required this.sakin,
    required this.childNumber,
    required this.mared,
    required this.qada,
    required this.nahea,
    required this.stady,
    required this.worrk,
    required this.mhna,
    required this.lunguth,
    required this.imageUrlToDisply,
    required this.mosma,
    required this.moaref,
    required this.join,
    required this.famlyName,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
          child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/aa.jpg'),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 25.sp,
                        )),
                  ),
                  Center(
                    child: ineed.custmText(
                        data: '$Fname', fontSize: 20.sp, isbold: true),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                      width: 100.w,
                      height: 100.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: imageUrlToDisply!.length > 10
                          ? Image.network('$imageUrlToDisply')
                          : Image.asset('assets/images/bac.png')),

                  SizedBox(
                    height: 10.h,
                  ),
                  infoContener(data: '$berthdy', title: 'المواليد'),
                  SizedBox(
                    height: 10.h,
                  ),
                  infoContener(data: '$phoneNumber', title: 'رقم الهاتف'),
                  SizedBox(
                    height: 10.h,
                  ),
                  infoContener(data: '$anySice', title: 'هل لديك مرض مزمن'),
                  SizedBox(
                    height: 10.h,
                  ),
                  infoContener(
                      data: ' $didWorkWithatba ',
                      title: ''''هل سبق ان خدمت في العتبات المقدسة ؟
'''),
                  SizedBox(
                    height: 10.h,
                  ),
                  infoContener(data: '$havaTato', title: 'هل لديك وشم ضاهر '),
                  SizedBox(
                    height: 10.h,
                  ),
                  infoContener(data: '$loction', title: 'المحافظة'),
                  SizedBox(
                    height: 10.h,
                  ),
                  infoContener(
                      data: '$loctionAndwhere', title: 'اقرب نقطة دالة'),
                  SizedBox(
                    height: 10.h,
                  ),
                  infoContener(
                      data: '$whayYouuNedTashrf',
                      title: 'ما سبب طلبك التشرف للخدمة في العتبات المقدسة ؟'),
                  SizedBox(
                    height: 10.h,
                  ),
                  infoContener(
                      data: '$roulse',
                      title: 'هل تستطيع الالتزام بتعليمات الخدمة'),
                  SizedBox(
                    height: 10.h,
                  ),
                  infoContener(
                      data: '$radeyTo40',
                      title: 'هل لديك استعداد للخدمة في الزيارة الاربعينية ؟ '),
                  SizedBox(
                    height: 10.h,
                  ),
                  infoContener(data: '$cardd', title: 'رقم هوية الاحوال'),
                  SizedBox(
                    height: 10.h,
                  ),
                  infoContener(data: '$born', title: 'محل الولادة'),
                  SizedBox(
                    height: 10.h,
                  ),
                  //
                  infoContener(data: '$fborn', title: 'محل ولادة الاب'),
                  SizedBox(
                    height: 10.h,
                  ),
                  infoContener(
                      data: '$numberTwmen', title: 'رقم البطاقة التومنية'),
                  SizedBox(
                    height: 10.h,
                  ),
                  infoContener(data: '$sakin', title: 'رقم بطاقة السكن'),
                  SizedBox(
                    height: 10.h,
                  ),
                  infoContener(data: '$mared', title: 'الحالة الزوجية'),
                  SizedBox(
                    height: 10.h,
                  ),
                  infoContener(data: '$moaref', title: 'اسم المعرف الثلاثي'),
                  SizedBox(
                    height: 10.h,
                  ),
                  infoContener(data: '$famlyName', title: 'اللقب'),
                  SizedBox(
                    height: 10.h,
                  ),
                  infoContener(data: '$mosma', title: 'المسمى التنظيمي'),
                  SizedBox(
                    height: 10.h,
                  ),
                  infoContener(data: '$join', title: 'تاريخ الانتساب للمؤسسة'),
                  SizedBox(
                    height: 10.h,
                  ),
                  infoContener(data: '$childNumber', title: ' عدد الاولاد'),
                  SizedBox(
                    height: 10.h,
                  ),
                  infoContener(data: '$qada', title: 'القضاء'),
                  SizedBox(
                    height: 10.h,
                  ),
                  infoContener(data: '$nahea', title: ' الناحية'),
                  SizedBox(
                    height: 10.h,
                  ),
                  infoContener(data: '$mhna', title: 'المهنة'),
                  SizedBox(
                    height: 10.h,
                  ),
                  infoContener(data: '$stady', title: 'التحصيل الدراسي'),
                  SizedBox(
                    height: 10.h,
                  ),
                  infoContener(data: '$worrk', title: 'العمل'),
                  SizedBox(
                    height: 10.h,
                  ),
                  infoContener(data: '$lunguth', title: 'اللغات '),
                  SizedBox(
                    height: 10.h,
                  ),
                  infoContener(data: '$mhna', title: 'المهنة'),
                  SizedBox(
                    height: 10.h,
                  ),

                  ss.rank == 2
                      ? Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Container(
                              width: double.infinity,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.green),
                              child: TextButton(
                                  onPressed: () async {
                                    int contributions = 0;

                                    String uid = await FirebaseAuth
                                        .instance.currentUser!.uid;
                                    await FirebaseFirestore.instance
                                        .collection('atusers')
                                        .doc(uid)
                                        .collection('users')
                                        .doc(doic
                                            //
                                            )
                                        .get()
                                        .then((value) => contributions =
                                            value.data()!['contributions']);

                                    await FirebaseFirestore.instance
                                        .collection('atusers')
                                        .doc(uid)
                                        .collection('users')
                                        .doc(doic)
                                        .update({
                                      'need': 11,
                                      'contributions': contributions + 1
                                    }).then((value) {
                                      Get.defaultDialog(
                                          title:
                                              'تم رفع المستخدم وزيادة عدد الزيارات التي شارك بها',
                                          content: Text(
                                              'حدث الصفحة لمشاهدة التغيرات'));
                                    });
                                  },
                                  child: ineed.custmText(
                                    data: need == 0
                                        ? 'رفع'
                                        : 'رفع من جديد لزيارة اخرى ؟',
                                    isbold: true,
                                    fontSize: 15.sp,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        )
                      : Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Container(
                              width: double.infinity,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.green),
                              child: TextButton(
                                  onPressed: () async {
                                    await FirebaseFirestore.instance
                                        .collection('Accepted')
                                        .add({
                                      "Fname": Fname,
                                      "berthdy": berthdy,
                                      "loction": loction,
                                      "loctionAndwhere": loctionAndwhere,
                                      "phoneNumber": phoneNumber,
                                      "didWorkWithatba": didWorkWithatba,
                                      "whayYouuNedTashrf,": whayYouuNedTashrf,
                                      "radeyTo40": radeyTo40,
                                      "havaTato": havaTato,
                                      "anySice": anySice,
                                      "roulse": roulse,
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
                                      "cardnuber": cardd,
                                      "imge": imageUrlToDisply,
                                      "contributions": contributions,
                                      "mosma": mosma,
                                      "famlyName": famlyName,
                                      "join": join,
                                      "moaref": moaref,
                                    }).then((value) {
                                      AwesomeDialog(
                                        context: context,
                                        dialogType: DialogType.success,
                                        animType: AnimType.rightSlide,
                                        title: 'نجح',
                                        desc: 'تم قبول المنتسب',
                                        btnOkOnPress: () {},
                                      )..show();
                                    });
                                  },
                                  child: ineed.custmText(
                                    data: 'قبول',
                                    isbold: true,
                                    fontSize: 15.sp,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        ),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }

  Widget infoContener({required String title, required String data}) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(3)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            child: ineed.custmText(data: ' $title   ', fontSize: 16.sp),
          ),
          SizedBox(
            width: 5.w,
          ),
          Container(
            width: 240.w,
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: ineed.custmText(
                data: data,
                fontSize: 20.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
