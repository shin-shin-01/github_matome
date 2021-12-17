import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:github_matome/ui/home/home_elements.dart';
import 'package:github_matome/ui/home/home_viewmodel.dart';

class HomeView extends StatelessWidget {
  static const routeName = '/home';

  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double betweenHeight = size.height * 0.1;
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (model) => model.initialize(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const Text('GitHub Summary'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: betweenHeight),
              // GitHub のアイコン
              const GitHubIcon(),
              SizedBox(height: betweenHeight),
              // トータルコミット数
              const TotalCommitCount(),
              SizedBox(height: betweenHeight),
              // 開発した日数
              const TotalCommitDays(),
              SizedBox(height: betweenHeight),
              // 連続して開発した日数
              const ContinuousCommitDays(),
              SizedBox(height: betweenHeight),
              // 最も開発した月
              const TotalCommitCountByMonth(),
              SizedBox(height: betweenHeight),
            ],
          ),
        ),
      ),
    );
  }
}
