import 'package:flutter/material.dart';
import 'package:movie_app/pages/watch_movie.dart';

import '../Content/movieDetailsContent.dart';
import '../widget/textStyle.dart';
import 'movie_details.dart';

class AddList extends StatefulWidget {
  const AddList({super.key});
  @override
  State<AddList> createState() => _AddListState();
}

class _AddListState extends State<AddList> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    List<MovieDetailsContent> allMovies = MovieDetailsData.getMovieDetail();
    // Filter only liked movies
    List<MovieDetailsContent> addListMovies = allMovies.where((movie) => movie.addList).toList();

    if (addListMovies.isEmpty) {
      return Container(
        height: height,
        width: width,
        color: Colors.black,
        child: Center(
          child: Text(
            "No movie added yet",
            style: AppWidget.lightTextFieldStyle(),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size(width, height / 10),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.8),
                Colors.black.withOpacity(0.6),
              ],
            ),
          ),
          height: height / 10,
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
            left: 12.0,
            right: 8,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 6.0),
                child: Image(
                  image: const AssetImage("img/logo.png"),
                  width: width / 4.5,
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: addListMovies.length,
          itemBuilder: (context, index) {
            // Find the original index in allMovies list
            int originalIndex = allMovies.indexWhere((movie) =>
            movie.name == addListMovies[index].name &&
                movie.poster == addListMovies[index].poster
            );

            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MovieDetails(),
                      settings: RouteSettings(
                        // Use the original index for navigation
                        arguments: originalIndex,
                      ),
                    )
                );
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
                            addListMovies[index].poster,
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
                                addListMovies[index].name,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20, // Larger font size
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                addListMovies[index].description ?? '',
                                style: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 14, // Adjusted font size
                                  height: 1.4, // Line height for better readability
                                ),
                                maxLines: 4, // Increased number of lines
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 20,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          // Toggle addList property
                                          addListMovies[index].addList = !addListMovies[index].addList;
                                          // Use the original index for updating
                                          MovieDetailsData.updateMovie(originalIndex, addListMovies[index]);
                                        });
                                      },
                                      child: Icon(
                                        Icons.library_add,
                                        size: 28,
                                        color: addListMovies[index].addList ? Colors.deepPurple : Colors.white,
                                      )
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => const WatchMovie(),
                                            settings: RouteSettings(
                                              arguments: originalIndex,
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
                                      child: const Center(
                                          child: Text(
                                            "PLAY",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600
                                            ),
                                          )
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          addListMovies[index].like = !addListMovies[index].like;
                                          // Use the original index for updating
                                          MovieDetailsData.updateMovie(originalIndex, addListMovies[index]);
                                        });
                                      },
                                      child: Icon(
                                        Icons.star,
                                        color: addListMovies[index].like ? Colors.yellow : Colors.grey,
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
          }
      ),
    );
  }
}