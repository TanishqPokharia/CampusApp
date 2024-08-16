import 'package:campus_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glass/glass.dart';

class Calendar extends StatelessWidget {
  const Calendar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.responsiveSize(20)),
      child: Container(
        padding: EdgeInsets.all(context.responsiveSize(20)),
        width: double.infinity,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.keyboard_arrow_left,
                        ))
                    .asGlass(
                        frosted: false,
                        tintColor: Colors.blue,
                        clipBorderRadius:
                            BorderRadius.circular(context.responsiveSize(100))),
                Theme(
                  data: Theme.of(context).copyWith(
                    canvasColor: const Color.fromRGBO(11, 38, 74, 1),
                  ),
                  child: DropdownButton(
                          alignment: Alignment.center,
                          onChanged: (value) {},
                          value: 1,
                          icon: SizedBox(
                            height: context.responsiveSize(50),
                            child: Column(
                              children: [
                                const Spacer(),
                                SvgPicture.asset(
                                  "assets/calendar_months_drawer.svg",
                                  width: context.responsiveSize(20),
                                  height: context.responsiveSize(20),
                                ),
                              ],
                            ),
                          ),
                          underline: const SizedBox(),
                          padding: EdgeInsets.symmetric(
                              horizontal: context.responsiveSize(5)),
                          borderRadius:
                              BorderRadius.circular(context.responsiveSize(10)),
                          style: context.textSmall!
                              .copyWith(fontSize: context.responsiveSize(20)),
                          items: {
                            "January": 1,
                            "February": 2,
                            "March": 3,
                            "April": 4,
                            "May": 5,
                            "June": 6,
                            "July": 7,
                            "August": 8,
                            "September": 9,
                            "October": 10,
                            "November": 11,
                            "December": 12
                          }
                              .entries
                              .map((e) => DropdownMenuItem(
                                  value: e.value,
                                  child: Container(
                                    padding: EdgeInsets.all(
                                        context.responsiveSize(10)),
                                    child: Text(e.key),
                                  )))
                              .toList())
                      .asGlass(
                          frosted: false,
                          tintColor: Colors.blue,
                          clipBorderRadius: BorderRadius.circular(
                              context.responsiveSize(10))),
                ),
                IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.keyboard_arrow_right))
                    .asGlass(
                        frosted: false,
                        tintColor: Colors.blue,
                        clipBorderRadius:
                            BorderRadius.circular(context.responsiveSize(100)))
              ],
            ),
            SizedBox(
              height: context.responsiveSize(20),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: ["Mo", "Tu", "We", "Th", "Fr", "Sat", "Su"]
                    .map((e) => Container(
                          alignment: Alignment.center,
                          width: context.responsiveSize(50),
                          margin: EdgeInsets.symmetric(
                              horizontal: context.responsiveSize(2)),
                          child: Text(
                            e,
                            style: context.textSmall!.copyWith(
                                fontSize: context.responsiveSize(20),
                                color: Colors.white.withOpacity(0.3)),
                          ),
                        ))
                    .toList()),
            SizedBox(
              height: context.responsiveSize(20),
            ),
            Wrap(
                alignment: WrapAlignment.start,
                spacing: context.responsiveSize(4),
                runAlignment: WrapAlignment.spaceEvenly,
                runSpacing: context.responsiveSize(5),
                children: List.generate(30, (index) => index + 1)
                    .map((e) => Container(
                          alignment: Alignment.center,
                          width: context.responsiveSize(50),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(41, 117, 218, 0.611)
                                  .withOpacity(0.2),
                              borderRadius: BorderRadius.circular(
                                  context.responsiveSize(10))),
                          padding: EdgeInsets.all(context.responsiveSize(10)),
                          child: Text("$e"),
                        ))
                    .toList())
          ],
        ),
      ).asGlass(
          tintColor: Colors.blue.shade500,
          frosted: false,
          clipBorderRadius: BorderRadius.circular(context.responsiveSize(10))),
    );
  }
}
