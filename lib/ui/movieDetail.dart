import 'package:flutter/material.dart';
import 'package:movies_app/model/moviesModel.dart';
import 'package:movies_app/ui/movieDetailHeader.dart';
import 'package:movies_app/ui/moviesThumbnail.dart';

class moviesDetail extends StatelessWidget {
final moviesModel movies;

  const moviesDetail({super.key,required this.movies});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text(movies.title),
    backgroundColor: Colors.black,
    centerTitle: false,


    ),
      body:ListView(
        children: <Widget>[
          moviesThumbnail(Thumbnail: movies.Images[0]),
          movieHeader(movie: movies),
          HorizontalLine(),
          MovieCast(movieCast: movies),
          HorizontalLine(),
          MoviesImages(images: movies.Images,)
        ],

      )

    );  }
}
