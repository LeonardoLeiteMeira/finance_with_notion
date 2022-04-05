extension DateTimeExtension on DateTime {
  String toFormatDate() {
    var monthAsNumber = month;
    var year = this.year;
    var day = this.day;
    String monthAsString = _getMonthString(monthAsNumber);
    return "$day $monthAsString $year";
  }

  String _getMonthString(int monthAsNumber) {
    switch (monthAsNumber) {
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
