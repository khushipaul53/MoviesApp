import 'package:flutter/material.dart';
import 'package:movies_app/ui/movieDetail.dart';

import '../model/moviesModel.dart';

class movies extends StatelessWidget {

  // List m=["A","B","C","D","E"];
   List<moviesModel>movieList=moviesModel.getMovies();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        backgroundColor: Colors.blueGrey.shade900,
        centerTitle: false,

      ),
      backgroundColor:Colors.blueGrey.shade900,
      body: ListView.builder(itemCount:movieList.length,itemBuilder: (BuildContext context,int index){
        return Stack(children:<Widget>[

            MovieCard(movieList[index],context),

            Positioned(top:20,left: 10,child: movieImage(movieList[index].Images[0]))

             ]);
        // return Card(
        //   elevation: 10,
        //   color: Colors.white,
        //   child: ListTile(
        //     leading: CircleAvatar(
        //       child:Container(
        //         width: 200,
        //         height: 200,
        //         decoration: BoxDecoration(
        //
        //           image: DecorationImage(image: NetworkImage(movieList[index].Images[0]),
        //               fit: BoxFit.cover
        //           ),
        //
        //           borderRadius: BorderRadius.circular(14)
        //         ),
        //
        //       )
        //     ),
        //     trailing: Text("...."),
        //     title: Text(movieList[index].title),
        //     subtitle: Text(movieList[index].title),
        //     onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>moviesDetail(movies: movieList[index])))
        //   ),
        // );
      }
      )
    );
  }

  Widget MovieCard(moviesModel movie,BuildContext context){
    return InkWell(

      child: Container(
        margin: EdgeInsets.only(left:90),
        width: MediaQuery.of(context).size.width,
        height: 120,
        child:Card(

          color:Colors.black45,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: Text(movie.title,
                          style: TextStyle(
                            color:Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,


                          ),
                        ),
                      ),
                      Text("Rating: ${movie.imdbRating}/10",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children:<Widget> [
                      Text("Released: ${movie.Released}"
                        ,
                        style: TextStyle(
                          color:Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,


                        ),
                      ),
                      Text(movie.Runtime
                        ,
                        style: TextStyle(
                          color:Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,


                        ),),
                      Text(movie.Rated
                        ,
                        style: TextStyle(
                          color:Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,


                        ),)

                    ],
                  )
                ],

              ),
            ),
          ),

      )
      ),
    onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>moviesDetail(movies:movie)) )
    );


  }
  Widget movieImage(String urlImage)
  { return  Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
                image:DecorationImage(image: NetworkImage(
                  urlImage ?? 'https://images-na.ssl-images-amazon.com/images/M/MV5BMjEyOTYyMzUxNl5BMl5BanBnXkFtZTcwNTg0MTUzNA@@._V1_SX1500_CR0,0,1500,999_AL_.jpg'
                ),
fit: BoxFit.cover
                )

              )


          );

  }
}

