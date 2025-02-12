import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String title;
  final String genre;
  final String imagePath;
  final bool completed;
  final VoidCallback onToggleStatus;

  const MovieCard({
    super.key,
    required this.title,
    required this.genre,
    required this.imagePath,
    required this.completed,
    required this.onToggleStatus,
    required Function() onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[900],
      margin: EdgeInsets.all(6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Image.asset(
              imagePath,
              width: 100,
              height: 150,
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: completed ? Colors.white54 : Colors.white,
                        decoration:
                            completed ? TextDecoration.lineThrough : null,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      genre,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
              onPressed: onToggleStatus,
              icon: Icon(
                completed ? Icons.check_box : Icons.check_box_outline_blank,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
