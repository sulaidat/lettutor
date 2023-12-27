class SearchInfo {
  Filters? filters;
  String? search;
  String? page;
  int? perPage;

  SearchInfo({this.filters, this.search, this.page, this.perPage});
}

class Filters {
  List<String>? specialties;
  Nationality? nationality;
  List<String>? tutoringTimeAvailable;

  Filters({this.specialties, this.nationality, this.tutoringTimeAvailable});
}

class Nationality {
  bool? isVietnamese;
  bool? isNative;

  Nationality({this.isVietnamese, this.isNative});
}
