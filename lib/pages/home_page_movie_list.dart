import 'package:flutter/material.dart';
import 'package:movie_app/pages/movie_details.dart';
import 'package:movie_app/pages/watch_movie.dart';
import 'package:movie_app/widget/textStyle.dart';
import '../Content/movieDetailsContent.dart';

class HomePageMovieList extends StatefulWidget {
  const HomePageMovieList({super.key});

  @override
  State<HomePageMovieList> createState() => _HomePageMovieListState();
}

class _HomePageMovieListState extends State<HomePageMovieList> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    List<MovieDetailsContent> movie = MovieDetailsData.getMovieDetail();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Movies" , style: AppWidget.boldTextFieldStyle(),),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: movie.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MovieDetails(),
                      settings: RouteSettings(
                        arguments: index,
                      ),
                    ));
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Larger Image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            movie[index].poster,
                            width: 130,  // Increased width
                            height: 200, // Increased height
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: 110,
                                height: 160,
                                color: Colors.grey[800],
                                child: const Icon(
                                  Icons.image_not_supported,
                                  color: Colors.white,
                                  size: 40, // Larger icon
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 16), // Space between image and text
                        // Text content
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20,),
                              Text(
                                movie[index].name,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20, // Larger font size
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                movie[index].description ?? '',
                                style: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 14, // Adjusted font size
                                  height: 1.4, // Line height for better readability
                                ),
                                maxLines: 4, // Increased number of lines
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 20,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        movie[index].addList = !movie[index].addList;
                                        MovieDetailsData.updateMovie(index, movie[index]);
                                      });
                                    },
                                      child: Icon(
                                        Icons.library_add ,
                                        size: 28,
                                        color: movie[index].addList? Colors.deepPurple : Colors.white,
                                      )
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => const WatchMovie(),
                                            settings: RouteSettings(
                                              arguments: index,
                                            ),
                                          ));
                                    },
                                    child: Container(
                                      width: 84,
                                      height: 32,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.white
                                      ),
                                      child: Center(child: Text("PLAY" , style: TextStyle(color: Colors.black , fontSize: 20 , fontWeight: FontWeight.w600),)),
                                    ),
                                  ),
                                  GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          movie[index].like = !movie[index].like;
                                          MovieDetailsData.updateMovie(index, movie[index]);
                                        });
                                      },
                                      child: Icon(
                                        Icons.star ,
                                        color: movie[index].like? Colors.yellow : Colors.grey,
                                        size: 28,
                                      )
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Colors.white24,
                    height: 1,
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}