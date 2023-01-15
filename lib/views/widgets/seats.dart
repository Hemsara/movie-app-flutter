import 'package:flutter/material.dart';
import 'package:movie_app/colors.dart';
import 'package:movie_app/providers/seat_provider.dart';
import 'package:provider/provider.dart';

import '../../models/seat_view.dart';

class Seats extends StatefulWidget {
  const Seats({Key? key}) : super(key: key);

  @override
  State<Seats> createState() => _SeatsState();
}

class _SeatsState extends State<Seats> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = context.read<TicketProvider>();
    Widget _seat(
        {required Seat seat,
        required int colIndex,
        required int rowIndex,
        required int seatIndex}) {
      Color bgColor;

      switch (seat.status) {
        case SeatStatus.Available:
          bgColor = AppColors.seatColor;
          break;
        case SeatStatus.Reserved:
          bgColor = AppColors.seatReservedColor;
          break;
        case SeatStatus.Selected:
          bgColor = AppColors.seatSelectedColor;
          break;
      }

      return Padding(
        padding: const EdgeInsets.all(4.4),
        child: GestureDetector(
          onTap: () => provider.selectSeat(
              seat: seat,
              colIndex: colIndex,
              rowIndex: rowIndex,
              seatIndex: seatIndex),
          child: CircleAvatar(
            backgroundColor: bgColor,
            radius: 16.8,
            child: seat.status == SeatStatus.Selected
                ? const Image(
                    image: AssetImage('tick.png'),
                    width: 12,
                  )
                : Text(
                    seat.number,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 11,
                    ),
                  ),
          ),
        ),
      );
    }

    return SizedBox(
      child: Column(
        children: [
          const Image(image: AssetImage('screen.png')),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: context
                .watch<TicketProvider>()
                .getSeatList
                .sections
                .asMap()
                .entries
                .map<Widget>(
                  (section) => Column(
                    children: section.value.rows
                        .asMap()
                        .entries
                        .map<Widget>((row) => Row(
                              children: row.value.seats
                                  .asMap()
                                  .entries
                                  .map<Widget>((seat) => _seat(
                                      seatIndex: seat.key,
                                      seat: seat.value,
                                      colIndex: section.key,
                                      rowIndex: row.key))
                                  .toList(),
                            ))
                        .toList(),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.seatColor,
                      radius: 7,
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      "Available",
                      style: TextStyle(color: Colors.white, fontSize: 11),
                    )
                  ],
                ),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.seatReservedColor,
                      radius: 7,
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      "Reserved",
                      style: TextStyle(color: Colors.white, fontSize: 11),
                    )
                  ],
                ),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.seatSelectedColor,
                      radius: 7,
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      "Selected",
                      style: TextStyle(color: Colors.white, fontSize: 11),
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 13),
          Divider(
            color: Colors.grey.withOpacity(0.4),
          )
        ],
      ),
    );
  }
}
