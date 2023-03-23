import 'package:ataba/Controller/motshrfeenController.dart';
import 'package:ataba/color/color.dart';
import 'package:ataba/ineed/ineed.dart';
import 'package:ataba/view/Accepted.dart';
import 'package:ataba/view/AllUserScrren.dart';
import 'package:ataba/view/Uoloded.dart';
import 'package:ataba/view/auth/newAcuont.dart';
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.bookmark_added_rounded),
        onPressed: () {
          Get.to(() => Accepted());
        },
      ),
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
                          ineed.custmText(data: 'المنتسبين', fontSize: 20.sp),
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
                                    : 3,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return cc.AllMotshrfeen.length > 0
                                      ? InkWell(
                                          onTap: () {
                                            Get.to(() => motshref_info(
                                                  cardd: cc.AllMotshrfeen[index]
                                                      ['cardnuber'],
                                                  born: cc.AllMotshrfeen[index]
                                                      ['born'],
                                                  childNumber:
                                                      cc.AllMotshrfeen[index]
                                                          ['childNumber'],
                                                  fborn: cc.AllMotshrfeen[index]
                                                      ['fatherborn'],
                                                  imageUrlToDisply:
                                                      cc.AllMotshrfeen[index]
                                                          ['imge'],
                                                  lunguth:
                                                      cc.AllMotshrfeen[index]
                                                          ['lunguth'],
                                                  mared: cc.AllMotshrfeen[index]
                                                      ['mared'],
                                                  mhna: cc.AllMotshrfeen[index]
                                                      ['mhna'],
                                                  nahea: cc.AllMotshrfeen[index]
                                                      ['nahea'],
                                                  numberTwmen:
                                                      cc.AllMotshrfeen[index]
                                                          ['numberTwmen'],
                                                  qada: cc.AllMotshrfeen[index]
                                                      ['qada'],
                                                  sakin: cc.AllMotshrfeen[index]
                                                      ['sakin'],
                                                  stady: cc.AllMotshrfeen[index]
                                                      ['stady'],
                                                  worrk: cc.AllMotshrfeen[index]
                                                      ['worrk'],
                                                  need: 0,
                                                  doic: '',
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ineed.custmText(
                            data: 'الامانة العامة',
                            fontSize: 15.sp,
                            isbold: true),
                        IconButton(
                            onPressed: () {
                              Get.to(() => newAcuont());
                            },
                            icon: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 25.sp,
                            ))
                      ],
                    ),
                    // ExpansionTileDemo()
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount:
                          cc.adminsDicid.length > 0 ? cc.adminsDicid.length : 5,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return cc.adminsDicid.length > 0
                            ? InkWell(
                                onTap: () {
                                  Get.to(() => Uoloded(
                                        name: cc.admins[index]['name'],
                                        userUId: cc.adminsDicid[index],
                                      ));
                                },
                                child: ineed.showMotrshrefConterer(
                                    onShowMore: () async {
                                      cc.dleatAdmin(
                                          docid: cc.adminsDicid[index]);
                                    },
                                    title: '${cc.admins[index]['name']}',
                                    subtitle: '${cc.admins[index]['loction']}',
                                    isadmin: true),
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
            );
          },
        ),
      ),
    ));
  }
}
