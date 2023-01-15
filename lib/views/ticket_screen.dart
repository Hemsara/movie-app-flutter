import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widgets/bottom_actions.dart';
import 'widgets/date_selector.dart';
import 'widgets/header.dart';
import 'widgets/seats.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion(
        value: SystemUiOverlayStyle.light,
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Color.fromARGB(255, 19, 14, 25),
                    Color.fromARGB(255, 38, 17, 56),
                  ],
                ),
              ),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
              child: Column(
                children: const [
                  Spacer(),
                  Header(),
                  Spacer(),
                  Seats(),
                  Spacer(),
                  Dates(),
                  Spacer(),
                  BottomActions(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
