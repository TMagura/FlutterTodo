// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeightSpacer extends StatelessWidget {
  const HeightSpacer({
    Key? key,
    required this.ht,
  }) : super(key: key);

  final double ht;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: ht.w,);
  }
}
