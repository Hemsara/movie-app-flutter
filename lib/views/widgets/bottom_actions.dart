import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/colors.dart';
import 'package:movie_app/providers/seat_provider.dart';
import 'package:provider/provider.dart';

import '../../models/seat_view.dart';

class BottomActions extends StatelessWidget {
  const BottomActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = context.read<TicketProvider>();
    return Row(
      children: [
        const CircleAvatar(
          foregroundColor: Colors.white,
          radius: 28,
          backgroundColor: Color(0xff513B6F),
          child: Icon(
            CupertinoIcons.arrow_left,
            size: 20,
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
            child: AbsorbPointer(
          absorbing: context.watch<TicketProvider>().getSelectedSeats.isEmpty
              ? true
              : false,
          child: GestureDetector(
            onTap: () {
              log("📆📆 Selected date is ${DateFormat.yMMMMd('en_US').format(provider.getSelectedDate)} 📆📆");
              log("👇👇 Selected seats 👇👇");

              List<Seat> selectedSeats = provider.getSelectedSeats;
              for (var element in selectedSeats) {
                log("  Seat number ${element.number}");
              }
            },
            child: Container(
              height: 59,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                gradient: LinearGradient(colors: [
                  AppColors.primaryColor,
                  AppColors.secondaryColor,
                ]),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    CupertinoIcons.cart,
                    color: Colors.white,
                    size: 20,
                  ),
                  SizedBox(width: 12),
                  Text("Go to checkout",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500)),
                ],
              ),
            ),
          ),
        )),
      ],
    );
  }
}
