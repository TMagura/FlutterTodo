import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riverpod_todo/common/utils/constants.dart';
import 'package:riverpod_todo/common/widgets/appstyle.dart';
import 'package:riverpod_todo/common/widgets/height_spacer.dart';
import 'package:pinput/pinput.dart';
import 'package:riverpod_todo/common/widgets/reusable_text.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HeightSpacer(ht: AppConst.kHeight * 0.15),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Image.asset(
                  "assets/images/todo.png",
                  width: AppConst.kWidth * 0.5,
                )),
             HeightSpacer(ht: AppConst.kHeight * 0.09), 
             ReusableText(text: "Enter your OTP code", 
             style: appstyle(20, AppConst.kLight, FontWeight.bold)),
             HeightSpacer(ht: AppConst.kHeight * 0.02), 
             Padding(
               padding: EdgeInsets.only(left: 15.0, right: 15.0),
               child: Pinput(
                length: 6,
                showCursor: true, 
                onCompleted: (value) {
                  if (value.length == 6 ) {
                    
                  }
                },
                onSubmitted: (value) {
                  
                },
               ),
             ),
          ],
        ),
      )),
    );
  }
}
