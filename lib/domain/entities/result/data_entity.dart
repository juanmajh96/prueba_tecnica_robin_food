///Entity for data
class DataEntity {
  DataEntity({
    required this.key,
    this.coverId,
    this.title,
    this.editionCount,
    this.author,
    this.subject,
    this.time,
    this.placeFacet,
    this.firstPublisherYear,
    this.subtitle,
  });

  final String key;
  final int? coverId;
  final String? title;
  final int? editionCount;
  final List<String>? author;
  final List<String>? subject;
  final List<String>? time;
  final List<String>? placeFacet;
  final int? firstPublisherYear;
  final String? subtitle;
}
