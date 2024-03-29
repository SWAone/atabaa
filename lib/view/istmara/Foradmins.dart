import 'dart:io';

import 'package:ataba/Controller/homeController.dart';
import 'package:ataba/Controller/motshrfeenController.dart';
import 'package:ataba/Controller/secondAstmara.dart';
import 'package:ataba/Controller/tashrefController.dart';
import 'package:ataba/color/color.dart';
import 'package:ataba/ineed/ineed.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class Foradmins extends StatelessWidget {
  Foradmins({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Directionality(
      textDirection: TextDirection.rtl,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            child: Image(
              image: AssetImage('assets/images/aa.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: GetBuilder<secondAstmara>(
              init: secondAstmara(),
              builder: (cc) {
                return Form(
                  key: cc.form,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
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
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: color.postContener),
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10.h,
                                ),
                                ineed.custmText(
                                    data: 'استمارة الانتساب الالكترونية',
                                    isbold: true,
                                    fontSize: 15.sp),
                                SizedBox(
                                  height: 10.h,
                                ),
                                InkWell(
                                    onTap: () async {
                                      cc.isTabOnAddImage = true;
                                      cc.update();
                                      ImagePicker imagePicker = ImagePicker();
                                      cc.file = await imagePicker.pickImage(
                                          imageQuality: 50,
                                          source: ImageSource.gallery);

                                      if (cc.file == null) return;
                                      String UineqFileNmaw = DateTime.now()
                                          .microsecondsSinceEpoch
                                          .toString();
                                      Reference referenceRote =
                                          FirebaseStorage.instance.ref();
                                      Reference referenceDirimage =
                                          referenceRote.child('users');
                                      cc.referenceimageUAplod =
                                          referenceDirimage
                                              .child(UineqFileNmaw);
                                      try {
                                        await cc.referenceimageUAplod!
                                            .putFile(File(cc.file!.path))
                                            .then((p0) {
                                          cc.isTabOnAddImage = true;
                                          cc.loding = true;

                                          cc.update();
                                        });
                                        if (imagePicker != null) {
                                          cc.image = cc.imageUrlToDisply =
                                              await cc.referenceimageUAplod!
                                                  .getDownloadURL();
                                          cc.update();
                                        }
                                      } catch (e) {}
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: color.postContener,
                                            border: Border.all(
                                                color: Colors.white)),
                                        width: 200.w,
                                        height: 100.h,
                                        child: Center(
                                            child: cc.loding == false
                                                ? Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      ineed.custmText(
                                                          data: cc.isTabOnAddImage
                                                              ? 'جار التحميل ...'
                                                              : 'اضافة صورة'),
                                                      SizedBox(
                                                        width: 5.w,
                                                      ),
                                                      Icon(
                                                        Icons
                                                            .camera_alt_outlined,
                                                        color: Colors.white,
                                                        size: 20.sp,
                                                      ),
                                                    ],
                                                  )
                                                : cc.imageUrlToDisply != null &&
                                                        cc.isTabOnAddImage
                                                    ? Image(
                                                        fit: BoxFit.cover,
                                                        image: NetworkImage(
                                                            '${cc.imageUrlToDisply}'))
                                                    : Text('WS')))),
                                SizedBox(
                                  height: 10.h,
                                ),
                                ineed.custemTextForm(
                                  lable: 'الاسم الثلاثي',
                                  onSaved: (p0) {
                                    cc.Fname = p0;
                                  },
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                ineed.custemTextForm(
                                  lable: 'اللقب',
                                  onSaved: (p0) {
                                    cc.familyName = p0;
                                  },
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                ineed.custemTextForm(
                                  lable: 'المواليد',
                                  onSaved: (p0) {
                                    cc.berthdy = p0;
                                  },
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                ineed.custemTextForm(
                                  lable:
                                      'رقم هوية الاحوال المدنية او البطاقة الوطنية',
                                  onSaved: (p0) {
                                    cc.card = p0;
                                  },
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                ineed.custemTextForm(
                                  lable: 'محل الولادة',
                                  onSaved: (p0) {
                                    cc.born = p0;
                                  },
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                ineed.custemTextForm(
                                  lable: 'محل ولادة الاب',
                                  onSaved: (p0) {
                                    cc.fborn = p0;
                                  },
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                ineed.custemTextForm(
                                  lable: 'رقم البطاقة التموينية',
                                  onSaved: (p0) {
                                    cc.numberTwmen = p0;
                                  },
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                ineed.custemTextForm(
                                  lable: 'رقم بطاقة السكن',
                                  onSaved: (p0) {
                                    cc.sakin = p0;
                                  },
                                ),
                                ineed.custemTextForm(
                                  lable: 'عدد الاولاد',
                                  onSaved: (p0) {
                                    cc.childNumber = p0;
                                  },
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                //
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 3),
                                  child: Container(
                                    width: double.infinity,
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton2(
                                        hint: Text(
                                          'الحالة الزوجية',
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              color: Colors.white,
                                              fontFamily: 'kufi'),
                                        ),
                                        items: cc.maredList
                                            .map((item) =>
                                                DropdownMenuItem<String>(
                                                  value: item,
                                                  child: Text(
                                                    item,
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ))
                                            .toList(),
                                        value: cc.selectedMaredValue,
                                        onChanged: (value) {
                                          cc.update();
                                          cc.selectedMaredValue =
                                              value as String;
                                          cc.selectedMaredValue != null
                                              ? cc.mared = cc.selectedMaredValue
                                              : cc.mared = 'اعزب';
                                        },
                                        buttonStyleData: const ButtonStyleData(
                                          height: 40,
                                          width: 140,
                                        ),
                                        menuItemStyleData:
                                            const MenuItemStyleData(
                                          height: 40,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                //
                                SizedBox(
                                  height: 10.h,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 3),
                                  child: Container(
                                    width: double.infinity,
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton2(
                                        hint: Text(
                                          'المحافظة',
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              color: Colors.white,
                                              fontFamily: 'kufi'),
                                        ),
                                        items: cc.items
                                            .map((item) =>
                                                DropdownMenuItem<String>(
                                                  value: item,
                                                  child: Text(
                                                    item,
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ))
                                            .toList(),
                                        value: cc.selectedValue,
                                        onChanged: (value) {
                                          cc.update();
                                          cc.selectedValue = value as String;
                                          cc.selectedValue != null
                                              ? cc.loction = cc.selectedValue
                                              : cc.loction = 'بغداد';
                                        },
                                        buttonStyleData: const ButtonStyleData(
                                          height: 40,
                                          width: 140,
                                        ),
                                        menuItemStyleData:
                                            const MenuItemStyleData(
                                          height: 40,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                ineed.custemTextForm(
                                  lable: 'القضاء',
                                  onSaved: (p0) {
                                    cc.qada = p0;
                                  },
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                ineed.custemTextForm(
                                  lable: 'الناحية',
                                  onSaved: (p0) {
                                    cc.nahea = p0;
                                  },
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                ineed.custemTextForm(
                                  lable: 'المنطقة او الحي',
                                  onSaved: (p0) {
                                    cc.haay = p0;
                                  },
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                ineed.custemTextForm(
                                  lable: ' اقرب نقطة دالة',
                                  onSaved: (p0) {
                                    cc.loctionAndwhere = p0;
                                  },
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                ineed.custemTextForm(
                                  lable: 'رقم الهاتف',
                                  onSaved: (p0) {
                                    cc.phoneNumber = p0;
                                  },
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Container(
                                  width: double.infinity,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ineed.custmText(
                                          data:
                                              'سبق وان خدمت في العتبات المقدسة؟'),
                                      ToggleSwitch(
                                        minWidth: 50.0,
                                        cornerRadius: 20.0,
                                        activeBgColors: [
                                          [Colors.green[800]!],
                                          [Colors.red[800]!]
                                        ],
                                        activeFgColor: Colors.white,
                                        inactiveBgColor: Colors.grey,
                                        inactiveFgColor: Colors.white,
                                        initialLabelIndex: 1,
                                        totalSwitches: 2,
                                        labels: ['نعم', 'لا'],
                                        radiusStyle: true,
                                        onToggle: (index) {
                                          index == 1
                                              ? cc.didWorkWithatba = 'لا'
                                              : cc.didWorkWithatba = 'نعم';
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                ineed.custemTextForm(
                                  lable: ''' ما سبب طلبك التشرف للخدمة ؟ ''',
                                  onSaved: (p0) {
                                    cc.whayYouuNedTashrf = p0;
                                  },
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Container(
                                  width: double.infinity,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ineed.custmText(
                                          data:
                                              'لديك استعداد للخدمة في الاربعينية؟'),
                                      ToggleSwitch(
                                        minWidth: 50.0,
                                        cornerRadius: 20.0,
                                        activeBgColors: [
                                          [Colors.green[800]!],
                                          [Colors.red[800]!]
                                        ],
                                        activeFgColor: Colors.white,
                                        inactiveBgColor: Colors.grey,
                                        inactiveFgColor: Colors.white,
                                        initialLabelIndex: 1,
                                        totalSwitches: 2,
                                        labels: ['نعم', 'لا'],
                                        radiusStyle: true,
                                        onToggle: (index) {
                                          index == 1
                                              ? cc.radeyTo40 = 'لا'
                                              : cc.radeyTo40 = 'نعم';
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Container(
                                  width: double.infinity,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ineed.custmText(
                                          data: 'هل لديك وشم ظاهر على جسدك '),
                                      ToggleSwitch(
                                        minWidth: 50.0,
                                        cornerRadius: 20.0,
                                        activeBgColors: [
                                          [Colors.green[800]!],
                                          [Colors.red[800]!]
                                        ],
                                        activeFgColor: Colors.white,
                                        inactiveBgColor: Colors.grey,
                                        inactiveFgColor: Colors.white,
                                        initialLabelIndex: 1,
                                        totalSwitches: 2,
                                        labels: ['نعم', 'لا'],
                                        radiusStyle: true,
                                        onToggle: (index) {
                                          index == 1
                                              ? cc.havaTato = 'لا'
                                              : cc.havaTato = 'نعم';
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Container(
                                  width: double.infinity,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ineed.custmText(
                                          data: 'هل لديك مرض مزمن ؟'),
                                      ToggleSwitch(
                                        minWidth: 50.0,
                                        cornerRadius: 20.0,
                                        activeBgColors: [
                                          [Colors.green[800]!],
                                          [Colors.red[800]!]
                                        ],
                                        activeFgColor: Colors.white,
                                        inactiveBgColor: Colors.grey,
                                        inactiveFgColor: Colors.white,
                                        initialLabelIndex: 1,
                                        totalSwitches: 2,
                                        labels: ['نعم', 'لا'],
                                        radiusStyle: true,
                                        onToggle: (index) {
                                          index == 1
                                              ? cc.anySice = 'لا'
                                              : cc.anySice = 'نعم';
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Container(
                                  width: double.infinity,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ineed.custmText(
                                          data:
                                              'هل تستطيع الالتزام بتعليمات الخدمة؟'),
                                      ToggleSwitch(
                                        minWidth: 50.0,
                                        cornerRadius: 20.0,
                                        activeBgColors: [
                                          [Colors.green[800]!],
                                          [Colors.red[800]!]
                                        ],
                                        activeFgColor: Colors.white,
                                        inactiveBgColor: Colors.grey,
                                        inactiveFgColor: Colors.white,
                                        initialLabelIndex: 1,
                                        totalSwitches: 2,
                                        labels: ['نعم', 'لا'],
                                        radiusStyle: true,
                                        onToggle: (index) {
                                          index == 1
                                              ? cc.roulse = 'لا'
                                              : cc.roulse = 'نعم';
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Divider(
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                ineed.custmText(
                                    data: 'المعلومات الدراسية والمهنية',
                                    isbold: true),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 3),
                                  child: Container(
                                    width: double.infinity,
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton2(
                                        hint: Text(
                                          'التحصيل الدراسي',
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              color: Colors.white,
                                              fontFamily: 'kufi'),
                                        ),
                                        items: cc.study
                                            .map((item) =>
                                                DropdownMenuItem<String>(
                                                  value: item,
                                                  child: Text(
                                                    item,
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ))
                                            .toList(),
                                        value: cc.selectedStadyValue,
                                        onChanged: (value) {
                                          cc.update();
                                          cc.selectedStadyValue =
                                              value as String;
                                          cc.selectedStadyValue != null
                                              ? cc.stady = cc.selectedStadyValue
                                              : cc.stady = 'يقراء ويكتب';
                                        },
                                        buttonStyleData: const ButtonStyleData(
                                          height: 40,
                                          width: 140,
                                        ),
                                        menuItemStyleData:
                                            const MenuItemStyleData(
                                          height: 40,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 3),
                                  child: Container(
                                    width: double.infinity,
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton2(
                                        hint: Text(
                                          'العمل',
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              color: Colors.white,
                                              fontFamily: 'kufi'),
                                        ),
                                        items: cc.work
                                            .map((item) =>
                                                DropdownMenuItem<String>(
                                                  value: item,
                                                  child: Text(
                                                    item,
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ))
                                            .toList(),
                                        value: cc.selectedWorkValue,
                                        onChanged: (value) {
                                          cc.update();
                                          cc.selectedWorkValue =
                                              value as String;
                                          cc.selectedWorkValue != null
                                              ? cc.worrk = cc.selectedWorkValue
                                              : cc.worrk = 'كاسب';
                                        },
                                        buttonStyleData: const ButtonStyleData(
                                          height: 40,
                                          width: 140,
                                        ),
                                        menuItemStyleData:
                                            const MenuItemStyleData(
                                          height: 40,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                ineed.custemTextForm(
                                  lable: 'المهنة',
                                  onSaved: (p0) {
                                    cc.mhna = p0;
                                  },
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                ineed.custemTextForm(
                                  lable: 'اللغات المتقنة',
                                  onSaved: (p0) {
                                    cc.lunguth = p0;
                                  },
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 3),
                                  child: Container(
                                    width: double.infinity,
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton2(
                                        hint: Text(
                                          'المسمى التنظيمي',
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              color: Colors.white,
                                              fontFamily: 'kufi'),
                                        ),
                                        items: cc.mosamaTandemi
                                            .map((item) =>
                                                DropdownMenuItem<String>(
                                                  value: item,
                                                  child: Text(
                                                    item,
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ))
                                            .toList(),
                                        value: cc.mosamaTandemiValue,
                                        onChanged: (value) {
                                          cc.update();
                                          cc.mosamaTandemiValue =
                                              value as String;
                                          cc.mosamaTandemiValue != null
                                              ? cc.mosama =
                                                  cc.mosamaTandemiValue
                                              : cc.mosama = 'منتسب';
                                        },
                                        buttonStyleData: const ButtonStyleData(
                                          height: 40,
                                          width: 140,
                                        ),
                                        menuItemStyleData:
                                            const MenuItemStyleData(
                                          height: 40,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                ineed.custemTextForm(
                                  lable: 'اسم المعرف الثلاثي',
                                  onSaved: (p0) {
                                    cc.moaref = p0;
                                  },
                                ),

                                ineed.custemTextForm(
                                  lable: 'تاريخ الانضمام للمؤسسة',
                                  onSaved: (p0) {
                                    cc.join = p0;
                                  },
                                ),

                                InkWell(
                                  onTap: () {
                                    cc.loding
                                        ? cc.UplodMotshref()
                                        : Get.defaultDialog(
                                            title: "جار تحميل الصورة",
                                            middleText: "انتظر قليلا");
                                  },
                                  child: Container(
                                    width: 300.w,
                                    height: 40.h,
                                    child: Center(
                                      child: cc.lodeing == false
                                          ? ineed.custmText(
                                              data: 'ارسال',
                                              color:
                                                  Colors.white.withOpacity(0.8),
                                              fontSize: 20.sp,
                                              isbold: true)
                                          : LoadingAnimationWidget
                                              .threeRotatingDots(
                                              color: Colors.white,
                                              size: 20.sp,
                                            ),
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white.withOpacity(0.2)),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    )));
  }
}
