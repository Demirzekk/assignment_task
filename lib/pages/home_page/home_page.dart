import 'package:assignment_task/base/base_widgets.dart';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            Stack(
              children: [
                const SafeArea(
                  child: ImageWidgetFromAsset(
                    imageName: "home_banner",
                  ),
                ),
                ClipPath(
                  clipper: BezierClipper(),
                  child: Container(
                    alignment: Alignment.topCenter,
                    width: size.width,
                    height: 140,
                    color: Colors.white,
                    child: const ImageWidgetFromAsset(
                      height: 77,
                      imageName: "patient_logo",
                      padding: EdgeInsets.only(top: 8),
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Center(
                      child: Stack(
                        children: [
                          Container(
                            clipBehavior: Clip.antiAlias,
                            margin: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 12),
                            height: 100,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  alignment: FractionalOffset.topCenter,
                                  image:
                                      AssetImage("assets/listtile_image.png"),
                                )),
                            child: Stack(
                              children: [
                                Transform.rotate(
                                  angle: 0.2,
                                  origin: const Offset(-380, -91),
                                  child: Container(
                                    height: 60,
                                    width: double.maxFinite,
                                    color: const Color(0x000a4b81)
                                        .withOpacity(0.6),
                                  ),
                                ),
                                Transform.rotate(
                                  angle: -0.2,
                                  origin: const Offset(200, 0),
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    height: 60,
                                    width: double.maxFinite,
                                    color: const Color(0x000a4b81)
                                        .withOpacity(0.6),
                                  ),
                                ),
                                Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0, vertical: 8.0),
                                      child: Text(
                                        "Klinik $index",
                                        style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class BezierClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 100);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 100);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(oldClipper) => false;
}
