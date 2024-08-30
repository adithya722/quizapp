import 'package:flutter/material.dart';
import 'package:project2/questions.dart';

class QuizScreen extends StatefulWidget {
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Question> questionList = getQuestion();
  int currentQuestionIndex = 0;
  int score = 0;
  Answer? selectedAnswer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //    elevation: 0,
      //   backgroundColor: Colors.white,

      //   title: Text('Quiz App',
      //     style: TextStyle(
      //         color: Color.fromARGB(255, 116, 115, 115),
      //         fontWeight: FontWeight.bold,
      //         fontSize: 20,
      //       ),),

      // ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/ques.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 3,
                child: _questionWidget(),
              ),
              Expanded(
                flex: 4,
                child: _answerList(),
              ),
              _nextButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _questionWidget() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 39),
            child: Text(
              "Question: ${currentQuestionIndex + 1}/${questionList.length}",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(height: 35),
          Card(
            color: Color.fromARGB(179, 76, 75, 75),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                questionList[currentQuestionIndex].questionText,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _answerList() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: questionList[currentQuestionIndex]
            .answerList
            .map((answer) => _answerButton(answer))
            .toList(),
      ),
    );
  }

  Widget _answerButton(Answer answer) {
    bool isSelected = answer == selectedAnswer;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: isSelected ? Colors.amber : Colors.white,
          onPrimary: isSelected ? Colors.blue : Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          setState(() {
            // Allow selection only if no answer is currently selected
            if (selectedAnswer == answer) {
              selectedAnswer = null;
              if (answer.isCorrect) {
                score--; // Increment score if the selected answer is correct
              }
            } else {
              if (selectedAnswer != null && selectedAnswer!.isCorrect) {
                score--;
              }
              selectedAnswer == answer;
              if (answer.isCorrect) {
                score++;
              }
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            answer.answerText,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }

  Widget _nextButton() {
    bool isLastQuestion = currentQuestionIndex == questionList.length - 1;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: () {
          if (selectedAnswer != null) {
            setState(() {
              if (!isLastQuestion) {
                currentQuestionIndex++;
                selectedAnswer = null;
              } else {
                _showScoreDialog();
              }
            });
          }
        },
        child: Text(
          isLastQuestion ? 'Submit' : 'Next',
          style: TextStyle(fontSize: 18),
        ),
        style: ElevatedButton.styleFrom(
          primary: const Color.fromARGB(255, 63, 63, 63),
          onPrimary: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  void _showScoreDialog() {
    bool isPassed = score >= questionList.length * 0.6;
    String dialogTitle = isPassed ? 'Passed' : 'Failed';
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(
          '$dialogTitle\nScore: $score/${questionList.length}',
          textAlign: TextAlign.center,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  currentQuestionIndex = 0;
                  score = 0;
                  selectedAnswer = null;
                });
                Navigator.pop(context);
              },
              child: Text('Restart'),
            ),
          ],
        ),
      ),
    );
  }
}
