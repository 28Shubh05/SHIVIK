import 'package:flutter/material.dart';
import 'package:movie_app/Content/movieDetailsContent.dart';
import 'package:movie_app/widget/textStyle.dart';

class WatchMovie extends StatefulWidget {
  const WatchMovie({super.key});

  @override
  State<WatchMovie> createState() => _WatchMovie();
}

class _WatchMovie extends State<WatchMovie> {
  late int index;
  late MovieDetailsContent movie;
  List<MovieDetailsContent> allMovies = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Get the index from route arguments after the widget is built
      index = ModalRoute.of(context)!.settings.arguments as int;
      allMovies = MovieDetailsData.getMovieDetail();  // Get all movies once
      movie = allMovies[index];
      movie.watched = true;// Reference the movie from allMovies
      setState(() {}); // Trigger a rebuild with the initialized data
    });
  }



  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    if (!mounted || movie == null) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(preferredSize: Size(width, height/10),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0 , top: 8 , left:  12 , right: 16),
            child: SizedBox(
              height: height/12,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: (){
                      MovieDetailsData.updateMovie(index, movie);
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_outlined ,
                      color: Colors.grey,
                      size: 28,
                    ),
                  ),
                  GestureDetector(
                      onTap: (){
                        setState(() {
                          movie.like = !movie.like;
                          MovieDetailsData.updateMovie(index, movie);
                        });
                      },
                      child: Icon(
                        Icons.star ,
                        color: movie.like? Colors.yellow : Colors.grey,
                        size: 28,
                      )
                  )
                ],
              ),
            ),
          )
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: width,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: height/2.2,
                      width: width,
                      child: Image.network(movie.poster , fit: BoxFit.fill,),
                    ),
                    Positioned(
                      top: height/8.8,
                        child: Container(
                          width: width/1.05,
                          height: height/4,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Colors.black87,
                              Colors.black87
                            ])
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.fast_rewind , color: Colors.white,size: 60,),
                              Icon(Icons.play_circle_fill , color: Colors.white,size: 60,),
                              Icon(Icons.fast_forward , color: Colors.white,size: 60,)
                            ],
                          ),
                        )
                    )
                  ]
                ),
                SizedBox(height: height/40,),

                Row(
                  children: [
                    Icon(Icons.star , color: Colors.yellow, size: 20,),
                    SizedBox(width: width/70,),
                    Text("${movie.rate}/10" , style: AppWidget.lightTextFieldStyle(),),
                  ],
                ),
                SizedBox(height: height/150,),
                Text(movie.name,style: AppWidget.boldTextFieldStyle(),),
                SizedBox(height: height/150,),
                Text("${movie.duration} min | ${movie.genre}",style: AppWidget.lightTextFieldStyle(),),
                SizedBox(height: height/40,),
                Text("${movie.description}" , style: AppWidget.lightTextFieldStyle(),textAlign: TextAlign.justify,),
                SizedBox(height: height/40,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
