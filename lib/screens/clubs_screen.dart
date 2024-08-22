import 'package:campus_app/main.dart';
import 'package:campus_app/providers/clubs/club_notifier_provider.dart';
import 'package:campus_app/providers/clubs/club_provider.dart';
import 'package:campus_app/widgets/club_widgets/club_card.dart';
import 'package:campus_app/widgets/screen_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ClubsScreen extends ConsumerWidget {
  const ClubsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenBase(
        title: "Clubs",
        scrollPhysics: const NeverScrollableScrollPhysics(),
        child: ref.watch(clubProvider).when(
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              data: (data) {
                final clubs = ref.watch(clubNotifierProvider);
                return SizedBox(
                  height: context.screenHeight - 280,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(context.responsiveSize(20)),
                        child: TextFormField(
                          decoration: InputDecoration(hintText: "Search"),
                          onChanged: (value) {
                            ref
                                .read(clubNotifierProvider.notifier)
                                .filteredClubs(data, value);
                          },
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Padding(
                                padding:
                                    EdgeInsets.all(context.responsiveSize(10)),
                                child: ClubCard(club: clubs[index]));
                          },
                          itemCount: clubs.length,
                        ),
                      ),
                    ],
                  ),
                );
              },
              error: (error, stackTrace) {
                print(error);
                print(stackTrace);
                return const Center(
                  child: Text("Error fetching clubs"),
                );
              },
            ));
  }
}
