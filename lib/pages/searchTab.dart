import 'package:flutter/material.dart';
import 'package:movie_app/Content/movieDetailsContent.dart';

import 'movie_details.dart';

class SearchTabContent extends StatefulWidget {
  const SearchTabContent({super.key});

  @override
  State<SearchTabContent> createState() => _SearchTabContentState();
}

class _SearchTabContentState extends State<SearchTabContent> {
  final List<MovieDetailsContent> allMovies = MovieDetailsData.getMovieDetail();

  List<MovieDetailsContent> filteredMovies = [];
  // Start with empty search history
  List<String> searchHistory = [];

  final FocusNode _focusNode = FocusNode();
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  final TextEditingController _searchController = TextEditingController();

  // Flag to track if a search has been performed
  bool hasSearched = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _showOverlay();
      } else {
        _removeOverlay();
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _searchController.dispose();
    _removeOverlay();
    super.dispose();
  }

  void _showOverlay() {
    _removeOverlay();
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  List<MovieDetailsContent> getFilteredSuggestions(String query) {
    if (query.isEmpty) return [];
    return allMovies
        .where((movie) => movie.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;

    return OverlayEntry(
      builder: (context) => Positioned(
        width: size.width - 32, // Accounting for the padding
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: const Offset(0.0, 60.0),
          child: Material(
            elevation: 8,
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(10),
            child: Builder(
                builder: (context) {
                  final suggestions = getFilteredSuggestions(_searchController.text);
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Only show search history if we have any
                      if (_searchController.text.isEmpty && searchHistory.isNotEmpty) ...[
                        const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              Icon(Icons.history, color: Colors.grey, size: 20),
                              SizedBox(width: 8),
                              Text(
                                'Recent Searches',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        ...searchHistory.map((movie) => ListTile(
                          leading: const Icon(Icons.history, color: Colors.grey),
                          title: Text(movie, style: const TextStyle(color: Colors.white)),
                          onTap: () {
                            _selectMovie(movie);
                          },
                        )),
                      ],
                      if (_searchController.text.isNotEmpty && suggestions.isNotEmpty) ...[
                        const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              Icon(Icons.movie_outlined, color: Colors.grey, size: 20),
                              SizedBox(width: 8),
                              Text(
                                'Suggestions',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        ...suggestions.map((movie) => ListTile(
                          leading: const Icon(Icons.movie, color: Colors.grey),
                          title: RichText(
                            text: TextSpan(
                              children: highlightOccurrences(movie.name, _searchController.text),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          onTap: () {
                            _selectMovie(movie.name);
                          },
                        )),
                      ],
                      if (_searchController.text.isNotEmpty && suggestions.isEmpty)
                        const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            'No movies found',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                    ],
                  );
                }
            ),
          ),
        ),
      ),
    );
  }

  List<TextSpan> highlightOccurrences(String source, String query) {
    if (query.isEmpty) return [TextSpan(text: source)];

    List<TextSpan> spans = [];
    int start = 0;
    int indexOfHighlight;
    String sourceLower = source.toLowerCase();
    String queryLower = query.toLowerCase();

    while ((indexOfHighlight = sourceLower.indexOf(queryLower, start)) != -1) {
      if (indexOfHighlight > start) {
        spans.add(TextSpan(
          text: source.substring(start, indexOfHighlight),
          style: const TextStyle(color: Colors.white),
        ));
      }
      spans.add(TextSpan(
        text: source.substring(indexOfHighlight, indexOfHighlight + query.length),
        style: const TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),
      ));
      start = indexOfHighlight + query.length;
    }

    if (start < source.length) {
      spans.add(TextSpan(
        text: source.substring(start),
        style: const TextStyle(color: Colors.white),
      ));
    }

    return spans;
  }

  void _selectMovie(String movie) {
    setState(() {
      _searchController.text = movie;
      addToSearchHistory(movie);
      _focusNode.unfocus();
      hasSearched = true;

      // Update filteredMovies based on the selected movie name
      filteredMovies = allMovies
          .where((m) => m.name.toLowerCase() == movie.toLowerCase())
          .toList();
    });
  }

  void addToSearchHistory(String movie) {
    setState(() {
      // Remove if exists (to avoid duplicates)
      searchHistory.remove(movie);
      // Add to beginning of list
      searchHistory.insert(0, movie);
      // Keep only the most recent 4 searches
      if (searchHistory.length > 4) {
        searchHistory.removeLast();
      }
    });
  }

  void performSearch(String query) {
    setState(() {
      hasSearched = true;
      if (query.isNotEmpty) {
        addToSearchHistory(query);
        filteredMovies = getFilteredSuggestions(query);
      } else {
        filteredMovies = [];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 40),
            CompositedTransformTarget(
              link: _layerLink,
              child: TextField(
                controller: _searchController,
                focusNode: _focusNode,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Search movies...',
                  hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear, color: Colors.grey),
                    onPressed: () {
                      setState(() {
                        _searchController.clear();
                        filteredMovies = [];
                        hasSearched = false;
                      });
                    },
                  ),
                  filled: true,
                  fillColor: Colors.grey[900],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    // Just update the overlay suggestions when typing
                    _showOverlay();
                  });
                },
                onSubmitted: (value) {
                  // Perform search when user presses enter
                  performSearch(value);
                },
              ),
            ),

            // Display search results or appropriate message
            Expanded(
              child: Builder(
                builder: (context) {
                  // If no search performed yet
                  if (!hasSearched) {
                    return Center(
                      child: Text(
                        'Search for movies',
                        style: TextStyle(color: Colors.grey[600], fontSize: 16),
                      ),
                    );
                  }

                  // If search performed but no results found
                  if (filteredMovies.isEmpty && _searchController.text.isNotEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.browser_not_supported_sharp,
                            color: Colors.grey,
                            size: 60,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'No movie found',
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Try searching with a different title',
                            style: TextStyle(color: Colors.grey[600], fontSize: 14),
                          ),
                        ],
                      ),
                    );
                  }

                  // If search performed and results found
                  return ListView.builder(
                      itemCount: filteredMovies.length,
                      itemBuilder: (context, index) {
                        final movie = filteredMovies[index];
                        return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: ListTile(
                              title: Text(
                                movie.name,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                movie.genre,
                                style: TextStyle(color: Colors.grey[400]),
                              ),
                              leading: Container(
                                width: 60,
                                height: 90,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                    image: NetworkImage(movie.poster),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              onTap: () {
                                // Handle movie selection
                                // You can navigate to movie details page here
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const MovieDetails(),
                                      settings: RouteSettings(
                                        arguments: allMovies.indexOf(movie),
                                      ),
                                    ));
                              },
                            ),
                          );
                      },
                    );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}