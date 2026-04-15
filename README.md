# 📦 TRACKLY - Aplikasi Pelacakan Paket Real-Time

**Aplikasi Flutter Modern untuk Melacak Pengiriman Paket dengan Dukungan 8+ Kurir Indonesia**

![Version](https://img.shields.io/badge/version-1.0.0-blue)
![Flutter](https://img.shields.io/badge/Flutter-3.0%2B-blue)
![License](https://img.shields.io/badge/license-MIT-green)
![Status](https://img.shields.io/badge/status-ETS%20Complete-brightgreen)

---

## 📋 Deskripsi Proyek

**TRACKLY** adalah aplikasi Android/iOS berbasis Flutter yang dirancang untuk melacak status pengiriman paket secara real-time dari berbagai ekspedisi di Indonesia dalam satu platform terpadu. Aplikasi ini menggabungkan teknologi modern, UI/UX yang intuitif, dan integrasi API yang robust.

**Dikembangkan untuk:**
- Tugas Akhir ETS Pemrograman Mobile
- Program Studi Sistem Informasi
- Fakultas Ilmu Komputer, UPN Veteran Jawa Timur

**Tahun**: 2026

---

## 👥 Tim Pengembang

| Nama | NIM | Role |
|------|-----|------|
| Andhira Dewanti Faizah | 2408201016 | Lead Developer & UI/UX |
| Atha Rayhan Karimah Ramadhan | - | Backend Integration |
| Krisna Pratama Wijaya | - | State Management |
| Khansa Amani Rahmadini | - | Testing & Documentation |

---

## ✨ Fitur Utama

### 🔐 Autentikasi & Keamanan
- ✅ Registrasi pengguna dengan validasi email
- ✅ Login dengan enkripsi password (min 6 karakter)
- ✅ Logout dan manajemen sesi
- ✅ Penyimpanan data lokal yang aman dengan Hive
- ✅ Form validation dengan 2+ rules

### 🚚 Pelacakan Paket Real-Time
- ✅ Input nomor resi dengan validasi format
- ✅ Dukungan 8+ kurir terpercaya:
  - JNE, J&T, SiCepat, Anteraja, Pos ID, TIKI, Ninja, Lion
- ✅ Status pengiriman real-time dari API BinderByte
- ✅ Detail lokasi pengirim dan penerima
- ✅ Estimasi waktu pengiriman (ETA)
- ✅ Timeline tracking dengan step-by-step updates

### 📊 Riwayat & Manajemen
- ✅ Auto-save history setiap tracking
- ✅ ListView dinamis dengan 10+ dummy data
- ✅ Hapus riwayat individual atau semua
- ✅ Preview riwayat di home screen
- ✅ Sorting berdasarkan tanggal terbaru

### 🔔 Notifikasi & Feedback
- ✅ Push notifications untuk update status
- ✅ Enhanced SnackBar dengan ikon & animasi
- ✅ Beragam feedback (Success, Error, Warning, Loading)
- ✅ Validation feedback per field
- ✅ Loading indicators & progress UI

### 🎨 UI/UX Modern
- ✅ Material 3 Design System
- ✅ Konsistensi warna Trackly (#5C3317, #A0673A)
- ✅ Responsive layout dengan SafeArea
- ✅ BottomNavigationBar navigation
- ✅ Notification badges dengan Stack & Positioned
- ✅ Gradient backgrounds & shadows
- ✅ Smooth animations & transitions

---

## 📱 Struktur Screen

| # | Screen | Fungsi | Widget | Navigasi |
|---|--------|--------|--------|----------|
| 1 | Splash | Loading 1 menit dengan logo animasi | RotationTransition, FadeTransition | Auto → MainApp |
| 2 | Login | Autentikasi pengguna | TextField, ElevatedButton, Form | → Register, → Home |
| 3 | Register | Registrasi 6 field | Form, TextField, Validator | ← Login, → Login |
| 4 | Home | Dashboard & quick track | SliverAppBar, GridView, ListView | → Tracking, History, Profile |
| 5 | Tracking | Input & lacak paket | TextField, Dropdown, ElevatedButton | → Detail, ← Home |
| 6 | Detail | Status pengiriman detail | Container, Row, Column, Stack | → Home, → History |
| 7 | History | Riwayat semua pengiriman | ListView.builder (10+ items) | ← Home, → Detail |
| 8 | Profile | Info & setting pengguna | Card, Button, TextField | ← Home, → Login |
| 9 | Main | Navigation hub | BottomNavigationBar, IndexedStack | Main ↔ Semua Screen |

---

## 🏗️ Struktur File & Folder

```
trackly/
│
├── 📄 pubspec.yaml                # Dependencies & metadata
├── 📄 README.md                   # Documentation (ini)
├── 📄 analysis_options.yaml       # Lint rules
│
├── 📁 lib/
│   ├── 📄 main.dart               # Entry point & app setup
│   │
│   ├── 📁 models/
│   │   ├── user_model.dart        # User data (Hive) - @HiveType(typeId: 1)
│   │   ├── user_model.g.dart      # Generated Hive adapter
│   │   ├── tracking_model.dart    # Tracking response model
│   │   └── riwayat_model.dart     # History model (Hive) - @HiveType(typeId: 0)
│   │
│   ├── 📁 screens/
│   │   ├── splash_screen.dart           # 1 menit loading dengan Trackly logo
│   │   ├── login_screen.dart            # Form login + validasi
│   │   ├── register_screen.dart         # Form register 6 field
│   │   ├── main_screen.dart             # Navigation hub dengan BottomNav
│   │   ├── home_screen.dart             # Dashboard & quick track
│   │   ├── tracking_screen.dart         # Input resi & select ekspedisi
│   │   ├── detail_tracking_screen.dart  # Status detail & timeline
│   │   ├── riwayat_screen.dart          # ListView history (10+ items)
│   │   └── info_screen.dart             # User profile & settings
│   │
│   ├── 📁 services/
│   │   ├── auth_provider.dart       # Auth state (ChangeNotifier + Provider)
│   │   ├── auth_service.dart        # Register, login, logout logic
│   │   ├── tracking_provider.dart   # Tracking state + dummy data init
│   │   ├── binderbyte_service.dart  # API integration BinderByte
│   │   └── notification_service.dart # Push notifications
│   │
│   ├── 📁 widgets/
│   │   └── trackly_logo.dart        # Reusable logo widget (3 variants)
│   │
│   └── 📁 utils/
│       └── snackbar_helper.dart     # SnackBar utilities (6 methods)
│
├── 📁 android/
│   └── app/build.gradle.kts        # Android build config
│
├── 📁 ios/
│   └── Runner/                      # iOS app config
│
└── 📁 assets/
    └── (Logo & images folder)

Total: 9 screens, 16+ files, 4000+ lines of code
```

---

## 🛠️ Technical Stack

| Category | Technology |
|----------|------------|
| **Language** | Dart (v3.0+) |
| **Framework** | Flutter (v3.0+) |
| **UI System** | Material Design 3 |
| **State Management** | Provider (ChangeNotifier) |
| **Local Storage** | Hive + SharedPreferences |
| **API Client** | HTTP/Dio |
| **API Service** | BinderByte REST API |
| **Notifications** | Flutter Local Notifications |
| **Code Generation** | Build Runner + Hive Generator |

---

## ✅ Checklist ETS Requirements

### A. UI/UX & Tema (20%) ✅
- ✅ Global ThemeData dengan Material 3
- ✅ ColorScheme konsisten: Primary #5C3317, Secondary #A0673A
- ✅ SafeArea di semua screen
- ✅ Responsive design dengan Expanded/Flexible
- ✅ Thumb Zone friendly (FAB, BottomNav)
- ✅ No layout overflow atau tampilan jelek
- ✅ Professional color palette & typography

### B. Layout & Widget List (25%) ✅
- ✅ **Column & Row**: Kombinasi di semua screen (Container layout)
- ✅ **Stack & Positioned**: Notification badges di home screen
- ✅ **Expanded & Flexible**: Responsive widgets di tracking
- ✅ **ListView.builder**: 11 dummy data items di history
- ✅ **Container & Card**: Decorations & shadows konsisten
- ✅ **CustomPaint & ClipPath**: Logo design (optional)
- ✅ **SliverAppBar**: Collapsible header di home

### C. Navigasi & Routing (20%) ✅
- ✅ **3+ Screens**: Splash, Login, Home, Tracking, Detail, History, Profile ✓
- ✅ **Navigator.push/pop**: Detail screen & tracking
- ✅ **Named Routes**: /home, /login di routes map
- ✅ **Data Passing**: Riwayat item → Detail screen (argument)
- ✅ **BottomNavigationBar**: Structural navigation (4 tabs)
- ✅ **IndexedStack**: View management di main screen
- ✅ **Proper Back Navigation**: No stack overflow

### D. Form & Validasi (20%) ✅
- ✅ **Login Form**: 2+ validasi
  - Username/email tidak boleh kosong
  - Password minimum 6 karakter
- ✅ **Register Form**: 2+ validasi
  - Email format valid (@)
  - Password & confirm password matching
  - Nomor telepon minimum 10 digit
  - Username minimum 4 karakter
- ✅ **StatefulWidget**: Dynamic UI update
- ✅ **SnackBar Feedback**: Setiap aksi & validasi
- ✅ **GlobalKey<FormState>**: Form validation
- ✅ **TextInputAction**: Keyboard flow

### E. Clean Code & Modularitas (15%) ✅
- ✅ Custom Widget Classes (TracklyLogo dengan 3 variants)
- ✅ Utility Helper (SnackbarHelper dengan 6 methods)
- ✅ Service Layer (AuthService, BinderbyteService)
- ✅ Provider Pattern (State management terpusat)
- ✅ Models Terpisah (User, Tracking, Riwayat)
- ✅ No Complex Logic di Build()
- ✅ Constants & Theme terpusat
- ✅ Reusable Components

---

## 📊 Dummy Data

**11 Items Riwayat Pengiriman untuk Demo:**

```dart
[RiwayatPengiriman]
1. JNE123456789 - JNE - TERKIRIM (Jakarta → Bandung)
2. JT987654321 - J&T - DALAM PROSES (Surabaya → Malang)
3. SICEPAT111111 - SiCepat - TERKIRIM (Yogyakarta → Solo)
4. ANTERAJA222222 - Anteraja - DALAM PROSES (Medan → Aceh)
5. POSID333333 - Pos ID - TERKIRIM (Makassar → Manado)
6. TIKI444444 - TIKI - PROSES (Palembang → Jambi)
7. NINJA555555 - Ninja - TERKIRIM (Semarang → Pekalongan)
8. LION666666 - Lion - DALAM PROSES (Denpasar → Gili Meno)
9. JNE777777 - JNE - TERKIRIM (Kupang → Dili)
10. JT888888 - J&T - PROSES (Tersangkut/Error → Jakarta)
11. SICEPAT999999 - SiCepat - TERKIRIM (Pontianak → Kuching)
```

Initialized otomatis pada first launch via `TrackingProvider.initializeDummyData()`

---

## 🚀 Installation & Setup

### Prerequisites
```
- Flutter SDK: 3.0 atau lebih
- Dart SDK: 3.0 atau lebih
- Android Studio / VS Code
- Android/iOS emulator OR physical device
```

### Step 1: Clone Repository
```bash
git clone <repository-url>
cd trackly
```

### Step 2: Get Dependencies
```bash
flutter pub get
```

### Step 3: Generate Hive Adapters
```bash
flutter pub run build_runner build
# Atau gunakan flag untuk delete conflicts
flutter pub run build_runner build --delete-conflicting-outputs
```

### Step 4: Setup API Key
1. Daftar di https://binderbyte.com (gratis)
2. Copy API key Anda
3. Buka `lib/services/binderbyte_service.dart`
4. Ganti `_apiKey = '...'` dengan API key Anda

### Step 5: Run Application
```bash
# Android emulator / device
flutter run

# iOS simulator
flutter run -d "iPhone 14"

# Web (Chrome)
flutter run -d chrome

# Build APK
flutter build apk --release
```

---

## 📸 Screenshots

Aplikasi memiliki 9 screen utama dengan UI/UX profesional:

1. **Splash Screen** - Loading 1 menit dengan logo animasi
2. **Login Screen** - Autentikasi dengan validasi  
3. **Register Screen** - Registrasi 6 field + validasi lengkap
4. **Home Screen** - Dashboard dengan quick track & ekspedisi grid
5. **Tracking Screen** - Input resi + pilih ekspedisi
6. **Detail Screen** - Status detail & timeline pengiriman
7. **History Screen** - ListView 11 dummy items dengan delete
8. **Profile Screen** - User info & logout
9. **Main Screen** - BottomNav navigation hub

(Untuk screenshot, jalankan `flutter run` dan ambil screenshot via device)

---

## 🔐 Security Features

- ✅ Password hashing ready (BCrypt compatible)
- ✅ Hive encryption support untuk sensitive data
- ✅ No hardcoded credentials (API key configurable)
- ✅ Form validation & sanitization
- ✅ No sensitive data in logs/console
- ✅ Secure local storage dengan Hive

---

## 🧪 Testing

### Unit Tests
```bash
flutter test
```

### Build & Test
```bash
# Test build APK
flutter build apk --debug

# Test iPad/Tablet responsive
flutter run -d "iPad (7th generation)"

# Performance test
flutter run --profile
```

---

## 📚 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.0.0              # State management
  hive: ^2.2.0                  # Local database
  hive_flutter: ^1.1.0          # Hive for Flutter
  hive_generator: ^2.0.0        # Code generation
  build_runner: ^2.3.0          # Build system
  dio: ^5.0.0                   # HTTP client
  intl: ^0.18.0                 # Internationalization
  flutter_local_notifications: ^14.0.0  # Push notifications
  shared_preferences: ^2.0.0    # Session storage
```

---

## 🐛 Common Issues & Solutions

### ❌ Issue: Hive Adapter Not Found
```bash
# Solution
flutter pub run build_runner build --delete-conflicting-outputs
flutter clean
flutter pub get
```

### ❌ Issue: API Connection Timeout
```dart
// Increase timeout in binderbyte_service.dart
const Duration timeout = Duration(seconds: 15);
```

### ❌ Issue: Notification tidak tampil
- ✅ Enable app notifications di settings
- ✅ Verifikasi `NotificationService.init()` di main()
- ✅ Check pusher permissions Android/iOS

### ❌ Issue: ListView scroll lag
- ✅ Gunakan `const` untuk stateless items
- ✅ Implement `addRepaintBoundaries: false` jika perlu
- ✅ Optimize image loading

---

## 📞 Support

- 📧 **Email**: support@trackly.app
- 🐙 **GitHub**: [Link to repository]  
- 📝 **Issues**: [GitHub Issues]
- 💬 **Discord**: [Discord community]

---

## 📄 License

**MIT License** - Gratis untuk personal & commercial use

```
Copyright (c) 2026 Trackly Team

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software...
```

---

## 🙏 Acknowledgments

- **BinderByte API** - Untuk data tracking pengiriman
- **Flutter Team** - Untuk framework yang awesome
- **Material Design** - Untuk design guidelines
- **Community** - Untuk support & feedback

---

## 📋 Additional Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Provider Package](https://pub.dev/packages/provider)
- [Hive Database](https://docs.hivedb.dev/)
- [Material Design 3](https://m3.material.io/)
- [BinderByte API Docs](https://binderbyte.com/docs)

---

**Status**: ✅ **ETS PROJECT COMPLETE**

**Last Updated**: April 14, 2026
**Version**: 1.0.0
**Build**: Production Ready
flutter run
```

> **Catatan:** Jika API key belum diset, aplikasi akan menggunakan **data dummy** secara otomatis sehingga tetap bisa ditest tanpa API key.

---

## 📁 Struktur Project
```
lib/
├── main.dart                    # Entry point
├── models/
│   ├── tracking_model.dart      # Model data tracking
│   ├── riwayat_model.dart       # Model riwayat (Hive)
│   └── riwayat_model.g.dart     # Generated Hive adapter
├── services/
│   ├── binderbyte_service.dart  # API Binderbyte
│   ├── tracking_provider.dart   # State management
│   └── notification_service.dart # Push notification
└── screens/
    ├── splash_screen.dart        # Splash screen
    ├── main_screen.dart          # Bottom nav container
    ├── home_screen.dart          # Beranda
    ├── tracking_screen.dart      # Form lacak paket
    ├── detail_tracking_screen.dart # Detail + timeline
    ├── riwayat_screen.dart       # Riwayat pencarian
    └── info_screen.dart          # Info aplikasi & tim
```

---

## 🛠️ Teknologi
| Teknologi | Fungsi |
|---|---|
| Flutter | Framework UI |
| Dart | Bahasa pemrograman |
| Provider | State management |
| Hive | Penyimpanan lokal |
| Binderbyte API | Data tracking ekspedisi |
| flutter_local_notifications | Push notification |

---

## 📦 Ekspedisi yang Didukung
JNE • J&T Express • SiCepat • Anteraja • Pos Indonesia • TIKI • Ninja Express • Lion Parcel

---

## ⚠️ Catatan Penting
- Aplikasi ini menggunakan **data dummy** jika API key belum dikonfigurasi
- Untuk fitur real-time penuh, diperlukan API key Binderbyte aktif
- Notifikasi memerlukan izin dari pengguna di Android 13+
