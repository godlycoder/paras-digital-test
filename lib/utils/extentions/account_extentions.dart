import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:paras_test/domain/uimodel/account.dart';

extension AccountMapper on User {
  AccountUiModel toUiModel() {
    return AccountUiModel(
      uid,
      displayName,
      email,
      photoURL
    );
  }
}
