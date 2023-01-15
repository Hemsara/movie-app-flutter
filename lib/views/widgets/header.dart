import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text(
            "Avengers: Endgame",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 7),
          Text(
            "Action, Sci-fi 2019",
            style: TextStyle(
                color: Colors.white.withOpacity(0.4),
                fontSize: 12,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: const [
                  Icon(
                    CupertinoIcons.location,
                    color: Color(0xff963FCD),
                    size: 18,
                  ),
                  SizedBox(width: 4),
                  Text(
                    "Colombo Marina Mall",
                    style: TextStyle(color: Colors.white, fontSize: 11),
                  )
                ],
              ),
              const SizedBox(width: 20),
              Row(
                children: const [
                  Icon(
                    CupertinoIcons.clock,
                    color: Color(0xff963FCD),
                    size: 18,
                  ),
                  SizedBox(width: 4),
                  Text(
                    "3 hours 8 minutes",
                    style: TextStyle(color: Colors.white, fontSize: 11),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
