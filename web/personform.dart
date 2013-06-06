import 'package:web_ui/web_ui.dart';
import 'person.dart';
import 'dart:html';

class PersonForm extends WebComponent {
  Person person;
  String action;
  
  submit(Event e) {
    e.preventDefault();
    
    FormElement form = e.target as FormElement;
    form.action = action;
    
    HttpRequest.request(form.action,
          method:form.method,
          sendData:new FormData(form))
        .then((HttpRequest req) {
          host.query('#message').text = req.responseText;
        })
        .catchError((e) => print(e));
  }
}