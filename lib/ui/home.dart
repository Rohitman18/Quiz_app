import 'package:flutter/material.dart';
import 'package:quiz_app/model/question.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  var index = 0;
  var questionBank = [
    Question.name(" Mahatma Gandhi is the Father of our Nation ? ", true),
    Question.name(
        "Dr. Rajendra Prasad was the first President of India ?", true),
    Question.name("Giddha is the folk dance of Assam ?", false),
    Question.name("India lies in which continent of ASIA ?", true),
    Question.name("Brain of computer is Monitor ?", false),
    Question.name("Charles Babbage invented Computer?", true),
    Question.name(
        " Jawaharlal Nehru was the first Prime Minister of India ?", true),
    Question.name(
        " National Sports Day celebrated in India on 28th August ?", false),
    // Question.name("My name is Rohit Sharma", true),
    // Question.name("My name is Rohit Sharma", true),
    // Question.name("My name is Rohit Sharma", true),
    // Question.name("My name is Rohit Sharma", true),
    // Question.name("My name is Rohit Sharma", true),
    // Question.name("My name is Rohit Sharma", true),
    // Question.name("My name is Rohit Sharma", true),
    // Question.name("My name is Rohit Sharma", true),
    // Question.name("My name is Rohit Sharma", true),
    // Question.name("My name is Rohit Sharma", true),
    // Question.name("My name is Rohit Sharma", true),
    // Question.name("My name is Rohit Sharma", true),
    // Question.name("My name is Rohit Sharma", true),
    // Question.name("My name is Rohit Sharma", true),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz App"),
        backgroundColor: Colors.orangeAccent,
        centerTitle: true,
      ),
      // backgroundColor: Colors.lightGreenAccent,

      body: Builder(
        builder: (BuildContext context) => Container(
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
          // color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image.asset("images/flag.png"),
                const Image(
                  image: AssetImage('images/img.png'),
                  width: 250,
                  height: 200,
                ),
                Expanded(
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.05),
                      // width: 375,
                      // height: 75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.green.shade800,
                      ),
                      // color: Colors.green.shade800,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Center(
                          child: Text(
                            questionBank[index].question,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 19,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 85,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () => _prevquestion(),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.blue.shade800),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.2),
                                      side: const BorderSide(
                                          color: Colors.redAccent)))),
                          child: const Icon(
                            Icons.arrow_back,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 85,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () => _answer(true, context),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.blue.shade800),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.2),
                                      side: const BorderSide(
                                          color: Colors.redAccent)))),
                          child: const Text(
                            "True",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 85,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () => _answer(false, context),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.blue.shade800),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.2),
                                      side: const BorderSide(
                                          color: Colors.redAccent)))),
                          child: const Text(
                            "False",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 85,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () => _nextquestion(),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.blue.shade800),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.2),
                                      side: const BorderSide(
                                          color: Colors.redAccent)))),
                          child: const Icon(
                            Icons.arrow_forward,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer()
              ],
            ),
          ),
        ),
      ),
    );
  }

  _answer(bool userChoice, BuildContext context) {
    if (userChoice == questionBank[index].isBoolean) {

      var snackBar = const SnackBar(
        duration: Duration(milliseconds: 500),
        content: Text(
          "Correct Answer",
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w700,
            fontSize: 19,
          ),
        ),
        backgroundColor: Colors.green,
      );
      _nextquestion();
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      var snackBar = const SnackBar(
        duration: Duration(milliseconds: 500),
        content: Text(
          "Wrong Answer",
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w700,
            fontSize: 19,
          ),
        ),
        backgroundColor: Colors.redAccent,
      );
      // _nextquestion();
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  _nextquestion() {
    setState(() {
      index = (index + 1) % questionBank.length;
    });
  }

  _prevquestion() {
    setState((){
      index = (index - 1) % questionBank.length;
    });
  }
}
