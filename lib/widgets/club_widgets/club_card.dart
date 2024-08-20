import 'package:campus_app/main.dart';
import 'package:campus_app/models/club.dart';
import 'package:campus_app/widgets/event_widgets/event_popularity.dart';
import 'package:campus_app/widgets/event_widgets/event_tag.dart';
import 'package:flutter/material.dart';
import 'package:glass/glass.dart';

class ClubCard extends StatelessWidget {
  const ClubCard({
    super.key,
    required this.club,
  });

  final Club club;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.all(context.responsiveSize(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: context.responsiveSize(20),
          children: [
            Text(
              club.name,
              style: context.textTheme.headlineSmall,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(child: Text(club.description)),
                Padding(
                  padding: EdgeInsets.all(context.responsiveSize(20)),
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(context.responsiveSize(10)),
                    child: Image.network(
                      club.logo,
                      fit: BoxFit.fill,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress != null) {
                          return ColoredBox(
                              color: Colors.white.withOpacity(0.1));
                        }
                        return child;
                      },
                      width: context.responsiveSize(100),
                      height: context.responsiveSize(100),
                    ),
                  ),
                )
              ],
            ),
            Wrap(
              spacing: 5,
              runSpacing: 5,
              children: [
                club.isRecruiting != null
                    ? club.isRecruiting!
                        ? const FeatureTag(title: "#Recruiting")
                        : const SizedBox()
                    : const SizedBox(),
                ...club.labels.map((e) => FeatureTag(title: e))
              ],
            ),
            EventPopularity(popularity: "20")
          ],
        ),
      ).asGlass(
          tintColor: Colors.blue,
          frosted: false,
          clipBorderRadius: BorderRadius.circular(context.responsiveSize(10))),
    );
  }
}
