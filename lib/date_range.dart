import 'package:innerlibs/innerlibs.dart';

/// Represents a range of dates.
class DateRange {
  /// Creates a new instance of the [DateRange] class with the specified start and end dates.
  DateRange(date startDate, date endDate) {
    var r = startDate.compareAndSwap(endDate);
    _startDate = r.$1;
    _endDate = r.$2;
  }

  /// Creates a [DateRange] representing today.
  factory DateRange.today() => DateRange(today, today.endOfDay);

  /// Creates a [DateRange] representing yesterday.
  factory DateRange.yesterday() => DateRange(yesterday, yesterday.endOfDay);

  /// Creates a [DateRange] representing tomorrow.
  factory DateRange.tomorrow() => DateRange(tomorrow, tomorrow.endOfDay);

  /// Creates a [DateRange] representing the current week.
  factory DateRange.thisWeek() => DateRange(today.firstDayOfWeek, today.lastDayOfWeek.endOfDay);

  /// Creates a [DateRange] representing the previous week.
  factory DateRange.lastWeek() => DateRange(today.previousWeek.firstDayOfWeek, today.previousWeek.lastDayOfWeek.endOfDay);

  /// Creates a [DateRange] representing the next week.
  factory DateRange.nextWeek() => DateRange(today.nextWeek.firstDayOfWeek, today.nextWeek.lastDayOfWeek.endOfDay);

  /// Creates a [DateRange] representing the current month.
  factory DateRange.thisMonth() => DateRange(today.firstDayOfMonth, today.lastDayOfMonth.endOfDay);

  /// Creates a [DateRange] representing the previous month.
  factory DateRange.lastMonth() => DateRange(today.firstDayOfMonth.previousMonth, today.lastDayOfMonth.previousMonth.endOfDay);

  /// Creates a [DateRange] representing the next month.
  factory DateRange.nextMonth() => DateRange(today.firstDayOfMonth.nextMonth, today.lastDayOfMonth.nextMonth.endOfDay);

  /// Creates a [DateRange] representing the current quarter.
  factory DateRange.thisQuarter() => DateRange(today.firstDayOfQuarter, today.lastDayOfQuarter.endOfDay);

  /// Creates a [DateRange] representing the previous quarter.
  factory DateRange.lastQuarter() => DateRange(today.firstDayOfQuarter.previousQuarter, today.lastDayOfQuarter.previousQuarter.endOfDay);

  /// Creates a [DateRange] representing the next quarter.
  factory DateRange.nextQuarter() => DateRange(today.firstDayOfQuarter.nextQuarter, today.lastDayOfQuarter.nextQuarter.endOfDay);

  /// Creates a [DateRange] representing the current year.
  factory DateRange.thisYear() => DateRange(today.firstDayOfYear, today.lastDayOfYear.endOfDay);

  /// Creates a [DateRange] representing the previous year.
  factory DateRange.lastYear() => DateRange(today.firstDayOfYear.previousYear, today.lastDayOfYear.previousYear.endOfDay);

  /// Creates a [DateRange] representing the next year.
  factory DateRange.nextYear() => DateRange(today.firstDayOfYear.nextYear, today.lastDayOfYear.nextYear.endOfDay);

  factory DateRange.thisBimester() => DateRange(today.firstDayOfBimester, today.lastDayOfBimester.endOfDay);

  factory DateRange.lastBimester() => DateRange(today.firstDayOfBimester.previousBimester, today.lastDayOfBimester.previousBimester.endOfDay);

  factory DateRange.nextBimester() => DateRange(today.firstDayOfBimester.nextBimester, today.lastDayOfBimester.nextBimester.endOfDay);

  factory DateRange.thisSemester() => DateRange(today.firstDayOfSemester, today.lastDayOfSemester.endOfDay);

  factory DateRange.lastSemester() => DateRange(today.firstDayOfSemester.previousSemester, today.lastDayOfSemester.previousSemester.endOfDay);

  factory DateRange.nextSemester() => DateRange(today.firstDayOfSemester.nextSemester, today.lastDayOfSemester.nextSemester.endOfDay);

  /// Creates a [DateRange] representing the specified number of days before today.
  /// - [days] The number of days before today.
  factory DateRange.daysAgo(int days) => DateRange(today.subtract(days.days), today.endOfDay);

  /// Gets the start date of the date range.
  date get startDate => _startDate;

  /// Sets the start date of the date range.
  set startDate(date value) {
    var r = value.compareAndSwap(endDate);
    _startDate = r.$1;
    _endDate = r.$2;
  }

  /// Gets the end date of the date range.
  date get endDate => _endDate;

  /// Sets the end date of the date range.
  set endDate(date value) {
    var r = startDate.compareAndSwap(value);
    _startDate = r.$1;
    _endDate = r.$2;
  }

  late date _startDate;
  late date _endDate;

  /// Gets the duration of the date range.
  Duration get duration => endDate.difference(startDate);

  /// Returns true if today is in the date range.
  bool get isNow => now.isBetweenOrEqual(_startDate, _endDate);

  /// Returns true if yesterday is in the date range.
  bool contains(date date) => date.isBetweenOrEqual(_startDate, _endDate);

  bool containsRange(DateRange range) => range.startDate.isBetweenOrEqual(_startDate, _endDate) && range.endDate.isBetweenOrEqual(_startDate, _endDate);

  bool intersects(DateRange range) => range.startDate.isBetweenOrEqual(_startDate, _endDate) || range.endDate.isBetweenOrEqual(_startDate, _endDate);

  /// Returns true if the date range is in the past.
  bool get isPast => endDate.isBefore(now);

  /// Returns true if the date range is in the future.
  bool get isFuture => startDate.isAfter(now);
}
