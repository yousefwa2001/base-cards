# Base Cards

Production-ready Flutter B2B digital voucher marketplace built with Clean Architecture and Firebase.

---

## 📌 Project Overview

Base Cards is a wallet-based digital card supply platform designed for shop accounts to securely purchase voucher codes from a centralized inventory.

The system focuses on transactional safety, role isolation, and scalable architecture.

---

## 🎯 Problem This Project Solves

Digital voucher systems are prone to:

- Double selling inventory  
- Inconsistent balance deduction  
- Role abuse  
- Mutable purchase records  

Base Cards was designed to eliminate these risks using transactional logic and strict role-based control.

---

## 🏗 Architecture

This project follows **Clean Architecture** principles to ensure scalability and maintainability.

```
lib/
 ├── app/
 ├── core/
 ├── features/
 ├── l10n/
 ├── main.dart
 └── my_app.dart
```

Each feature follows strict separation:

```
feature/
 ├── data/
 ├── domain/
 └── presentation/
```

- **Domain** → Entities + UseCases (pure business logic)  
- **Data** → Models + Repositories + Firebase implementation  
- **Presentation** → UI + Bloc/Cubit state management  

State management is implemented using Bloc/Cubit.  
Dependency Injection is handled with GetIt.  
Routing is managed using AutoRoute.

---

## 🔥 Core Features

### 🏪 Shop Account (Main User)

- Browse categories and card values **fetched directly from Firestore**
- Purchase available voucher codes from centralized inventory
- Automatic wallet balance deduction
- Immutable purchase history
- Real-time updates (Firestore streams)

> Note: Shops cannot create or edit categories/values. All pricing and values are managed centrally in Firestore.

### 🏢 Supplier / Admin Management

- Create and manage card categories and values
- Add cards to the centralized inventory
- Monitor purchases and wallet transactions

---

## 🔐 Security & Data Integrity

- Role-based Firestore Security Rules
- Shops cannot modify roles or increase balance
- Categories/values are write-protected for shops (read-only access)
- Pricing is managed centrally to prevent client-side manipulation
- Inventory protected against double-selling
- Purchase records are immutable
- Wallet deduction is transaction-safe

---

## ⚙ Tech Stack

- Flutter
- Firebase Authentication
- Cloud Firestore
- Bloc
- GetIt
- AutoRoute
- Flutter Localization (ARB + gen_l10n)

---

## 🌍 Localization (i18n)

The app supports **Arabic and English** using Flutter localization.

- ARB translation files under `lib/l10n/`
- Generated localization via `gen_l10n`
- `context.l10n` extension for clean access to localized strings

---

## 🧠 Key Architectural Decisions

- Firestore used as Single Source of Truth
- Transaction-based purchase flow to prevent race conditions
- Manual transaction syncing for controlled state consistency
- Separation of CardCategoriesBloc and CardValuesBloc for better state isolation
- Categories and values are centrally managed in Firestore (shops have read-only access) to enforce consistent pricing and prevent client-side tampering

---

## 🚀 Getting Started

1. Clone the repository  
2. Run `flutter pub get`  
3. Add your Firebase configuration file:  
   `android/app/google-services.json`  
4. Enable Firebase Authentication & Firestore  
5. Run the app  

---

## 🛡 Notes

- Firebase configuration files are intentionally excluded
- No secret keys are included in this repository
- Admin management can be handled via Firebase Console or future admin panel implementation

---

## 📈 Status


Actively maintained.