import 'package:assignment_task/utility/constants/color_constants.dart';
import 'package:assignment_task/utility/extensions/general_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BaseWidgets {
  BottomNavigationBarItem bottomNavigationBarItem(BuildContext context,
      {required String label,
      required String icon,
      required String activeIcon,
      required Color activeColor,
      required Color color,
      double width = 20.0,
      height = 20.0}) {
    return BottomNavigationBarItem(
        label: label,
        activeIcon: SvgIconFromAssets(
            iconName: activeIcon,
            color: Theme.of(context).primaryColor,
            width: width,
            height: height),
        icon: SvgIconFromAssets(
            color: color, iconName: icon, width: width, height: height));
  }
}

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        clipBehavior: Clip.antiAlias,
        width: size.width * 4,
        height: 100,
        decoration: BoxDecoration(
            color: ColorConstants().appPrimaryColor,
            border: Border.all(
              color: ColorConstants().appPrimaryColor,
            )),
        child: Stack(
          children: [
            Transform.scale(
              scale: 4,
              alignment: const Alignment(1.05, -0.5),
              child: ClipOval(
                child: Container(
                  //ColorConstants().appPrimaryColor.withAlpha(20),
                  decoration: const BoxDecoration(
                    color: Color(0xff084171),
                  ),
                  height: 300,
                  width: 300,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24),
                child: Row(
                  children: [
                    Row(
                      children: [
                        const SvgIconFromAssets(iconName: "bold_heart_paper"),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          title,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    const Spacer(),
                    if (Navigator.canPop(context) == true)
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child:
                              const SvgIconFromAssets(iconName: "back_button"))
                  ],
                ),
              ),
            )
          ],
        ));
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 120);
}

class SvgIconFromAssets extends StatelessWidget {
  const SvgIconFromAssets(
      {super.key,
      required this.iconName,
      this.color,
      this.width = 32.0,
      this.height = 32.0,
      this.padding = EdgeInsets.zero,
      this.boxfit = BoxFit.contain});
  final String iconName;
  final Color? color;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry padding;
  final BoxFit boxfit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: SvgPicture.asset(
        iconName.toSvg,
        color: color,
        width: width,
        height: height,
        fit: boxfit,
      ),
    );
  }
}

class ImageWidgetFromAsset extends StatelessWidget {
  const ImageWidgetFromAsset(
      {super.key,
      required this.imageName,
      this.width,
      this.height,
      this.padding = EdgeInsets.zero});
  final String imageName;
  final double? width;
  final double? height;
  final EdgeInsets padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Image.asset(
        imageName.toPng,
        height: height,
        width: width,
      ),
    );
  }
}
