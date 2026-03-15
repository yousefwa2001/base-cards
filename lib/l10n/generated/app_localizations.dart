import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @theLanguage.
  ///
  /// In en, this message translates to:
  /// **'العربية'**
  String get theLanguage;

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Cards App'**
  String get appTitle;

  /// No description provided for @loginTitle.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginTitle;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @loginButton.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get loginButton;

  /// No description provided for @logoutButton.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logoutButton;

  /// No description provided for @homeTitle.
  ///
  /// In en, this message translates to:
  /// **'Available Cards'**
  String get homeTitle;

  /// No description provided for @balance.
  ///
  /// In en, this message translates to:
  /// **'Balance'**
  String get balance;

  /// No description provided for @buyNow.
  ///
  /// In en, this message translates to:
  /// **'Buy now'**
  String get buyNow;

  /// No description provided for @cardCategory.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get cardCategory;

  /// No description provided for @cardValue.
  ///
  /// In en, this message translates to:
  /// **'Card value'**
  String get cardValue;

  /// No description provided for @purchaseSuccess.
  ///
  /// In en, this message translates to:
  /// **'Card purchased successfully'**
  String get purchaseSuccess;

  /// No description provided for @purchaseFailed.
  ///
  /// In en, this message translates to:
  /// **'Purchase failed, please try again'**
  String get purchaseFailed;

  /// No description provided for @notEnoughBalance.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have enough balance'**
  String get notEnoughBalance;

  /// No description provided for @supplierScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Supplier Panel'**
  String get supplierScreenTitle;

  /// No description provided for @addCard.
  ///
  /// In en, this message translates to:
  /// **'Add card'**
  String get addCard;

  /// No description provided for @cardCode.
  ///
  /// In en, this message translates to:
  /// **'Card code'**
  String get cardCode;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @requiredField.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get requiredField;

  /// No description provided for @invalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Invalid email format'**
  String get invalidEmail;

  /// No description provided for @shortPassword.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters long'**
  String get shortPassword;

  /// No description provided for @passwordMismatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordMismatch;

  /// No description provided for @invalidPhone.
  ///
  /// In en, this message translates to:
  /// **'Invalid phone number'**
  String get invalidPhone;

  /// No description provided for @invalidNumber.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid number'**
  String get invalidNumber;

  /// No description provided for @invalidSelection.
  ///
  /// In en, this message translates to:
  /// **'Please select a valid option'**
  String get invalidSelection;

  /// No description provided for @termsNotAccepted.
  ///
  /// In en, this message translates to:
  /// **'You must accept the terms and conditions first'**
  String get termsNotAccepted;

  /// No description provided for @minLength.
  ///
  /// In en, this message translates to:
  /// **'The input is too short'**
  String get minLength;

  /// No description provided for @maxLength.
  ///
  /// In en, this message translates to:
  /// **'You have exceeded the maximum character limit'**
  String get maxLength;

  /// No description provided for @emptyEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email address'**
  String get emptyEmail;

  /// No description provided for @errorDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'An error occurred'**
  String get errorDialogTitle;

  /// No description provided for @errorDialogOk.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get errorDialogOk;

  /// No description provided for @errorDialogDefaultMessage.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred. Please try again later.'**
  String get errorDialogDefaultMessage;

  /// No description provided for @firebaseInvalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Invalid email address'**
  String get firebaseInvalidEmail;

  /// No description provided for @firebaseUserNotFound.
  ///
  /// In en, this message translates to:
  /// **'No user found with this email'**
  String get firebaseUserNotFound;

  /// No description provided for @firebaseWrongPassword.
  ///
  /// In en, this message translates to:
  /// **'Incorrect email or password'**
  String get firebaseWrongPassword;

  /// No description provided for @firebaseUserDisabled.
  ///
  /// In en, this message translates to:
  /// **'This account has been disabled, please contact support'**
  String get firebaseUserDisabled;

  /// No description provided for @firebaseTooManyRequests.
  ///
  /// In en, this message translates to:
  /// **'Too many failed attempts, please try again later'**
  String get firebaseTooManyRequests;

  /// No description provided for @firebaseDefaultError.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while signing in, please try again'**
  String get firebaseDefaultError;

  /// No description provided for @categories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// No description provided for @regions.
  ///
  /// In en, this message translates to:
  /// **'Regions'**
  String get regions;

  /// No description provided for @successDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get successDialogTitle;

  /// No description provided for @successDialogDefaultMessage.
  ///
  /// In en, this message translates to:
  /// **'Done successfully.'**
  String get successDialogDefaultMessage;

  /// No description provided for @successDialogOk.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get successDialogOk;

  /// No description provided for @buyCardTitle.
  ///
  /// In en, this message translates to:
  /// **'Buy Card'**
  String get buyCardTitle;

  /// No description provided for @buyCardSubtitle.
  ///
  /// In en, this message translates to:
  /// **'The amount will be deducted from your balance and the code will be shown immediately after the purchase succeeds.'**
  String get buyCardSubtitle;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @processingPurchase.
  ///
  /// In en, this message translates to:
  /// **'Processing your purchase...'**
  String get processingPurchase;

  /// No description provided for @codeCopied.
  ///
  /// In en, this message translates to:
  /// **'Code copied'**
  String get codeCopied;

  /// No description provided for @copyCode.
  ///
  /// In en, this message translates to:
  /// **'Copy code'**
  String get copyCode;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @purchaseSuccessTitle.
  ///
  /// In en, this message translates to:
  /// **'Purchase successful'**
  String get purchaseSuccessTitle;

  /// No description provided for @codeLabel.
  ///
  /// In en, this message translates to:
  /// **'Code'**
  String get codeLabel;

  /// No description provided for @unexpectedError.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred'**
  String get unexpectedError;

  /// No description provided for @errInsufficientBalance.
  ///
  /// In en, this message translates to:
  /// **'Your balance is insufficient'**
  String get errInsufficientBalance;

  /// No description provided for @errNoCards.
  ///
  /// In en, this message translates to:
  /// **'No cards are available for this value at the moment'**
  String get errNoCards;

  /// No description provided for @errAlreadySold.
  ///
  /// In en, this message translates to:
  /// **'This card was just purchased. Please try again'**
  String get errAlreadySold;

  /// No description provided for @errInvalidCard.
  ///
  /// In en, this message translates to:
  /// **'Invalid card data'**
  String get errInvalidCard;

  /// No description provided for @keepCodeSafe.
  ///
  /// In en, this message translates to:
  /// **'Keep the code in a safe place.'**
  String get keepCodeSafe;

  /// No description provided for @addCardSuccessTitle.
  ///
  /// In en, this message translates to:
  /// **'Card added successfully'**
  String get addCardSuccessTitle;

  /// No description provided for @addCardTitle.
  ///
  /// In en, this message translates to:
  /// **'Add card'**
  String get addCardTitle;

  /// No description provided for @cardCodeLabel.
  ///
  /// In en, this message translates to:
  /// **'Card code'**
  String get cardCodeLabel;

  /// No description provided for @cardCodeEmpty.
  ///
  /// In en, this message translates to:
  /// **'Card code is empty'**
  String get cardCodeEmpty;

  /// No description provided for @logoutConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Confirm logout'**
  String get logoutConfirmTitle;

  /// No description provided for @logoutConfirmMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out?'**
  String get logoutConfirmMessage;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get logout;

  /// No description provided for @cardHistory.
  ///
  /// In en, this message translates to:
  /// **'Card history'**
  String get cardHistory;

  /// No description provided for @languageChangeTitle.
  ///
  /// In en, this message translates to:
  /// **'Change language'**
  String get languageChangeTitle;

  /// No description provided for @languageChangeMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to change the language?'**
  String get languageChangeMessage;

  /// No description provided for @changeLanguage.
  ///
  /// In en, this message translates to:
  /// **'Change language'**
  String get changeLanguage;

  /// No description provided for @cardCodeAlreadyExists.
  ///
  /// In en, this message translates to:
  /// **'Code already exists'**
  String get cardCodeAlreadyExists;

  /// No description provided for @no_purchases_yet_title.
  ///
  /// In en, this message translates to:
  /// **'No purchases yet'**
  String get no_purchases_yet_title;

  /// No description provided for @no_purchases_yet_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Any purchase will appear here with the code and details.'**
  String get no_purchases_yet_subtitle;

  /// No description provided for @purchase_history.
  ///
  /// In en, this message translates to:
  /// **'Purchase History'**
  String get purchase_history;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @available.
  ///
  /// In en, this message translates to:
  /// **'Available'**
  String get available;

  /// No description provided for @sold.
  ///
  /// In en, this message translates to:
  /// **'Sold'**
  String get sold;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// No description provided for @cardsInventory.
  ///
  /// In en, this message translates to:
  /// **'Cards Inventory'**
  String get cardsInventory;

  /// No description provided for @noCardsFound.
  ///
  /// In en, this message translates to:
  /// **'No cards found'**
  String get noCardsFound;

  /// No description provided for @buyerName.
  ///
  /// In en, this message translates to:
  /// **'Buyer Name'**
  String get buyerName;

  /// No description provided for @savedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Saved successfully'**
  String get savedSuccessfully;

  /// No description provided for @enterNewCode.
  ///
  /// In en, this message translates to:
  /// **'Enter new code'**
  String get enterNewCode;

  /// No description provided for @editCardCodeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Update the card code carefully to avoid mistakes.'**
  String get editCardCodeSubtitle;

  /// No description provided for @copyOldCode.
  ///
  /// In en, this message translates to:
  /// **'Copy old code'**
  String get copyOldCode;

  /// No description provided for @savingChanges.
  ///
  /// In en, this message translates to:
  /// **'Saving changes...'**
  String get savingChanges;

  /// No description provided for @editCode.
  ///
  /// In en, this message translates to:
  /// **'Edit code'**
  String get editCode;

  /// No description provided for @editCardCodeTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit card code'**
  String get editCardCodeTitle;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @serial_number.
  ///
  /// In en, this message translates to:
  /// **'Serial Number'**
  String get serial_number;

  /// No description provided for @expiry_date.
  ///
  /// In en, this message translates to:
  /// **'Expiry Date'**
  String get expiry_date;

  /// No description provided for @expiry_month.
  ///
  /// In en, this message translates to:
  /// **'Month'**
  String get expiry_month;

  /// No description provided for @expiry_year.
  ///
  /// In en, this message translates to:
  /// **'Year'**
  String get expiry_year;

  /// No description provided for @expiry_hint_month.
  ///
  /// In en, this message translates to:
  /// **'MM'**
  String get expiry_hint_month;

  /// No description provided for @expiry_hint_year.
  ///
  /// In en, this message translates to:
  /// **'YYYY'**
  String get expiry_hint_year;

  /// No description provided for @no_expiry.
  ///
  /// In en, this message translates to:
  /// **'No expiry'**
  String get no_expiry;

  /// No description provided for @error_select_month.
  ///
  /// In en, this message translates to:
  /// **'Select month'**
  String get error_select_month;

  /// No description provided for @error_select_year.
  ///
  /// In en, this message translates to:
  /// **'Select year'**
  String get error_select_year;

  /// No description provided for @error_invalid_month.
  ///
  /// In en, this message translates to:
  /// **'Invalid month'**
  String get error_invalid_month;

  /// No description provided for @availableCards.
  ///
  /// In en, this message translates to:
  /// **'Available cards'**
  String get availableCards;

  /// No description provided for @shops.
  ///
  /// In en, this message translates to:
  /// **'Shops'**
  String get shops;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @noShopsFound.
  ///
  /// In en, this message translates to:
  /// **'No shops found'**
  String get noShopsFound;

  /// No description provided for @purchaseTimeNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'Purchase time is not available'**
  String get purchaseTimeNotAvailable;

  /// No description provided for @signUpTitle.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get signUpTitle;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get phoneNumber;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// No description provided for @invalidName.
  ///
  /// In en, this message translates to:
  /// **'Invalid name'**
  String get invalidName;

  /// No description provided for @invalidPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid Jordanian number starting with 07'**
  String get invalidPhoneNumber;

  /// No description provided for @required.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get required;

  /// No description provided for @verifyEmailTitle.
  ///
  /// In en, this message translates to:
  /// **'Email Verification'**
  String get verifyEmailTitle;

  /// No description provided for @verifyEmailHeadline.
  ///
  /// In en, this message translates to:
  /// **'Check your email'**
  String get verifyEmailHeadline;

  /// No description provided for @verifyEmailBody.
  ///
  /// In en, this message translates to:
  /// **'We sent you a verification link. Open your inbox and click the link, then come back and tap (I verified).'**
  String get verifyEmailBody;

  /// No description provided for @resendVerificationEmail.
  ///
  /// In en, this message translates to:
  /// **'Resend verification email'**
  String get resendVerificationEmail;

  /// No description provided for @iVerified.
  ///
  /// In en, this message translates to:
  /// **'I verified'**
  String get iVerified;

  /// No description provided for @forgotPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password'**
  String get forgotPasswordTitle;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get forgotPassword;

  /// No description provided for @sendResetLink.
  ///
  /// In en, this message translates to:
  /// **'Send reset link'**
  String get sendResetLink;

  /// No description provided for @resetEmailSent.
  ///
  /// In en, this message translates to:
  /// **'A reset link has been sent to your email'**
  String get resetEmailSent;

  /// No description provided for @firebaseEmailAlreadyInUse.
  ///
  /// In en, this message translates to:
  /// **'This email is already in use.'**
  String get firebaseEmailAlreadyInUse;

  /// No description provided for @firebaseWeakPassword.
  ///
  /// In en, this message translates to:
  /// **'Weak password. Use at least 6 characters.'**
  String get firebaseWeakPassword;

  /// No description provided for @firebaseOperationNotAllowed.
  ///
  /// In en, this message translates to:
  /// **'This operation is currently disabled. Contact support.'**
  String get firebaseOperationNotAllowed;

  /// No description provided for @firebaseRequiresRecentLogin.
  ///
  /// In en, this message translates to:
  /// **'For security reasons, please sign in again and try again.'**
  String get firebaseRequiresRecentLogin;

  /// No description provided for @firebaseNetworkError.
  ///
  /// In en, this message translates to:
  /// **'Network error. Check your connection and try again.'**
  String get firebaseNetworkError;

  /// No description provided for @verificationEmailSentMessage.
  ///
  /// In en, this message translates to:
  /// **'We sent a verification email to your inbox. Please open it, tap the verification link, then return to the app.'**
  String get verificationEmailSentMessage;

  /// No description provided for @emailStillNotVerifiedMessage.
  ///
  /// In en, this message translates to:
  /// **'Your email is still not verified. Please open the verification email, tap the link, then try again.'**
  String get emailStillNotVerifiedMessage;

  /// No description provided for @alreadyHaveAccountQuestion.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAccountQuestion;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get signIn;

  /// No description provided for @notActive.
  ///
  /// In en, this message translates to:
  /// **'Not Active'**
  String get notActive;

  /// No description provided for @adjustBalance.
  ///
  /// In en, this message translates to:
  /// **'Adjust Balance'**
  String get adjustBalance;

  /// No description provided for @addBalance.
  ///
  /// In en, this message translates to:
  /// **'Add Balance'**
  String get addBalance;

  /// No description provided for @deductBalance.
  ///
  /// In en, this message translates to:
  /// **'Deduct Balance'**
  String get deductBalance;

  /// No description provided for @amount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get amount;

  /// No description provided for @note.
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get note;

  /// No description provided for @optional.
  ///
  /// In en, this message translates to:
  /// **'Optional'**
  String get optional;

  /// No description provided for @invalidAmount.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid amount'**
  String get invalidAmount;

  /// No description provided for @purchasePrice.
  ///
  /// In en, this message translates to:
  /// **'Purchase price'**
  String get purchasePrice;

  /// No description provided for @invalidValue.
  ///
  /// In en, this message translates to:
  /// **'Invalid value'**
  String get invalidValue;

  /// No description provided for @mustBeGreaterThanZero.
  ///
  /// In en, this message translates to:
  /// **'Must be greater than or equal to 0'**
  String get mustBeGreaterThanZero;

  /// No description provided for @expiryMonth.
  ///
  /// In en, this message translates to:
  /// **'Expiry Month'**
  String get expiryMonth;

  /// No description provided for @expiryYear.
  ///
  /// In en, this message translates to:
  /// **'Expiry Year'**
  String get expiryYear;

  /// No description provided for @transactions.
  ///
  /// In en, this message translates to:
  /// **'Transactions'**
  String get transactions;

  /// No description provided for @transaction_details.
  ///
  /// In en, this message translates to:
  /// **'Transaction details'**
  String get transaction_details;

  /// No description provided for @copy_details.
  ///
  /// In en, this message translates to:
  /// **'Copy details'**
  String get copy_details;

  /// No description provided for @copied.
  ///
  /// In en, this message translates to:
  /// **'Copied'**
  String get copied;

  /// No description provided for @unknown_date.
  ///
  /// In en, this message translates to:
  /// **'Unknown date'**
  String get unknown_date;

  /// No description provided for @no_transactions_yet_title.
  ///
  /// In en, this message translates to:
  /// **'No transactions yet'**
  String get no_transactions_yet_title;

  /// No description provided for @no_transactions_yet_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Any balance adjustment will appear here with full details.'**
  String get no_transactions_yet_subtitle;

  /// No description provided for @tx_type.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get tx_type;

  /// No description provided for @tx_direction.
  ///
  /// In en, this message translates to:
  /// **'Direction'**
  String get tx_direction;

  /// No description provided for @tx_date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get tx_date;

  /// No description provided for @tx_amount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get tx_amount;

  /// No description provided for @tx_shop.
  ///
  /// In en, this message translates to:
  /// **'Shop'**
  String get tx_shop;

  /// No description provided for @tx_supplier.
  ///
  /// In en, this message translates to:
  /// **'Supplier'**
  String get tx_supplier;

  /// No description provided for @tx_shop_balance_before.
  ///
  /// In en, this message translates to:
  /// **'Shop balance before'**
  String get tx_shop_balance_before;

  /// No description provided for @tx_shop_balance_after.
  ///
  /// In en, this message translates to:
  /// **'Shop balance after'**
  String get tx_shop_balance_after;

  /// No description provided for @tx_supplier_balance_before.
  ///
  /// In en, this message translates to:
  /// **'Supplier balance before'**
  String get tx_supplier_balance_before;

  /// No description provided for @tx_supplier_balance_after.
  ///
  /// In en, this message translates to:
  /// **'Supplier balance after'**
  String get tx_supplier_balance_after;

  /// No description provided for @tx_credit.
  ///
  /// In en, this message translates to:
  /// **'Credit'**
  String get tx_credit;

  /// No description provided for @tx_debit.
  ///
  /// In en, this message translates to:
  /// **'Debit'**
  String get tx_debit;

  /// No description provided for @tx_balance_adjustment.
  ///
  /// In en, this message translates to:
  /// **'Balance adjustment'**
  String get tx_balance_adjustment;

  /// No description provided for @contacts.
  ///
  /// In en, this message translates to:
  /// **'Contacts'**
  String get contacts;

  /// No description provided for @quickContacts.
  ///
  /// In en, this message translates to:
  /// **'Quick Contacts'**
  String get quickContacts;

  /// No description provided for @tapAContactToCopyTheNumber.
  ///
  /// In en, this message translates to:
  /// **'Tap a contact to copy the number.'**
  String get tapAContactToCopyTheNumber;

  /// No description provided for @copy.
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get copy;

  /// No description provided for @call.
  ///
  /// In en, this message translates to:
  /// **'Call'**
  String get call;

  /// No description provided for @contactUs.
  ///
  /// In en, this message translates to:
  /// **'Contact us'**
  String get contactUs;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
