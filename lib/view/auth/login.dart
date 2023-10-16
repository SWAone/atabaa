import 'package:ataba/Controller/loginController.dart';
import 'package:ataba/ineed/ineed.dart';
import 'package:ataba/view/auth/signin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class login extends StatelessWidget {
  login({super.key});
  loginControllr cc = Get.put(loginControllr());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/aa.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Form(
                key: cc.st,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Container(
                          width: double.infinity,
                          height: 300.h,
                          child: Image(
                              image: AssetImage('assets/images/bac.png'))),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    InkWell(
                      onTap: () {
                        cc.newUser();
                      },
                      child: GetBuilder<loginControllr>(
                        init: loginControllr(),
                        builder: (controller) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Container(
                              height: 40.h,
                              // ignore: sort_child_properties_last
                              child: Center(
                                child: controller.loding == false
                                    ? ineed.custmText(
                                        data: 'الدخول المباشر التطبيق',
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
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => signin());
                      },
                      child: GetBuilder<loginControllr>(
                        init: loginControllr(),
                        builder: (controller) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Container(
                              height: 40.h,
                              // ignore: sort_child_properties_last
                              child: Center(
                                  child: ineed.custmText(
                                      data: 'تسجيل الدخول (للمسؤلين)',
                                      color: Colors.white.withOpacity(0.8),
                                      fontSize: 15.sp,
                                      isbold: true)),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white.withOpacity(0.2)),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
