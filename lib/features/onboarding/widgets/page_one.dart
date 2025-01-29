import 'package:flutter/material.dart';
import 'package:riverpod_todo/common/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riverpod_todo/common/widgets/appstyle.dart';
import 'package:riverpod_todo/common/widgets/height_spacer.dart';
import 'package:riverpod_todo/common/widgets/reusable_text.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConst.kHeight,
      width: AppConst.kWidth,
      color: AppConst.kBkDark,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30.w,
            ),
            child: Image.asset("assets/images/todo.png"),
          ),
          const HeightSpacer(ht: 100),
          Column(
            children: [
              ReusableText(
                text: "ToDo Application",
                style: appstyle(30, AppConst.kLight, FontWeight.w500),
              ),
              const HeightSpacer(ht: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Text(
                  "Welcome !! Do you want to create a task fast and at ease",
                  textAlign: TextAlign.center,
                  style: appstyle(16, AppConst.kGreyLight, FontWeight.normal),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
