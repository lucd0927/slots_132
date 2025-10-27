import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';

ssTushi({String text = "", Alignment aaaaa = Alignment.topCenter}) {
  toastification.show(
    context: Get.context, // optional if you use ToastificationWrapper
    title: Text(
      text,
      style: TextStyle(
        fontSize: 12.sp,
        color: Colors.white,
        fontWeight: FontWeight.w400,
      ),
    ),
    backgroundColor:Colors.black.withValues(alpha: 0.8),
    alignment: aaaaa,
    autoCloseDuration: const Duration(seconds: 4),
  );
}
