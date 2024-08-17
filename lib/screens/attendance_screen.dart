import 'package:campus_app/providers/user_data/user_data_provider.dart';
import 'package:campus_app/widgets/attendance_widget.dart';
import 'package:campus_app/widgets/screen_base.dart';
import 'package:flutter/material.dart';
import 'package:campus_app/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AttendanceScreen extends ConsumerWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenBase(
        title: "Attendance",
        scrollPhysics: const NeverScrollableScrollPhysics(),
        child: ref.watch(userDataProvider).when(
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              data: (data) {
                final courses = data.courses;
                return Container(
                  padding: EdgeInsets.all(context.responsiveSize(10)),
                  height: context.screenHeight - 280,
                  width: context.screenWidth,
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.all(context.responsiveSize(5)),
                          child: AttendanceWidget(
                            course: courses[index],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: context.responsiveSize(10),
                        );
                      },
                      itemCount: courses.length),
                );
              },
              error: (error, stackTrace) {
                print(error);
                print(stackTrace);
                return const Center(
                  child: Text("Error getting attendance details"),
                );
              },
            ));
  }
}
