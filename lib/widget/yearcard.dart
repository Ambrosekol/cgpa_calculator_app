import 'package:cgpa_calculator_app/models/level.dart';
import 'package:flutter/material.dart';

import '../screens/yearsummary.dart';

class YearCard extends StatefulWidget {
  const YearCard({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  State<YearCard> createState() => _YearCardState();
}

class _YearCardState extends State<YearCard> {
  late int totalPoints;
  late double cgpa;
  late double firstSemesterGpa;
  late double secondSemesterGpa;
  late int totalCourseUnit;
  late int totalCourseOffered;
  @override
  void initState() {
    super.initState();
    totalCourseOffered = yearInfo[widget.id].totalCourseOffered1 +
        yearInfo[widget.id].totalCourseOffered2;
    totalPoints =
        yearInfo[widget.id].totalPoints1 + yearInfo[widget.id].totalPoints2;
    totalCourseUnit = yearInfo[widget.id].totalCourseUnits1 +
        yearInfo[widget.id].totalCourseUnits2;
    cgpa = yearInfo[widget.id].cgpa;
    firstSemesterGpa = yearInfo[widget.id].firstSemsetergpa;
    secondSemesterGpa = yearInfo[widget.id].secondSemsetergpa;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //edit each level

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => YearSummary(id: widget.id)));
      },
      child: Container(
        margin: (widget.id == 0)
            ? const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0)
            : const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          // color: Colors.redAccent,
          gradient: const LinearGradient(
            stops: [0.6, 0.2],
            colors: [Colors.white, Colors.blue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        width: MediaQuery.of(context).size.width - 20,
        height: 160.0,
        child: Column(
          children: [
            Text(
              (widget.id == 0) ? '100 Level' : '${widget.id + 1}00 Level',
              style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Amaranth'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Total points: $totalPoints',
                      style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Amaranth'),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Level CGPA: $cgpa',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Amaranth'),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '1st Semester GPA: $firstSemesterGpa',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Amaranth'),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '2nd Semester GPA: $secondSemesterGpa',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Amaranth'),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Total Course units: $totalCourseUnit',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Amaranth'),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Total Course offered: $totalCourseOffered',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Amaranth'),
                    ),
                    Image(
                      height: 90.0,
                      image: AssetImage('assets/graphimage.png'),
                      fit: BoxFit.fill,
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
