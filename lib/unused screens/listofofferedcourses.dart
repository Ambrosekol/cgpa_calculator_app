import 'package:flutter/material.dart';

import '../models/level.dart';

// class CourseInputPage extends StatefulWidget {
//   const CourseInputPage({Key? key}) : super(key: key);

//   @override
//   State<CourseInputPage> createState() => _CourseInputPageState();
// }

// class _CourseInputPageState extends State<CourseInputPage> {
//   @override
//   Widget build(BuildContext context) {
//     List<String> grades = ['A', 'B', 'C', 'D', 'E', 'F'];
//     String selectedItem = 'A';
//     TextEditingController courseController = TextEditingController();
//     TextEditingController gradeController = TextEditingController();
//     TextEditingController unitController = TextEditingController();

//     return Scaffold(
//         body:
//             // body: Stack(
//             //   alignment: Alignment.bottomCenter,
//             //   // mainAxisAlignment: MainAxisAlignment.start,
//             //   // crossAxisAlignment: CrossAxisAlignment.center,
//             //   children: [
//             Container(
//       color: const Color.fromARGB(206, 0, 0, 0),
//       width: MediaQuery.of(context).size.width,
//       child: ListView.builder(
//         padding: const EdgeInsets.all(8.0),
//         itemCount: listOfOfferedCourses.length,
//         itemBuilder: (context, index) {
//           return Column(
//             children: [
//               const Divider(
//                 thickness: 0.2,
//                 color: Colors.white54,
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: const Color.fromARGB(52, 255, 255, 255),
//                 ),
//                 child: ListTile(
//                   tileColor: Colors.white,

//                   leading: Text(listOfOfferedCourses[index].name),
//                   title: Text(
//                     listOfOfferedCourses[index].units.toString(),
//                     textAlign: TextAlign.center,
//                   ),
//                   trailing: Text(listOfOfferedCourses[index].grade),
//                   // subtitle: Text(
//                   //     '${listOfCourses[index].calculateCourseData().toInt()}'),
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     )
//         //   ],
//         // ),
//         );
//   }
// }
