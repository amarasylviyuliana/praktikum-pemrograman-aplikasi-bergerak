import 'package:flutter/material.dart';

class NavigasiPage extends StatefulWidget {
  const NavigasiPage({super.key});

  @override
  State<NavigasiPage> createState() => _NavigasiPageState();
}

class _NavigasiPageState extends State<NavigasiPage> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Navigasi Sederhana',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF5B7CFF),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          _buildPage(
            title: 'Halaman 1',
            color: Colors.blue[400]!,
            icon: Icons.home,
            description: 'Ini adalah halaman pertama.\nGeser ke kanan untuk melihat halaman berikutnya.',
          ),
          _buildPage(
            title: 'Halaman 2',
            color: Colors.purple[400]!,
            icon: Icons.info,
            description: 'Ini adalah halaman kedua.\nGeser ke kanan atau kiri untuk navigasi.',
          ),
          _buildPage(
            title: 'Halaman 3',
            color: Colors.green[400]!,
            icon: Icons.star,
            description: 'Ini adalah halaman ketiga.\nGeser ke kiri untuk kembali ke halaman sebelumnya.',
          ),
          _buildPage(
            title: 'Halaman 4',
            color: Colors.orange[400]!,
            icon: Icons.settings,
            description: 'Ini adalah halaman keempat (Halaman Terakhir).\nTerus geser untuk loop kembali.',
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 12,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: const Color(0xFF5B7CFF),
          unselectedItemColor: Colors.grey[500],
          onTap: (index) {
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: 'Halaman 1',
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.info),
              label: 'Halaman 2',
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.star),
              label: 'Halaman 3',
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.settings),
              label: 'Halaman 4',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage({
    required String title,
    required Color color,
    required IconData icon,
    required String description,
  }) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            color,
            color.withValues(alpha: 0.7),
          ],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 60,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 32),
            Text(
              title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  height: 1.6,
                ),
              ),
            ),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.5),
                  width: 2,
                ),
              ),
              child: Text(
                'Slide Page ${_currentIndex + 1} dari 4',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
