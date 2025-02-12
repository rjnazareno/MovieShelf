// ignore_for_file: library_private_types_in_public_api, avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'movie_list_screen.dart';
import 'add_movie_dialog.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({super.key});

  @override
  _MovieListScreenState createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  final List<Map<String, dynamic>> movies = [
    {
      "title": "Sniper: The Last Stand",
      "genre": "Action/Thriller",
      "completed": false,
      "image": "assets/images/Sniper.jpg"
    },
    {
      "title": "Madame Web",
      "genre": "Psychological Horror/Sci-Fi",
      "completed": false,
      "image": "assets/images/madameweb.jpg"
    },
    {
      "title": "Venom: The Last Dance",
      "genre": "Action/Superhero",
      "completed": false,
      "image": "assets/images/venom.jpg"
    },
    {
      "title": "The Intruder",
      "genre": "Horror/Thriller",
      "completed": false,
      "image": "assets/images/TheIntruder.jpg"
    },
    {
      "title": "Babes",
      "genre": "Comedy/Drama",
      "completed": false,
      "image": "assets/images/Babes.jpg"
    },
  ];

  void addMovie(String title, String genre) {
    setState(() {
      movies.add({
        "title": title,
        "genre": genre,
        "completed": false,
        "image": "assets/images/noimage.jpg",
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MovieList(
          movies: movies,
          onAddMovie: addMovie,
          onToggleStatus: (index) {},
          onDelete: (int) {},
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AddMovieDialog(onAddMovie: addMovie),
              );
            },
            backgroundColor: Colors.deepPurple,
            child: Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
