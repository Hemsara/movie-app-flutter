import 'dart:math';

class SeatView {
  final List<SeatColumn> sections;

  SeatView({
    required this.sections,
  });
}

class SeatColumn {
  List<SeatRow> rows;
  SeatColumn({
    required this.rows,
  });
}

class SeatRow {
  final List<Seat> seats;
  SeatRow({
    required this.seats,
  });
}

class Seat {
  String number;
  SeatStatus status;
  Seat({
    required this.status,
  }) : number = getRandomSeatNumber();
}

//small function to get a random seat number
String getRandomSeatNumber() {
  List<String> chars = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'P',
    'Q',
    'T'
  ];
  Random random = Random();
  return "${random.nextInt(9)}${chars[random.nextInt(chars.length)]}";
}

// ignore: constant_identifier_names
enum SeatStatus { Available, Reserved, Selected }
