import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Stream<User?> authStateChanges();
  Future<String> signIn({required String email, required String password});
  Future<void> signOut();

  Future<UserModel> getOrCreateUser({
    required String uid,
    required String email,
  });
  Future<String> signUp({required String email, required String password});

  Future<UserModel> createUserDoc({
    required String uid,
    required String email,
    required String name,
    required String phoneNumber,
  });
  Future<void> sendEmailVerification();

  Future<bool> isEmailVerified();
  Future<void> reloadUser();
  Future<void> sendPasswordResetEmail({required String email});
}
