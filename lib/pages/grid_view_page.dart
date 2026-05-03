import 'package:flutter/material.dart';

class GridViewPage extends StatefulWidget {
  const GridViewPage({super.key});

  @override
  State<GridViewPage> createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  final List<Map<String, dynamic>> gridItems = [
    {'title': 'Flutter', 'icon': Icons.flutter_dash, 'color': Colors.blue},
    {'title': 'Dart', 'icon': Icons.code, 'color': Colors.orange},
    {'title': 'Android', 'icon': Icons.android, 'color': Colors.green},
    {'title': 'iOS', 'icon': Icons.phone_iphone, 'color': Colors.grey},
    {'title': 'Web', 'icon': Icons.language, 'color': Colors.purple},
    {'title': 'Desktop', 'icon': Icons.desktop_mac, 'color': Colors.indigo},
    {'title': 'API', 'icon': Icons.cloud, 'color': Colors.teal},
    {'title': 'Database', 'icon': Icons.storage, 'color': Colors.red},
    {'title': 'UI/UX', 'icon': Icons.design_services, 'color': Colors.pink},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Grid View',
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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.pink[50]!,
              Colors.purple[50]!,
            ],
          ),
        ),
        child: GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 1,
          ),
          itemCount: gridItems.length,
          itemBuilder: (context, index) {
            return _buildGridItem(gridItems[index]);
          },
        ),
      ),
    );
  }

  Widget _buildGridItem(Map<String, dynamic> item) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${item['title']} dipilih'),
            backgroundColor: item['color'],
            duration: const Duration(seconds: 1),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: item['color'].withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                item['icon'],
                size: 36,
                color: item['color'],
              ),
            ),
            const SizedBox(height: 12),
            Text(
              item['title'],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
