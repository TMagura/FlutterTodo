import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_todo/common/utils/constants.dart';
import 'package:riverpod_todo/common/widgets/appstyle.dart';
import 'package:riverpod_todo/common/widgets/reusable_text.dart';
import 'package:riverpod_todo/features/auth/controllers/code_provider.dart';

class TestPAge extends ConsumerWidget {
  const TestPAge({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var txt = ref.watch(codeStateProvider);
    return SafeArea(
      child: Scaffold(
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: (){ref.read(codeStateProvider.notifier).setStart("Sando");}, 
              child: Text("Press me"),
              
              ),
              ReusableText(text: txt,style: appstyle(30, AppConst.kLight, FontWeight.bold),),
          ],
        )
      ),
      ),
    );
  }
}