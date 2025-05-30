import 'package:flutter/material.dart';

import '../utils/control_board_colors.dart';

class BoolIndicator extends StatefulWidget {
  const BoolIndicator(
      {super.key, required this.name, required this.boolListenable});
  final String name;
  final Stream<bool> boolListenable;
  @override
  State<BoolIndicator> createState() => _BoolIndicatorState();
}

class _BoolIndicatorState extends State<BoolIndicator> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: widget.boolListenable,
        builder: (context, snapshot) => Card(
              color: ControlBoardColors.cardBackground,
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 10,
                  top: 2,
                  left: 10,
                  right: 10,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: ControlBoardColors.buttonText,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 5),
                    Container(
                      height: 75,
                      width: 100,
                      decoration: BoxDecoration(
                        color: switch (snapshot.data) {
                          true => ControlBoardColors.boolTrue,
                          false => ControlBoardColors.boolFalse,
                          null => ControlBoardColors.missing,
                        },
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }
}
