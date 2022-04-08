// SCSJ3623 Mobile Application Programming
// Tutorial 2.2

// Date: _________
// Section: _________
// Room Number: _________

// Member 1's Name: _____________    Location: ____________ (i.e. where are you currently located)
// Member 2's Name: _____________    Location: ____________
// Member 3's Name: _____________    Location: ____________
// Member 4's Name: _____________    Location: ____________

// Task 1a: Define class Person

import 'dart:convert';
import 'dart:core';

class Person {
  String _name;

  Person(this._name);
  String get name => _name;
  void set name(String name) => _name = name;
}

//  Task 1b: Define class Result as a mixin

mixin Result {
  double _score;

  double get score => _score;
  void set score(double score) => _score = score;
  String get grade {
    if (_score >= 85 && _score <= 100) {
      return "A";
    }
    if (_score >= 75 && _score <= 84) {
      return "B";
    }
    if (_score >= 65 && _score <= 74) {
      return "C";
    }
    if (_score >= 50 && _score <= 64) {
      return "D";
    }
    return "E";
  }
}

//  Task 1c: Define class Student

class Student extends Person with Result {
  String _matric;

  Student(String name, double score, String this._matric) : super(name) {
    this._score = score;
  }

  String get matric => _matric;

  void set matric(String matric) => _matric = matric;

  String get yearOfStudy {
    int matricYear;
    int currentYear;

    matricYear = int.parse(this._matric.substring(1, 3));
    matricYear += 2000;
    //DateTime now = new DateTime.now();
    currentYear = 2020; //now.year;

    // currentYear = currentYear.substring(currentYear.length - 2);
    // int year = (int.parse(currentYear)) - (int.parse(matricYear));

    int year = currentYear - matricYear;

    if (year == 1) return "First Year";
    if (year == 2) return "Second Year";
    if (year == 3) return "Third Year";
    return "Fourth Year";
  }
}

void main() {
  // Task 2: Store the input data in a multi-line string variable
  var data = """
Mario Max,A16EC4041,57
Petey Cruiser,A17EC4042,85
Anna Sthesia,A18EC4056,66
Paul Molive,A16EC9043,80
Anna Mull,A19EC4002,57
Gail Forcewind,A16EC4032,75
Paige Turner,A16EC3002,85
Bob Frapples,A17EC3003,82
Robin Banks,A17EC4043,83
Jimmy Changa,A18EC4044,84
Barry Wine,A18EC3004,67
Wilma Mumduya,A16EC4045,70
Buster Hyman,A17EC4040,53
  """;

  // Task 3: Split the text into a list of single line string

  var lines = data.split('\n');

  // Task 4: create a list of Student objects from the strings

  var students = <Student>[];

  for (int i = 0; i < lines.length; i++) {
    var singleData = lines[i].split(',');
    if (singleData.length == 3) {
      students.add(new Student(
          singleData[0], double.parse(singleData[2]), singleData[1]));
    }
  }

  // Task 5: Print the list of students with their scores, grades and other info
  print('Name'.padRight(20) +
      'Year'.padRight(20) +
      'Matric'.padRight(15) +
      'Score'.padRight(10) +
      'Grade');
  print('----'.padRight(20) +
      '----'.padRight(20) +
      '------'.padRight(15) +
      '------'.padRight(10) +
      '----');

  students.forEach((s) => print(
      "${s._name.padRight(20)}${s.yearOfStudy.padRight(20)}${s._matric.padRight(15)}${s._score.round().toString().padRight(10)}${s.grade}"));

  double total = 0;

  students.forEach((s) => total += s.score);

  print('\nAverage score: ${(total / students.length).round()}');
  print(
      'Average grade: ${new Student("", (total / students.length), "").grade}');
}

// void printInfo(Student s) {
//   print("$s._name\t$s.yearOfStudy\t$s._matric\t$s._score\t$s.grade\n");
// }

// Resources
// 1.	How do I call a super constructor in Dart?
//    https://stackoverflow.com/questions/13272035/how-do-i-call-a-super-constructor-in-dart

// 2.	substring method
//    https://api.flutter.dev/flutter/dart-core/String/substring.html

// 3.	How do I parse a string into a number with Dart?
//    https://stackoverflow.com/questions/13167496/how-do-i-parse-a-string-into-a-number-with-dart

// 4.	Multi-lines string in Dart
//    https://stackoverflow.com/questions/13104729/multi-lines-string-in-darttext

// 5.	split method
//    https://api.flutter.dev/flutter/dart-core/String/split.htmltext

// 6.	Top 10 Array utility methods you should know (Dart)
//    https://codeburst.io/top-10-array-utility-methods-you-should-know-dart-feb2648ee3a2

// 7.	round method
//    https://api.dart.dev/stable/2.7.1/dart-core/num/round.html
