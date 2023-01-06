
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AccountRemoteDataSource {
  Future<User?> doSignIn();

  Future<bool> doCheckSignInStatus();

  Future<User?> getAccount();

  Future<void> doSignOut();
}

class AccountRemoteDataSourceImpl extends AccountRemoteDataSource {

  final GoogleSignIn _googleSignIn;
  final FirebaseAuth _firebaseAuth;

  AccountRemoteDataSourceImpl(this._googleSignIn, this._firebaseAuth);

  @override
  Future<User?> doSignIn() async {

    final account = await _googleSignIn.signIn();
    final auth = await account?.authentication;

    final credential = GoogleAuthProvider.credential(
      idToken: auth?.idToken,
      accessToken: auth?.accessToken
    );

    final authResult = await _firebaseAuth.signInWithCredential(credential);
    return authResult.user;
  }

  @override
  Future<bool> doCheckSignInStatus() {
    return _googleSignIn.isSignedIn();
  }

  @override
  Future<User?> getAccount() async {
    return _firebaseAuth.currentUser;
  }

  @override
  Future<void> doSignOut() {
    return _googleSignIn.signOut();
  }

}