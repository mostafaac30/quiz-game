class QeustionModel {
  String questionText;
  String feedback;
  int answerIndex;
  List<String> answers;
  String intro;
  QeustionModel({
    required this.questionText,
    required this.answerIndex,
    required this.answers,
    required this.feedback,
    required this.intro,
  });
}

List<QeustionModel> questions = [
  QeustionModel(
    questionText: ':ما ليس بفعل ماض فيما يأتي',
    answerIndex: 3,
    answers: [
      'أَحَبَّ',
      'اِسْتَحَبَ',
      'تَحَبّبَ',
      'يُحِبُ',
    ],
    feedback:
        'يحب; فعل مضارع٫ ومن علامة الفعل المضارع قبول السين٫ سوف; مثال: سيحب٫ سوف يحب',
    intro:
        'الفعل الماضي يبني على الفتح، إذا لم يتصل به شىء في نهايته، مثل: كتب، نجح، تميز، استمتع، استيقظ...',
  ),
  QeustionModel(
    questionText: 'تَاءُ الرَّفعِ المُتَحَرِّكَةُ كَمَا فِيْ كَلِمَةِ:	',
    answerIndex: 0,
    answers: [
      'فَكَّرْتُ',
      'وَقْتٍ',
      'نَبَاتٍ',
      'بَنَاتٍ',
    ],
    feedback:
        'فَكَّرْتُ؛ فَالفِعْلُ مَاضٍ اتَّصَلَتْ بِهِ تَاءُ الرَّفعِ المُتَحَرِّكَةُ.	',
    intro:
        'تَاءُ الرَّفعِ المُتَحَرِّكَةُ ضَمِيْرٌ يَتَّصِلُ بِالفِعْلِ المَاضِيْ فَقَطْ، فَيَدُلُّ عَلَى الفَاعِلِ غَالِبًا، مِثْلُ: فُزْتُ، رَبِحْتُ.	',
  ),
];
