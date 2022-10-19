import 'package:flutter/material.dart';

import '../screens/yearsummary.dart';

class YearCard extends StatefulWidget {
  const YearCard({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  State<YearCard> createState() => _YearCardState();
}

class _YearCardState extends State<YearCard> {
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
                  children: const [
                    Text(
                      'Total points: 100',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Amaranth'),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Level CGPA: 4.32',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Amaranth'),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '1st Semester GPA: 4.32',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Amaranth'),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '2nd Semester GPA: 4.32',
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
                  children: const [
                    Text(
                      'Total Course units: 20',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Amaranth'),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Total Course offered: 30',
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
