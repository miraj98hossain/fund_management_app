import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String toFormattedString([String format = 'yyyy-MM-dd']) {
    return DateFormat(format).format(this);
  }

//Difference in years, months and days
  (int year, int month, int day) toDifferenceYMD([DateTime? other]) {
    var difference = other == null
        ? DateTime.now().difference(this)
        : other.difference(this);

    return (
      difference.inDays ~/ 365,
      difference.inDays % 365 ~/ 30,
      difference.inDays % 365 % 30
    );
  }

  //
  String toFormattedTimeString([String format = 'hh:mm a']) {
    return DateFormat(format).format(this);
  }
}
