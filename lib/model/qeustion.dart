class QeustionModel {
  String questionText;
  String feedback;
  int answerIndex;
  List<String> answers;
  QeustionModel({
    required this.questionText,
    required this.answerIndex,
    required this.answers,
    required this.feedback,
  });
}
