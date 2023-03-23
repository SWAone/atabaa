import 'package:ataba/Controller/AcceptedController.dart';
import 'package:ataba/Controller/motshrfeenController.dart';
import 'package:ataba/color/color.dart';
import 'package:ataba/ineed/ineed.dart';
import 'package:ataba/view/AllUserScrren.dart';
import 'package:ataba/view/motshref_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class Accepted extends StatelessWidget {
  const Accepted({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: GetBuilder<AcceptedController>(
          init: AcceptedController(),
          builder: (cc) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/aa.jpg'),
                      fit: BoxFit.cover)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    ineed.custmText(
                        data: 'المنتسبين اللذين تم قبولهم', fontSize: 20.sp),
                    SizedBox(
                      height: 20.h,
                    ),
                    ListView.builder(
                      itemCount: cc.AllAccepted.length > 0
                          ? cc.AllAccepted.length
                          : 10,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return cc.AllAccepted.length > 0
                            ? ineed.showMotrshrefConterer(
                                title: '${cc.AllAccepted[index]['Fname']}',
                                subtitle: '${cc.AllAccepted[index]['loction']}')
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
            );
          },
        ),
      ),
    ));
  }
}
