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

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar(
      {super.key,
      this.titleWidget,
      this.leading,
      this.bottomWidget,
      this.actionIcon,
      this.actionIcon2,
      this.leadingWidth = 28,
      this.bgColor,
      this.fgColor,
      this.centerTitle = true,
      this.titleIconWidht = 120.0,
      this.titleIconHeight = 80.0,
      this.snap = false,
      this.floating = true,
      this.pinned = true});
  final Widget? titleWidget;
  final Widget? leading;
  final Widget? bottomWidget;
  final Widget? actionIcon;
  final Widget? actionIcon2;
  final double leadingWidth;
  final Color? bgColor;
  final Color? fgColor;
  final bool centerTitle;
  final double titleIconWidht;
  final double titleIconHeight;
  final bool snap;
  final bool floating;
  final bool pinned;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: floating,
      pinned: pinned,
      snap: snap,
      backgroundColor: bgColor ?? Colors.white,
      foregroundColor: fgColor ?? Colors.blueGrey.shade800,
      elevation: 0,
      leading: leading,
      leadingWidth: leadingWidth,
      title: titleWidget ??
          SvgIconFromAssets(
              iconName: "AppIconPacks",
              width: titleIconWidht,
              height: titleIconHeight),
      centerTitle: centerTitle,
      iconTheme: const IconThemeData(size: 26),
      actionsIconTheme: const IconThemeData(size: 25),
      bottom: bottomWidget == null
          ? const PreferredSize(
              preferredSize: Size.zero, child: SizedBox.shrink())
          : PreferredSize(
              preferredSize: const Size(double.minPositive, 48),
              child: bottomWidget ?? const SizedBox.shrink(),
            ),
      actions: [
        actionIcon ?? const SizedBox(),
      ],
    );
  }
}

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar(
      {super.key,
      this.titleWidget,
      this.leading,
      this.actionIcon,
      this.actionIcon2,
      this.bottomWidget,
      this.centerTitle = false,
      this.leadingWidth,
      this.titleIconWidht = 120.0,
      this.titleIconHeight = 75.0});

  final Widget? titleWidget;
  final Widget? leading;
  final Widget? actionIcon;
  final Widget? actionIcon2;
  final Widget? bottomWidget;
  final bool? centerTitle;
  final double? leadingWidth;
  final double titleIconWidht;
  final double titleIconHeight;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
      leading: leading,
      leadingWidth: leadingWidth,
      title: titleWidget ??
          SvgIconFromAssets(
              iconName: " AppIconPacks.",
              width: titleIconWidht,
              height: titleIconHeight),
      centerTitle: centerTitle,
      iconTheme: const IconThemeData(size: 26),
      bottom: bottomWidget == null
          ? const PreferredSize(
              preferredSize: Size.zero, child: SizedBox.shrink())
          : PreferredSize(
              preferredSize: const Size(double.minPositive, 48),
              child: bottomWidget ?? const SizedBox.shrink(),
            ),
      actions: [
        actionIcon ?? const SizedBox(),
      ],
    );
  }
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
        iconName,
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Image.asset(
        imageName.toPng,
        width: width,
        height: height,
      ),
    );
  }
}
