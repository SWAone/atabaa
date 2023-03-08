import 'package:ataba/color/color.dart';
import 'package:ataba/ineed/ineed.dart';
import 'package:ataba/view/istmara/tashef.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
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
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                child: Row(
                              children: [
                                Icon(
                                  Icons.newspaper,
                                  color: Colors.white,
                                  size: 28.sp,
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
                          Padding(
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
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: color.postContener,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Container(
                                    width: double.infinity,
                                    height: 157.h,
                                    color: Colors.grey,
                                    child: Image(
                                      fit: BoxFit.cover,
                                      image:
                                          AssetImage('assets/images/krbla.jpg'),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  child: Container(
                                    width: double.infinity,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                          child: ineed.custmText(
                                              fontSize: 15.sp,
                                              data:
                                                  'زيارة الثاني من كانون الثالث زيارة الثاني من كانون الثالث  زيارة الثاني من كانون الثالث زيارة الثاني من كانون الثالث  زيارة الثاني من كانون الثالث زيارة الثاني من كانون الثالث  زيارة الثاني من كانون الثالث زيارة الثاني من كانون الثالث ')),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: color.postContener,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Container(
                                    width: double.infinity,
                                    height: 157.h,
                                    color: Colors.grey,
                                    child: Image(
                                      fit: BoxFit.cover,
                                      image:
                                          AssetImage('assets/images/krbla.jpg'),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  child: Container(
                                    width: double.infinity,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                          child: ineed.custmText(
                                              fontSize: 15.sp,
                                              data:
                                                  'زيارة الثاني من كانون الثالث زيارة الثاني من كانون الثالث  زيارة الثاني من كانون الثالث زيارة الثاني من كانون الثالث  زيارة الثاني من كانون الثالث زيارة الثاني من كانون الثالث  زيارة الثاني من كانون الثالث زيارة الثاني من كانون الثالث ')),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: color.postContener,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Container(
                                    width: double.infinity,
                                    height: 157.h,
                                    color: Colors.grey,
                                    child: Image(
                                      fit: BoxFit.cover,
                                      image:
                                          AssetImage('assets/images/krbla.jpg'),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  child: Container(
                                    width: double.infinity,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                          child: ineed.custmText(
                                              fontSize: 15.sp,
                                              data:
                                                  'زيارة الثاني من كانون الثالث زيارة الثاني من كانون الثالث  زيارة الثاني من كانون الثالث زيارة الثاني من كانون الثالث  زيارة الثاني من كانون الثالث زيارة الثاني من كانون الثالث  زيارة الثاني من كانون الثالث زيارة الثاني من كانون الثالث ')),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
