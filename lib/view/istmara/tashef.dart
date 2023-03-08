import 'package:ataba/color/color.dart';
import 'package:ataba/ineed/ineed.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
                            lable: 'الاسم الاول',
                            onSaved: (p0) {},
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          ineed.custemTextForm(
                            lable: 'اسم الاب',
                            onSaved: (p0) {},
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          ineed.custemTextForm(
                            lable: 'اسم الجد',
                            onSaved: (p0) {},
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          ineed.custemTextForm(
                            lable: 'اللقب',
                            onSaved: (p0) {},
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          ineed.custemTextForm(
                            lable: 'المواليد',
                            onSaved: (p0) {},
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          ineed.custemTextForm(
                            lable: 'محل الولاده',
                            onSaved: (p0) {},
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          ineed.custemTextForm(
                            lable: 'رقم هوية الاحوال المدنية',
                            onSaved: (p0) {},
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          ineed.custemTextForm(
                            lable: 'اسم الام',
                            onSaved: (p0) {},
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          ineed.custemTextForm(
                            lable: 'السكن الحالي',
                            onSaved: (p0) {},
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            width: 300.w,
                            height: 40.h,
                            child: Center(
                              child: ineed.custmText(
                                  data: 'ارسال',
                                  color: Colors.white.withOpacity(0.8),
                                  fontSize: 20.sp,
                                  isbold: true),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white.withOpacity(0.2)),
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
          )
        ],
      ),
    )));
  }
}
