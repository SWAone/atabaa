import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
}
