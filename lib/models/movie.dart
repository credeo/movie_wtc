import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

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

enum AgeRating { restricted }

class Movie {
  final String title;
  final String coverImage;
  final List<Genre> genres;
  final String subtitle;
  final String details;
  final DateTime releaseDate;
  final AgeRating? ageRating;
  final int duration;
  final int downloadSize;
  int? rated;
  int? year;

  Movie(
      {this.ageRating,
      this.rated,
      required this.title,
      required this.coverImage,
      required this.genres,
      required this.subtitle,
      required this.details,
      required this.releaseDate,
      required this.duration,
      required this.downloadSize,
      this.year});
  @override
  bool operator ==(other) =>
      other is Movie &&
      other.title == title &&
      other.subtitle == subtitle &&
      other.details == details &&
      other.releaseDate == releaseDate &&
      other.rated == rated;
  //other.fileSize == fileSize &&
  //other.length == length;

  @override
  int get hashCode => hashValues(
        title,
        subtitle,
        details,
        releaseDate,
        rated,
        //fileSize,
        //length,
      );
}
