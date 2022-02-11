import 'dart:core';

String parseBaseUrl(String str) {
  bool alreadyParse = true;

  for (int i = 0; i <= str.length - 1; i++)
    if (str[i] == '?') {
      alreadyParse = false;
    }
  if (alreadyParse == false)
    str = str.substring(0, str.toString().indexOf('?'));
  return str;
}

String removeStartLetter(String str) {
  if (str.length > 2) {
    str = str.substring(2, str.length);
  }
  return str;
}
