import 'package:github_summary/services/authentication.dart';
import 'package:github_summary/services_locator.dart';
import 'package:stacked/stacked.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeViewModel extends BaseViewModel {
  final _auth = servicesLocator<AuthService>();
  bool isSignedIn = false;
  User? currentUser;

  void initialize() {
    isSignedIn = _auth.isSignedIn();
    currentUser = _auth.getCurrentUser();
  }

  void signIn() async {
    await _auth.signIn();
    isSignedIn = _auth.isSignedIn();
    currentUser = _auth.getCurrentUser();
    print(await currentUser!.getIdToken());
    notifyListeners();
  }
}
