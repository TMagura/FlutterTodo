import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_todo/common/utils/constants.dart';
import 'package:riverpod_todo/common/widgets/appstyle.dart';
import 'package:riverpod_todo/common/widgets/height_spacer.dart';
import 'package:riverpod_todo/common/widgets/reusable_text.dart';
import 'package:riverpod_todo/common/widgets/width_spacer.dart';

class BottomTitles extends StatelessWidget {
  const BottomTitles({super.key, required this.text, required this.text2, this.clr});

  final String text;
  final String text2;
  final Color? clr;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppConst.kWidth,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Consumer(builder: (context, ref, child) {
              return Container(
                height: 80,
                width: 5,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.all(Radius.circular(AppConst.kRadius)),

                  ///TODO:  add changing color here
                  color: AppConst.kGreen,
                ),
              );
            }),
            const WidthSpacer(
              wt: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(
                      text: text,
                      style: appstyle(24, AppConst.kLight, FontWeight.bold)),
                  const HeightSpacer(ht: 10),
                  ReusableText(
                      text:text2,
                      style: appstyle(12, AppConst.kLight, FontWeight.normal)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
