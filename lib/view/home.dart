import 'package:ataba/Controller/ItemController.dart';
import 'package:ataba/Controller/homeController.dart';
import 'package:ataba/Controller/motshrfeenController.dart';
import 'package:ataba/color/color.dart';
import 'package:ataba/ineed/ineed.dart';
import 'package:ataba/view/addPost.dart';
import 'package:ataba/view/adminsMotshrfen.dart';
import 'package:ataba/view/istmara/Foradmins.dart';
import 'package:ataba/view/istmara/tashef.dart';
import 'package:ataba/view/model/Post.dart';
import 'package:ataba/view/motshrfeen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class home extends StatelessWidget {
  home({super.key});
  motshrfeenController ss = Get.put(motshrfeenController());
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
                      : cc.rank == 2
                          ? FloatingActionButton(
                              onPressed: () {
                                Get.to(() => Foradmins());
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
                              child: InkWell(
                                onTap: () {
                                  Get.defaultDialog(
                                      backgroundColor: color.arrowback,
                                      title: 'اتصل بنا',
                                      titleStyle: TextStyle(
                                          fontFamily: 'kufi',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.sp,
                                          color: Colors.white),
                                      content: Column(
                                        children: [
                                          ineed.callMetod(
                                              'اسياسيل', '07733892226', false),
                                          ineed.callMetod('زين العراق',
                                              '07822892226', false),
                                          ineed.callMetod(
                                              'انستغرام', 'ab_ss0', true),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 3),
                                            child: InkWell(
                                              onTap: () {
                                                cc.singOt();
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                height: 50.h,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: color.postContener,
                                                ),
                                                child: Center(
                                                  child: ineed.custmText(
                                                      data: 'تسجيل الخروج'),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ));
                                },
                                child: Container(
                                    child: Row(
                                  children: [
                                    Icon(
                                      Icons.call,
                                      color: Colors.white,
                                      size: 20.sp,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4),
                                      child: ineed.custmText(
                                          data: 'اتصل بنا',
                                          fontSize: 15.sp,
                                          isbold: true),
                                    ),
                                  ],
                                )),
                              ),
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
                                            Get.to(() => motshrfeen());
                                          },
                                          child: Container(
                                            child: Padding(
                                              padding: const EdgeInsets.all(4),
                                              child: ineed.custmText(
                                                  data: 'المنتسبين',
                                                  fontSize: 15.sp,
                                                  isbold: true),
                                            ),
                                          ),
                                        ),
                                      )
                                    : cc.rank == 2
                                        ? InkWell(
                                            onTap: () {
                                              ss.adminspepole.clear();
                                              ss.getAdminpepols(docid: cc.uid!);
                                              Get.to(() => adminsMotshrfen());
                                            },
                                            child: Container(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(6),
                                                child: ineed.custmText(
                                                    data: 'المنتسبين',
                                                    fontSize: 15.sp,
                                                    isbold: true),
                                              ),
                                            ),
                                          )
                                        : InkWell(
                                            onTap: () {
                                              Get.to(() => tashef());
                                            },
                                            child: Container(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(6),
                                                child: ineed.custmText(
                                                    data: 'المنتسبين',
                                                    fontSize: 15.sp,
                                                    isbold: true),
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
                              cc.update();
                              return Center(
                                  child: Text('Error: ${snapshot.error}'));
                            }

                            if (!snapshot.hasData) {
                              return Center(child: ineed.lodingPostShimmer());
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
                                            cc.update();
                                            cc.rank == 1
                                                ? cc.delet(docId: post.docId)
                                                : null;
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
