import 'package:cgpa_calculator_app/models/level.dart';
import 'package:flutter/material.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key, required this.level, required this.semester});

  final int level;
  final int semester;

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
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
                  child: const Text(
                    'Your Entries',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                      fontFamily: 'Amaranth',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5.0),
            Expanded(
              child: Container(
                color: const Color.fromARGB(206, 0, 0, 0),
                // height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  padding: const EdgeInsets.all(8.0),
                  itemCount: (widget.semester == 1)
                      ? yearInfo[widget.level].firstSemesterCourses.length
                      : yearInfo[widget.level].secondSemesterCourses.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        const Divider(
                          thickness: 0.2,
                          color: Colors.white54,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(52, 255, 255, 255),
                          ),
                          child: ListTile(
                            // focusColor: Colors.white,
                            tileColor: Colors.white,
                            // style: ListTileStyle.drawer,
                            leading: Text((widget.semester == 1)
                                ? yearInfo[widget.level]
                                    .firstSemesterCourses[index]
                                    .name
                                : yearInfo[widget.level]
                                    .secondSemesterCourses[index]
                                    .name),
                            title: Text(
                              (widget.semester == 1)
                                  ? yearInfo[widget.level]
                                      .firstSemesterCourses[index]
                                      .units
                                      .toString()
                                  : yearInfo[widget.level]
                                      .secondSemesterCourses[index]
                                      .units
                                      .toString(),
                              textAlign: TextAlign.center,
                            ),
                            trailing: Text((widget.semester == 1)
                                ? yearInfo[widget.level]
                                    .firstSemesterCourses[index]
                                    .grade
                                : yearInfo[widget.level]
                                    .secondSemesterCourses[index]
                                    .grade),
                            // subtitle: Text(
                            //     '${listOfCourses[index].calculateCourseData().toInt()}'),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
