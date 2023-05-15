library time_diffrence;

String convertToNaturalLanguageDate(DateTime dateTime) {
  DateTime now = DateTime.now();
  Duration difference = now.difference(dateTime);
  Duration reverseDifference = dateTime.difference(now);
  int daysAgo = difference.inDays;
  int monthsAgo = (now.year - dateTime.year) * 12 + (now.month - dateTime.month);
  int yearsAgo = now.year - dateTime.year;

  if (difference.inDays == 0 && difference.inHours >= 0 && difference.inHours <= 24) {
    return 'Today';
  } else if (reverseDifference.inDays >= 0) {
    if (reverseDifference.inHours >= 0 && reverseDifference.inHours <= 24) {
      return 'Tomorrow';
    } else {
      return '${reverseDifference.inDays} days later';
    }
  } else if (daysAgo == 1) {
    return 'Yesterday';
  } else if (daysAgo < 7) {
    return '$daysAgo days ago';
  } else if (monthsAgo < 12) {
    int weeksAgo = (daysAgo / 7).floor();
    if(weeksAgo <= 4){
      return '$weeksAgo weeks ago';
    }else{
      return '${(weeksAgo / 4).floor()} months ago';
    }
  } else {
    return '$yearsAgo years ago';
  }
}