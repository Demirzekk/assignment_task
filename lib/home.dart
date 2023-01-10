import 'package:assignment_task/pages/appointment_page/appointment_page.dart';
import 'package:get/get.dart';

import '../utility/constants/app_icons.dart';
import 'package:flutter/material.dart';

import 'base/base_widgets.dart';
import 'pages/home_page/home_page.dart';
import 'pages/home_page/home_page_model_view.dart';
import 'utility/constants/color_constants.dart';

class MyHome extends StatefulWidget {
  const MyHome({
    super.key,
  });

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> with BaseWidgets, AppIconPacks {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Assignment Task',
        home: AppInit());
  }
}

class AppInit extends StatelessWidget with ColorConstants {
  AppInit({super.key});

  @override
  Widget build(BuildContext context) {
    var tabScreens = [const HomePage(), const AppointmentPage()];
    final PageIndexController pageIndex = Get.put(PageIndexController());
    final PageIndexController getPageIndex = Get.find();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Obx(
        () => tabScreens[getPageIndex.currentPage.value],
      ),
      bottomNavigationBar: Obx(
        () => Container(
          width: size.width,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.grey.shade200, // const Color(0x00f5f5f5),
            borderRadius: BorderRadius.vertical(
                bottom: Radius.elliptical(size.width, 0),
                top: Radius.elliptical(size.width * 2, 30)),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    pageIndex.currentPage.value = 0;
                    pageIndex.navigateToTab(pageIndex.currentPage);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: pageIndex.currentPage.value != 0
                          ? Colors.transparent
                          : const Color(0xFF0a4b81),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    width: 72,
                    height: 63,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgIconFromAssets(
                            height: 18,
                            width: 17,
                            color: pageIndex.currentPage.value == 0
                                ? Colors.white
                                : appPrimaryColor,
                            iconName: "home_button_light"),
                        Text(
                          "Ana Sayfa",
                          style: TextStyle(
                              color: pageIndex.currentPage.value == 0
                                  ? Colors.white
                                  : appPrimaryColor,
                              fontSize: 11),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                InkWell(
                  onTap: () {
                    pageIndex.currentPage.value = 1;
                    pageIndex.navigateToTab(pageIndex.currentPage);
                  },
                  child: AppointmentTabButton(
                      pageIndex: pageIndex, appPrimaryColor: appPrimaryColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AppointmentTabButton extends StatelessWidget {
  const AppointmentTabButton({
    Key? key,
    required this.pageIndex,
    required this.appPrimaryColor,
  }) : super(key: key);

  final PageIndexController pageIndex;
  final Color appPrimaryColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: pageIndex.currentPage.value == 0
            ? Colors.transparent
            : appPrimaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      width: 75,
      height: 63,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgIconFromAssets(
              color: pageIndex.currentPage.value != 0
                  ? Colors.white
                  : appPrimaryColor,
              height: 19,
              width: 19,
              iconName: "calendar-Filled"),
          Text(
            "Randevularım",
            style: TextStyle(
                color: pageIndex.currentPage.value != 0
                    ? Colors.white
                    : appPrimaryColor,
                fontSize: 11),
          )
        ],
      ),
    );
  }
}
