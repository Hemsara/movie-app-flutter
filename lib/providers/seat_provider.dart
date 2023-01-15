import 'package:flutter/material.dart';
import '../models/seat_view.dart';

class TicketProvider with ChangeNotifier {
  List<Seat> selectedSeats = [];
  SeatView seatList = SeatView(
    sections: [
      SeatColumn(
        rows: [
          SeatRow(
            seats: [
              Seat(status: SeatStatus.Available),
              Seat(status: SeatStatus.Available),
            ],
          ),
          SeatRow(
            seats: [
              Seat(status: SeatStatus.Available),
              Seat(status: SeatStatus.Available),
              Seat(status: SeatStatus.Available),
              Seat(status: SeatStatus.Available),
            ],
          ),
          SeatRow(
            seats: [
              Seat(status: SeatStatus.Available),
              Seat(status: SeatStatus.Available),
              Seat(status: SeatStatus.Available),
              Seat(status: SeatStatus.Available),
            ],
          ),
          SeatRow(
            seats: [
              Seat(status: SeatStatus.Available),
              Seat(status: SeatStatus.Available),
              Seat(status: SeatStatus.Available),
              Seat(status: SeatStatus.Available),
            ],
          ),
          SeatRow(
            seats: [
              Seat(status: SeatStatus.Available),
              Seat(status: SeatStatus.Available),
              Seat(status: SeatStatus.Available),
              Seat(status: SeatStatus.Available),
            ],
          ),
          SeatRow(
            seats: [
              Seat(status: SeatStatus.Available),
              Seat(status: SeatStatus.Reserved),
              Seat(status: SeatStatus.Reserved),
              Seat(status: SeatStatus.Available),
            ],
          ),
        ],
      ),
      SeatColumn(
        rows: [
          SeatRow(
            seats: [
              Seat(status: SeatStatus.Available),
              Seat(status: SeatStatus.Reserved),
            ],
          ),
          SeatRow(
            seats: [
              Seat(status: SeatStatus.Available),
              Seat(status: SeatStatus.Available),
              Seat(status: SeatStatus.Available),
              Seat(status: SeatStatus.Available),
            ],
          ),
          SeatRow(
            seats: [
              Seat(status: SeatStatus.Available),
              Seat(status: SeatStatus.Reserved),
              Seat(status: SeatStatus.Available),
              Seat(status: SeatStatus.Available),
            ],
          ),
          SeatRow(
            seats: [
              Seat(status: SeatStatus.Available),
              Seat(status: SeatStatus.Available),
              Seat(status: SeatStatus.Available),
              Seat(status: SeatStatus.Available),
            ],
          ),
          SeatRow(
            seats: [
              Seat(status: SeatStatus.Available),
              Seat(status: SeatStatus.Available),
              Seat(status: SeatStatus.Available),
              Seat(status: SeatStatus.Available),
            ],
          ),
          SeatRow(
            seats: [
              Seat(status: SeatStatus.Available),
              Seat(status: SeatStatus.Available),
              Seat(status: SeatStatus.Available),
              Seat(status: SeatStatus.Available),
            ],
          ),
        ],
      )
    ],
  );
  DateTime selectedDate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  List<Seat> get getSelectedSeats => selectedSeats;
  SeatView get getSeatList => seatList;
  DateTime get getSelectedDate => selectedDate;

  void setSelectedDate(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }

  void selectSeat(
      {required Seat seat,
      required int colIndex,
      required int rowIndex,
      required int seatIndex}) {
    if (seat.status != SeatStatus.Reserved) {
      if (selectedSeats.contains(seat)) {
        selectedSeats.remove(seat);
        seatList.sections[colIndex].rows[rowIndex].seats[seatIndex].status =
            SeatStatus.Available;
        notifyListeners();
      } else {
        selectedSeats.add(seat);

        seatList.sections[colIndex].rows[rowIndex].seats[seatIndex].status =
            SeatStatus.Selected;

        notifyListeners();
      }
    }
  }
}
