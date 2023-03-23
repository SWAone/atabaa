import 'package:ataba/Controller/newAcuontController.dart';
import 'package:ataba/Controller/siginController.dart';
import 'package:ataba/ineed/ineed.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class newAcuont extends StatelessWidget {
  const newAcuont({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: GetBuilder<newAcuontController>(
        init: newAcuontController(),
        builder: (cc) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/aa.jpg'),
                      fit: BoxFit.cover)),
              child: Form(
                key: cc.st,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 200.h,
                        child:
                            Image(image: AssetImage('assets/images/bac.png'))),
                    SizedBox(
                      height: 20.h,
                    ),
                    ineed.custmText(data: 'توليد امانة جديدة', fontSize: 20.sp),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ineed.custemTextForm(
                            lable: 'الاسم ',
                            onSaved: (p0) {
                              cc.name = p0!;
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ineed.custemTextForm(
                            lable: 'المحافظة',
                            onSaved: (p0) {
                              cc.loction = p0!;
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ineed.custemTextForm(
                            lable: 'المعرف',
                            onSaved: (p0) {
                              cc.email = p0!;
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ineed.custemTextForm(
                            lable: 'كلمة السر',
                            onSaved: (p0) {
                              cc.pass = p0!;
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: InkWell(
                        onTap: () {
                          cc.newAcuont();
                        },
                        child: Container(
                          height: 40.h,
                          // ignore: sort_child_properties_last
                          child: Center(
                            child: cc.loding == false
                                ? ineed.custmText(
                                    data: 'تسجيل الدخول',
                                    color: Colors.white.withOpacity(0.8),
                                    fontSize: 15.sp,
                                    isbold: true)
                                : LoadingAnimationWidget.threeRotatingDots(
                                    color: Colors.white,
                                    size: 20.sp,
                                  ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white.withOpacity(0.2)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    ));
  }
}
