// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WidthSpacer extends StatelessWidget {
  const WidthSpacer({
    Key? key,
    required this.wt,
  }) : super(key: key);
   
   final double wt;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: wt.w,);
  }
}
