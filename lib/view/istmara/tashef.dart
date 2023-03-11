import 'package:ataba/Controller/tashrefController.dart';
import 'package:ataba/color/color.dart';
import 'package:ataba/ineed/ineed.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

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
                                ineed.custemTextForm(
                                  lable: 'المحافظة',
                                  onSaved: (p0) {
                                    cc.loction = p0;
                                  },
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
                                ineed.custemTextForm(
                                  lable: '''
               سبق وان خدمت في العتبات المقدسة؟
              
              ''',
                                  onSaved: (p0) {
                                    cc.didWorkWithatba = p0;
                                  },
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                ineed.custemTextForm(
                                  lable: '''
               ما سبب طلبك التشرف للخدمة ؟
              ''',
                                  onSaved: (p0) {
                                    cc.whayYouuNedTashrf = p0;
                                  },
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                ineed.custemTextForm(
                                  lable: '''
               لديك استعداد للخدمة في الاربعينية؟
              ''',
                                  onSaved: (p0) {
                                    cc.radeyTo40 = p0;
                                  },
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                ineed.custemTextForm(
                                  lable: '''
              هل لديك وشم ظاهر على جسدك 
              ''',
                                  onSaved: (p0) {
                                    cc.havaTato = p0;
                                  },
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                ineed.custemTextForm(
                                  lable: '''
              هل لديك مرض مزمن ؟
              ''',
                                  onSaved: (p0) {
                                    cc.anySice = p0;
                                  },
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                ineed.custemTextForm(
                                  lable: '''
              هل تستطيع الالتزام بتعليمات الخدمة؟
              ''',
                                  onSaved: (p0) {
                                    cc.roulse = p0;
                                  },
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
