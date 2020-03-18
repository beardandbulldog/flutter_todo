import 'package:todo/sliding_cards.dart';
import 'package:flutter/material.dart';


class DaysView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFBF1EF),
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                SizedBox(height: 8),
                Header(),

                SizedBox(height: 8),
                SlidingCardsView(),
                SizedBox(height: 8)
              ],
            ),

          ),

        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Text(
        'to.day',
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }
}
