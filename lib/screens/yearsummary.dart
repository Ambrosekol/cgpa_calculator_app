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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.center,
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
                    '${yearInfo[widget.id].cgpa}',
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
                (semesterID == 1)
                    ? 'Total Course Offered: ${yearInfo[widget.id].totalCourseOffered1}'
                    : 'Total Course Offered: ${yearInfo[widget.id].totalCourseOffered2}',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontFamily: 'Amaranth',
                ),
              ),
              Text(
                (semesterID == 1)
                    ? 'GPA for 1st Semester: ${yearInfo[widget.id].firstSemsetergpa}'
                    : 'GPA for 2st Semester: ${yearInfo[widget.id].secondSemsetergpa}',
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
                (semesterID == 1)
                    ? 'Total Course units: ${yearInfo[widget.id].totalCourseUnits1}'
                    : 'Total Course units: ${yearInfo[widget.id].totalCourseUnits2}',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontFamily: 'Amaranth',
                ),
              ),
              Text(
                (semesterID == 1)
                    ? 'Total Course points: ${yearInfo[widget.id].totalPoints1}'
                    : 'Total Course points: ${yearInfo[widget.id].totalPoints2}',
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
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      backgroundColor: const Color.fromARGB(255, 242, 241, 241),
                      title: const Text(
                        'Add a new course',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                          fontFamily: 'Amaranth',
                        ),
                      ),
                      scrollable: true,
                      content: inputfield(),

                      // Column(
                      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //   children: [
                      //     Align(
                      //       alignment: Alignment.topRight,
                      //       child: IconButton(
                      //         onPressed: () => Navigator.pop(context),
                      //         icon: const Icon(
                      //           Icons.cancel,
                      //           color: Colors.white,
                      //         ),
                      //       ),
                      //     ),
                      //     inputfield(),

                      //     ///
                      //     ///
                      //     ///
                      //   ],
                      // ),
                    ),
                  );
                  // //
                  // showModalBottomSheet(
                  //     constraints: BoxConstraints.loose(
                  //         Size(MediaQuery.of(context).size.width, 500)),
                  //     shape: const RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.only(
                  //         topLeft: Radius.circular(10),
                  //         topRight: Radius.circular(10),
                  //       ),
                  //     ),
                  //     backgroundColor: Colors.black87,
                  //     context: context,
                  //     builder: (context) {
                  //       return ListView(
                  //         children: [
                  //           Align(
                  //             alignment: Alignment.topRight,
                  //             child: IconButton(
                  //               onPressed: () => Navigator.pop(context),
                  //               icon: const Icon(
                  //                 Icons.cancel,
                  //                 color: Colors.white,
                  //               ),
                  //             ),
                  //           ),
                  //           inputfield(),

                  //           ///
                  //           ///
                  //           ///
                  //         ],
                  //       );
                  //     });

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
    InputDecoration textfielddecoration = const InputDecoration(
      prefixIcon: Icon(
        Icons.book_online_rounded,
        color: Colors.blue,
      ),
      // prefixIconColor: Colors.white,
      fillColor: Colors.white,
      label: Text(
        'Course Code',
        style: TextStyle(color: Colors.blue),
      ),
      // border: OutlineInputBorder(
      //   borderSide: BorderSide(color: Colors.redAccent),
      // ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.redAccent),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.redAccent),
      ),
    );
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextField(
          controller: courseController,
          style: const TextStyle(
            color: Colors.blue,
            fontFamily: 'Amaranth',
            fontSize: 20.0,
          ),
          cursorColor: Colors.blue,
          decoration: textfielddecoration,
        ),
        const SizedBox(height: 20.0),
        TextField(
          controller: unitController,
          keyboardType: TextInputType.number,
          style: const TextStyle(
            color: Colors.blue,
            fontFamily: 'Amaranth',
            fontSize: 20.0,
          ),
          cursorColor: Colors.blue,
          decoration: textfielddecoration.copyWith(
            prefixIcon: const Icon(
              Icons.school,
              color: Colors.blue,
            ),
            label: const Text(
              'Course unit',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ),
        const SizedBox(height: 20.0),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.redAccent),
              borderRadius: BorderRadius.circular(10.0)),
          child: DropdownButton(
            hint: const Text(
              'Select your Grade',
              style: TextStyle(
                color: Colors.blue,
                fontFamily: 'Amaranth',
                fontSize: 18.0,
              ),
            ),
            dropdownColor: Colors.white,
            // underline: Divider(),
            isExpanded: true,
            alignment: Alignment.center,
            focusColor: Colors.blue,
            value: selectedItem,
            onChanged: (newValue) {
              setState(() {
                selectedItem = newValue as String;
              });
            },
            items: grades.map((valueItem) {
              return DropdownMenuItem(
                value: valueItem,
                child: Center(
                  child: Text(
                    valueItem,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.blue,
                        fontFamily: 'Amaranth',
                        fontSize: 20.0),
                    //
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 20.0),
        ElevatedButton(
            style: ButtonStyle(
                fixedSize: MaterialStateProperty.resolveWith(
                    (states) => const Size.fromWidth(300))),
            onPressed: () {
              if (courseController.text.isNotEmpty &&
                  selectedItem.isNotEmpty &&
                  unitController.text.isNotEmpty) {
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

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Colors.green,
                    content: Text(
                      'Entry Added Successfully',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Amaranth',
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Colors.redAccent,
                    content: Text(
                      'Entry Error - Input all fields',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Amaranth',
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                );
              }

              Navigator.pop(context);
            },
            child: const Text(
              'Submit',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Amaranth',
                fontSize: 20.0,
              ),
            )),
      ],
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