import 'package:flutter/material.dart';

class YearCard extends StatefulWidget {
  const YearCard({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  State<YearCard> createState() => _YearCardState();
}

class _YearCardState extends State<YearCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: (widget.id == 0)
          ? const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0)
          : const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        // color: Colors.redAccent,
        gradient: const LinearGradient(
          stops: [0.9, 0.2],
          colors: [Colors.white, Colors.redAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      width: MediaQuery.of(context).size.width - 20,
      height: 150.0,
    );
  }
}
