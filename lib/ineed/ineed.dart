import 'package:ataba/color/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shimmer/shimmer.dart';

class ineed {
  static Widget custmText(
      {required String data,
      double? fontSize,
      Color color = Colors.white,
      String fontFamily = 'Cairo',
      bool isbold = false}) {
    {
      return Text(
        data,
        style: TextStyle(
            fontSize: fontSize,
            color: color,
            fontFamily: fontFamily,
            fontWeight: isbold ? FontWeight.bold : FontWeight.normal),
      );
    }
  }

  static Widget custemTextForm(
      {required String lable, required void Function(String?)? onSaved}) {
    return TextFormField(
      onSaved: onSaved,
      validator: (value) {
        if (value!.isEmpty) {
          return "هذا الحقل مطلوب";
        }
      },
      style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'kufi'),
      decoration: InputDecoration(
        label: Row(
          children: [
            ineed.custmText(data: lable, fontSize: 15.sp),
            SizedBox(
              width: 5.w,
            ),
            ineed.custmText(data: '*', fontSize: 20.sp, color: Colors.red)
          ],
        ),
      ),
    );
  }

  static Widget postContener(
      {required String title,
      required String image,
      void Function()? onPressedDelet}) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: InkWell(
          //admin
          onTap: onPressedDelet,
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
                      height: 300.h,
                      color: Colors.grey,
                      child: Image.network(
                        '$image',
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return Image(
                                fit: BoxFit.cover, image: NetworkImage(image));
                          } else {
                            return Center(
                              child: LoadingAnimationWidget.threeRotatingDots(
                                color: Colors.white,
                                size: 50.sp,
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Container(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child:
                                ineed.custmText(fontSize: 15.sp, data: title)),
                      ),
                    ),
                  ),

                  //
                ],
              )),
        ));
  }

  static Widget lodingPostShimmer() {
    return Shimmer.fromColors(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Container(
                    width: double.infinity.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                  )
                ],
              ),
            )),
        baseColor: Colors.white12,
        highlightColor: Colors.white24);
  }
}
