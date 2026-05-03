import 'package:flutter/material.dart';

class DynamicListPage extends StatefulWidget {
  const DynamicListPage({super.key});

  @override
  State<DynamicListPage> createState() => _DynamicListPageState();
}

class _DynamicListPageState extends State<DynamicListPage> {
  final List<Map<String, dynamic>> items = [
    {
      'id': 1,
      'title': 'Belajar Flutter',
      'description': 'Mempelajari framework Flutter dan Dart',
      'icon': Icons.flutter_dash,
      'color': Colors.blue,
    },
    {
      'id': 2,
      'title': 'Membuat UI',
      'description': 'Desain dan implementasi antarmuka pengguna',
      'icon': Icons.design_services,
      'color': Colors.purple,
    },
    {
      'id': 3,
      'title': 'Manajemen State',
      'description': 'Mengelola state dengan setStatedan provider',
      'icon': Icons.settings,
      'color': Colors.orange,
    },
    {
      'id': 4,
      'title': 'Navigasi',
      'description': 'Implementasi navigasi antar halaman',
      'icon': Icons.navigation,
      'color': Colors.green,
    },
    {
      'id': 5,
      'title': 'Networking',
      'description': 'API integration dan data fetching',
      'icon': Icons.cloud,
      'color': Colors.teal,
    },
  ];

  late List<Map<String, dynamic>> displayItems;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    displayItems = List.from(items);
  }

  void _filterItems(String query) {
    setState(() {
      if (query.isEmpty) {
        displayItems = List.from(items);
      } else {
        displayItems = items
            .where((item) =>
                item['title']
                    .toLowerCase()
                    .contains(query.toLowerCase()) ||
                item['description']
                    .toLowerCase()
                    .contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void _addItem() {
    setState(() {
      items.add({
        'id': items.length + 1,
        'title': 'Item Baru ${items.length + 1}',
        'description': 'Deskripsi item yang baru ditambahkan',
        'icon': Icons.new_releases,
        'color': Colors.red,
      });
      displayItems = List.from(items);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Item baru ditambahkan!'),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _removeItem(int index) {
    setState(() {
      items.removeAt(index);
      displayItems = List.from(items);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Item dihapus'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dynamic List Example',
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
              Colors.green[50]!,
              Colors.teal[50]!,
            ],
          ),
        ),
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: _searchController,
                onChanged: _filterItems,
                decoration: InputDecoration(
                  hintText: 'Cari item...',
                  prefixIcon: const Icon(Icons.search),
                  prefixIconColor: const Color(0xFF5B7CFF),
                  fillColor: Colors.white,
                  filled: true,
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            _searchController.clear();
                            _filterItems('');
                          },
                        )
                      : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.grey[300]!,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Color(0xFF5B7CFF),
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
            // List Items
            Expanded(
              child: displayItems.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search_off,
                            size: 64,
                            color: Colors.grey[400],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Tidak ada item yang ditemukan',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: displayItems.length,
                      itemBuilder: (context, index) {
                        final item = displayItems[index];
                        return _buildListItem(item, index);
                      },
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        backgroundColor: const Color(0xFF5B7CFF),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildListItem(Map<String, dynamic> item, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: item['color'].withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            item['icon'],
            color: item['color'],
            size: 28,
          ),
        ),
        title: Text(
          item['title'],
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            item['description'],
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey[600],
            ),
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete_outline),
          color: Colors.red[400],
          onPressed: () {
            _removeItem(index);
          },
        ),
      ),
    );
  }
}
