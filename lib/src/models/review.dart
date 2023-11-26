class Review {
  String id;
  String? name;
  String? review;
  double? rating;
  DateTime? date;

  Review({
    required this.id,
    this.name,
    this.review,
    this.rating,
    this.date,
  });

  void updateName(String newName) {
    name = newName;
  }

  void updateReview(String newReview) {
    review = newReview;
  }

  void updateRating(double newRating) {
    rating = newRating;
  }
}