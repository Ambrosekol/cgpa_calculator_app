import 'package:flutter/material.dart';

class DisplayConfirmer extends StatefulWidget {
  const DisplayConfirmer({Key? key}) : super(key: key);

  @override
  State<DisplayConfirmer> createState() => _DisplayConfirmerState();
}

class _DisplayConfirmerState extends State<DisplayConfirmer> {
  List levelSummery = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => levelSummery.isEmpty
      ? showClickToADD()
      : InkWell(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(),
              Row(),
            ],
          ),
        );
}

Widget showClickToADD() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
      Icon(Icons.question_mark),
      Text('Click to Add'),
    ],
  );
}
