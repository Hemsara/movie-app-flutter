import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/providers/seat_provider.dart';
import 'package:provider/provider.dart';

import '../../colors.dart';

class Dates extends StatefulWidget {
  const Dates({Key? key}) : super(key: key);

  @override
  State<Dates> createState() => _DatesState();
}

class _DatesState extends State<Dates> {
  List<DateTime> dates = [];

  List<DateTime> getDateList() {
    List<DateTime> d = [];

    int daysInMonth = DateTimeRange(
            start: DateTime.now(),
            end: DateTime(DateTime.now().year, DateTime.now().month + 1))
        .duration
        .inDays;

    for (var i = 0; i < daysInMonth + 1; i++) {
      d.add(
        DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day + i),
      );
    }
    return d;
  }

  @override
  void initState() {
    setState(() {
      dates = getDateList();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget _dateWidget(DateTime date) {
      DateTime selectedDate = context.read<TicketProvider>().getSelectedDate;

      return Padding(
        padding: const EdgeInsets.only(right: 13),
        child: GestureDetector(
          onTap: () {
            context.read<TicketProvider>().setSelectedDate(date);
            setState(() {
              selectedDate = date;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 57,
            height: 95,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: selectedDate == date
                  ? const Color.fromARGB(255, 59, 3, 108)
                  : AppColors.seatReservedColor,
            ),
            child: Column(
              children: [
                Container(
                  height: 63,
                  decoration: BoxDecoration(
                    gradient: selectedDate == date
                        ? LinearGradient(
                            colors: [
                              AppColors.primaryColor,
                              AppColors.secondaryColor,
                            ],
                          )
                        : null,
                    color: AppColors.seatColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      date.day.toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                  ),
                ),
                Expanded(
                    child: Center(
                        child: Text(
                  DateFormat.E().format(date),
                  style: TextStyle(
                      color: selectedDate == date
                          ? Colors.white
                          : const Color.fromARGB(255, 80, 61, 101),
                      fontWeight: FontWeight.w600,
                      fontSize: 11),
                )))
              ],
            ),
          ),
        ),
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: dates.map((e) => _dateWidget(e)).toList(),
      ),
    );
  }
}
