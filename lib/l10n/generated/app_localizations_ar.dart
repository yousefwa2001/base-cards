// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get theLanguage => 'English';

  @override
  String get appTitle => 'تطبيق البطاقات';

  @override
  String get loginTitle => 'تسجيل الدخول';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get password => 'كلمة المرور';

  @override
  String get loginButton => 'دخول';

  @override
  String get logoutButton => 'تسجيل الخروج';

  @override
  String get homeTitle => 'البطاقات المتاحة';

  @override
  String get balance => 'الرصيد';

  @override
  String get buyNow => 'شراء الآن';

  @override
  String get cardCategory => 'الفئة';

  @override
  String get cardValue => 'قيمة البطاقة';

  @override
  String get purchaseSuccess => 'تم شراء البطاقة بنجاح';

  @override
  String get purchaseFailed => 'فشل الشراء، حاول مرة أخرى';

  @override
  String get notEnoughBalance => 'لا يوجد رصيد كافٍ';

  @override
  String get supplierScreenTitle => 'لوحة المورّد';

  @override
  String get addCard => 'إضافة بطاقة';

  @override
  String get cardCode => 'كود البطاقة';

  @override
  String get price => 'السعر';

  @override
  String get save => 'حفظ';

  @override
  String get requiredField => 'هذا الحقل مطلوب';

  @override
  String get invalidEmail => 'صيغة البريد الإلكتروني غير صحيحة';

  @override
  String get shortPassword => 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';

  @override
  String get passwordMismatch => 'كلمتا المرور غير متطابقتين';

  @override
  String get invalidPhone => 'رقم الهاتف غير صالح';

  @override
  String get invalidNumber => 'الرجاء إدخال رقم صحيح';

  @override
  String get invalidSelection => 'الرجاء اختيار قيمة صحيحة';

  @override
  String get termsNotAccepted => 'يجب الموافقة على الشروط والأحكام أولاً';

  @override
  String get minLength => 'المدخل قصير جدًا';

  @override
  String get maxLength => 'لقد تجاوزت الحد الأقصى لعدد الأحرف المسموح به';

  @override
  String get emptyEmail => 'الرجاء إدخال البريد الإلكتروني';

  @override
  String get errorDialogTitle => 'حدث خطأ';

  @override
  String get errorDialogOk => 'حسنًا';

  @override
  String get errorDialogDefaultMessage =>
      'حدث خطأ غير متوقع. حاول مرة أخرى لاحقًا.';

  @override
  String get firebaseInvalidEmail => 'البريد الإلكتروني غير صالح';

  @override
  String get firebaseUserNotFound => 'لا يوجد مستخدم مسجّل بهذا البريد';

  @override
  String get firebaseWrongPassword =>
      'البريد الإلكتروني أو كلمة المرور غير صحيحة';

  @override
  String get firebaseUserDisabled => 'هذا الحساب معطّل، تواصل مع الدعم';

  @override
  String get firebaseTooManyRequests =>
      'محاولات عديدة فاشلة، الرجاء المحاولة لاحقًا';

  @override
  String get firebaseDefaultError =>
      'حدث خطأ أثناء تسجيل الدخول، حاول مرة أخرى';

  @override
  String get categories => 'الفئات';

  @override
  String get regions => 'المناطق';

  @override
  String get successDialogTitle => 'تم بنجاح';

  @override
  String get successDialogDefaultMessage => 'تمت العملية بنجاح.';

  @override
  String get successDialogOk => 'حسنًا';

  @override
  String get buyCardTitle => 'شراء كرت';

  @override
  String get buyCardSubtitle =>
      'سيتم خصم المبلغ من رصيدك وإظهار الكود مباشرة بعد نجاح العملية.';

  @override
  String get cancel => 'إلغاء';

  @override
  String get processingPurchase => 'جارِ إتمام عملية الشراء...';

  @override
  String get codeCopied => 'تم نسخ الكود';

  @override
  String get copyCode => 'نسخ الكود';

  @override
  String get done => 'تم';

  @override
  String get close => 'إغلاق';

  @override
  String get purchaseSuccessTitle => 'تم الشراء بنجاح';

  @override
  String get codeLabel => 'الكود';

  @override
  String get unexpectedError => 'حدث خطأ غير متوقع';

  @override
  String get errInsufficientBalance => 'رصيدك غير كافي';

  @override
  String get errNoCards => 'لا توجد كروت متاحة لهذه القيمة حالياً';

  @override
  String get errAlreadySold => 'تم شراء الكرت للتو، حاول مرة أخرى';

  @override
  String get errInvalidCard => 'بيانات الكرت غير صحيحة';

  @override
  String get keepCodeSafe => 'احتفظ بالكود بمكان آمن.';

  @override
  String get addCardSuccessTitle => 'تمت إضافة الكرت بنجاح';

  @override
  String get addCardTitle => 'إضافة كرت';

  @override
  String get cardCodeLabel => 'كود الكرت';

  @override
  String get cardCodeEmpty => 'كود الكرت فارغ';

  @override
  String get logoutConfirmTitle => 'تأكيد تسجيل الخروج';

  @override
  String get logoutConfirmMessage => 'هل أنت متأكد أنك تريد تسجيل الخروج؟';

  @override
  String get logout => 'تسجيل الخروج';

  @override
  String get cardHistory => 'سجل البطاقات';

  @override
  String get languageChangeTitle => 'تغيير اللغة';

  @override
  String get languageChangeMessage => 'هل أنت متأكد أنك تريد تغيير اللغة؟';

  @override
  String get changeLanguage => 'تغيير اللغة';

  @override
  String get cardCodeAlreadyExists => 'الكود موجود مسبقًا';

  @override
  String get no_purchases_yet_title => 'لا يوجد مشتريات بعد';

  @override
  String get no_purchases_yet_subtitle =>
      'أي عملية شراء ستظهر هنا مع الكود والتفاصيل.';

  @override
  String get purchase_history => 'سجل المشتريات';

  @override
  String get all => 'الكل';

  @override
  String get available => 'متاح';

  @override
  String get sold => 'مباع';

  @override
  String get category => 'الفئة';

  @override
  String get cardsInventory => 'مخزون البطاقات';

  @override
  String get noCardsFound => 'لم يتم العثور على بطاقات';

  @override
  String get buyerName => 'اسم المشتري';

  @override
  String get savedSuccessfully => 'تم الحفظ بنجاح';

  @override
  String get enterNewCode => 'أدخل الكود الجديد';

  @override
  String get editCardCodeSubtitle => 'حدّث كود البطاقة بحذر لتجنب أي خطأ.';

  @override
  String get copyOldCode => 'نسخ الكود القديم';

  @override
  String get savingChanges => 'جاري حفظ التغييرات...';

  @override
  String get editCode => 'تعديل الكود';

  @override
  String get editCardCodeTitle => 'تعديل كود البطاقة';

  @override
  String get edit => 'تعديل';

  @override
  String get serial_number => 'الرقم التسلسلي';

  @override
  String get expiry_date => 'تاريخ الانتهاء';

  @override
  String get expiry_month => 'الشهر';

  @override
  String get expiry_year => 'السنة';

  @override
  String get expiry_hint_month => 'شهر';

  @override
  String get expiry_hint_year => 'سنة';

  @override
  String get no_expiry => 'بدون تاريخ انتهاء';

  @override
  String get error_select_month => 'اختر الشهر';

  @override
  String get error_select_year => 'اختر السنة';

  @override
  String get error_invalid_month => 'شهر غير صالح';

  @override
  String get availableCards => 'البطاقات المتاحة';

  @override
  String get shops => 'المحلات';

  @override
  String get search => 'بحث';

  @override
  String get noShopsFound => 'لم يتم العثور على محلات';

  @override
  String get purchaseTimeNotAvailable => 'وقت الشراء غير متوفر';

  @override
  String get signUpTitle => 'إنشاء حساب';

  @override
  String get name => 'الاسم';

  @override
  String get phoneNumber => 'رقم الهاتف';

  @override
  String get createAccount => 'إنشاء حساب';

  @override
  String get invalidName => 'الاسم غير صالح';

  @override
  String get invalidPhoneNumber => 'رقم أردني صحيح يبدأ بـ 07';

  @override
  String get required => 'هذا الحقل مطلوب';

  @override
  String get verifyEmailTitle => 'تأكيد البريد الإلكتروني';

  @override
  String get verifyEmailHeadline => 'تحقق من بريدك الإلكتروني';

  @override
  String get verifyEmailBody =>
      'أرسلنا لك رابط تأكيد على بريدك. افتح البريد واضغط على الرابط، ثم ارجع واضغط (لقد تحققت).';

  @override
  String get resendVerificationEmail => 'إعادة إرسال رابط التحقق';

  @override
  String get iVerified => 'لقد تحققت';

  @override
  String get forgotPasswordTitle => 'نسيت كلمة المرور';

  @override
  String get forgotPassword => 'هل نسيت كلمة المرور؟';

  @override
  String get sendResetLink => 'إرسال رابط الاستعادة';

  @override
  String get resetEmailSent => 'تم إرسال رابط الاستعادة إلى بريدك الإلكتروني';

  @override
  String get firebaseEmailAlreadyInUse =>
      'هذا البريد الإلكتروني مستخدم مسبقًا.';

  @override
  String get firebaseWeakPassword =>
      'كلمة المرور ضعيفة. استخدم 6 أحرف على الأقل.';

  @override
  String get firebaseOperationNotAllowed =>
      'هذه العملية غير مفعّلة حاليًا. تواصل مع الدعم.';

  @override
  String get firebaseRequiresRecentLogin =>
      'لأسباب أمنية، الرجاء تسجيل الدخول مرة أخرى ثم إعادة المحاولة.';

  @override
  String get firebaseNetworkError =>
      'مشكلة في الاتصال بالإنترنت. تحقق من الشبكة وحاول مرة أخرى.';

  @override
  String get verificationEmailSentMessage =>
      'تم إرسال رسالة تحقق إلى بريدك الإلكتروني. الرجاء فتح البريد والضغط على رابط التحقق ثم العودة للتطبيق.';

  @override
  String get emailStillNotVerifiedMessage =>
      'البريد غير مُحقق بعد. افتح رسالة التحقق واضغط الرابط ثم جرّب مرة أخرى.';

  @override
  String get alreadyHaveAccountQuestion => 'هل لديك حساب بالفعل؟';

  @override
  String get signIn => 'تسجيل الدخول';

  @override
  String get notActive => 'غير نشط';

  @override
  String get adjustBalance => 'تعديل الرصيد';

  @override
  String get addBalance => 'إضافة رصيد';

  @override
  String get deductBalance => 'خصم رصيد';

  @override
  String get amount => 'المبلغ';

  @override
  String get note => 'ملاحظة';

  @override
  String get optional => 'اختياري';

  @override
  String get invalidAmount => 'يرجى إدخال مبلغ صحيح';

  @override
  String get purchasePrice => 'سعر الشراء';

  @override
  String get invalidValue => 'قيمة غير صحيحة';

  @override
  String get mustBeGreaterThanZero => 'يجب أن تكون القيمة أكبر من أو تساوي 0';

  @override
  String get expiryMonth => 'شهر الانتهاء';

  @override
  String get expiryYear => 'سنة الانتهاء';

  @override
  String get transactions => 'الحركات المالية';

  @override
  String get transaction_details => 'تفاصيل الحركة';

  @override
  String get copy_details => 'نسخ التفاصيل';

  @override
  String get copied => 'تم النسخ';

  @override
  String get unknown_date => 'تاريخ غير معروف';

  @override
  String get no_transactions_yet_title => 'لا توجد حركات حتى الآن';

  @override
  String get no_transactions_yet_subtitle =>
      'أي تعديل على الرصيد سيظهر هنا مع التفاصيل الكاملة.';

  @override
  String get tx_type => 'النوع';

  @override
  String get tx_direction => 'الاتجاه';

  @override
  String get tx_date => 'التاريخ';

  @override
  String get tx_amount => 'المبلغ';

  @override
  String get tx_shop => 'المحل';

  @override
  String get tx_supplier => 'المورد';

  @override
  String get tx_shop_balance_before => 'رصيد المحل قبل';

  @override
  String get tx_shop_balance_after => 'رصيد المحل بعد';

  @override
  String get tx_supplier_balance_before => 'رصيد المورد قبل';

  @override
  String get tx_supplier_balance_after => 'رصيد المورد بعد';

  @override
  String get tx_credit => 'إيداع';

  @override
  String get tx_debit => 'خصم';

  @override
  String get tx_balance_adjustment => 'تعديل رصيد';

  @override
  String get contacts => 'جهات الاتصال';

  @override
  String get quickContacts => 'جهات اتصال سريعة';

  @override
  String get tapAContactToCopyTheNumber => 'اضغط على جهة اتصال لنسخ الرقم.';

  @override
  String get copy => 'نسخ';

  @override
  String get call => 'اتصال';

  @override
  String get contactUs => 'تواصل معنا';
}
