import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';

pbToast({String text = "", Alignment alignment = Alignment.topCenter}) {
  toastification.show(
    context: Get.context, // optional if you use ToastificationWrapper
    title: Text(
      text,
      style: TextStyle(
        fontSize: 24.sp,
        color: Colors.white.withValues(alpha: 1),
        fontWeight: FontWeight.w400,
      ),
    ),
    backgroundColor:Colors.black.withValues(alpha: 0.8),
    alignment: alignment,
    autoCloseDuration: const Duration(seconds: 4),
  );
}
