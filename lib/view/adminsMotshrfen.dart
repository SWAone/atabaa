import 'package:ataba/Controller/motshrfeenController.dart';
import 'package:ataba/ineed/ineed.dart';
import 'package:ataba/view/motshref_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class adminsMotshrfen extends StatelessWidget {
  const adminsMotshrfen({super.key});

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
                                itemCount: cc.adminspepole.length > 0
                                    ? cc.adminspepole.length
                                    : 3,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return cc.adminspepole.length > 0
                                      ? InkWell(
                                          onTap: () {
                                            Get.to(() => motshref_info(
                                                  join: cc.adminspepole[index]
                                                      ['familyName'],
                                                  moaref: cc.adminspepole[index]
                                                      ['moaref'],
                                                  mosma: cc.adminspepole[index]
                                                      ['mosama'],
                                                  famlyName:
                                                      cc.adminspepole[index]
                                                          ['familyName'],
                                                  cardd: cc.adminspepole[index]
                                                      ['cardNumber'],
                                                  born: cc.adminspepole[index]
                                                      ['born'],
                                                  childNumber:
                                                      cc.adminspepole[index]
                                                          ['childNumber'],
                                                  fborn: cc.adminspepole[index]
                                                      ['fatherborn'],
                                                  imageUrlToDisply:
                                                      cc.adminspepole[index]
                                                          ['imge'],
                                                  lunguth:
                                                      cc.adminspepole[index]
                                                          ['lunguth'],
                                                  mared: cc.adminspepole[index]
                                                      ['mared'],
                                                  mhna: cc.adminspepole[index]
                                                      ['mhna'],
                                                  nahea: cc.adminspepole[index]
                                                      ['nahea'],
                                                  numberTwmen:
                                                      cc.adminspepole[index]
                                                          ['numberTwmen'],
                                                  qada: cc.adminspepole[index]
                                                      ['qada'],
                                                  sakin: cc.adminspepole[index]
                                                      ['sakin'],
                                                  stady: cc.adminspepole[index]
                                                      ['stady'],
                                                  worrk: cc.adminspepole[index]
                                                      ['worrk'],
                                                  need: cc.adminspepole[index]
                                                      ['need'],
                                                  doic: cc.usersdoicId[index],
                                                  Fname: cc.adminspepole[index]
                                                      ['Fname'],
                                                  anySice:
                                                      cc.adminspepole[index]
                                                          ['anySice'],
                                                  berthdy:
                                                      cc.adminspepole[index]
                                                          ['berthdy'],
                                                  didWorkWithatba:
                                                      cc.adminspepole[index]
                                                          ['didWorkWithatba'],
                                                  havaTato:
                                                      cc.adminspepole[index]
                                                          ['havaTato'],
                                                  loction:
                                                      cc.adminspepole[index]
                                                          ['loction'],
                                                  loctionAndwhere:
                                                      cc.adminspepole[index]
                                                          ['loctionAndwhere'],
                                                  phoneNumber:
                                                      cc.adminspepole[index]
                                                          ['phoneNumber'],
                                                  radeyTo40:
                                                      cc.adminspepole[index]
                                                          ['radeyTo40'],
                                                  roulse: cc.adminspepole[index]
                                                      ['roulse'],
                                                  whayYouuNedTashrf:
                                                      cc.adminspepole[index]
                                                          ['whayYouuNedTashrf'],
                                                  contributions:
                                                      cc.adminspepole[index]
                                                          ['contributions'],
                                                ));
                                          },
                                          child: ineed.showMotrshrefConterer(
                                            canselUplodToAdmin: () async {
                                              AwesomeDialog(
                                                context: context,
                                                dialogType: DialogType.info,
                                                animType: AnimType.rightSlide,
                                                title: 'هل انت متاكد',
                                                desc:
                                                    'سوف يتم الغاء رفع ${cc.adminspepole[index]['Fname']}',
                                                btnCancelOnPress: () {},
                                                btnOkOnPress: () {
                                                  cc.DleateUserOnTap(
                                                    docid:
                                                        cc.usersdoicId[index],
                                                  );
                                                },
                                              )..show();
                                            },
                                            isUplodToAdmin:
                                                cc.adminspepole[index]
                                                            ['need'] ==
                                                        11
                                                    ? true
                                                    : false,
                                            title: cc.adminspepole[index]
                                                ['Fname'],
                                            subtitle: cc.adminspepole[index]
                                                    ['contributions']
                                                .toString(),
                                            img: cc.adminspepole[index]['imge'],
                                          ),
                                        )
                                      : Shimmer.fromColors(
                                          child: ineed.showMotrshrefConterer(
                                              img: 's',
                                              title: ' ',
                                              subtitle: ' '),
                                          baseColor: Colors.white12,
                                          highlightColor: Colors.white24);
                                },
                              ),
                            ],
                          )),
                    ),
                    SizedBox(
                      height: 5.h,
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
