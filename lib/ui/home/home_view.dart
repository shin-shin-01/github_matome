import 'package:flutter/material.dart';
import 'package:github_summary/shared/app_bar.dart';
import 'package:stacked/stacked.dart';
import 'package:github_summary/ui/home/home_elements.dart';
import 'package:github_summary/ui/home/home_viewmodel.dart';

class HomeView extends StatelessWidget {
  static const routeName = '/home';

  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (model) => model.initialize(),
      builder: (context, model, child) => Scaffold(
        appBar: customAppBar(),
        body: SingleChildScrollView(
          child: Center(
            child: model.isSignedIn
                ? const SignInedWidget()
                : const NotSignInedWidget(),
          ),
        ),
      ),
    );
  }
}

class SignInedWidget extends ViewModelWidget<HomeViewModel> {
  const SignInedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    final Size size = MediaQuery.of(context).size;
    final double betweenHeight = size.height * 0.1;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: betweenHeight),
        const TitleWidget(),
        SizedBox(height: betweenHeight),
        // GitHub のアイコン
        GitHubIcon(photoURL: viewModel.currentUser!.photoURL!),
        SizedBox(height: betweenHeight * 0.5),
        // ユーザー名
        UserName(displayName: viewModel.currentUser!.displayName!),
        SizedBox(height: betweenHeight),
        // GitHub草カレンダー
        const GitHubGrassCalendar(),
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
    );
  }
}

class NotSignInedWidget extends ViewModelWidget<HomeViewModel> {
  const NotSignInedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    final Size size = MediaQuery.of(context).size;
    final double betweenHeight = size.height * 0.1;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: betweenHeight),
        const TitleWidget(),
        SizedBox(height: betweenHeight),

        // SignIn Button
        ElevatedButton(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Colors.blue[500]!,
                  Colors.blue[700]!,
                  Colors.blue[800]!,
                ],
              ),
            ),
            padding: const EdgeInsets.all(10),
            child: const Text(
              'SignIn With GitHub ...',
            ),
          ),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () => viewModel.signIn(),
        ),
      ],
    );
  }
}
