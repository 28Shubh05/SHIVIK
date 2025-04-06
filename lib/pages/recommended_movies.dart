import 'package:flutter/material.dart';

import '../Content/movieDetailsContent.dart';
import '../widget/textStyle.dart';
import 'movie_details.dart';

class RecommendedMovies extends StatefulWidget {
  const RecommendedMovies({super.key});

  @override
  State<RecommendedMovies> createState() => _RecommendedMoviesState();
}

class _RecommendedMoviesState extends State<RecommendedMovies> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    List<MovieDetailsContent> recommendedMovies = MovieDetailsData.getMovieRecommendations();
    if(recommendedMovies.isEmpty){
      return SizedBox(height: 0,);
    }
    return
      SizedBox(
      height: height/2.4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8 , vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Recommended Movies" , style: AppWidget.boldTextFieldStyle(),),
            ),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: recommendedMovies.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // Navigate to movie details when tapped
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MovieDetails(),
                              settings: RouteSettings(
                                arguments: index,//allMovies.indexOf(recommendedMovies[index]),
                              ),
                            ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              height: height/4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  recommendedMovies[index].poster,//recommendedMovies[index].poster,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      color: Colors.grey[800],
                                      child: const Icon(
                                        Icons.image_not_supported,
                                        color: Colors.white,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: height/100,),
                            Text(recommendedMovies[index].name , style: AppWidget.lightTextFieldStyle(),),
                          ],
                        ),
                      ),
                    );
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
