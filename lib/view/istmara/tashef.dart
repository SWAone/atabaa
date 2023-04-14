import 'package:ataba/Controller/tashrefController.dart';
import 'package:ataba/color/color.dart';
import 'package:ataba/ineed/ineed.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class tashef extends StatelessWidget {
  const tashef({super.key});

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
            child: GetBuilder<tasherfController>(
              init: tasherfController(),
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
                                  lable: 'المواليد',
                                  onSaved: (p0) {
                                    cc.berthdy = p0;
                                  },
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
                                SizedBox(
                                  height: 10.h,
                                ),
                                ineed.custemTextForm(
                                  lable: 'العنوان واقرب نقطة دالة',
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
                                InkWell(
                                  onTap: () {
                                    cc.UplodMotshref();
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
