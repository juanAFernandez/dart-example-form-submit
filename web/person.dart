library person;

import 'package:web_ui/web_ui.dart';

@observable
class Person {
  String firstName;
  String lastName;
  double age = 0.0;  // not an int because web ui loves doubles
}