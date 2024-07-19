class BSDate {
  int year;
  int month;
  int day;

  BSDate(this.year, this.month, this.day);

  @override
  String toString() {
    return '$year/$month/$day';
  }
}
