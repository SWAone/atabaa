import 'package:ataba/Controller/homeController.dart';
import 'package:ataba/color/color.dart';
import 'package:ataba/ineed/ineed.dart';
import 'package:ataba/view/addPost.dart';
import 'package:ataba/view/istmara/tashef.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class home extends StatelessWidget {
  home({super.key});
  homeController hocc = Get.put(homeController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniStartDocked,
          //اضافة المنشور فقط للادمنية admin
          floatingActionButton: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Container(
              width: 60.w,
              height: 60.h,
              child: FloatingActionButton(
                onPressed: () {
                  Get.to(() => addPost());
                },
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 30.sp,
                ),
                backgroundColor: color.postContener,
              ),
            ),
          ),
          backgroundColor: Colors.black12,
          body: Stack(
            children: [
              Center(
                child: Container(
                    width: double.infinity,
                    child: Image(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/aa.jpg'),
                    )),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    child: Image(
                  image: AssetImage('assets/images/bac.png'),
                  opacity: const AlwaysStoppedAnimation(0.1),
                )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: SingleChildScrollView(
                    child: GetBuilder<homeController>(
                  init: homeController(),
                  builder: (cc) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  child: Row(
                                children: [
                                  Icon(
                                    Icons.newspaper,
                                    color: Colors.white,
                                    size: 28.sp,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: ineed.custmText(
                                        data: 'النشاطات',
                                        fontSize: 15.sp,
                                        isbold: true),
                                  ),
                                ],
                              )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  Get.to(() => tashef());
                                },
                                child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: ineed.custmText(
                                        data: 'التشرف بالخدمة',
                                        fontSize: 15.sp,
                                        isbold: true),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, index) => SizedBox(
                            height: 12.h,
                          ),
                          shrinkWrap: true,
                          itemCount: cc.posts.length > 0 ? cc.posts.length : 5,
                          itemBuilder: (context, index) {
                            if (cc.posts.length > 0) {
                              return ineed.postContener(
                                  onPressedDelet: () {
                                    print('object');
                                    cc.delet(docId: cc.posts[index]['id']);
                                  },
                                  title: cc.posts[index]['title'],
                                  image: cc.posts[index]['image']);
                            } else {
                              return ineed.lodingPostShimmer();
                            }
                          },
                        )
                      ],
                    );
                  },
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
