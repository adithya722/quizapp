import 'package:flutter/material.dart';

class Admin extends StatefulWidget {
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  List<Map<String, Map<String, bool>>> _questions = [];
  final TextEditingController _questionController = TextEditingController();
  final TextEditingController _answerController = TextEditingController();
  final TextEditingController _correctAnswerController = TextEditingController();
  List<String> _answers = [];

  @override
  void initState() {
    super.initState();
    _fetchQuestions();
  }

  Future<void> _fetchQuestions() async {
    // Simulate a network request
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      _questions = [
        {
          'What is Flutter?': {
            'A UI toolkit by Google.': false,
            'It is used to build natively compiled applications.': false,
          }
        },
        {
          'What is Dart?': {
            'A programming language for Flutter.': false,
            'It is optimized for building UIs.': false,
          }
        },
      ];
    });
  }

  void _addQuestion() {
    final question = _questionController.text;
    final correctAnswer = _correctAnswerController.text;

    if (question.isNotEmpty && _answers.length >= 2 && _answers.contains(correctAnswer)) {
      setState(() {
        _questions.add({
          question: {
            for (var answer in _answers)
              answer: answer == correctAnswer
          }
        });
        _questionController.clear();
        _answerController.clear();
        _correctAnswerController.clear();
        _answers.clear();
      });
    }
  }

  void _addAnswer() {
    final answer = _answerController.text;

    if (answer.isNotEmpty && _answers.length < 4 && !_answers.contains(answer)) {
      setState(() {
        _answers.add(answer);
        _answerController.clear();
      });
    }
  }

  void _setCorrectAnswer(String answer) {
    setState(() {
      _correctAnswerController.text = answer;
    });
  }

  void _deleteQuestion(int index) {
    setState(() {
      _questions.removeAt(index);
    });
  }

  void _deleteAnswer(String question, String answer) {
    setState(() {
      for (var item in _questions) {
        if (item.containsKey(question)) {
          item[question]!.remove(answer);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Manage Questions',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  TextField(
                    controller: _questionController,
                    decoration: InputDecoration(labelText: 'Question'),
                  ),
                  TextField(
                    controller: _answerController,
                    decoration: InputDecoration(labelText: 'Answer'),
                  ),
                  ElevatedButton(
                    onPressed: _addAnswer,
                    child: Text('Add Answer'),
                  ),
                  TextField(
                    controller: _correctAnswerController,
                    decoration: InputDecoration(labelText: 'Correct Answer'),
                  ),
                  ElevatedButton(
                    onPressed: _addQuestion,
                    child: Text('Add Question'),
                  ),
                  SizedBox(height: 20),
                  if (_questions.isEmpty)
                    Center(child: Text('No questions available.'))
                  else
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: _questions.length,
                      itemBuilder: (ctx, index) {
                        final item = _questions[index];
                        final question = item.keys.first;
                        final answers = item[question] ?? {};

                        return Card(
                          margin: EdgeInsets.symmetric(vertical: 8.0),
                          child: ExpansionTile(
                            title: Text(question),
                            children: [
                              Column(
                                children: [
                                  for (var answer in answers.keys)
                                    ListTile(
                                      title: Text(answer),
                                      trailing: IconButton(
                                        icon: Icon(Icons.delete),
                                        onPressed: () => _deleteAnswer(question, answer),
                                      ),
                                    ),
                                  if (_answers.isNotEmpty)
                                    TextField(
                                      controller: _answerController,
                                      decoration: InputDecoration(
                                        labelText: 'Add more answers',
                                      ),
                                      onSubmitted: (value) {
                                        if (value.isNotEmpty) {
                                          _addAnswer();
                                        }
                                      },
                                    ),
                                  SizedBox(height: 10),
                                ],
                              ),
                              ListTile(
                                title: TextButton(
                                  onPressed: () => _deleteQuestion(index),
                                  child: Text('Delete Question', style: TextStyle(color: Colors.red)),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
