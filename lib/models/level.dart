List<TLvl> yearInfo = [];

class TLvl {
  double cgpa = 0.0;
  double firstSemsetergpa = 0.0;
  double secondSemsetergpa = 0.0;
  int totalPoints1 = 0;
  int totalPoints2 = 0;
  int totalCourseUnits1 = 0;
  int totalCourseUnits2 = 0;
  int totalCourseOffered1 = 3;
  int totalCourseOffered2 = 0;
  List<Course>? firstSemesterCourses;
  List<Course>? secondSemesterCourses;
}

/////////////////////////////////////
class Level {
  List<Semester> semesters;
  Level(this.semesters);
}

class Semester {
  int? totalCourseUnits;
  int? totalpoints;
  int? totalcourseDone;
  double? gpa;
  List<Course> courses;
  Semester({required this.courses});
}

class Course {
  int units;
  String name;
  String grade;
  Course({required this.name, required this.units, required this.grade});

  int calculateCourseData() {
    int? calculatedPoint = 0;
    if (grade == 'A') {
      calculatedPoint = 5 * units;
      return calculatedPoint;
    } else if (grade == 'B') {
      calculatedPoint = 4 * units;
      return calculatedPoint;
    } else if (grade == 'C') {
      calculatedPoint = 3 * units;
      return calculatedPoint;
    } else if (grade == 'D') {
      calculatedPoint = 2 * units;
      return calculatedPoint;
    } else if (grade == 'E') {
      calculatedPoint = 1 * units;
      return calculatedPoint;
    } else {
      return calculatedPoint;
    }
  }
}

//////////////////////////////
List<Course> listOfOfferedCourses = [];
List<int> calculatedCoursePoints = [];

/////////

int getTotalCoursePoints() {
  int holder = 0;
  for (var i = 0; i < calculatedCoursePoints.length; i++) {
    holder += calculatedCoursePoints[i];
  }
  return holder;
}

int getTotalCourseunits() {
  int holder = 0;
  for (var i = 0; i < listOfOfferedCourses.length; i++) {
    holder += listOfOfferedCourses[i].units;
  }
  return holder;
}
