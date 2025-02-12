// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class AddMovieDialog extends StatefulWidget {
  final Function(String, String) onAddMovie;

  const AddMovieDialog({super.key, required this.onAddMovie});

  @override
  _AddMovieDialogState createState() => _AddMovieDialogState();
}

class _AddMovieDialogState extends State<AddMovieDialog> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController genreController = TextEditingController();

  void addMovieToList() {
    final String title = titleController.text.trim();
    final String genre = genreController.text.trim();

    if (title.isNotEmpty && genre.isNotEmpty) {
      widget.onAddMovie(title, genre);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(child: Text('Add a New Movie')),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              labelText: 'Movie Title',
            ),
          ),
          TextField(
            controller: genreController,
            decoration: InputDecoration(
              labelText: 'Genre',
            ),
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: addMovieToList,
          child: Text('Add'),
        ),
      ],
    );
  }
}
