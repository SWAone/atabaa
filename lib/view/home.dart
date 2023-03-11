import 'package:ataba/Controller/ItemController.dart';
import 'package:ataba/Controller/homeController.dart';
import 'package:ataba/color/color.dart';
import 'package:ataba/ineed/ineed.dart';
import 'package:ataba/view/addPost.dart';
import 'package:ataba/view/istmara/tashef.dart';
import 'package:ataba/view/model/Post.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
import 'package:cloud_firestore/cloud_firestore.dart';

class home extends StatelessWidget {
  home({super.key});

  ItemController Controller = Get.put(ItemController());

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
            child: GetBuilder<homeController>(
              init: homeController(),
              builder: (cc) {
                return Container(
                  width: 60.w,
                  height: 60.h,
                  child: cc.rank == 1
                      ? FloatingActionButton(
                          onPressed: () {
                            Get.to(() => addPost());
                          },
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 30.sp,
                          ),
                          backgroundColor: color.postContener,
                        )
                      : null,
                );
              },
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
                                  InkWell(
                                    onDoubleTap: () {
                                      print('ouuuuuuuuut');
                                      cc.singOt();
                                    },
                                    child: Icon(
                                      Icons.newspaper,
                                      color: Colors.white,
                                      size: 28.sp,
                                    ),
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
                            //يوزر عااااااااادي
                            cc.rank == 0
                                ? Padding(
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
                                    //الادمن الاساسي
                                  )
                                : cc.rank == 1
                                    ? Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: InkWell(
                                          onTap: () {
                                            Get.to(() => tashef());
                                          },
                                          child: Container(
                                            child: Padding(
                                              padding: const EdgeInsets.all(4),
                                              child: ineed.custmText(
                                                  data: 'المتشرفين بالخدمة',
                                                  fontSize: 15.sp,
                                                  isbold: true),
                                            ),
                                          ),
                                        ),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: InkWell(
                                          onTap: () async {
                                            await FirebaseAuth.instance
                                                .signOut()
                                                .then((value) {
                                              Get.back();
                                            });
                                          },
                                          child: Container(
                                            child: Padding(
                                              padding: const EdgeInsets.all(4),
                                              child: ineed.custmText(
                                                  data: 'تسجيل الخروج',
                                                  fontSize: 15.sp,
                                                  isbold: true),
                                            ),
                                          ),
                                        ),
                                      ),
                          ],
                        ),
                        StreamBuilder<List<Post>>(
                          stream: Controller.posts.stream,
                          builder: (BuildContext context,
                              AsyncSnapshot<List<Post>> snapshot) {
                            if (snapshot.hasError) {
                              return Center(
                                  child: Text('Error: ${snapshot.error}'));
                            }

                            if (!snapshot.hasData) {
                              return Center(child: CircularProgressIndicator());
                            }

                            return snapshot.data!.length > 0
                                ? ListView.separated(
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                      height: 10.h,
                                    ),
                                    physics: BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: snapshot.data!.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      Post post = snapshot.data![index];
                                      return ineed.postContener(
                                          onPressedDelet: () {
                                            cc.delet(docId: post.docId);
                                          },
                                          title: post.title,
                                          image: post.imageUrl);
                                    },
                                  )
                                : ListView.builder(
                                    physics: BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: 5,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return ineed.lodingPostShimmer();
                                    },
                                  );
                          },
                        ),
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
