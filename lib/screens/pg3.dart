import 'package:flutter/material.dart';

class Diaries extends StatefulWidget {
  const Diaries({super.key});

  @override
  State<Diaries> createState() => _DiariesState();
}

class _DiariesState extends State<Diaries> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        title: const Text('Diaries'),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: GridView.count(

          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,

          children: [

            actionCard(
              icon: Icons.add,
              label: "New Diary",
              onTap: () {},
            ),

            actionCard(
              icon: Icons.add_task,
              label: "New Bucket List",
              onTap: () {},
            ),

            actionCard(
              icon: Icons.menu_book,
              label: "View Diaries",
              onTap: () {},
            ),

            actionCard(
              icon: Icons.list,
              label: "View Bucket Lists",
              onTap: () {},
            ),

          ],
        ),
      ),
    );
  }
}

/// Reusable card widget
Widget actionCard({
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
            size: 36,
            color: Colors.teal,
          ),

          const SizedBox(height: 12),

          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),

        ],
      ),
    ),
  );
}