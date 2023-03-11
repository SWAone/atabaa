import 'package:ataba/Controller/motshrfeenController.dart';
import 'package:ataba/ineed/ineed.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class motshrfeen extends StatelessWidget {
  const motshrfeen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: GetBuilder<motshrfeenController>(
          init: motshrfeenController(),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ineed.custmText(data: ' ', fontSize: 15.sp),
                          ineed.custmText(
                              data: 'المتشرفين بالخدمة', fontSize: 20.sp),
                          IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: Icon(
                                Icons.arrow_forward,
                                size: 25.sp,
                                color: Colors.white,
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(20)),
                        width: double.infinity,
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: cc.AllMotshrfeen.length > 0
                              ? cc.AllMotshrfeen.length
                              : 10,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return cc.AllMotshrfeen.length > 0
                                ? Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border:
                                              Border.all(color: Colors.white)),
                                      child: ListTile(
                                          leading: CircleAvatar(
                                            radius: 25,
                                            backgroundColor: Colors.white,
                                            child: Image.asset(
                                              'assets/images/bac.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          title: ineed.custmText(
                                              data: cc.AllMotshrfeen[index]
                                                  ['Fname'],
                                              fontSize: 15.sp,
                                              isbold: true),
                                          subtitle: ineed.custmText(
                                              data:
                                                  'يسكن في  :  ${cc.AllMotshrfeen[index]['loction']}',
                                              isbold: true,
                                              fontSize: 12.sp)),
                                    ),
                                  )
                                : Shimmer.fromColors(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            border: Border.all(
                                                color: Colors.white)),
                                        child: ListTile(
                                            leading: CircleAvatar(
                                              radius: 25,
                                              backgroundColor: Colors.white,
                                              child: Image.asset(
                                                'assets/images/bac.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            title: ineed.custmText(
                                                data: 'd',
                                                fontSize: 15.sp,
                                                isbold: true),
                                            subtitle: ineed.custmText(
                                                data: 'يسكن في  ',
                                                isbold: true,
                                                fontSize: 12.sp)),
                                      ),
                                    ),
                                    baseColor: Colors.white12,
                                    highlightColor: Colors.white24);
                          },
                        ),
                      ),
                    ),
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
