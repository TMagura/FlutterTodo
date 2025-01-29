import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_todo/common/utils/constants.dart';
import 'package:riverpod_todo/common/widgets/appstyle.dart';
import 'package:riverpod_todo/common/widgets/custom_text.dart';
import 'package:riverpod_todo/common/widgets/height_spacer.dart';
import 'package:riverpod_todo/common/widgets/reusable_text.dart';
import 'package:riverpod_todo/common/widgets/width_spacer.dart';
import 'package:riverpod_todo/common/widgets/xpansion-tile.dart';
import 'package:riverpod_todo/features/todo/controllers/xpansion_provider.dart';
import 'package:riverpod_todo/features/todo/widgets/todo_tile.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with TickerProviderStateMixin {
  //to have a tabbar
  final TextEditingController search = TextEditingController();
  late final TabController tabController =
      TabController(length: 2, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(85),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ReusableText(
                          text: "Dashboard",
                          style: appstyle(18, AppConst.kLight, FontWeight.bold),
                        ),
                        Container(
                            height: 25.h,
                            width: 25.w,
                            decoration: BoxDecoration(
                                color: AppConst.kLight,
                                borderRadius: BorderRadius.circular(9)),
                            child: GestureDetector(
                              onTap: () {},
                              child: const Icon(
                                Icons.add,
                                color: AppConst.kBkDark,
                              ),
                            ))
                      ],
                    ),
                  ),
                  const HeightSpacer(ht: 20),
                  CustomTextField(
                    hintText: "Search",
                    controller: search,
                    prefixIcon: Container(
                      padding: const EdgeInsets.all(20),
                      child: GestureDetector(
                        onTap: null,
                        child: const Icon(AntDesign.search1,
                            color: AppConst.kGreyLight),
                      ),
                    ),
                    suffixIcon: const Icon(FontAwesome.sliders,
                        color: AppConst.kGreyLight),
                  ),
                  const HeightSpacer(ht: 15),
                ],
              )),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: ListView(
              children: [
                const HeightSpacer(ht: 25),
                Row(
                  children: [
                    const Icon(
                      FontAwesome.tasks,
                      size: 20,
                      color: AppConst.kLight,
                    ),
                    const WidthSpacer(wt: 10),
                    ReusableText(
                      text: "Today`s Task",
                      style: appstyle(18, AppConst.kLight, FontWeight.bold),
                    ),
                  ],
                ),
                const HeightSpacer(ht: 20),
                Container(
                  decoration: BoxDecoration(
                    color: AppConst.kLight,
                    borderRadius:
                        BorderRadius.all(Radius.circular(AppConst.kRadius)),
                  ),
                  child: TabBar(
                    controller: tabController,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.circular(AppConst.kRadius)),
                      color: AppConst.kGreyLight,
                    ),
                    labelPadding: EdgeInsets.zero,
                    isScrollable: false,
                    labelColor: AppConst.kBlueLight,
                    labelStyle:
                        appstyle(24, AppConst.kBlueLight, FontWeight.w700),
                    unselectedLabelColor: AppConst.kLight,
                    tabs: [
                      Tab(
                        child: SizedBox(
                          width: AppConst.kWidth * 0.5,
                          child: Center(
                            child: ReusableText(
                                text: "Pending",
                                style: appstyle(
                                    16, AppConst.kBkDark, FontWeight.bold)),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          padding: EdgeInsets.only(left: 30.w),
                          width: AppConst.kWidth * 0.5,
                          child: Center(
                            child: ReusableText(
                                text: "Completed",
                                style: appstyle(
                                    16, AppConst.kBkDark, FontWeight.bold)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const HeightSpacer(ht: 20),
                SizedBox(
                  height: AppConst.kHeight * 0.3,
                  width: AppConst.kWidth,
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.all(Radius.circular(AppConst.kRadius)),
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        Container(
                          color: AppConst.kBkLight,
                          height: AppConst.kHeight * 0.3,
                          child: ListView(
                            children: [
                              TodoTile(
                                start: "03:00",
                                end: "09: 00",
                                switcher:
                                    Switch(value: true, onChanged: (value) {}),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: AppConst.kBkLight,
                          height: AppConst.kHeight * 0.3,
                        ),
                      ],
                    ),
                  ),
                ),
                const HeightSpacer(ht: 20),
                XpansionTile(
                  text: "Tomorrow`s task",
                  text2: "Tomorrow tasks are shown here",
                  onExpansionChanged: (bool expanded) {
                    ref
                        .read(xpansionStateProvider.notifier)
                        .setStart(!expanded);
                  },
                  trailing: Padding(
                    padding: EdgeInsets.only(right: 12.w),
                    child: ref.watch(xpansionStateProvider)
                        ? Icon(
                            AntDesign.circledown,
                            color: AppConst.kBlueLight,
                          )
                        : Icon(
                            AntDesign.closecircleo,
                            color: AppConst.kLight,
                          )
                  ),
                  children: [
                    TodoTile(
                      start: "03:00",
                      end: "09: 00",
                      switcher: Switch(value: true, onChanged: (value) {}),
                    ),
                    TodoTile(
                      start: "03:00",
                      end: "09: 00",
                      switcher: Switch(value: true, onChanged: (value) {}),
                    ),
                  ],
                ),
                const HeightSpacer(ht: 20),
                XpansionTile(
                  text: DateTime.now()
                      .add(const Duration(days: 2))
                      .toString()
                      .substring(5, 10),
                  text2: "Day after tomorrow tasks",
                   onExpansionChanged: (bool expanded) {
                    ref
                        .read(xpansionState0Provider.notifier)
                        .setStart(!expanded);
                  },
                  trailing: Padding(
                    padding: EdgeInsets.only(right: 12.w),
                    child: ref.watch(xpansionState0Provider)
                        ? Icon(
                            AntDesign.circledown,
                            color: AppConst.kBlueLight,
                          )
                        : Icon(
                            AntDesign.closecircleo,
                            color: AppConst.kLight,
                          )
                  ),
                  children: [
                     TodoTile(
                      start: "03:00",
                      end: "09: 00",
                      switcher: Switch(value: true, onChanged: (value) {}),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
