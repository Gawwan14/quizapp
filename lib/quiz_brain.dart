import 'package:quizapp/questions.dart';

class QuizBrain{
  int questionNumber=0;
  final List<Map<String, dynamic>> questionsBank = [
    {
      'question': 'Some cats are actually allergic to humans?',
      'options': [
        'Cats are allergic to humans.',
        'Cats are not allergic to humans.',
        'Only some cats are allergic to humans.',
        'Cats cannot have allergies.'
      ],
      'answerIndex': 2,
    },
    {
      'question': 'You can lead a cow down stairs but not up stairs?',
      'options': [
        'Cows can go both up and down stairs.',
        'Cows cannot go down stairs.',
        'Cows cannot go up stairs.',
        'Cows are scared of stairs entirely.'
      ],
      'answerIndex': 2,
    },
    {
      'question': 'Approximately one quarter of human bones are in the feet?',
      'options': [
        'The majority of bones are in the feet.',
        'A quarter of bones are in the feet.',
        'Half of the bones are in the feet.',
        'Feet have very few bones.'
      ],
      'answerIndex': 1,
    },
    {
      'question': 'A slug\'s blood is green?',
      'options': [
        'A slug\'s blood is red.',
        'A slug\'s blood is green.',
        'A slug\'s blood is blue.',
        'A slug\'s blood is colorless.'
      ],
      'answerIndex': 1,
    },
    {
      'question': 'Buzz Aldrin\'s mother\'s maiden name was "Moon"?',
      'options': [
        'Buzz Aldrin\'s mother\'s maiden name was "Star".',
        'Buzz Aldrin\'s mother\'s maiden name was "Moon".',
        'Buzz Aldrin\'s mother\'s maiden name was "Plant".',
        'Buzz Aldrin\'s mother\'s maiden name was "Sky".'
      ],
      'answerIndex': 1,
    },
    {
      'question': 'It is illegal to pee in the Ocean in Portugal?',
      'options': [
        'It is legal to pee in the ocean anywhere.',
        'It is illegal to pee in the ocean in Portugal.',
        'It is only illegal in some parts of Portugal.',
        'It is illegal to pee in any ocean worldwide.'
      ],
      'answerIndex': 1,
    },
    {
      'question': 'No piece of square dry paper can be folded in half more than 7 times?',
      'options': [
        'It is possible to fold paper more than 7 times.',
        'It is impossible to fold paper more than 7 times.',
        'Only round paper can be folded more than 7 times.',
        'Paper can always be folded endlessly.'
      ],
      'answerIndex': 1,
    },
    {
      'question':
      'If you die in the House of Parliament in London, what are you entitled to?',
      'options': [
        'A public memorial service.',
        'A royal burial.',
        'A state funeral, because the building is considered sacred.',
        'No special privileges.'
      ],
      'answerIndex': 2,
    },
    {
      'question':
      'The loudest sound produced by any animal is 188 decibels. What is the animal?',
      'options': [
        'African Elephant.',
        'Blue Whale.',
        'Humpback Whale.',
        'Sperm Whale.'
      ],
      'answerIndex': 3,
    },
    {
      'question': 'The total surface area of two human lungs is approximately:',
      'options': [
        '20 square meters.',
        '50 square meters.',
        '70 square meters.',
        '100 square meters.'
      ],
      'answerIndex': 2,
    },
    {
      'question': 'What was Google originally called?',
      'options': ['Backrub', 'PageRank', 'WebFinder', 'SearchBuddy'],
      'answerIndex': 0,
    },
    {
      'question': 'How does chocolate affect dogs?',
      'options': [
        'It is toxic to them.',
        'It is neutral for them.',
        'It is healthy for them.',
        'It has no effect.'
      ],
      'answerIndex': 0,
    },
    {
      'question':
      'In West Virginia, USA, what can you legally do if you accidentally hit an animal with your car?',
      'options': [
        'Call animal control to take it away.',
        'Take it home to cook and eat it.',
        'Leave it where it is.',
        'Report it to the authorities.'
      ],
      'answerIndex': 1,
    },
  ];
  void nextQuestion(){
    if (questionNumber< questionsBank.length-1){
      questionNumber++;
    }
  }
  String getQuestionText() {
    return questionsBank[questionNumber]['question'];
  }
  List<String> getOptions() {
    return List<String>.from(questionsBank[questionNumber]['options']);
  }

  int getCorrectAnswerIndex() {
    return questionsBank[questionNumber]['answerIndex'];
  }



  bool isFinished(){
    if (questionNumber>=questionsBank.length-1){
      print("Now returning ture");
      return true;
    }
    else{
      return false;
    }
  }
  void reset(){
    questionNumber=0;
  }
}