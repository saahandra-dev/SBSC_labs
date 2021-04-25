import 'dart:io';

void main(){
  print("Enter your scores");
  var score;
  List<String> scores = [];
  
  //reads user score as comma seperated list
  //88,90,78
  score = stdin.readLineSync();
  scores = score.split(",");
  StudentResult result = new StudentResult();
  result.setScore(scores);
  print(result.calcCgpa());
  print(result.calcPercent());
}

class StudentResult{
  List<String>scores;

  void setScore(List<String> marks) {
    this.scores = marks;
  }
  //block to calculate cgpa
  double calcCgpa(){
    num sum = 0;
    this.scores.forEach((e){sum += double.parse(e)/10;});
    return (sum/this.scores.length);
  
  }
  //block to calculate cgpa percentage 
  double calcPercent() {
    double cgpaAvg = this.calcCgpa();
    return cgpaAvg * 9.5;
  }
}