import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slots_132/ss_pages/zhifu/withddd_controller.dart';

class TabNav extends StatefulWidget {
  const TabNav({super.key});

  @override
  State<TabNav> createState() => _TabNavState();
}

class _TabNavState extends State<TabNav> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            tabItem(method: EnumSSPaymentMethod.paypal),
            const SizedBox(width: 8),
            tabItem(method: EnumSSPaymentMethod.cashApp),
            const SizedBox(width: 8),
            tabItem(method: EnumSSPaymentMethod.bank),
          ],
        ),
      );
    });
  }

  tabItem({required EnumSSPaymentMethod method}) {
    bool selected =
        WithdddController.to.selectedPaymentBank.value.toString() ==
        method.name.toString();
    Color bgColor = method == EnumSSPaymentMethod.paypal
        ? Color(0xff2F3667)
        : method == EnumSSPaymentMethod.paypal
        ? Color(0xff2F674C)
        : Color(0xff2F3667);
    String iconPath = selected
        ? WithdddController.to.selectedPaymentIconSelected(method)
        : WithdddController.to.selectedPaymentIconUnSelected(method);
    return GestureDetector(
      onTap: () {
        WithdddController.to.selectedPaymentBank.value = method.name;
      },
      child: Container(
        width: 110.h,
        height: 40.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: selected ? Colors.white : bgColor,
          borderRadius: BorderRadius.circular(100),
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.12),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Stack(
          children: [
            Center(
              child: Image.asset(
                iconPath,
                width: 96.h,
                height: 40.h,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
