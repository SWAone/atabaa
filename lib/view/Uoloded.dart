import 'dart:math';

import 'package:ataba/Controller/homeController.dart';
import 'package:ataba/Controller/motshrfeenController.dart';
import 'package:ataba/Controller/uplodedController.dart';
import 'package:ataba/ineed/ineed.dart';
import 'package:ataba/view/motshref_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shimmer/shimmer.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Uoloded extends StatelessWidget {
  String? userUId, name;
  Uoloded({required this.userUId, required this.name});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
          child: Scaffold(
        body: GetBuilder<uplodedController>(
          init: uplodedController(uid: userUId),
          builder: (cc) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/aa.jpg'),
                      fit: BoxFit.cover)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h),
                      Center(
                        child: ineed.custmText(
                            data: 'منتسبين تم رفعهم بواسطة $name',
                            isbold: true,
                            fontSize: 13.sp),
                      ),
                      ListView.builder(
                        itemCount: cc.users.length > 0 ? cc.users.length : 3,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return cc.users.length > 0
                              ? InkWell(
                                  onTap: () {
                                    Get.to(() => motshref_info(
                                        cardd: cc.users[index]['cardNumber'],
                                        born: cc.users[index]['born'],
                                        childNumber: cc.users[index]
                                            ['childNumber'],
                                        fborn: cc.users[index]['fatherborn'],
                                        imageUrlToDisply: cc.users[index]
                                            ['imge'],
                                        lunguth: cc.users[index]['lunguth'],
                                        mared: cc.users[index]['mared'],
                                        mhna: cc.users[index]['mhna'],
                                        nahea: cc.users[index]['nahea'],
                                        numberTwmen: cc.users[index]
                                            ['numberTwmen'],
                                        qada: cc.users[index]['qada'],
                                        sakin: cc.users[index]['sakin'],
                                        stady: cc.users[index]['stady'],
                                        worrk: cc.users[index]['worrk'],
                                        need: cc.users[index]['need'],
                                        Fname: cc.users[index]['Fname'],
                                        berthdy: cc.users[index]['berthdy'],
                                        loction: cc.users[index]['loction'],
                                        loctionAndwhere: cc.users[index]
                                            ['loctionAndwhere'],
                                        phoneNumber: cc.users[index]
                                            ['phoneNumber'],
                                        didWorkWithatba: cc.users[index]
                                            ['didWorkWithatba'],
                                        whayYouuNedTashrf: cc.users[index]
                                            ['whayYouuNedTashrf'],
                                        radeyTo40: cc.users[index]['radeyTo40'],
                                        havaTato: cc.users[index]['havaTato'],
                                        anySice: cc.users[index]['anySice'],
                                        roulse: cc.users[index]['roulse'],
                                        doic: ''));
                                  },
                                  child: ineed.showMotrshrefConterer(
                                      title: cc.users[index]['Fname'],
                                      subtitle: cc.users[index]['loction']),
                                )
                              : Shimmer.fromColors(
                                  child: ineed.showMotrshrefConterer(
                                      title: ' ', subtitle: ' ', isadmin: true),
                                  baseColor: Colors.white12,
                                  highlightColor: Colors.white24);
                        },
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      )),
    );
  }
}
