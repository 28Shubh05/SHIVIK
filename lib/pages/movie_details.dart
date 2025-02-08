import 'package:flutter/material.dart';
import 'package:movie_app/Content/movieDetailsContent.dart';
import 'package:movie_app/pages/watch_movie.dart';
import 'package:movie_app/widget/input_widget.dart';
import 'package:movie_app/widget/textStyle.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({super.key});

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
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
      movie = allMovies[index];  // Reference the movie from allMovies
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
                      child: Icon(
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
                Container(
                    height: height/2.2,
                    width: width,
                    child: Image.network(movie.poster , fit: BoxFit.fill,),
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
                Text("Top Cast" , style: AppWidget.semiBoldBigTextFieldStyle(),),
                SizedBox(height: height/150,),
                SizedBox(
                  height: height/6,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: movie.cast.length,
                      itemBuilder: (context, castIndex){
                        String actorName = movie.cast.keys.elementAt(castIndex);
                        String actorImageUrl = movie.cast.values.elementAt(castIndex);
                          return GestureDetector(

                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  ClipOval(
                                    child: Image.network(
                                      actorImageUrl,
                                      width: 80,
                                      height: 80,
                                      fit: BoxFit.cover,
                                      loadingBuilder: (context, child, loadingProgress) {
                                        if (loadingProgress == null) return child;
                                        return Center(
                                          child: CircularProgressIndicator(
                                            value: loadingProgress.expectedTotalBytes != null
                                                ? loadingProgress.cumulativeBytesLoaded /
                                                loadingProgress.expectedTotalBytes!
                                                : null,
                                          ),
                                        );
                                      },
                                      errorBuilder: (context, error, stackTrace) =>
                                          Icon(Icons.person, size: 80, color: Colors.grey),
                                    ),
                                  ),

                                                    SizedBox(height: height/100,),
                                  Text(actorName , style: AppWidget.lightTextFieldStyle(),),
                                ],
                              ),
                            ),
                          );
                      }
                  ),
                ),
                SizedBox(height: height/20,),
                GradientButtonFb1(
                    text: "Watch Movie",
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WatchMovie(),
                            settings: RouteSettings(
                              arguments: index,
                            ),
                          ));
                    }
                ),
                SizedBox(height: height/40,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
