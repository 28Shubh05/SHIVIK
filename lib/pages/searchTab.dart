import 'package:flutter/material.dart';

class SearchTabContent extends StatefulWidget {
  const SearchTabContent({super.key});

  @override
  State<SearchTabContent> createState() => _SearchTabContentState();
}

class _SearchTabContentState extends State<SearchTabContent> {
  final List<String> allMovies = [
    "The Dark Knight",
    "Inception",
    "Pulp Fiction",
    "The Godfather",
    "Interstellar",
    "The Matrix"
  ];

  List<String> filteredMovies = [];
  List<String> searchHistory = [
    "The Matrix",
    "Inception",
    "Pulp Fiction",
    "The Dark Knight"
  ];

  final FocusNode _focusNode = FocusNode();
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  final TextEditingController _searchController = TextEditingController();

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

  List<String> getFilteredSuggestions(String query) {
    if (query.isEmpty) return [];
    return allMovies
        .where((movie) => movie.toLowerCase().contains(query.toLowerCase()))
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
                      if (_searchController.text.isEmpty) ...[
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
                              children: highlightOccurrences(movie, _searchController.text),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          onTap: () {
                            _selectMovie(movie);
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
    });
  }

  void addToSearchHistory(String movie) {
    setState(() {
      searchHistory.remove(movie);
      searchHistory.insert(0, movie);
      if (searchHistory.length > 4) {
        searchHistory.removeLast();
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
                  filled: true,
                  fillColor: Colors.grey[900],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    // Trigger rebuild of overlay
                    _showOverlay();
                  });
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}