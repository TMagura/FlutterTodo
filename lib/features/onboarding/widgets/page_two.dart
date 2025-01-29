import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riverpod_todo/common/utils/constants.dart';
import 'package:riverpod_todo/common/widgets/custom_otn_btn.dart';
import 'package:riverpod_todo/common/widgets/height_spacer.dart';
import 'package:riverpod_todo/features/auth/pages/login_page.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

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
          const HeightSpacer(ht: 50),
          CustomOtlnBtn(
            width: AppConst.kWidth*0.9,
            height:AppConst.kHeight*0.06 , 
            color:AppConst.kLight , 
            color2: AppConst.kGreyLight, 
            text: "Login with a phone number",
            onTap: () {
              Navigator.pushReplacement(context, 
              MaterialPageRoute(builder: (context) => const LoginPage(),));
            },
          ),
       ],
      ),
    );
  }
}