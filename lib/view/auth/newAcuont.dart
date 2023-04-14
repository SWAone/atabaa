import 'dart:io';

import 'package:ataba/Controller/newAcuontController.dart';
import 'package:ataba/color/color.dart';
import 'package:ataba/ineed/ineed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

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
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 200.h,
                          child: Image(
                              image: AssetImage('assets/images/bac.png'))),
                      SizedBox(
                        height: 20.h,
                      ),
                      ineed.custmText(
                          data: 'توليد امانة جديدة', fontSize: 20.sp),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: Container(
                          width: double.infinity,
                          child: InkWell(
                              onTap: () async {
                                cc.isTabOnAddImage = true;
                                cc.update();
                                ImagePicker imagePicker = ImagePicker();
                                cc.file = await imagePicker.pickImage(
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
                                    referenceDirimage.child(UineqFileNmaw);
                                try {
                                  await cc.referenceimageUAplod!
                                      .putFile(File(cc.file!.path))
                                      .then((p0) {
                                    cc.isTabOnAddImage = true;
                                    cc.loding = true;

                                    cc.update();
                                  });
                                  if (imagePicker != null) {
                                    cc.image = cc.imageUrlToDisply = await cc
                                        .referenceimageUAplod!
                                        .getDownloadURL();
                                    cc.update();
                                  }
                                } catch (e) {}
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: color.postContener,
                                      border: Border.all(color: Colors.white)),
                                  width: 200.w,
                                  height: 100.h,
                                  child: Center(
                                      child: cc.loding == false
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                ineed.custmText(
                                                    data: cc.isTabOnAddImage
                                                        ? 'جار التحميل ...'
                                                        : 'اضافة صورة'),
                                                SizedBox(
                                                  width: 5.w,
                                                ),
                                                Icon(
                                                  Icons.camera_alt_outlined,
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
                            if (cc.loding == true) {
                              cc.newAcuont();
                              Get.back();
                              cc.loding = false;
                            } else {
                              Get.defaultDialog(
                                  backgroundColor: color.postContener,
                                  title: 'جار تحميل الصورة',
                                  titleStyle: TextStyle(
                                      fontFamily: 'kufi', color: Colors.white),
                                  content: ineed.custmText(
                                      data: 'انتظر قليلا ',
                                      color: Colors.white));
                            }
                          },
                          child: Container(
                            height: 40.h,
                            // ignore: sort_child_properties_last
                            child: Center(
                                child: ineed.custmText(
                                    data: 'انشاء الحساب',
                                    color: Colors.white.withOpacity(0.8),
                                    fontSize: 15.sp,
                                    isbold: true)),
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
            ),
          );
        },
      ),
    ));
  }
}
