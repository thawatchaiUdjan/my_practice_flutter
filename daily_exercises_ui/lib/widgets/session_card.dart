import 'package:daily_exercises_ui/constants.dart';
import 'package:daily_exercises_ui/models/exersices.dart';
import 'package:flutter/material.dart';

class SessionCard extends StatelessWidget {
  final Exercises exer;
  final int number;
  const SessionCard({
    Key? key,
    required this.exer,
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: LayoutBuilder(
        builder: (context, constraint) => Container(
          width: constraint.maxWidth / 2 - 10,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 17),
                color: kShadowColor,
                blurRadius: 23,
                spreadRadius: -10,
              ),
            ],
          ),
          child: OnPressCard(exer: exer, number: number),
        ),
      ),
    );
  }
}

class OnPressCard extends StatefulWidget {
  const OnPressCard({
    Key? key,
    required this.exer,
    required this.number,
  }) : super(key: key);

  final Exercises exer;
  final int number;

  @override
  _OnPressCardState createState() => _OnPressCardState();
}

class _OnPressCardState extends State<OnPressCard> {
  var isDone = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => setState(() {
          isDone ^= true;
        }),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: isDone ? widget.exer.colorIcon : Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: widget.exer.colorIcon),
                ),
                child: Icon(
                  Icons.play_arrow,
                  color: isDone ? Colors.white : widget.exer.colorIcon,
                ),
              ),
              SizedBox(width: 10),
              Text(
                "Session ${widget.number.toString().padLeft(2, '0')}",
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
