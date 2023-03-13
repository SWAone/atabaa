import 'package:ataba/Controller/motshrfeenController.dart';
import 'package:ataba/color/color.dart';
import 'package:ataba/ineed/ineed.dart';
import 'package:ataba/view/motshref_info.dart';
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
                          Column(
                            children: [
                              ineed.custmText(
                                  data: ' الطلبات', fontSize: 14.sp),
                              Center(
                                child: ineed.custmText(
                                    data: ' ${cc.AllMotshrfeen.length}',
                                    fontSize: 15.sp,
                                    isbold: true),
                              )
                            ],
                          ),
                          ineed.custmText(
                              data: 'المتشرفين بالخدمة ', fontSize: 20.sp),
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
                          child: Column(
                            children: [
                              ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: cc.AllMotshrfeen.length > 0
                                    ? cc.visibleItems
                                    : 10,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return cc.AllMotshrfeen.length > 0
                                      ? InkWell(
                                          onTap: () {
                                            Get.to(() => motshref_info(
                                                  Fname: cc.AllMotshrfeen[index]
                                                      ['Fname'],
                                                  anySice:
                                                      cc.AllMotshrfeen[index]
                                                          ['anySice'],
                                                  berthdy:
                                                      cc.AllMotshrfeen[index]
                                                          ['berthdy'],
                                                  didWorkWithatba:
                                                      cc.AllMotshrfeen[index]
                                                          ['didWorkWithatba'],
                                                  havaTato:
                                                      cc.AllMotshrfeen[index]
                                                          ['havaTato'],
                                                  loction:
                                                      cc.AllMotshrfeen[index]
                                                          ['loction'],
                                                  loctionAndwhere:
                                                      cc.AllMotshrfeen[index]
                                                          ['loctionAndwhere'],
                                                  phoneNumber:
                                                      cc.AllMotshrfeen[index]
                                                          ['phoneNumber'],
                                                  radeyTo40:
                                                      cc.AllMotshrfeen[index]
                                                          ['radeyTo40'],
                                                  roulse:
                                                      cc.AllMotshrfeen[index]
                                                          ['roulse'],
                                                  whayYouuNedTashrf:
                                                      cc.AllMotshrfeen[index]
                                                          ['whayYouuNedTashrf'],
                                                ));
                                          },
                                          child: ineed.showMotrshrefConterer(
                                              title: cc.AllMotshrfeen[index]
                                                  ['Fname'],
                                              subtitle: cc.AllMotshrfeen[index]
                                                  ['loction']),
                                        )
                                      : Shimmer.fromColors(
                                          child: ineed.showMotrshrefConterer(
                                              title: ' ', subtitle: ' '),
                                          baseColor: Colors.white12,
                                          highlightColor: Colors.white24);
                                },
                              ),
                              InkWell(
                                onTap: () {
                                  if (cc.visibleItems ==
                                      cc.AllMotshrfeen.length) {
                                    cc.visibleItems = 3;
                                    cc.update();
                                  } else {
                                    cc.showMore();
                                  }
                                },
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    child: ineed.custmText(
                                        data: cc.visibleItems ==
                                                cc.AllMotshrfeen.length
                                            ? 'عرض اقل'
                                            : 'عرض المزيد',
                                        color: color.moreTextBlue,
                                        isbold: true),
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 17),
                      child: Divider(
                        height: 3.h,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    ineed.custmText(
                        data: 'مسؤلي الفرع', fontSize: 15.sp, isbold: true),
                    ineed.showMotrshrefConterer(
                        title: 'محمد بهاء محمد',
                        subtitle: 'كريطعة',
                        isadmin: true),
                    ineed.showMotrshrefConterer(
                        title: 'محمد بهاء محمد',
                        subtitle: 'كريطعة',
                        isadmin: true),
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
