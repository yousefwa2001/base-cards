import 'package:base_cards/core/constants/app_exception.dart';
import 'package:base_cards/core/enums/user_role.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/constants/app_collections.dart';
import '../models/user_model.dart';
import 'auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  AuthRemoteDataSourceImpl({required this.auth, required this.firestore});
  @override
  Stream<User?> authStateChanges() => auth.authStateChanges();
  @override
  Future<String> signIn({
    required String email,
    required String password,
  }) async {
    final UserCredential credential = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final User? user = credential.user;
    if (user == null) throw Exception(AppException.userNull);
    return user.uid;
  }

  @override
  Future<void> signOut() async {
    await auth.signOut();
  }

  @override
  Future<UserModel> getOrCreateUser({
    required String uid,
    required String email,
  }) async {
    final docRef = firestore.collection(AppCollections.users).doc(uid);
    final snap = await docRef.get();

    await auth.currentUser?.reload();
    final bool isVerified = auth.currentUser?.emailVerified ?? false;

    if (!snap.exists) {
      final UserModel userModel = UserModel(
        uid: uid,
        email: email,
        role: UserRole.shop.value,
        name: '',
        balance: 0,
        isVerified: isVerified,
      );
      await docRef.set(userModel.toMap(), SetOptions(merge: true));
      return userModel;
    }

    final data = snap.data() as Map<String, dynamic>;

    if ((data['isVerified'] as bool?) != isVerified) {
      await docRef.update({'isVerified': isVerified});
    }

    return UserModel.fromMap(uid, {...data, 'isVerified': isVerified});
  }

  @override
  Future<String> signUp({
    required String email,
    required String password,
  }) async {
    final credential = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = credential.user;
    if (user == null) throw Exception(AppException.userNull);
    return user.uid;
  }

  @override
  Future<UserModel> createUserDoc({
    required String uid,
    required String email,
    required String name,
  }) async {
    final docRef = firestore.collection(AppCollections.users).doc(uid);

    await auth.currentUser?.reload();
    final bool isVerified = auth.currentUser?.emailVerified ?? false;

    final model = UserModel(
      uid: uid,
      email: email,
      role: UserRole.shop.value,
      name: name,
      balance: 0,
      isVerified: isVerified,
    );

    await docRef.set(model.toMap(), SetOptions(merge: true));
    return model;
  }

  @override
  Future<void> sendEmailVerification() async {
    final user = auth.currentUser;
    if (user == null) {
      throw FirebaseAuthException(code: 'user-not-found', message: 'No user');
    }
    if (user.emailVerified) return;
    await user.sendEmailVerification();
  }

  @override
  Future<void> reloadUser() async {
    final user = auth.currentUser;
    if (user == null) return;
    await user.reload();
  }

  @override
  Future<bool> isEmailVerified() async {
    final user = auth.currentUser;
    if (user == null) return false;

    await user.reload();
    final refreshed = auth.currentUser;
    final verified = refreshed?.emailVerified ?? false;

    await firestore.collection(AppCollections.users).doc(user.uid).set({
      'isVerified': verified,
    }, SetOptions(merge: true));

    return verified;
  }

  @override
  Future<void> sendPasswordResetEmail({required String email}) async {
    await auth.sendPasswordResetEmail(email: email);
  }
}
