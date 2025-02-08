import 'dart:async';
import 'package:flutter/material.dart';
import 'package:movie_app/pages/searchTab.dart';
import 'package:movie_app/pages/user_details.dart';
import 'package:movie_app/pages/watch_movie.dart';
import '../Content/movieDetailsContent.dart';
import 'home_page_movie_list.dart';
import 'movie_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final kTabPages = <Widget>[
      const HomeTabContent(),
      SearchTabContent(),
      UserTabContent(),
    ];

    final kBottomNavBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: const Icon(Icons.home, color: Colors.white),
          activeIcon: const Icon(Icons.home, color: Colors.deepPurple),
          label: 'Home'
      ),
      BottomNavigationBarItem(
          icon: const Icon(Icons.search, color: Colors.white),
          activeIcon: const Icon(Icons.search, color: Colors.deepPurple),
          label: 'Search'
      ),
      BottomNavigationBarItem(
          icon: const Icon(Icons.account_circle, color: Colors.white),
          activeIcon: const Icon(Icons.account_circle, color: Colors.deepPurple),
          label: 'User'
      ),
    ];

    return Scaffold(
      body: kTabPages[currentTabIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedLabelStyle: const TextStyle(color: Colors.white, fontSize: 14),
        fixedColor: Colors.deepPurple,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.black,
        items: kBottomNavBarItems,
        currentIndex: currentTabIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            currentTabIndex = index;
          });
        },
      ),
    );
  }
}

class HomeTabContent extends StatefulWidget {
  const HomeTabContent({super.key});

  @override
  State<HomeTabContent> createState() => _HomeTabContentState();
}

class _HomeTabContentState extends State<HomeTabContent> {
  static const menuItems = <String>[
    'Help',
    'Privacy Policy',
  ];

  final List<PopupMenuItem<String>> _popUpMenuItems = menuItems
      .map(
        (String value) => PopupMenuItem<String>(
      value: value,
      child: Text(value),
    ),
  )
      .toList();

  String _btn3SelectedVal = '';

  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  List<MovieDetailsContent> sliderList = MovieDetailsData.getMovieDetail().take(5).toList();

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < sliderList.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  Widget _buildImageSlider(double height, double width) {
    return SizedBox(
      height: height * 0.61,
      width: width/1.1,
      child: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemCount: sliderList.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: GestureDetector(
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
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                sliderList[index].poster,
                                fit: BoxFit.cover,
                              ),
                          ),
                        ),
                      ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: height/9.5,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Colors.black,
                              Colors.black26
                            ]),
                          backgroundBlendMode: BlendMode.hue
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: width/2,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
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
                                        child: const Icon(Icons.play_circle_fill , color: Colors.white, size: 56,)
                                    ),
                                    GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            sliderList[index].like = !sliderList[index].like;
                                            MovieDetailsData.updateMovie(index, sliderList[index]);
                                          });
                                        },
                                        child: Icon(
                                          Icons.star ,
                                          color: sliderList[index].like? Colors.yellow : Colors.grey,
                                          size: 28,
                                        )
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: height/70,),
                          ],
                        ),
                      ),
                    )
                  ]
                ),
              );
            },
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                sliderList.length,
                    (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage == index
                        ? Colors.white
                        : Colors.white.withOpacity(0.4),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

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
              IntrinsicWidth(
                stepHeight: 0,
                stepWidth: 0,
                child: Container(
                  padding: EdgeInsets.zero,
                  child: IconButton(
                    icon: const Icon(Icons.more_vert, color: Colors.white, size: 20),
                    padding: EdgeInsets.zero,
                    onPressed: () async {
                      String? selectedValue = await showMenu<String>(
                        context: context,
                        position: RelativeRect.fromLTRB(width, height / 10, 0, 0),
                        items: _popUpMenuItems,
                      );

                      if (selectedValue != null) {
                        setState(() {
                          _btn3SelectedVal = selectedValue;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(_btn3SelectedVal)),
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: height/20),
            _buildImageSlider(height, width),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(right: 8.0, left: 8.0),
              child: HomePageMovieList(),
            ),
          ],
        ),
      ),
    );
  }
}

