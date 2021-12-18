// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:github_summary/ui/theme/app_theme.dart';
import 'package:heatmap_calendar/heatmap_calendar.dart';
import 'package:heatmap_calendar/time_utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// タイトル
class TitleWidget extends HookConsumerWidget {
  const TitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;
    final theme = ref.watch(appThemeProvider);
    return Column(children: [
      Image.asset(
        // TODO: fix here
        'assets/images/GitHub_Logo_Light.png',
        width: size.width * 0.4,
        fit: BoxFit.fill,
      ),
      Text(
        "21",
        style: GoogleFonts.caveat(textStyle: theme.textTheme.h90.bold()),
      ),
      Text(
        "SUMMARY",
        style: GoogleFonts.caveat(textStyle: theme.textTheme.h90.bold()),
      ),
    ]);
  }
}

// GitHubのアイコン
class GitHubIcon extends HookConsumerWidget {
  const GitHubIcon({
    Key? key,
    required this.photoURL,
  }) : super(key: key);

  final String photoURL;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(90),
      child: Image.network(
        photoURL,
        width: 200,
        height: 200,
        fit: BoxFit.fill,
      ),
    );
  }
}

// ユーザー名
class UserName extends HookConsumerWidget {
  const UserName({
    Key? key,
    required this.displayName,
  }) : super(key: key);

  final String displayName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    return Text(
      displayName,
      style: GoogleFonts.caveat(
        textStyle: theme.textTheme.h70.bold(),
      ),
    );
  }
}

// GitHub草カレンダー
class GitHubGrassCalendar extends HookConsumerWidget {
  const GitHubGrassCalendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;
    return IgnorePointer(
      child: SizedBox(
        width: size.width * 0.7,
        child: HeatMapCalendar(
          input: {
            TimeUtils.removeTime(DateTime.now().subtract(Duration(days: 50))):
                20,
            TimeUtils.removeTime(DateTime.now().subtract(Duration(days: 3))): 5,
            TimeUtils.removeTime(DateTime.now().subtract(Duration(days: 2))):
                35,
            TimeUtils.removeTime(DateTime.now().subtract(Duration(days: 1))):
                14,
            TimeUtils.removeTime(DateTime.now()): 5,
          },
          colorThresholds: {
            1: Colors.green[100]!,
            10: Colors.green[300]!,
            30: Colors.green[500]!
          },
          weekDaysLabels: [for (var i = 0; i < 7; i++) ""],
          monthsLabels: const [
            "",
            "Jan",
            "Feb",
            "Mar",
            "Apr",
            "May",
            "Jun",
            "Jul",
            "Aug",
            "Sep",
            "Oct",
            "Nov",
            "Dec",
          ],
          squareSize: 16.0,
          textOpacity: 0.3,
          labelTextColor: Colors.blueGrey,
          dayTextColor: Colors.transparent,
        ),
      ),
    );
  }
}

// トータルコミット数
class TotalCommitCount extends HookConsumerWidget {
  const TotalCommitCount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    return Column(
      children: [
        const Text("今年のコミット数は"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "4000 ",
              style: theme.textTheme.h70.bold(),
            ),
            Text(
              "commit",
              style: theme.textTheme.h50.bold(),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "昨年 ",
              style: theme.textTheme.h40,
            ),
            Text(
              "100 ",
              style: theme.textTheme.h50.bold(),
            ),
            Text(
              "commit",
              style: theme.textTheme.h40,
            ),
          ],
        ),
      ],
    );
  }
}

// 開発した日数
class TotalCommitDays extends HookConsumerWidget {
  const TotalCommitDays({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    return Column(
      children: [
        const Text("今年開発をした日数は"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "300",
              style: theme.textTheme.h70.bold(),
            ),
            Text(
              "日",
              style: theme.textTheme.h50.bold(),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "昨年 ",
              style: theme.textTheme.h40,
            ),
            Text(
              "100",
              style: theme.textTheme.h50.bold(),
            ),
            Text(
              "日",
              style: theme.textTheme.h40,
            ),
          ],
        ),
      ],
    );
  }
}

// 連続して開発した日数
class ContinuousCommitDays extends HookConsumerWidget {
  const ContinuousCommitDays({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    return Column(
      children: [
        const Text("今年最も連続で開発をした日数は"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "30",
              style: theme.textTheme.h70.bold(),
            ),
            Text(
              "日",
              style: theme.textTheme.h50.bold(),
            ),
          ],
        ),
      ],
    );
  }
}

// 最も開発した月
class TotalCommitCountByMonth extends HookConsumerWidget {
  const TotalCommitCountByMonth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final Size size = MediaQuery.of(context).size;
    final double betweenHeight = size.height * 0.1;
    return Column(
      children: [
        const Text("今年最も開発をした月は..."),
        Text(
          "January",
          style: theme.textTheme.h70.bold(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "2010",
              style: theme.textTheme.h40,
            ),
            Text(
              "commits",
              style: theme.textTheme.h40,
            ),
          ],
        ),
        SizedBox(height: betweenHeight * 0.5),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 2,
          itemBuilder: (BuildContext context, _) => Column(
            children: [
              Text(
                "Febrary",
                style: theme.textTheme.h50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "200",
                    style: theme.textTheme.h40,
                  ),
                  Text(
                    "commits",
                    style: theme.textTheme.h40,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
