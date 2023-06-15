import 'package:flutter/material.dart';
import 'package:movie_ui/constants.dart';

class PlotSummary extends StatelessWidget {
  final String plot;

  const PlotSummary({
    Key? key,
    required this.plot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: kDefaultPadding * 1.2,
        left: kDefaultPadding,
        right: kDefaultPadding,
        bottom: kDefaultPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Plot Summary",
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(height: kDefaultPadding / 2),
          Text(
            plot,
            style: kDetailTextStyle,
            maxLines: 4,
          ),
        ],
      ),
    );
  }
}
