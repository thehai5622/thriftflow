import 'package:intl/intl.dart';

class DateTimeUtils {
  static DateTimeUtils? _dateTimeUtils;
  static final DateTime _now = DateTime.now();
  static final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');
  static final Map<String, List<Map<String, dynamic>>> timeMap = {
    "day": (() {
      final List<Map<String, dynamic>> days = List.generate(18, (index) {
        final dayValue = _now.subtract(Duration(days: index));
        return {
          "value": dayValue,
          "title": index == 0
              ? "Hôm nay"
              : index == 1
                  ? "Hôm qua"
                  : _dateFormat.format(dayValue),
        };
      });

      days.sort((a, b) => a["value"].compareTo(b["value"]));
      return days;
    })(),
    "week": (() {
      final List<Map<String, dynamic>> weeks = List.generate(12, (index) {
        final weekValue = _now.subtract(Duration(days: index * 7));
        return {
          "value": weekValue,
          "title": index == 0
              ? "Tuần này"
              : index == 1
                  ? "Tuần trước"
                  : "Tuần ${index + 1} trước",
        };
      });

      weeks.sort((a, b) => a["value"].compareTo(b["value"]));
      return weeks +
          [
            {
              "value": null,
              "title": "Tương lai",
            }
          ];
    })(),
    "month": (() {
      List<Map<String, dynamic>> months = List.generate(12, (index) {
        final monthValue = DateTime(_now.year, _now.month - index, 1);
        return {
          "value": monthValue,
          "title": index == 0
              ? "Tháng này"
              : index == 1
                  ? "Tháng trước"
                  : "Tháng ${monthValue.month}",
        };
      });

      months.sort((a, b) => a["value"].compareTo(b["value"]));
      return months +
          [
            {
              "value": null,
              "title": "Tương lai",
            }
          ];
    })(),
    // "quarter": [],
    "year": (() {
      final List<Map<String, dynamic>> years = List.generate(6, (index) {
        final yearValue = DateTime(_now.year - index - 1, 1, 1);
        return {
          "value": yearValue,
          "title": index == 0 ? "Năm trước" : _dateFormat.format(yearValue),
        };
      });
      years.sort((a, b) => a["value"].compareTo(b["value"]));
      return years +
          [
            {
              "value": DateTime(_now.year, 1, 1),
              "title": "Năm nay",
            },
            {
              "value": null,
              "title": "Tương lai",
            }
          ];
    })(),
  };

  static DateTimeUtils getInstance() {
    _dateTimeUtils ??= DateTimeUtils();
    return _dateTimeUtils!;
  }

  List<dynamic> getListTime({required String type, bool isHaveFuture = true}) {
    return timeMap[type] ?? [];
  }
}
