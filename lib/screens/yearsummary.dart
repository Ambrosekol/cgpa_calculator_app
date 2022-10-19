import 'package:cgpa_calculator_app/models/level.dart';
import 'package:cgpa_calculator_app/screens/viewcoursespage.dart';
import 'package:flutter/material.dart';

class YearSummary extends StatefulWidget {
  const YearSummary({super.key, required this.id});
  final int id;

  @override
  State<YearSummary> createState() => _YearSummaryState();
}

class _YearSummaryState extends State<YearSummary> {
  List<String> grades = ['A', 'B', 'C', 'D', 'E', 'F'];
  String selectedItem = 'A';
  TextEditingController courseController = TextEditingController();
  TextEditingController gradeController = TextEditingController();
  TextEditingController unitController = TextEditingController();
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
              fontWeight: FontWeight.bold,
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
                onPressed: () {
                  //
                  showModalBottomSheet(
                      constraints: BoxConstraints.tight(
                          Size(MediaQuery.of(context).size.width, 250)),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      backgroundColor: Colors.black87,
                      context: context,
                      builder: (context) {
                        return Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: IconButton(
                                  onPressed: () => Navigator.pop(context),
                                  icon: const Icon(
                                    Icons.cancel,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              inputfield(),

                              ///
                              ///
                              ///
                            ],
                          ),
                        );
                      });

                  //
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.white),
                ),
                child: const Text(
                  'Add New Course',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.blue,
                    fontFamily: 'Amaranth',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return CoursesPage(level: widget.id, semester: semesterID);
                })),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.white),
                ),
                child: const Text(
                  'View Added Courses',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.blue,
                    fontFamily: 'Amaranth',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget inputfield() {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 5,
            child: Column(children: [
              const Text('Course code'),
              TextField(controller: courseController)
            ]),
          ),
          const SizedBox(width: 8.0),
          SizedBox(
            width: MediaQuery.of(context).size.width / 5,
            child: Column(children: [
              const Text('units'),
              TextField(
                  controller: unitController,
                  keyboardType: TextInputType.number),
            ]),
          ),
          const SizedBox(height: 8.0),
          DropdownButton(
            items: grades
                .map((item) =>
                    DropdownMenuItem<String>(value: item, child: Text(item)))
                .toList(),
            value: selectedItem,
            onChanged: (item) {
              selectedItem = item.toString();
            },
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: MediaQuery.of(context).size.width / 5,
            child: Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                  onPressed: () {
                    if (courseController.text.isNotEmpty &&
                        selectedItem.isNotEmpty &&
                        unitController.text.isNotEmpty) {
                      setState(() {
                        calculatedCoursePoints.add(Course(
                                name: courseController.text,
                                units: int.parse(unitController.text),
                                grade: selectedItem)
                            .calculateCourseData());
                        listOfOfferedCourses.add(
                          Course(
                              name: courseController.text,
                              units: int.parse(unitController.text),
                              grade: selectedItem),
                        );
                      });
                    }
                  },
                  child: const Text('Submit')),
            ),
          )
        ],
      ),
    );
  }
}
// DraggableScrollableSheet(
//                     initialChildSize: 0.3,
//                     minChildSize: 0.3,
//                     maxChildSize: 0.6,
//                     builder: (context, scrollController) => Container(
//                       decoration: const BoxDecoration(color: Colors.black87),
//                       child: ListView.separated(
//                         controller: scrollController,
//                         itemBuilder: (context, index) => ListTile(
//                           title: Text('this is number $index'),
//                         ),
//                         separatorBuilder: (__, _) => Divider(),
//                         itemCount: 30,
//                       ),
//                     ),
//                   );







  // showModalBottomSheet(
  //                     shape: const RoundedRectangleBorder(
  //                       borderRadius: BorderRadius.only(
  //                         topLeft: Radius.circular(10),
  //                         topRight: Radius.circular(10),
  //                       ),
  //                     ),
  //                     backgroundColor: Colors.black87,
  //                     context: context,
  //                     builder: (context) {
  //                       return Container(
  //                         padding: const EdgeInsets.all(10),
  //                         child: Column(
  //                           children: [
  //                             Align(
  //                               alignment: Alignment.topRight,
  //                               child: IconButton(
  //                                 onPressed: () => Navigator.pop(context),
  //                                 icon: const Icon(
  //                                   Icons.cancel,
  //                                   color: Colors.white,
  //                                 ),
  //                               ),
  //                             ),
  //                             // ListView.builder(
  //                             //     itemBuilder: (context, index) {
  //                             //   return ListTile();
  //                             // }),
  //                           ],
  //                         ),
  //                       );
  //                     }
                  
  //                     );