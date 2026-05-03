# MyPorto - Aplikasi Portfolio Flutter UTS PPAB

## 📱 Deskripsi Aplikasi
MyPorto adalah aplikasi portfolio sederhana yang menampilkan hasil-hasil praktek pembelajaran Praktikum PPAB dalam bentuk Flutter application. Aplikasi ini memiliki 2 halaman utama dan 6 halaman praktek tambahan dengan desain modern dan navigasi yang lancar.

## 🎨 Fitur Utama

### 1. Dashboard (MyPorto)
- **AppBar**: Judul "MyPorto" dengan background warna biru (#5B7CFF)
- **List Buttons**: 7 tombol dalam layout vertikal
  - Counter
  - Widget Bertingkat
  - User Input Example
  - Dynamic List Example
  - Navigasi Sederhana
  - Grid View
  - Tentang Saya
- **Interaktif**: Tombol berubah warna dari abu-abu menjadi biru saat diklik

### 2. Counter Page
- Display angka counter dalam circular gradient
- Tombol Decrement (merah), Reset (orange), Increment (hijau)
- Operasi aritmatika dasar

### 3. Widget Bertingkat
- Nested containers dengan 4 tingkat kedalaman
- Gradient warna yang berbeda untuk setiap level
- Row layout dengan 3 item card

### 4. User Input Example
- Form input: Nama, Email, Pesan
- Checkbox untuk persetujuan syarat dan ketentuan
- Tombol Kirim dan Bersihkan
- Display hasil input dalam green card

### 5. Dynamic List Example
- Search bar dengan filter real-time
- List dinamis dengan 5 item bawaan
- Tombol delete untuk menghapus item
- Floating action button untuk tambah item
- Snackbar feedback

### 6. Navigasi Sederhana
- PageView dengan 4 halaman
- BottomNavigationBar untuk navigasi
- Gradient background unik untuk setiap halaman
- Slide indicator

### 7. Grid View
- 9 item dalam grid layout 3x3
- Setiap item memiliki icon dan warna unik
- Interaktif dengan snackbar feedback

### 8. Tentang Saya
- **Profile Picture**: Placeholder dengan gradient
- **Informasi**:
  - NPM
  - Nama
  - Deskripsi singkat
- **Layout**: Vertikal dengan card-based design

## 🎯 Desain Visual

### Warna Utama
- Primary Blue: `#5B7CFF`
- Light Gray: `#E0E0E0` (default button)
- Gradients: Biru ke Ungu untuk berbagai elemen

### Komponen UI
- AppBar dengan elevation 0
- Rounded buttons (14-20px)
- Box shadows untuk depth
- Icon yang sesuai untuk setiap fitur
- Responsive layout

### Typography
- Title: 28px, Bold
- Heading: 20px, Bold
- Body: 14-16px, Medium/Regular

## 📁 Struktur File

```
lib/
├── main.dart                      # Entry point aplikasi
└── pages/
    ├── dashboard_page.dart        # Halaman utama dengan 7 tombol
    ├── about_page.dart            # Halaman tentang saya
    ├── counter_page.dart          # Aplikasi counter
    ├── widget_bertingkat_page.dart # Widget nested
    ├── user_input_page.dart       # Form input data
    ├── dynamic_list_page.dart     # List dinamis dengan search
    ├── navigasi_page.dart         # PageView navigation
    └── grid_view_page.dart        # Grid layout 3x3
```

## 🚀 Cara Menjalankan

### Prerequisites
- Flutter SDK terinstall
- Dart SDK (bundled dengan Flutter)
- Chrome browser (untuk web development)

### Build & Run
```bash
# Navigate ke project directory
cd "c:\Soal uts ppab\tugas_uts"

# Get dependencies
flutter pub get

# Run di Chrome (web)
flutter run -d chrome

# Run di Windows (desktop)
flutter run -d windows

# Run di Android/iOS
flutter run
```

### Hot Reload
Saat aplikasi sedang berjalan:
- Tekan `r` untuk hot reload
- Tekan `R` untuk hot restart
- Tekan `q` untuk quit

## ✅ Checklist Requirements

- ✅ Menggunakan framework Flutter
- ✅ 2 halaman utama (Dashboard + Tentang Saya)
- ✅ 6 proyek praktek tambahan
- ✅ Desain mirip mockup dengan warna modern
- ✅ Navigasi antar halaman berfungsi
- ✅ AppBar dengan judul yang sesuai
- ✅ 7 tombol dalam list vertikal
- ✅ Tombol berubah warna saat diklik
- ✅ Icon yang sesuai untuk setiap fitur
- ✅ Responsive design
- ✅ Shadow dan depth effect
- ✅ Gradient backgrounds

## 📝 Notes

### Deprecation Warnings
Aplikasi menggunakan `.withValues()` untuk color opacity (bukan `.withOpacity()`) untuk menghindari deprecation warning pada Flutter versi terbaru.

### Browser Compatibility
- Aplikasi dioptimalkan untuk Chrome
- Juga kompatibel dengan Edge dan Firefox
- Desktop windows juga didukung (memerlukan Visual Studio toolchain)

### Mobile Development
Untuk mengembangkan untuk Android/iOS:
1. Setup Android Studio + Android SDK atau Xcode
2. Jalankan `flutter doctor` untuk verifikasi setup
3. `flutter run` untuk menjalankan di emulator/device

## 👨‍💻 Dokumentasi Kode

Setiap file page dilengkapi dengan:
- Widget StatefulWidget/StatelessWidget yang sesuai
- Method build() yang terstruktur
- Widget helper untuk reusability
- Comments untuk clarity

## 🔄 Fitur Interaktif

### State Management
- Menggunakan `setState()` untuk state management
- List manipulation (add/remove items)
- Form input handling
- Navigation dengan `Navigator.push()`

### User Feedback
- SnackBars untuk feedback
- Color changes untuk visual feedback
- Icons untuk UX improvement

## 📦 Dependencies

Aplikasi menggunakan dependencies default Flutter:
- flutter
- material design components

Tidak ada external packages yang diperlukan!

## 🎓 Learning Outcomes

Melalui aplikasi ini, Anda telah mempelajari:
- ✅ Basic Flutter widgets
- ✅ Routing dan Navigation
- ✅ State management dengan setState
- ✅ Form handling dan validation
- ✅ List dan Grid views
- ✅ Custom styling dan theming
- ✅ Responsive UI design
- ✅ Gradient dan shadow effects
- ✅ Icon usage
- ✅ Hot reload & debugging

---

**Created**: April 30, 2026
**Status**: Ready for Submission
**Version**: 1.0
