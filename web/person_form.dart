import 'package:polymer/polymer.dart';
import 'models.dart';
import 'dart:html';
import 'ui_filters.dart' show StringToInt;
import 'package:polymer_expressions/filter.dart' show Transformer;

@CustomTag('person-form')
class PersonForm extends PolymerElement {
  final Person person = new Person();

  PersonForm.created() : super.created();

  @published String action;

  doSubmit(Event e, var detail, Node target) {
    e.preventDefault();

    FormElement form = target as FormElement;
    form.action = action;

    HttpRequest.request(action,
          method: form.method,
          sendData: new FormData(form))
        .then((HttpRequest req) {
          shadowRoot.querySelector('#message').text = req.responseText;
        })
        .catchError((e) => print(e));
  }

// Filters and transformers can be referenced as fields.
  final Transformer asInteger = new StringToInt();
}