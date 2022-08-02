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
}

class Movie {
  final String title;
  final String coverImage;
  final List<Genre> genres;
  final String subtitle;
  final String details;

  const Movie({
    required this.title,
    required this.coverImage,
    required this.genres,
    required this.subtitle,
    required this.details,
  });
}
