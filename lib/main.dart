import 'package:cgpa_calculator_app/screens/welcomescreen.dart';
import 'package:flutter/material.dart';

import 'models/level.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // routes: landingScreen(),
      title: 'Flutter Demo',
      theme: ThemeData(
        inputDecorationTheme: textFieldTheme,
        primarySwatch: Colors.blue,
      ),
      home: const WelcomeScreen(),
    );
  }
}

InputDecorationTheme textFieldTheme = const InputDecorationTheme(
  // contentPadding: EdgeInsets.all(4),
  focusColor: Colors.white,
  focusedBorder:
      UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
  enabledBorder:
      UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
);

////

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//
  List<String> grades = ['A', 'B', 'C', 'D', 'E', 'F'];
  String selectedItem = 'A';
  TextEditingController courseController = TextEditingController();
  TextEditingController gradeController = TextEditingController();
  TextEditingController unitController = TextEditingController();

//

  // int calculatedPoint(index){
  //   listOfCourses[index].calculateCourseData();
  //   return  listOfCourses[index].calculateCourseData();
  // }
//

  // List<int> totalcourseunites = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          leading: Text(
              '${(getTotalCoursePoints() / getTotalCourseunits()).toStringAsFixed(2)}  ${listOfOfferedCourses.length}'),
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              color: const Color.fromARGB(206, 0, 0, 0),
              // height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: listOfOfferedCourses.length,
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
                          leading: Text(listOfOfferedCourses[index].name),
                          title: Text(
                            listOfOfferedCourses[index].units.toString(),
                            textAlign: TextAlign.center,
                          ),
                          trailing: Text(listOfOfferedCourses[index].grade),
                          // subtitle: Text(
                          //     '${listOfCourses[index].calculateCourseData().toInt()}'),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            inputfield(),

            /////
            ///
            ///
          ],
        ));
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
