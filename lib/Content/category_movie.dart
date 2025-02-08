class Category {
  final String name;
  final List<String> imageUrls;

  Category({
    required this.name,
    required this.imageUrls
  });
}

class CategoriesData {
  static List<Category> getCategories() {
    return [
      Category(
        name: 'Horror',
        imageUrls: [
          'https://assets.website-files.com/5bf1c2ccde18dd05bd430ccc/5bf1c32c017c21412909f273_598191033fd40e0001129b77_horror-blog-conjuring.jpeg',
          'http://www.horror.land/wp-content/uploads/2016/12/Conjuring_2_Poster.jpg',
          'https://assets.website-files.com/5bf1c2ccde18dd05bd430ccc/5bf1c32b1faec7406406a17f_59819104534ede00017fa6e6_horror-blog-exorcist.jpeg',
          'https://tse1.mm.bing.net/th?id=OIP.GH-giI0GyTTVQc8AdrHu3gHaK9&pid=Api&P=0&h=180',
          'https://marketplace.canva.com/EAFVCFkAg3w/1/0/1131w/canva-red-and-black-horror-movie-poster-AOBSIAmLWOs.jpg',
          'https://tse4.mm.bing.net/th?id=OIP.5gK1bQ39tgMah8olDsCvwgHaJQ&pid=Api&P=0&h=180',
          'https://tse2.mm.bing.net/th?id=OIP.9YAN5nnYx-Ne5z2Vit2yHwHaLu&pid=Api&P=0&h=180',
          'https://tse3.mm.bing.net/th?id=OIP.7MCV2h8XD3uxIEpr6wmM9AHaLG&pid=Api&P=0&h=180',
          'https://mlpnk72yciwc.i.optimole.com/cqhiHLc.IIZS~2ef73/w:auto/h:auto/q:75/https://bleedingcool.com/wp-content/uploads/2023/04/Ft9IhWWacAAjNel.jpeg',
          'http://cdn.collider.com/wp-content/uploads/2015/03/insidious-chapter-3-poster.jpg',
        ],
      ),
      Category(
        name: 'Comedy',
        imageUrls: [
          'https://static1.tribute.ca/poster/660x980/you-netflix-167046.jpg',
          'http://cdn.pastemagazine.com/www/articles/mascots%20movie%20poster.jpg',
          'https://www.whats-on-netflix.com/wp-content/uploads/2021/03/the-bubble-judd-apptow-comedy-coming-april-2022-netflix-poster.jpg',
          'https://thesmartlocal.com/wp-content/uploads/2021/02/Isnt-It-Romantic-Movie-poster-min.png',
          'https://s.yimg.com/ny/api/res/1.2/1r4OnJuK8gHDMjtogqWQ4A--/YXBwaWQ9aGlnaGxhbmRlcjt3PTY0MDtoPTk0OA--/https://media.zenfs.com/en/seventeen_632/99cd88287b8e2e4b9abf6f98f2d90a76',
          'https://hips.hearstapps.com/hmg-prod/images/best-comedies-on-netflix-good-on-paper-648b60e0d5285.jpg?crop=1xw:1xh;center,top&resize=980:*',
          'https://images.saymedia-content.com/.image/t_share/MTc1MDg5OTMzODY4OTM0OTgw/top-5-best-new-romantic-comedy-movies-on-netflix-2018.jpg',
          'https://s.yimg.com/ny/api/res/1.2/wZ4CPgVK.XxWXkqUSYCbSw--/YXBwaWQ9aGlnaGxhbmRlcjt3PTY0MDtoPTk2MA--/https://media.zenfs.com/en/seventeen_632/90a3e8630e4fda158b9716a27dd00d96',
          'https://s.yimg.com/ny/api/res/1.2/4UgrKxcj80LAq5A5ySJPeg--/YXBwaWQ9aGlnaGxhbmRlcjt3PTY0MDtoPTk0OA--/https://media.zenfs.com/en/seventeen_632/690652f9350c9b6b6adfb24b54bff79a',
          'https://i.pinimg.com/originals/89/ce/62/89ce62db8a1809cdff12819d4b5d8e52.jpg',
        ],
      ),
      Category(
        name: 'Thriller',
        imageUrls: [
          'https://i.redd.it/y825v9phfgs21.jpg',
          'https://i.redd.it/d9djhb55q8821.png',
          'https://www.mydomaine.com/thmb/7x1pFxcyb2V9bedWNEeBC2L2XlQ=/550x0/filters:no_upscale():max_bytes(150000):strip_icc()/AAAABYzrnpxG3Re2pLJNbSh_m9B4Rc9yWPZCaKOcqtxRPS9T4QJISEqFpeCBYYmIQpi8jX00HDQO9K6kwy9tQG2kpqmerHPmsI_ZEwMXr-yvaIOV7Pm-_uHfy0-IJCV8Nw-ff8a4946e912418eb186eef0eacd14b4.jpg',
          'https://m.media-amazon.com/images/M/MV5BYjZiMzIzYTctNDViZi00OWNmLWFmN2YtMmI2OWJiZWViMmY3XkEyXkFqcGdeQXVyNTYwMzA0MTM@._V1_.jpg',
          'https://i.pinimg.com/originals/ee/43/31/ee4331dcba4abb6eabf1bbbaa279fdff.jpg',
          'https://flxt.tmsimg.com/assets/p23306603_p_v10_aa.jpg',
          'https://www.mydomaine.com/thmb/QSQtlXIAjweLLrzXLJhKYIgkR8Q=/800x0/filters:no_upscale():max_bytes(150000):strip_icc()/AAAABaQ49znZ-orrB1oTxdcqL-2M2CfzSWun7b9EG17N02J1LyMuV5ruGezfvkQoS0DMcSYEPkQU0jueimylnIyHp6RRpDy-XVO21zQuG7Z5qzrtBvx9GbwYbe1kkHEVbA-67b2f50e7916450eb8d12fa7303c6ebd.jpg',
          'https://i0.wp.com/moviesandmania.com/wp-content/uploads/2021/09/Prey-movie-film-survival-horror-German-Netflix-2021-review-reviews-poster.jpg?resize=817%2C1024&ssl=1',
          'https://m.media-amazon.com/images/M/MV5BM2FkYmZiZjItY2Q5NC00MWVkLWI3NDItMzhiOTRkNDhhZDEyXkEyXkFqcGdeQXVyOTg4MDYyNw@@._V1_UY1200_CR92,0,630,1200_AL_.jpg',
          'https://www.mydomaine.com/thmb/1XrnUDHlamCapF0tZ5Ur0qLedy0=/550x0/filters:no_upscale():max_bytes(150000):strip_icc()/AAAABSRQgN5cPXKZc9Brnc4fmV9uPWgVU63EISyZYI8hySETbvMTCBQ_YES50WdtQX0Hq3Jy3snPLFD3Tpl8W0Fu7jVZ-cK9vqUUwhh0R9knq7OOOFrfat8_4Qk0q59bIg-def65a151f164d718203a7b803dacafc.jpg',
        ],
      ),
    ];
  }
}