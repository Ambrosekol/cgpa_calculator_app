import 'package:flutter/material.dart';

class YearSummary extends StatefulWidget {
  const YearSummary({super.key, required this.id});
  final int id;

  @override
  State<YearSummary> createState() => _YearSummaryState();
}

class _YearSummaryState extends State<YearSummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10.0, left: 10.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 20,
                      color: Colors.redAccent,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 30.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Year Summary for ${widget.id + 1}00 Level',
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                      fontFamily: 'Amaranth',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40.0),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 90.0,
              decoration: BoxDecoration(
                color: Colors.redAccent,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Your total CGPA is:',
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Amaranth',
                    ),
                  ),
                  Text(
                    '3.46',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Amaranth',
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 50.0),
            semesterCard(1),
            const SizedBox(height: 10.0),
            semesterCard(2),
          ],
        ),
      ),
    );
  }

  Widget semesterCard(int semesterID) {
    return Container(
      height: MediaQuery.of(context).size.height / 3.5,
      margin: const EdgeInsets.only(left: 5.0, right: 5.0),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.blue, width: 2.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            (semesterID == 1)
                ? 'FIrst Semester Stats'
                : 'Second Semester Stats',
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontFamily: 'Amaranth',
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Course Offered: 30',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontFamily: 'Amaranth',
                ),
              ),
              Text(
                'GPA for first Semester: 3.50',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontFamily: 'Amaranth',
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Course units: 30',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontFamily: 'Amaranth',
                ),
              ),
              Text(
                'Total course Points: 3.50',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontFamily: 'Amaranth',
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Add New Course',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.blue,
                    fontFamily: 'Amaranth',
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.white),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'View Added Courses',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.blue,
                    fontFamily: 'Amaranth',
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
