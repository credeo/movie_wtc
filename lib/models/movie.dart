import 'package:easy_localization/easy_localization.dart';

enum Genre {
  romance('romance'),
  comedy('comedy'),
  horror('horror'),
  action('action'),
  mystery('mystery');

  final String value;

  const Genre(this.value);

  String toLocalisedString() {
    final locString = 'genre_$value'.tr();
    return locString;
  }

  String getThumbnailPath() {
    final locString = 'assets/images/categories/icon_$value.png';
    return locString;
  }
}

class Movie {
  final String id;
  final String title;
  final String coverImage;
  final List<Genre> genres;
  final String subtitle;
  final String details;
  final DateTime releaseDate;
  final int rated;
  final double fileSize;
  final double length;

  const Movie({
    required this.id,
    required this.title,
    required this.coverImage,
    required this.genres,
    required this.subtitle,
    required this.details,
    required this.releaseDate,
    required this.rated,
    required this.fileSize,
    required this.length,
  });

  @override
  bool operator ==(other) => other is Movie && other.id == id;

  @override
  int get hashCode => id.hashCode;

  factory Movie.test(int seed) {
    switch (seed) {
      case 1:
        return Movie(
          id: 'id1',
          title: 'Thor: Love and Thunder',
          coverImage: 'assets/images/movies/thor.jpg',
          genres: [Genre.comedy],
          subtitle:
              'Thor enlists the help of Valkyrie, Korg and ex-girlfriend Jane Foster to fight Gorr the God Butcher, who intends to make the gods extinct',
          details: 'Movie',
          releaseDate: DateTime.now().add(
            const Duration(days: 40),
          ),
          rated: 0,
          fileSize: 101857600,
          length: 92,
        );
      case 2:
        return Movie(
          id: 'id2',
          title: 'Stranger Things',
          coverImage: 'assets/images/movies/stranger_things.jpg',
          genres: [Genre.comedy],
          subtitle:
              'When a young boy disappears, his mother, a police chief and his friends must confront terrifying supernatural forces in order to get him back',
          details: 'TV Show',
          releaseDate: DateTime.now().add(
            const Duration(days: 50),
          ),
          rated: 18,
          fileSize: 124857600,
          length: 156,
        );
      case 3:
        return Movie(
          id: 'id3',
          title: 'The Witcher',
          coverImage: 'assets/images/movies/the_witcher.jpg',
          genres: [Genre.comedy],
          subtitle:
              'Geralt of Rivia, a solitary monster hunter, struggles to find his place in a world where people often prove more wicked than beasts',
          details: 'TV Show',
          releaseDate: DateTime.now().add(
            const Duration(days: 60),
          ),
          rated: 18,
          fileSize: 99857600,
          length: 124,
        );
      default:
        return Movie(
          id: 'id4',
          title: 'Bridgerton',
          coverImage: 'assets/images/movies/bridgerton.png',
          genres: [Genre.romance, Genre.mystery],
          subtitle:
              'Wealth, lust, and betrayal set against the backdrop of Regency-era England, seen through the eyes of the powerful Bridgerton family',
          details: 'TV Show',
          releaseDate: DateTime.now().add(
            const Duration(days: 60),
          ),
          rated: 0,
          fileSize: 104857600,
          length: 104,
        );
    }
  }
}
