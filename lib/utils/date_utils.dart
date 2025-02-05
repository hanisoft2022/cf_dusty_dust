class DateUtils {
  static padInteger(int value) {
    return value.toString().padLeft(2, '0');
  }

  static String dateTimeToString(DateTime dateTime) =>
      '${dateTime.year}-${padInteger(dateTime.month)}-${padInteger(dateTime.day)} ${padInteger(dateTime.hour)}:00';
}
