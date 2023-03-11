import 'package:ataba/Controller/homeController.dart';
import 'package:ataba/color/color.dart';
import 'package:ataba/ineed/ineed.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class addPost extends StatelessWidget {
  addPost({super.key});
  String? uid;
  homeController hocc = Get.put(homeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            child: Image(
              image: AssetImage('assets/images/aa.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Align(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.backspace,
                      color: Colors.white,
                      size: 20.sp,
                    ),
                  ),
                  ineed.custmText(
                      data: 'انشاء منشور جديد',
                      color: Colors.white,
                      fontSize: 20.sp),
                  ineed.custmText(
                      data: '  ', color: Colors.white, fontSize: 5.sp),
                ],
              ),
            ),
          ),
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: hocc.form,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: Colors.white, width: 2)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: ineed.custemTextForm(
                                lable: 'العنوان',
                                onSaved: (p0) {
                                  hocc.title = p0;
                                },
                              ),
                            ),
                          ),
                        ),
                        GetBuilder<homeController>(
                          init: homeController(),
                          builder: (cc) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () async {
                                  cc.isTabOnAddImage = true;
                                  cc.update();
                                  ImagePicker imagePicker = ImagePicker();
                                  hocc.file = await imagePicker.pickImage(
                                      source: ImageSource.gallery);

                                  if (hocc.file == null) return;
                                  String UineqFileNmaw = DateTime.now()
                                      .microsecondsSinceEpoch
                                      .toString();
                                  Reference referenceRote =
                                      FirebaseStorage.instance.ref();
                                  Reference referenceDirimage =
                                      referenceRote.child('image');
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
                                  width: double.infinity,
                                  height: 200.h,
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
                                                    '${hocc.imageUrlToDisply}'))
                                            : Text('WS'),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        InkWell(
                          onTap: () {
                            hocc.addPost();
                            hocc.loding = false;
                          },
                          child: Container(
                            width: double.infinity,
                            height: 40.h,
                            child: Center(
                                child: ineed.custmText(
                                    data: 'نشر',
                                    color: Colors.white.withOpacity(0.8),
                                    fontSize: 16.sp,
                                    isbold: true)),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white.withOpacity(0.2)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ])
        ],
      ),
    ));
  }
}
