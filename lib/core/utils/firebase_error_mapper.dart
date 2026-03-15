import '../../l10n/generated/app_localizations.dart';

String mapFirebaseErrorToMessage(String rawCode, AppLocalizations t) {
  final code = rawCode.trim().toLowerCase();

  switch (code) {
    case 'invalid-email':
      return t.firebaseInvalidEmail;

    case 'user-not-found':
      return t.firebaseUserNotFound;

    case 'wrong-password':
    case 'invalid-credential':
      return t.firebaseWrongPassword;

    case 'user-disabled':
      return t.firebaseUserDisabled;

    case 'too-many-requests':
      return t.firebaseTooManyRequests;

    case 'email-already-in-use':
      return t.firebaseEmailAlreadyInUse;

    case 'weak-password':
      return t.firebaseWeakPassword;

    case 'operation-not-allowed':
      return t.firebaseOperationNotAllowed;

    case 'requires-recent-login':
      return t.firebaseRequiresRecentLogin;

    case 'network-request-failed':
      return t.firebaseNetworkError;

    default:
      return t.firebaseDefaultError;
  }
}
