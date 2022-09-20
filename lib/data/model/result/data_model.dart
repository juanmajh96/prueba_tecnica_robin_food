import 'package:prueba_tecnica/domain/entities/result/result.dart';

///Model for data
class DataModel extends DataEntity {
  ///Use super to save variable in entity
  DataModel({
    required super.key,
    super.coverId,
    super.title,
    super.editionCount,
    super.author,
    super.subject,
    super.time,
    super.placeFacet,
    super.firstPublisherYear,
    super.subtitle,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        key: json['key'] as String,
        coverId: json['cover_i'] as int?,
        title: json['title'] as String?,
        editionCount: json['edition_count'] as int?,
        author: (json['author_name'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
        subject: (json['subject'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
        time:
            (json['time'] as List<dynamic>?)?.map((e) => e as String).toList(),
        placeFacet: (json['place_facet'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
        firstPublisherYear: json['first_publish_year'] as int?,
        subtitle: json['subtitle'] as String?,
      );
}
