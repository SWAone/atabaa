import 'package:ataba/Controller/siginController.dart';
import 'package:ataba/ineed/ineed.dart';
import 'package:ataba/view/auth/newAcuont.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class signin extends StatelessWidget {
  const signin({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: GetBuilder<siginController>(
        init: siginController(),
        builder: (cc) {
          return Container(
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
                      child: Image(image: AssetImage('assets/images/bac.png'))),
                  SizedBox(
                    height: 20.h,
                  ),
                  ineed.custmText(
                      data: 'الدخول من خلال البريد الالكتروني',
                      fontSize: 20.sp),
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
                          lable: 'البريد الالكتروني',
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
                        cc.sing();
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
                    height: 10.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: InkWell(
                      onTap: () {
                        Get.to(() => newAcuont());
                      },
                      child: Container(
                        height: 40.h,
                        // ignore: sort_child_properties_last
                        child: Center(
                            child: ineed.custmText(
                                data: 'انشاء حساب',
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 15.sp,
                                isbold: true)),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white.withOpacity(0.2)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ));
  }
}
