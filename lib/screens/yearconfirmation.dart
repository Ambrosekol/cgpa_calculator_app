import 'package:flutter/material.dart';

import 'dashboard.dart';

class YearConfirmation extends StatefulWidget {
  const YearConfirmation({Key? key}) : super(key: key);

  @override
  State<YearConfirmation> createState() => _YearConfirmationState();
}

class _YearConfirmationState extends State<YearConfirmation>
    with TickerProviderStateMixin {
  final graduatingYearController = TextEditingController();
  ColorTween colorChanger =
      ColorTween(begin: Colors.redAccent, end: Colors.white);
  late AnimationController _animationController;
  late Animation<double> animation;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn)
          ..addListener(() {
            setState(() {});
          });

    super.initState();
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              'Welcome',
              style: TextStyle(
                color: colorChanger.evaluate(animation),
                fontSize: 40.0,
                fontFamily: 'Amaranth',
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: const EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width / 1.5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: Colors.white, style: BorderStyle.solid, width: 3)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'How many years are you spending in College?',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Amaranth'),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  getText(),
                  const SizedBox(height: 20),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => Dashboard(int.parse(
                                graduatingYearController.text.trim()))));
                      },
                      icon: const Icon(
                        Icons.arrow_forward_sharp,
                        color: Colors.white,
                        size: 30,
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getText() {
    return TextField(
      controller: graduatingYearController,
      // onTap: () => print(graduatingYearController.text),
      cursorColor: Colors.white,
      textAlign: TextAlign.center,
      style: const TextStyle(
          fontFamily: 'Amaranth', fontSize: 20, color: Colors.white),
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.school_sharp, color: Colors.white),
        border:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      ),
    );
  }
}
