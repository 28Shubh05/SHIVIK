import 'package:flutter/material.dart';
import 'package:movie_app/pages/movie_details.dart';
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

    return ListView.builder(
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
                        width: 110,  // Increased width
                        height: 160, // Increased height
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
    );
  }
}