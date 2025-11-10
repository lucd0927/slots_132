
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slots_132/ss_common/routes.dart';
import 'package:slots_132/ss_pages/zhifu/withddd_controller.dart';

class TopNavMoney extends StatefulWidget {
  const TopNavMoney({super.key});

  @override
  State<TopNavMoney> createState() => _TopNavMoneyState();
}

class _TopNavMoneyState extends State<TopNavMoney> {

  // 新增：从相册选择头像
  Future<void> _pickAvatar() async {
    WithdddController.to.pickAvatar();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: WithdddController.to.bgColor(),
      padding: EdgeInsets.only(left: 16.w, right: 16.w),
      child: Column(
        children: [
          SizedBox(height: ScreenUtil().statusBarHeight),
          Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).maybePop(),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                  size: 24.h,
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                'Money',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              // 可点击的头像：点击调用 _pickAvatar()
              GetBuilder<WithdddController>(
                builder: (WithdddController controller) {
                  return GestureDetector(
                    onTap: _pickAvatar,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.h),
                      child: WithdddController.to.avatarFile != null
                          ? Image.file(
                        WithdddController.to.avatarFile!,
                        width: 30.h,
                        height: 30.h,
                        fit: BoxFit.cover,
                      )
                          : CircleAvatar(
                        radius: 15.h,
                        backgroundColor: Colors.grey.shade300,
                        child: const Icon(
                          Icons.person,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(width: 8.w),
              GestureDetector(
                onTap: () {
                  Get.toNamed(SSRouttttt.historyyyy);
                },
                child: Icon(
                  Icons.history,
                  color: Colors.white,
                  size: 36.h,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}
