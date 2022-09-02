///Import to use DateTimeExtension
///import 'package:finance_with_notion/shared/models/generic/date_extension.dart';
extension DateTimeExtension on DateTime {
  String fullFormatDate() {
    var year = this.year;
    var day = this.day;
    String monthAsString = _getMonthString();
    return "$day $monthAsString $year";
  }

  String dayAndMonthFormat() {
    var day = this.day;
    var month = _getMonthString();
    return "$day $month";
  }

  String _getMonthString() {
    switch (month) {
      case 1:
        return "Jan";
      case 2:
        return "Feb";

      case 3:
        return "Mar";

      case 4:
        return "Apr";

      case 5:
        return "May";

      case 6:
        return "Jun";

      case 7:
        return "Jul";

      case 8:
        return "Ago";

      case 9:
        return "Sep";

      case 10:
        return "Oct";

      case 11:
        return "Nov";

      case 12:
        return "Dez";
      default:
        return "";
    }
  }
}
