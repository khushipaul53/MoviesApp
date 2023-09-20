import 'package:flutter/material.dart';
import 'package:movies_app/model/moviesModel.dart';

class movieHeader extends StatelessWidget {
  final moviesModel movie;

  const movieHeader({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: <Widget>[
          MoviePoster(Poster: movie.Images[0].toString()),
          SizedBox(width: 16),
          Expanded(child: MovieHeader(Movie: movie))
        ],
      ),
    );
  }
}

class MovieHeader extends StatelessWidget {
  final moviesModel Movie;

  const MovieHeader({super.key, required this.Movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top:12.0),
          child: Text(
            "${Movie.Year}. ${Movie.Genre}".toUpperCase(),
            style: TextStyle(fontWeight: FontWeight.w400, color: Colors.cyan),
          ),
        ),
        Text(
          Movie.title,
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 30),
        ),
        Text.rich(TextSpan(
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
            children: <TextSpan>[
              TextSpan(text: Movie.Plot),
              TextSpan(text: "More..", style: TextStyle(color: Colors.blue)),
            ]))
      ],
    );
  }
}

class MovieCast extends StatelessWidget {
  final moviesModel movieCast;

  const MovieCast({super.key, required this.movieCast});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MovieField(field: "Cast", value: movieCast.Actors),
        MovieField(field: "Directors", value: movieCast.Director),
        MovieField(field: "Awards", value: movieCast.Awards)
      ],
    );
  }
}

class MovieField extends StatelessWidget {
  final String field;
  final String value;

  const MovieField({super.key, required this.field, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left:12.0),
          child: Text(
            "$field: ",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        Expanded(
          child: Text(
            "$value",
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
          ),
        )
      ],
    );
  }
}

class MoviePoster extends StatelessWidget {
  final String Poster;

  const MoviePoster({super.key, required this.Poster});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width / 4,
        height: 140,
        decoration: BoxDecoration(
          image:
              DecorationImage(image: NetworkImage(Poster), fit: BoxFit.cover),
        ),
      ),
    ));
  }
}

class HorizontalLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Container(
        height: 0.5,
        color: Colors.grey,
      ),
    );
  }
}

class MoviesImages extends StatelessWidget {
  final List<String> images;

  const MoviesImages({super.key, required this.images});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left:8.0),
          child: Text("More Movies Posters...".toUpperCase(),
              style: TextStyle(
                color: Colors.black26,
              )),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => SizedBox(
                        width: 8,
                      ),
                  itemCount: images.length,
                  itemBuilder: (context, index) => ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 4,
                          height: 160,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(images[index]),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ))),
        )
      ],
    );
  }
}
