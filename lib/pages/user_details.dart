import 'package:flutter/material.dart';
import 'package:movie_app/Content/movieDetailsContent.dart';
import 'package:movie_app/widget/textStyle.dart';

import 'movie_details.dart';

class UserTabContent extends StatefulWidget {
  @override
  State<UserTabContent> createState() => _UserTabContentState();
}

class _UserTabContentState extends State<UserTabContent> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: height/4,
            backgroundColor: Colors.black12,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
                child: Column(
                  children: [
                    SizedBox(height: height/16),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16),
                      child: Container(
                        height: height/5.5,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ClipOval(
                                child: Container(
                                  color: Colors.white,
                                  child: Image(
                                    image: AssetImage(""),
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
                              ),
                              SizedBox(width: width/12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      width: width/2,
                                      child: Text("User_Name", style: AppWidget.headingTextFieldStyle())
                                  ),
                                  SizedBox(height: height/2560),
                                  Container(
                                      width: width/1.9,
                                      child: Text("xxxxxxxxxxxx@gmail.com", style: AppWidget.lightTextFieldStyle(), softWrap: true)
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const Divider(
                  height: 0,
                  thickness: 2,
                  color: Colors.white,
                ),
                Container(
                  width: width,
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: height/20),
                        Text("Previously Watched", style: AppWidget.semiBoldBigTextFieldStyle()),
                        SizedBox(
                            height: height/3,
                            child: Watched(onWatchedChanged: () => setState(() {}))
                        ),
                        Text("Favourites", style: AppWidget.semiBoldBigTextFieldStyle()),
                        SizedBox(height: height/100),
                        SizedBox(
                            height: height/3,
                            child: Favourite(onFavoritesChanged: () => setState(() {}))
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Favourite extends StatefulWidget {
  final VoidCallback? onFavoritesChanged;

  const Favourite({
    super.key,
    this.onFavoritesChanged,
  });

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    List<MovieDetailsContent> allMovies = MovieDetailsData.getMovieDetail();
    // Filter only liked movies
    List<MovieDetailsContent> likedMovies = allMovies.where((movie) => movie.like).toList();

    if (likedMovies.isEmpty) {
      return Center(
        child: Text(
          "No favourite movies yet",
          style: AppWidget.lightTextFieldStyle(),
        ),
      );
    }

    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: likedMovies.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Navigate to movie details when tapped
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MovieDetails(),
                    settings: RouteSettings(
                      arguments: allMovies.indexOf(likedMovies[index]),
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
                        likedMovies[index].poster,
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
                  Text(likedMovies[index].name , style: AppWidget.lightTextFieldStyle(),),
                ],
              ),
            ),
          );
        }
    );
  }
}




class Watched extends StatefulWidget {
  final VoidCallback? onWatchedChanged;

  const Watched({
    super.key,
    this.onWatchedChanged,
  });

  @override
  State<Watched> createState() => _WatchedState();
}

class _WatchedState extends State<Watched> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    List<MovieDetailsContent> allMovies = MovieDetailsData.getMovieDetail();
    // Filter only liked movies
    List<MovieDetailsContent> watchedMovies = allMovies.where((movie) => movie.watched).toList();

    if (watchedMovies.isEmpty) {
      return Center(
        child: Text(
          "No movies watched yet",
          style: AppWidget.lightTextFieldStyle(),
        ),
      );
    }

    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: watchedMovies.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Navigate to movie details when tapped
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MovieDetails(),
                    settings: RouteSettings(
                      arguments: allMovies.indexOf(watchedMovies[index]),
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
                        watchedMovies[index].poster,
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
                  Text(watchedMovies[index].name , style: AppWidget.lightTextFieldStyle(),),
                ],
              ),
            ),
          );
        }
    );
  }
}