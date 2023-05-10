class DateTimeFormatter {
  static String fromMillisecondsSinceEpoch(int value) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(value);
    String year = dateTime.year.toString();
    String month = dateTime.month.toString().padLeft(2, '0');
    String day = dateTime.day.toString().padLeft(2, '0');
    String hour = dateTime.hour.toString().padLeft(2, '0');
    String minute = dateTime.minute.toString().padLeft(2, '0');
    String result = '$year$month$day\n$hour:$minute';
    return result;
  }
}
