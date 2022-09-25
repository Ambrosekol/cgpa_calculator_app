import 'package:cgpa_calculator_app/widget/yearcard.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Dashboard extends StatefulWidget {
  const Dashboard(this.yearsInCollege, {Key? key}) : super(key: key);
  final int yearsInCollege;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int bottomNavItemSelector = 0;
  List<String> commentaryStatus = [
    'Excellence',
    'Good Academic Standing',
    'Needs to Improve',
    'Bad Performance'
  ];
  String demoCgpa = '3.46';
  bool cgpaIsHidden = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavigation(),
      body: Column(
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: const DecorationImage(
                image: AssetImage('assets/dashboard_design.jpg'),
                fit: BoxFit.fitWidth,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'Total CGPA',
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 12.0,
                        fontFamily: 'Amaranth',
                      ),
                    ),
                    InkWell(
                      child: Container(
                        // margin: const EdgeInsets.only(right: 20.0),
                        width: 20.0,
                        height: 20.0,
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Icon(
                          cgpaIsHidden
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.white,
                          size: 15.0,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          cgpaIsHidden = !cgpaIsHidden;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 6.0),
                Text(
                  cgpaIsHidden ? demoCgpa : '****',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Amaranth',
                  ),
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Icon(
                        Icons.question_mark_sharp,
                        color: Colors.white,
                        size: 15.0,
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    getCommentary(),
                  ],
                ),
                const SizedBox(height: 7.0),
              ],
            ),
          ),
          const SizedBox(height: 10),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     actionButton(id: 1, icon: Icons.add, title: 'Add New'),
          //     actionButton(id: 2, icon: Icons.cloud, title: 'Save'),
          //     actionButton(id: 3, icon: Icons.share, title: 'Share'),
          //   ],
          // ),
          const SizedBox(height: 10.0),
          // const Chart(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(10),
              children: yearListStatus(),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> yearListStatus() {
    List<Widget> widgets = [
      Lottie.asset(
        'assets/35269-the-guy-with-the-cat-at-the-computer.json',
      )
    ];
    for (int i = 1; i < widget.yearsInCollege + 1; i++) {
      widgets.add(YearCard(id: i - 1));
    }

    return widgets;
  }

  Widget getCommentary() {
    if (double.parse(demoCgpa) > 4.0) {
      return Text(commentaryStatus[0]);
    } else if (double.parse(demoCgpa) >= 3.0) {
      return Text(commentaryStatus[1]);
    } else if (double.parse(demoCgpa) >= 2.0) {
      return Text(commentaryStatus[2]);
    } else {
      return Text(commentaryStatus[3]);
    }
  }

  /// Code Enhanced to [BottomNavigation]
  // Widget actionButton(
  //     {required int id, required IconData icon, required String title}) {
  //   return InkWell(
  //     child: Container(
  //       height: 50.0,
  //       width: MediaQuery.of(context).size.width / 4,
  //       decoration: BoxDecoration(
  //         color: Colors.blue,
  //         borderRadius: BorderRadius.circular(10),
  //       ),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //         children: [
  //           Icon(
  //             icon,
  //             color: Colors.white,
  //             size: 20.0,
  //           ),
  //           Text(
  //             title,
  //             style: const TextStyle(
  //                 color: Colors.white, fontFamily: 'Amaranth', fontSize: 15.0),
  //           )
  //         ],
  //       ),
  //     ),
  //     onTap: () {},
  //   );
  // }

  Widget bottomNavigation() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: Colors.blue.withOpacity(0.9)),
      child: Row(
        children: [
          navItem(Icons.add, 'Add New Entry', id: 1),
          navItem(Icons.share, 'Share', id: 2),
          navItem(Icons.save, 'Save', id: 3),
        ],
      ),
    );
  }

  Widget navItem(IconData icon, String label, {required id}) {
    // List<BottomNavigationBarItem> baritem = const [
    //   BottomNavigationBarItem(
    //     icon: Icon(Icons.add, color: Colors.white),
    //     label: 'New entry',
    //   ),
    //   BottomNavigationBarItem(
    //       icon: Icon(Icons.share, color: Colors.white), label: 'Share'),
    //   BottomNavigationBarItem(
    //       icon: Icon(Icons.cloud, color: Colors.white), label: 'Save')
    // ];
    return GestureDetector(
      onTap: () {
        setState(() {
          bottomNavItemSelector = id;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 3,
        height: 60,
        alignment: Alignment.center,
        decoration: id == bottomNavItemSelector
            ? const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                // border:
                //     Border(bottom: BorderSide(width: 5, color: Colors.white)),
                color: Colors.redAccent,
                // gradient: LinearGradient(
                //   colors: [
                //     Colors.redAccent.withOpacity(0.8),
                //     Colors.redAccent.withOpacity(0.1)
                //   ],
                //   begin: Alignment.bottomCenter,
                //   end: Alignment.topCenter,
                //   // stops: const [0.1, 0.2],
                // ),
              )
            : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(icon, color: Colors.white),
            Text(
              label,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
