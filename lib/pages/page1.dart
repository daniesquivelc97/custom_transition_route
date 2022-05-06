// import 'package:custom_transition_route/helpers/route_transitions.dart';
import 'package:custom_route_transition_daec/custom_route_transition_daec.dart';
import 'package:custom_transition_route/pages/page2.dart';
import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Page1'),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.blue,
      body: Center(
        child: MaterialButton(
          child: const Text('Go to page 2'),
          color: Colors.white,
          onPressed: () {
            RouteTransitions(
              context: context,
              child: const Page2(),
              animation: AnimationType.fadeIn,
              // duration: const Duration(seconds: 5),
              // replacement: true,
            );
          },
        ),
      ),
    );
  }
}
