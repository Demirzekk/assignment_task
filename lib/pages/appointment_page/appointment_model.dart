class AppointmentModel {
  String? doctor;
  String? photo;
  String? treatment;
  String? datetime;
  String? type;
  String? color;
  String? feedbackStars;
  String? feedbackComment;
  String? id;

  AppointmentModel(
      {this.doctor,
      this.photo,
      this.treatment,
      this.datetime,
      this.type,
      this.color,
      this.feedbackStars,
      this.feedbackComment,
      this.id});

  AppointmentModel.fromJson(Map<String, dynamic> json) {
    doctor = json['doctor'];
    photo = json['photo'];
    treatment = json['treatment'];
    datetime = json['datetime'];
    type = json['type'];
    color = json['color'];
    feedbackStars = json['feedback_stars'];
    feedbackComment = json['feedback_comment'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['doctor'] = doctor;
    data['photo'] = photo;
    data['treatment'] = treatment;
    data['datetime'] = datetime;
    data['type'] = type;
    data['color'] = color;
    data['feedback_stars'] = feedbackStars;
    data['feedback_comment'] = feedbackComment;
    data['id'] = id;
    return data;
  }

  List<Object?> get props {
    return [
      doctor,
      photo,
      treatment,
      datetime,
      type,
      color,
      feedbackStars,
      feedbackComment,
      id,
    ];
  }
}
