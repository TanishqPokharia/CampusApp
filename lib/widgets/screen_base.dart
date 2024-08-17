import 'package:campus_app/main.dart';
import 'package:campus_app/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScreenBase extends StatelessWidget {
  const ScreenBase(
      {super.key, required this.child, this.title, this.scrollPhysics});
  final Widget child;
  final String? title;
  final ScrollPhysics? scrollPhysics;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: scrollPhysics,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            const BackgroundImage(),
            Container(
              height: context.screenHeight,
              width: context.screenWidth,
              color: Colors.indigo.shade900.withOpacity(0.1),
            ),
            title != null
                ? Padding(
                    padding: EdgeInsets.all(context.responsiveSize(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: context.responsiveSize(100),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(left: context.responsiveSize(20)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset("assets/Logo.svg"),
                              SizedBox(
                                height: context.responsiveSize(20),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: context.responsiveSize(14)),
                                child: Text(
                                  title!,
                                  style: context.textLarge!
                                      .copyWith(color: Colors.blue.shade100),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: context.responsiveSize(20),
                        ),
                        child
                      ],
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.all(context.responsiveSize(8)),
                    child: child,
                  )
          ],
        ),
      ),
    );
  }
}
