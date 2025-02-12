// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'movie_card.dart';

class MovieList extends StatefulWidget {
  final List<Map<String, dynamic>> movies;
  final Function(String, String) onAddMovie;

  const MovieList(
      {super.key,
      required this.movies,
      required this.onAddMovie,
      required Null Function(dynamic index) onToggleStatus,
      required Null Function(dynamic int) onDelete});

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  void toggleMovieStatus(int index) {
    setState(() {
      widget.movies[index]["completed"] = !widget.movies[index]["completed"];
    });
  }

  void deleteMovie(int index) {
    setState(() {
      widget.movies.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.movies.length,
      itemBuilder: (context, index) {
        final movie = widget.movies[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
          child: Dismissible(
            key: Key(movie["title"]),
            background: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(Icons.delete, color: Colors.white),
            ),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              deleteMovie(index);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${movie["title"]} deleted'),
                ),
              );
            },
            child: MovieCard(
              title: movie["title"],
              genre: movie["genre"],
              imagePath: movie["image"],
              completed: movie["completed"],
              onToggleStatus: () => toggleMovieStatus(index),
              onDelete: () => deleteMovie(index),
            ),
          ),
        );
      },
    );
  }
}
