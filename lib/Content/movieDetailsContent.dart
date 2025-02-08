class MovieDetailsContent{
  final String poster;
  final String name;
  final double rate;
  final int duration;
  final String genre;
  final String description;
  bool like;
  bool watched = false;
  final Map<String , String> cast;
  final List<ContentTag> tags;

  MovieDetailsContent( {
    required this.poster,
    required this.name,
    required this.rate,
    required this.duration,
    required this.genre,
    required this.description,
    required this.like,
    required this.cast,
    required this.tags,
  });

  MovieDetailsContent copyWith({
    String? poster,
    String? name,
    double? rate,
    int? duration,
    String? genre,
    String? description,
    bool? like,
    Map<String, String>? cast,
    List<ContentTag>? tags,
  }) {
    return MovieDetailsContent(
      poster: poster ?? this.poster,
      name: name ?? this.name,
      rate: rate ?? this.rate,
      duration: duration ?? this.duration,
      genre: genre ?? this.genre,
      description: description ?? this.description,
      like: like ?? this.like,
      cast: cast ?? this.cast,
      tags: tags ?? this.tags,
    );
  }
}

class ContentTag{
  final String tagName;
  final double tagValue;

  ContentTag( {
    required this.tagName,
    required this.tagValue
  } );
}

class MovieDetailsData{
  static final List<MovieDetailsContent> _movies = [
      MovieDetailsContent(
          poster: "https://m.media-amazon.com/images/M/MV5BMjEzNTkyMDE3NV5BMl5BanBnXkFtZTgwMTM2MDY4NjE@._V1_FMjpg_UX1000_.jpg",
          name: "Casino Heist",
          rate: 6.1,
          duration: 93,
          genre: "Action | Crime | Drama | Thriller",
          description: "As a criminal mastermind manipulates the police to carry out his plot, twelve robbers kidnap and lock themselves up in the Royal Casino of Italy. The strategy has a national cost and ends up being an all-out conflict.",
          like: false,
          cast: {
            "Robert De Niro" : "https://cdn.britannica.com/00/213300-050-ADF31CD9/American-actor-Robert-De-Niro-2019.jpg" ,
            "Jeffrey Dean Morgan" : "https://preview.redd.it/jeffrey-dean-morgan-thats-it-v0-ixrjtmareoqb1.jpg?width=400&format=pjpg&auto=webp&s=9a0d0730560c983dc928c0ad811ed86f7d2afe56" ,
            "Dave Bautista" : "https://media.vanityfair.com/photos/63b70e194373b00ff0436fac/master/w_2560%2Cc_limit/1433948913" ,
            "Kate Bosworth" : "https://cdn.britannica.com/20/218820-050-9E834C60/Kate-Bosworth-American-actress.jpg"
          },
          tags: [
            ContentTag(tagName: "Robbery", tagValue: 5.0),
            ContentTag(tagName: "Casino", tagValue: 4.0),
            ContentTag(tagName: "Death", tagValue: 3.5),
            ContentTag(tagName: "Mastermind", tagValue: 5.0),
            ContentTag(tagName: "Plan", tagValue: 3.5),
            ContentTag(tagName: "Thriller", tagValue: 4.0),
            ContentTag(tagName: "Italy", tagValue: 3.5),
            ContentTag(tagName: "Italian", tagValue: 3.5),
            ContentTag(tagName: "Government", tagValue: 3.0),
            ContentTag(tagName: "Politics", tagValue: 4.0),
            ContentTag(tagName: "Greed", tagValue: 3.5),
            ContentTag(tagName: "Heist", tagValue: 3.0),
            ContentTag(tagName: "Originals", tagValue: 6.5),
            ContentTag(tagName: "Crime", tagValue: 4.0),
            ContentTag(tagName: "Guns", tagValue: 2.5),
            ContentTag(tagName: "Money", tagValue: 3.7),
          ],
      ),


      MovieDetailsContent(
        poster: "https://m.media-amazon.com/images/M/MV5BMDA0NDBkMzMtOWQ0Zi00NjE1LTkxNWYtYzI0MTE0NGJjZTQ1XkEyXkFqcGc@._V1_.jpg",
        name: "Fish Games",
        rate: 8.0,
        duration: 17,
        genre: "Dark Comedy | Korean Drama | Thriller",
        description: "A odd offer to compete in children's games is accepted by a large number of cash-strapped players. A enticing treasure with deadly high stakes awaits you inside. ",
          like: false,
          cast: {
          "Tom Choi" : "https://images.mubicdn.net/images/cast_member/481715/cache-745112-1640245781/image-w856.jpg" ,
          "Lee Jung-jae" : "https://i.mydramalist.com/2zEwW_5f.jpg" ,
          "Lee Byung-hun" : "https://i.mydramalist.com/Erx2Qf.jpg" ,
          "Greg Chun" : "https://www.animenewsnetwork.com/images/encyc/P154429-930109104.1489336676.jpg"
        },
        tags: [
          ContentTag(tagName: "Game", tagValue: 5.0),
          ContentTag(tagName: "Trapped", tagValue: 3.5),
          ContentTag(tagName: "Korea", tagValue: 4.5),
          ContentTag(tagName: "Korean", tagValue: 4.5),
          ContentTag(tagName: "Death", tagValue: 4.5),
          ContentTag(tagName: "Fish", tagValue: 3.0),
          ContentTag(tagName: "Survivor", tagValue: 5.0),
          ContentTag(tagName: "Thriller", tagValue: 4.0),
          ContentTag(tagName: "Battle Royale", tagValue: 4.5),
          ContentTag(tagName: "Strategy", tagValue: 4.0),
          ContentTag(tagName: "Guns", tagValue: 2.0),
          ContentTag(tagName: "Action", tagValue: 3.5),
          ContentTag(tagName: "Horror", tagValue: 2.0),
          ContentTag(tagName: "Money", tagValue: 3.5),
          ContentTag(tagName: "Fiction", tagValue: 1.5),
          ContentTag(tagName: "Greed", tagValue: 3.5),
        ]
      ),

      MovieDetailsContent(
          poster: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpC_3gF4OUaoMhWSucLsNNTPb-8jOp0j-pGA&s",
          name: "Under The Water",
          rate: 5.9,
          duration: 95,
          genre: "Action | Horror | Sci-fi",
          description: "Milo Thatch, a young linguist, joins an adventurous gang of explorers on a quest to discover the mythical lost island of riches lost beneath the sea.",
          like: false,
          cast: {
            "Tom Choi" : "https://images.mubicdn.net/images/cast_member/481715/cache-745112-1640245781/image-w856.jpg" ,
            "Lee Jung-jae" : "https://i.mydramalist.com/2zEwW_5f.jpg" ,
            "Lee Byung-hun" : "https://i.mydramalist.com/Erx2Qf.jpg" ,
            "Greg Chun" : "https://www.animenewsnetwork.com/images/encyc/P154429-930109104.1489336676.jpg"
          },
          tags: [
            ContentTag(tagName: "Exploration", tagValue: 5.0),
            ContentTag(tagName: "Ocean", tagValue: 5.0),
            ContentTag(tagName: "Deep Sea", tagValue: 3.5),
            ContentTag(tagName: "Lost Island", tagValue: 5.0),
            ContentTag(tagName: "Search", tagValue: 4.0),
            ContentTag(tagName: "Adventure", tagValue: 4.0),
            ContentTag(tagName: "Maps", tagValue: 3.5),
            ContentTag(tagName: "Ship", tagValue: 1.5),
            ContentTag(tagName: "Cartography", tagValue: 3.0),
            ContentTag(tagName: "Water", tagValue: 3.0),
            ContentTag(tagName: "Under", tagValue: 3.0),
            ContentTag(tagName: "Navigation", tagValue: 2.5),
            ContentTag(tagName: "Atlantis", tagValue: 3.5),
            ContentTag(tagName: "Water", tagValue: 3.0),
            ContentTag(tagName: "Mythology", tagValue: 3.5),
            ContentTag(tagName: "Spain", tagValue: 2.5),
            ContentTag(tagName: "Spanish", tagValue: 2.5),
            ContentTag(tagName: "Quest", tagValue: 3.0),
            ContentTag(tagName: "Knowledge", tagValue: 4),
          ]
      ),

      MovieDetailsContent(
          poster: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRP7FLBWIEHGbkkAwGTaJpTa_QzjGdQkeRnpA&s",
          name: "Where To",
          rate: 6.5,
          duration: 109,
          genre: "Comedy | Drama | Crime",
          description: "With nothing but a handful of souls and a lot of ambition, two buddies set off to travel the world.",
          like: false,
          cast: {
            "Tom Choi" : "https://images.mubicdn.net/images/cast_member/481715/cache-745112-1640245781/image-w856.jpg" ,
            "Lee Jung-jae" : "https://i.mydramalist.com/2zEwW_5f.jpg" ,
            "Lee Byung-hun" : "https://i.mydramalist.com/Erx2Qf.jpg" ,
            "Greg Chun" : "https://www.animenewsnetwork.com/images/encyc/P154429-930109104.1489336676.jpg"
          },
          tags: [
            ContentTag(tagName: "Adventure", tagValue: 5.0),
            ContentTag(tagName: "Friends", tagValue: 3.5),
            ContentTag(tagName: "Exploration", tagValue: 3.0),
            ContentTag(tagName: "Tourist", tagValue: 3.0),
            ContentTag(tagName: "Travel", tagValue: 3.5),
            ContentTag(tagName: "Spain", tagValue: 3.5),
            ContentTag(tagName: "Where", tagValue: 3.0),
            ContentTag(tagName: "To", tagValue: 3.0),
            ContentTag(tagName: "Spanish", tagValue: 3.5),
            ContentTag(tagName: "World Tour", tagValue: 4.5),
            ContentTag(tagName: "Tour", tagValue: 3.0),
            ContentTag(tagName: "Ship", tagValue: 1.0),
            ContentTag(tagName: "Vehicles", tagValue: 2.0),
          ]
      ),

      MovieDetailsContent(
          poster: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS125VQdlr9k6BhIBtGXdJAyjoOlviGVrAXuQ&s",
          name: "Hazlock Shomes",
          rate: 7.6,
          duration: 128,
          genre: "Action | Adventure | Mystery",
          description: "Detective Hazlock Shomes and his stalwart partner Watson face up against a villain whose plot threatens the entire United Kingdom.",
          like: false,
          cast: {
            "Tom Choi" : "https://images.mubicdn.net/images/cast_member/481715/cache-745112-1640245781/image-w856.jpg" ,
            "Lee Jung-jae" : "https://i.mydramalist.com/2zEwW_5f.jpg" ,
            "Lee Byung-hun" : "https://i.mydramalist.com/Erx2Qf.jpg" ,
            "Greg Chun" : "https://www.animenewsnetwork.com/images/encyc/P154429-930109104.1489336676.jpg"
          },
          tags: [
            ContentTag(tagName: "Thriller", tagValue: 5.0),
            ContentTag(tagName: "Detective", tagValue: 5.0),
            ContentTag(tagName: "Adventure", tagValue: 2.5),
            ContentTag(tagName: "Guns", tagValue: 3.0),
            ContentTag(tagName: "Crime", tagValue: 5.0),
            ContentTag(tagName: "Hazlock", tagValue: 3.0),
            ContentTag(tagName: "Shomes", tagValue: 3.0),
            ContentTag(tagName: "UK", tagValue: 3.0),
            ContentTag(tagName: "Britain", tagValue: 3.0),
            ContentTag(tagName: "British", tagValue: 3.0),
            ContentTag(tagName: "Mastermind", tagValue: 4.0),
            ContentTag(tagName: "Mystery", tagValue: 4.5),
            ContentTag(tagName: "Murder", tagValue: 2.5),
            ContentTag(tagName: "Killer", tagValue: 4.0),
            ContentTag(tagName: "Action", tagValue: 2.5),
            ContentTag(tagName: "Criminal", tagValue: 3.5),
            ContentTag(tagName: "Death", tagValue: 2.5),
          ]
      ),

      MovieDetailsContent(
          poster: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBMUvXhBqM1GBM-plBxrJhHZL3CAbaTEuD8w&s",
          name: "Night Mafia",
          rate: 6.0,
          duration: 96,
          genre: "Crime | Drama",
          description: "When the son of a powerful Mafia don returns home from Vietnam, he wants to live his own life, but family tradition, intrigues, and powerplays involving his older brother prevent him from doing so.",
          like: false,
          cast: {
            "Tom Choi" : "https://images.mubicdn.net/images/cast_member/481715/cache-745112-1640245781/image-w856.jpg" ,
            "Lee Jung-jae" : "https://i.mydramalist.com/2zEwW_5f.jpg" ,
            "Lee Byung-hun" : "https://i.mydramalist.com/Erx2Qf.jpg" ,
            "Greg Chun" : "https://www.animenewsnetwork.com/images/encyc/P154429-930109104.1489336676.jpg"
          },
          tags: [
            ContentTag(tagName: "Crime", tagValue: 5.0),
            ContentTag(tagName: "Mafia", tagValue: 6.0),
            ContentTag(tagName: "Organized", tagValue: 4.5),
            ContentTag(tagName: "USA", tagValue: 3.5),
            ContentTag(tagName: "Underworld", tagValue: 4.0),
            ContentTag(tagName: "American", tagValue: 3.5),
            ContentTag(tagName: "Guns", tagValue: 4.0),
            ContentTag(tagName: "Thriller", tagValue: 3.0),
            ContentTag(tagName: "Action", tagValue: 2.5),
            ContentTag(tagName: "Gangster", tagValue: 4.5),
            ContentTag(tagName: "Politics", tagValue: 4.0),
            ContentTag(tagName: "Planning", tagValue: 2.5),
            ContentTag(tagName: "Murder", tagValue: 3.0),
            ContentTag(tagName: "Mastermind", tagValue: 3.5),
            ContentTag(tagName: "Power", tagValue: 3.5),
            ContentTag(tagName: "Power Hungry", tagValue: 2.5),
            ContentTag(tagName: "Fame", tagValue: 2.5),
            ContentTag(tagName: "Money", tagValue: 2.5),
          ]
      ),

      MovieDetailsContent(
          poster: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRg1i2tlgMdvFGLdhpExhg4ugGaYIK85dHbZA&s",
          name: "It Follows",
          rate: 6.8,
          duration: 100,
          genre: "Horror | Mystery | Thriller",
          description: "In the summer of 1989, a group of bullied youngsters band together to stop a shape-shifting monster from posing as a clown and preying on the children of Derry, Maine.",
          like: false,
          cast: {
            "Tom Choi" : "https://images.mubicdn.net/images/cast_member/481715/cache-745112-1640245781/image-w856.jpg" ,
            "Lee Jung-jae" : "https://i.mydramalist.com/2zEwW_5f.jpg" ,
            "Lee Byung-hun" : "https://i.mydramalist.com/Erx2Qf.jpg" ,
            "Greg Chun" : "https://www.animenewsnetwork.com/images/encyc/P154429-930109104.1489336676.jpg"
          },
          tags: [
            ContentTag(tagName: "Horror", tagValue: 6.5),
            ContentTag(tagName: "Clown", tagValue: 5.5),
            ContentTag(tagName: "USA", tagValue: 3.0),
            ContentTag(tagName: "American", tagValue: 3.0),
            ContentTag(tagName: "Thriller", tagValue: 5.5),
            ContentTag(tagName: "Adventure", tagValue: 4.0),
            ContentTag(tagName: "Supernatural", tagValue: 4.5),
            ContentTag(tagName: "Fair", tagValue: 2.5),
            ContentTag(tagName: "Friends", tagValue: 3.5),
            ContentTag(tagName: "It", tagValue: 3.0),
            ContentTag(tagName: "Follows", tagValue: 3.0),
            ContentTag(tagName: "Children", tagValue: 3.5),
            ContentTag(tagName: "Bully", tagValue: 3.5),
            ContentTag(tagName: "Scary", tagValue: 4.0),
            ContentTag(tagName: "Ghost", tagValue: 2.0),
            ContentTag(tagName: "Death", tagValue: 1.7),
            ContentTag(tagName: "Action", tagValue: 1.5),
          ]
      ),

      MovieDetailsContent(
          poster: "https://m.media-amazon.com/images/M/MV5BMTM3NTA4NDIwMF5BMl5BanBnXkFtZTYwNTc4NDE3._V1_FMjpg_UX1000_.jpg",
          name: "Ghost Ship",
          rate: 5.6,
          duration: 91,
          genre: "Horror | Mystery | Thriller",
          description: "A salvage crew uncovers a long-lost 1662 passenger ship floating lifeless in a remote Caribbean Sea location, and quickly realises that its long-dead passengers may still be on board.",
          like: false,
          cast: {
            "Tom Choi" : "https://images.mubicdn.net/images/cast_member/481715/cache-745112-1640245781/image-w856.jpg" ,
            "Lee Jung-jae" : "https://i.mydramalist.com/2zEwW_5f.jpg" ,
            "Lee Byung-hun" : "https://i.mydramalist.com/Erx2Qf.jpg" ,
            "Greg Chun" : "https://www.animenewsnetwork.com/images/encyc/P154429-930109104.1489336676.jpg"
          },
          tags: [
            ContentTag(tagName: "Horror", tagValue: 4.5),
            ContentTag(tagName: "Ship", tagValue: 5.5),
            ContentTag(tagName: "Caribbean", tagValue: 4.3),
            ContentTag(tagName: "Thriller", tagValue: 4.5),
            ContentTag(tagName: "Adventure", tagValue: 4.0),
            ContentTag(tagName: "Supernatural", tagValue: 4.5),
            ContentTag(tagName: "Ghost", tagValue: 4.0),
            ContentTag(tagName: "Historical", tagValue: 4.5),
            ContentTag(tagName: "War", tagValue: 2.3),
            ContentTag(tagName: "Pirates", tagValue: 4.0),
            ContentTag(tagName: "Sea", tagValue: 3.5),
            ContentTag(tagName: "Ocean", tagValue: 4.0),
            ContentTag(tagName: "Scary", tagValue: 4.0),
            ContentTag(tagName: "Death", tagValue: 3.5),
            ContentTag(tagName: "Action", tagValue: 3.5),
          ]
      ),

      MovieDetailsContent(
          poster: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSz7X6jMsm3OnYvi13hxIKLSHAGpANWSRnyaQ&s",
          name: "Independence Night",
          rate: 7.0,
          duration: 145,
          genre: "Action | Adventure | Sci-fi",
          description: "The aliens are coming and their goal is to invade and destroy Earth. Fighting superior technology, mankind's best weapon is the will to survive.",
          like: false,
          cast: {
            "Tom Choi" : "https://images.mubicdn.net/images/cast_member/481715/cache-745112-1640245781/image-w856.jpg" ,
            "Lee Jung-jae" : "https://i.mydramalist.com/2zEwW_5f.jpg" ,
            "Lee Byung-hun" : "https://i.mydramalist.com/Erx2Qf.jpg" ,
            "Greg Chun" : "https://www.animenewsnetwork.com/images/encyc/P154429-930109104.1489336676.jpg"
          },
          tags: [
            ContentTag(tagName: "Alien", tagValue: 5.5),
            ContentTag(tagName: "Extinction", tagValue: 5.0),
            ContentTag(tagName: "Survival", tagValue: 4.0),
            ContentTag(tagName: "Invasion", tagValue: 5.3),
            ContentTag(tagName: "Spaceship", tagValue: 5.0),
            ContentTag(tagName: "War", tagValue: 4.5),
            ContentTag(tagName: "Battle", tagValue: 3.5),
            ContentTag(tagName: "Death", tagValue: 4.0),
            ContentTag(tagName: "Planning", tagValue: 3.0),
            ContentTag(tagName: "Organized", tagValue: 2.3),
            ContentTag(tagName: "Government", tagValue: 4.0),
            ContentTag(tagName: "Army", tagValue: 4.3),
            ContentTag(tagName: "Thriller", tagValue: 3.0),
            ContentTag(tagName: "Politics", tagValue: 4.0),
            ContentTag(tagName: "Science Fiction", tagValue: 4.5),
            ContentTag(tagName: "Disaster", tagValue: 3.7),
            ContentTag(tagName: "Action", tagValue: 4.5),
            ContentTag(tagName: "Independence", tagValue: 4.0),
            ContentTag(tagName: "Fantasy", tagValue: 3.7),
            ContentTag(tagName: "Futuristic", tagValue: 3.5),
            ContentTag(tagName: "Strategy", tagValue: 4.0),
            ContentTag(tagName: "Guns", tagValue: 3.4),
          ]
      ),

      MovieDetailsContent(
          poster: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTS3z_lMM2iMxcI1-aLZ0hty1fP0tlU8qRnag&s",
          name: "Star Troopers",
          rate: 7.3,
          duration: 129,
          genre: "Action | Adventure | Sci-fi | Thriller",
          description: "Johnny Rico, a Federation trooper, is assigned to work with a bunch of new recruits on a Mars satellite station where huge bugs have chosen to launch their next attack. Humans must now fight this futuristic battle in order to survive.",
          like: false,
          cast: {
            "Tom Choi" : "https://images.mubicdn.net/images/cast_member/481715/cache-745112-1640245781/image-w856.jpg" ,
            "Lee Jung-jae" : "https://i.mydramalist.com/2zEwW_5f.jpg" ,
            "Lee Byung-hun" : "https://i.mydramalist.com/Erx2Qf.jpg" ,
            "Greg Chun" : "https://www.animenewsnetwork.com/images/encyc/P154429-930109104.1489336676.jpg"
          },
          tags: [
            ContentTag(tagName: "Alien", tagValue: 5.5),
            ContentTag(tagName: "Extinction", tagValue: 5.0),
            ContentTag(tagName: "Survival", tagValue: 4.0),
            ContentTag(tagName: "Space", tagValue: 5.3),
            ContentTag(tagName: "Spaceship", tagValue: 5.0),
            ContentTag(tagName: "War", tagValue: 4.5),
            ContentTag(tagName: "Battle", tagValue: 3.5),
            ContentTag(tagName: "Death", tagValue: 4.0),
            ContentTag(tagName: "Star", tagValue: 3.0),
            ContentTag(tagName: "Planning", tagValue: 3.0),
            ContentTag(tagName: "Organized", tagValue: 2.3),
            ContentTag(tagName: "Satellite", tagValue: 4.0),
            ContentTag(tagName: "Troopers", tagValue: 3.0),
            ContentTag(tagName: "Army", tagValue: 4.3),
            ContentTag(tagName: "Thriller", tagValue: 3.0),
            ContentTag(tagName: "Science Fiction", tagValue: 4.5),
            ContentTag(tagName: "Disaster", tagValue: 3.7),
            ContentTag(tagName: "Action", tagValue: 5.0),
            ContentTag(tagName: "Futuristic", tagValue: 3.5),
            ContentTag(tagName: "Strategy", tagValue: 4.0),
            ContentTag(tagName: "Guns", tagValue: 4.5),
          ]
      ),

      MovieDetailsContent(
          poster: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRURxHW8tX1A2mThOXa3J4QlqHbuc1Q1D2p_g&s",
          name: "Boult",
          rate: 6.8,
          duration: 96,
          genre: "Adventure | Action |  Sci-fi | Animation | Comedy | Drama | Thriller",
          description: "A canine star of a fictional sci-fi/action show who believes his abilities are real sets out on a cross-country journey to save his co-star from a threat he believes is equally real.",
          like: false,
          cast: {
            "Tom Choi" : "https://images.mubicdn.net/images/cast_member/481715/cache-745112-1640245781/image-w856.jpg" ,
            "Lee Jung-jae" : "https://i.mydramalist.com/2zEwW_5f.jpg" ,
            "Lee Byung-hun" : "https://i.mydramalist.com/Erx2Qf.jpg" ,
            "Greg Chun" : "https://www.animenewsnetwork.com/images/encyc/P154429-930109104.1489336676.jpg"
          },
          tags: [
            ContentTag(tagName: "Kids", tagValue: 6.0),
            ContentTag(tagName: "Animated", tagValue: 5.0),
            ContentTag(tagName: "Science Fiction", tagValue: 3.5),
            ContentTag(tagName: "Dog", tagValue: 3.5),
            ContentTag(tagName: "Adventure", tagValue: 4.0),
            ContentTag(tagName: "Comedy", tagValue: 3.5),
            ContentTag(tagName: "Boult", tagValue: 4.0),
          ]
      ),

      MovieDetailsContent(
          poster: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShWuhgFKONNjxdKLxX-pp2mk6fjTF57y6Rww&s",
          name: "Brave",
          rate: 7.1,
          duration: 93,
          genre: "Action | Adventure | Animation",
          description: "Princess Maria opposes a tradition that causes havoc in her realm, determined to forge her own path in life. Maria is given one wish and must use her bravery and aviation abilities to break a monstrous curse.",
          like: false,
          cast: {
            "Tom Choi" : "https://images.mubicdn.net/images/cast_member/481715/cache-745112-1640245781/image-w856.jpg" ,
            "Lee Jung-jae" : "https://i.mydramalist.com/2zEwW_5f.jpg" ,
            "Lee Byung-hun" : "https://i.mydramalist.com/Erx2Qf.jpg" ,
            "Greg Chun" : "https://www.animenewsnetwork.com/images/encyc/P154429-930109104.1489336676.jpg"
          },
          tags: [
            ContentTag(tagName: "Kids", tagValue: 6.0),
            ContentTag(tagName: "Animated", tagValue: 5.0),
            ContentTag(tagName: "Fantasy", tagValue: 4.0),
            ContentTag(tagName: "Adventure", tagValue: 4.0),
            ContentTag(tagName: "Comedy", tagValue: 3.5),
            ContentTag(tagName: "Curse", tagValue: 3.0),
            ContentTag(tagName: "Brave", tagValue: 4.0),
            ContentTag(tagName: "FLying", tagValue: 4.0),
          ]
      ),

      MovieDetailsContent(
          poster: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRS1wEEuiRNJeyjKCCujMiw5f038FDEnLAA3Q&s",
          name: "Bravesoul",
          rate: 8.3,
          duration: 178,
          genre: "Biography | Drama | War",
          description: "Following the death of Alexander III of Scotland, who died without an heir, King Edward invades and conquers Scotland. William Wallace, a Scottish warrior, launches a revolt against King Edward I of England to free his nation.",
          like: false,
          cast: {
            "Tom Choi" : "https://images.mubicdn.net/images/cast_member/481715/cache-745112-1640245781/image-w856.jpg" ,
            "Lee Jung-jae" : "https://i.mydramalist.com/2zEwW_5f.jpg" ,
            "Lee Byung-hun" : "https://i.mydramalist.com/Erx2Qf.jpg" ,
            "Greg Chun" : "https://www.animenewsnetwork.com/images/encyc/P154429-930109104.1489336676.jpg"
          },
          tags: [
            ContentTag(tagName: "Invasion", tagValue: 3.5),
            ContentTag(tagName: "Warrior", tagValue: 4.5),
            ContentTag(tagName: "Revolt", tagValue: 4.0),
            ContentTag(tagName: "Scotland", tagValue: 3.0),
            ContentTag(tagName: "Britain", tagValue: 3.0),
            ContentTag(tagName: "Scottish", tagValue: 3.0),
            ContentTag(tagName: "British", tagValue: 3.0),
            ContentTag(tagName: "Politics", tagValue: 4.0),
            ContentTag(tagName: "Bravesoul", tagValue: 3.0),
            ContentTag(tagName: "Real Account", tagValue: 3.5),
            ContentTag(tagName: "Historical", tagValue: 4.5),
            ContentTag(tagName: "Strategy", tagValue: 4.0),
            ContentTag(tagName: "War", tagValue: 6.5),
            ContentTag(tagName: "Kings", tagValue: 4.0),
            ContentTag(tagName: "Kingdom", tagValue: 3.5),
            ContentTag(tagName: "Army", tagValue: 4.5),
            ContentTag(tagName: "Death", tagValue: 4.0),
            ContentTag(tagName: "Action", tagValue: 5.0),
          ]
      ),

      MovieDetailsContent(
          poster: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVYRGRJugm0BUyEcPAtgcuSJzz-CF02SteKg&s",
          name: "Captain Mathew",
          rate: 7.8,
          duration: 134,
          genre: "Biography | Drama | Thriller | Crime | Action",
          description: "The actual account of Captain Richard Phillips and the 2009 seizure of the US-flagged MV Maersk Alabama by Somali pirates, the first hijacking of an American cargo ship in two centuries.",
          like: false,
          cast: {
            "Tom Choi" : "https://images.mubicdn.net/images/cast_member/481715/cache-745112-1640245781/image-w856.jpg" ,
            "Lee Jung-jae" : "https://i.mydramalist.com/2zEwW_5f.jpg" ,
            "Lee Byung-hun" : "https://i.mydramalist.com/Erx2Qf.jpg" ,
            "Greg Chun" : "https://www.animenewsnetwork.com/images/encyc/P154429-930109104.1489336676.jpg"
          },
          tags: [
            ContentTag(tagName: "Adventure", tagValue: 5.0),
            ContentTag(tagName: "Cargo", tagValue: 3.5),
            ContentTag(tagName: "Shipment", tagValue: 3.5),
            ContentTag(tagName: "US", tagValue: 3.5),
            ContentTag(tagName: "American", tagValue: 3.5),
            ContentTag(tagName: "Ship", tagValue: 5.0),
            ContentTag(tagName: "Pirates", tagValue: 4.0),
            ContentTag(tagName: "Hijacking", tagValue: 4.5),
            ContentTag(tagName: "Mathew", tagValue: 3.0),
            ContentTag(tagName: "Captain", tagValue: 3.0),
            ContentTag(tagName: "Somalia", tagValue: 3.0),
            ContentTag(tagName: "Action", tagValue: 3.0),
            ContentTag(tagName: "Strategy", tagValue: 2.5),
            ContentTag(tagName: "Greed", tagValue: 3.5),
            ContentTag(tagName: "Money", tagValue: 3.5),
            ContentTag(tagName: "Real Account", tagValue: 3.5),
            ContentTag(tagName: "Guns", tagValue: 3.5),
            ContentTag(tagName: "Death", tagValue: 2.0),
          ]
      ),

      MovieDetailsContent(
          poster: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZNl1EYS9z4PfNViNWMK_V5ZspshcWfksobw&s",
          name: "Cyber Matrix",
          rate: 8.7,
          duration: 136,
          genre: "Cyberpunk | Sci-fi | Action",
          description: "When Neo is led to a foreboding underworld by a gorgeous stranger, he discovers the horrifying truth: the life he knows is a complex lie perpetrated by an evil cyber-intelligence.",
          like: false,
          cast: {
            "Tom Choi" : "https://images.mubicdn.net/images/cast_member/481715/cache-745112-1640245781/image-w856.jpg" ,
            "Lee Jung-jae" : "https://i.mydramalist.com/2zEwW_5f.jpg" ,
            "Lee Byung-hun" : "https://i.mydramalist.com/Erx2Qf.jpg" ,
            "Greg Chun" : "https://www.animenewsnetwork.com/images/encyc/P154429-930109104.1489336676.jpg"
          },
          tags: [
            ContentTag(tagName: "Matrix", tagValue: 5.5),
            ContentTag(tagName: "Cyber", tagValue: 4.0),
            ContentTag(tagName: "Underworld", tagValue: 5.5),
            ContentTag(tagName: "Survival", tagValue: 2.0),
            ContentTag(tagName: "Martial Arts", tagValue: 4.3),
            ContentTag(tagName: "Hand Combat", tagValue: 4.3),
            ContentTag(tagName: "Battle", tagValue: 3.5),
            ContentTag(tagName: "Death", tagValue: 1.0),
            ContentTag(tagName: "Thriller", tagValue: 2.0),
            ContentTag(tagName: "Science Fiction", tagValue: 3.5),
            ContentTag(tagName: "Action", tagValue: 5.5),
            ContentTag(tagName: "Fantasy", tagValue: 3.7),
            ContentTag(tagName: "Futuristic", tagValue: 4.5),
            ContentTag(tagName: "Guns", tagValue: 2.4),
          ]
      ),

      MovieDetailsContent(
          poster: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTDV1c7Orw38fF02lzBVetSCRVu0OCrtyFYQ&s",
          name: "Excalibur",
          rate: 7.3,
          duration: 140,
          genre: "Adventure | Drama | Fantasy",
          description: "Even as dark powers attempt to break the Round Table of Camelot apart, Morin the magician aids Arakan Pendragon in uniting the Britons around it.",
          like: false,
          cast: {
            "Tom Choi" : "https://images.mubicdn.net/images/cast_member/481715/cache-745112-1640245781/image-w856.jpg" ,
            "Lee Jung-jae" : "https://i.mydramalist.com/2zEwW_5f.jpg" ,
            "Lee Byung-hun" : "https://i.mydramalist.com/Erx2Qf.jpg" ,
            "Greg Chun" : "https://www.animenewsnetwork.com/images/encyc/P154429-930109104.1489336676.jpg"
          },
          tags: [
            ContentTag(tagName: "Adventure", tagValue: 5.0),
            ContentTag(tagName: "Historical", tagValue: 5.0),
            ContentTag(tagName: "Battle", tagValue: 5.0),
            ContentTag(tagName: "War", tagValue: 5.0),
            ContentTag(tagName: "British", tagValue: 3.0),
            ContentTag(tagName: "American", tagValue: 3.0),
            ContentTag(tagName: "US", tagValue: 3.0),
            ContentTag(tagName: "Britain", tagValue: 3.0),
            ContentTag(tagName: "Strategy", tagValue: 4.0),
            ContentTag(tagName: "Death", tagValue: 3.5),
            ContentTag(tagName: "Army", tagValue: 3.0),
          ]
      ),
    ];

  static List<MovieDetailsContent> getMovieDetail() {
    return List.from(_movies);
  }

  static void updateMovie(int index, MovieDetailsContent updatedMovie) {
    if (index >= 0 && index < _movies.length) {
      _movies[index] = updatedMovie;
    } else {
      throw RangeError('Invalid movie index: $index');
    }
  }

  static void toggleLike(int index) {
    if (index >= 0 && index < _movies.length) {
      _movies[index] = _movies[index].copyWith(like: !_movies[index].like);
    } else {
      throw RangeError('Invalid movie index: $index');
    }
  }

  static List<MovieDetailsContent> searchByName(String query) {
    return _movies.where((movie) =>
        movie.name.toLowerCase().contains(query.toLowerCase())
    ).toList();
  }

  // Get favorite movies (liked movies)
  static List<MovieDetailsContent> getFavoriteMovies() {
    return _movies.where((movie) => movie.like).toList();
  }
}
