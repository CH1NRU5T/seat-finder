import 'dart:developer';

import 'package:flutter/material.dart';
import './contants.dart';

Color decideColor(int selected, int sum) {
  return selected == sum ? darkBlue : blue;
}

int calculate(int count, int position, int add) {
  return ((count * 8) + add + (3 * position));
}

class ThreeSeat extends StatelessWidget {
  const ThreeSeat(
      {super.key,
      required this.count,
      required this.position,
      required this.selected});
  final int count, position, selected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Seat(
          add: 1,
          count: count,
          position: position,
          selected: selected,
        ),
        Seat(
          add: 2,
          count: count,
          position: position,
          selected: selected,
        ),
        Seat(
          add: 3,
          count: count,
          position: position,
          selected: selected,
        ),
      ],
    );
  }
}

class Seat extends StatefulWidget {
  const Seat(
      {super.key,
      required this.add,
      required this.count,
      required this.position,
      required this.selected});
  final int count, position, add, selected;
  @override
  State<Seat> createState() => _SeatState();
}

class _SeatState extends State<Seat> {
  late bool change;
  @override
  initState() {
    change = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          change = !change;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1),
        child: Container(
          width: 70,
          height: 85,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: denseBlue, width: 2.5),
            color: change == true
                ? darkBlue
                : decideColor(widget.selected,
                    calculate(widget.count, widget.position, widget.add)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('${calculate(widget.count, widget.position, widget.add)}'),
              const Text('Lower'),
            ],
          ),
        ),
      ),
    );
  }
}
