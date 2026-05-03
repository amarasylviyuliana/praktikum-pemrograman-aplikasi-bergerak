import 'package:flutter/material.dart';
import 'counter_page.dart';
import 'widget_bertingkat_page.dart';
import 'user_input_page.dart';
import 'dynamic_list_page.dart';
import 'navigasi_page.dart';
import 'grid_view_page.dart';
import 'about_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final List<String> buttonLabels = [
    'Counter',
    'Widget Bertingkat',
    'User Input Example',
    'Dynamic List Example',
    'Navigasi Sederhana',
    'Grid View',
    'Tentang Saya'
  ];

  final List<Color> buttonColors = [
    Colors.blue[400]!,
    Colors.purple[400]!,
    Colors.orange[400]!,
    Colors.green[400]!,
    Colors.red[400]!,
    Colors.teal[400]!,
    Colors.pink[400]!,
  ];

  final Set<int> clickedButtons = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MyPorto',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF5B7CFF),
        elevation: 0,
        centerTitle: false,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue[50]!,
              Colors.purple[50]!,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cek hasil karyaku disini:',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[700],
                      ),
                ),
                const SizedBox(height: 24),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: buttonLabels.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: _buildFeatureButton(
                        context,
                        index,
                        buttonLabels[index],
                        buttonColors,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureButton(
    BuildContext context,
    int index,
    String label,
    List<Color> colors,
  ) {
    bool isClicked = clickedButtons.contains(index);
    Color displayColor = isClicked ? colors[index] : Colors.grey[400]!;

    return Material(
      child: InkWell(
        onTap: () {
          setState(() {
            clickedButtons.add(index);
          });
          _navigateToPage(context, index);
        },
        child: Container(
          height: 56,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                displayColor,
                displayColor.withValues(alpha: 0.7),
              ],
            ),
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: displayColor.withValues(alpha: 0.3),
                blurRadius: 12,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                Icon(
                  _getIconForButton(index),
                  size: 24,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconData _getIconForButton(int index) {
    const icons = [
      Icons.calculate,
      Icons.layers,
      Icons.input,
      Icons.list,
      Icons.navigation,
      Icons.grid_3x3,
      Icons.person,
    ];
    return icons[index];
  }

  void _navigateToPage(BuildContext context, int index) {
    Widget page;
    switch (index) {
      case 0:
        page = const CounterPage();
        break;
      case 1:
        page = const WidgetBertingkatPage();
        break;
      case 2:
        page = const UserInputPage();
        break;
      case 3:
        page = const DynamicListPage();
        break;
      case 4:
        page = const NavigasiPage();
        break;
      case 5:
        page = const GridViewPage();
        break;
      case 6:
        page = const AboutPage();
        break;
      default:
        page = const CounterPage();
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}
