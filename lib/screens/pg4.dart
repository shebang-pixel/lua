import 'package:flutter/material.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {

  /// Library categories
  final List<Map<String, dynamic>> items = [
    {"icon": Icons.menu_book, "label": "Stories"},
    {"icon": Icons.image, "label": "Pictures"},
    {"icon": Icons.format_quote, "label": "Quotes"},
    {"icon": Icons.lightbulb, "label": "Facts"},
    {"icon": Icons.emoji_emotions, "label": "Jokes"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        title: const Text('Library'),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: GridView.builder(

          itemCount: items.length,

          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),

          itemBuilder: (context, index) {

            final item = items[index];

            return libraryCard(
              icon: item["icon"],
              label: item["label"],
              onTap: () {},
            );
          },
        ),
      ),
    );
  }
}

/// Reusable card widget
Widget libraryCard({
  required IconData icon,
  required String label,
  required VoidCallback onTap,
}) {

  return InkWell(

    onTap: onTap,

    child: Container(

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
          )
        ],
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Icon(
            icon,
            size: 40,
            color: Colors.teal,
          ),

          const SizedBox(height: 12),

          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          )

        ],
      ),
    ),
  );
}