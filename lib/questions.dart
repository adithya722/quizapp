class Question {
  final String questionText;
  final List<Answer> answerList;

  Question(this.questionText, this.answerList);
}

class Answer {
  final String answerText;
  final bool isCorrect;

  Answer(this.answerText, this.isCorrect);
}

List<Question> getQuestion() {
  List<Question> list = [];

  list.add(Question("1:Who created Flutter?", [
    Answer("Facebook", false),
    Answer("Adobe", false),
    Answer("Google", true),
    Answer("Microsoft", false)
  ]));

  list.add(Question("2:In which year was Slido founded?", [
    Answer("2012", true),
    Answer("2016", false),
    Answer("2020", false),
    Answer("2021", false),
  ]));

  list.add(Question("3:Who is credited with inventing the World Wide Web?", [
    Answer("Steve jobs", false),
    Answer("bill gates", false),
    Answer("tim berners lee", true),
    Answer("mark zuckberg", false),
  ]));

  list.add(Question("4:What type of computer was the first laptop computer?", [
    Answer("apple macintosh", false),
    Answer("IBM pc", false),
    Answer("Osborne 1", true),
    Answer("Mainframe computers", false),
  ]));

  list.add(
      Question("5:What is the largest social media network in the world?", [
    Answer("Instagram", false),
    Answer("Twitter", false),
    Answer("Facebook", true),
    Answer("Snapchat", false),
  ]));

  list.add(
      Question("6:Who is considered the founder of modern computer science?", [
    Answer("Alan turing", true),
    Answer("Steve jobs", false),
    Answer("Bill gates", false),
    Answer("Tim Berners-Lee", false),
  ]));

  list.add(Question("7:What year was the iPhone first released in?", [
    Answer("2007", true),
    Answer("2009", false),
    Answer("2010", false),
    Answer("2011", false),
  ]));

  list.add(Question(
      "8:Which video game console, first released in 2006, was the first to use motion controls during gameplay?",
      [
        Answer("Sega Megadrive", false),
        Answer("Nintendo Wii", true),
        Answer("Playstation", false),
        Answer("Microconsole", false),
      ]));

  list.add(Question("9:When was eBay founded?", [
    Answer("1990", false),
    Answer("1995", true),
    Answer("2001", false),
    Answer("2002", false),
  ]));

  list.add(Question("10:MOV extension refers usually to what kind of file?", [
    Answer("Image file", false),
    Answer("Audio file", false),
    Answer("Animation/movie file", true),
    Answer("MS Office document", false),
  ]));

  list.add(Question("11:OS computer abbreviation usually means ?", [
    Answer("Order of Significance", false),
    Answer("Open Software", false),
    Answer("Operating System", true),
    Answer("Optical Sensor", false),
  ]));

  list.add(Question(
      "12:What is part of a database that holds only one type of information?",
      [
        Answer("Report", false),
        Answer("Field", true),
        Answer("Record", false),
        Answer("File", false),
      ]));

  list.add(Question("13:A green owl is the mascot for which app?", [
    Answer("Spotify", false),
    Answer("Duolingo", true),
    Answer("Tinder", false),
    Answer("Adobe", false),
  ]));

  return list;
}
