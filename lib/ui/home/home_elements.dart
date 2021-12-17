import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:github_matome/ui/theme/app_theme.dart';
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
  const GitHubIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(90),
      child: Image.network(
        'https://avatars.githubusercontent.com/u/51741264?v=4',
        width: 200,
        height: 200,
        fit: BoxFit.fill,
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
