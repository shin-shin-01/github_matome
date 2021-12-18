// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:firebase_auth/firebase_auth.dart';

/// AuthService
/// - a wrapper for Firebase Authentication Service
class AuthService {
  // Firebase Authetication instance
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  /// auth change user stream
  /// - will trigger a stream every time the authState changes
  /// or idToken changes
  Stream<User?> get user => _firebaseAuth.userChanges();

  /// サインイン中か
  bool isSignedIn() => _firebaseAuth.currentUser != null;

  /// 現在のユーザー情報
  User? getCurrentUser() => _firebaseAuth.currentUser;

  /// サインアウト
  void signOut() => _firebaseAuth.signOut();

  /// サインイン
  Future<User?> signIn() async {
    GithubAuthProvider githubProvider = GithubAuthProvider();
    await _firebaseAuth.signInWithPopup(githubProvider);
  }
}
