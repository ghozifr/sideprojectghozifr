import 'package:flutter/material.dart';


class TheForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Form Example'),
        ),
        body: MyForm(),
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _textFieldController = TextEditingController();
  String _submittedData;

  void _submitForm() {
    if (_formKey.currentState.validate()) {
      setState(() {
        _submittedData = _textFieldController.text;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Form(
            key: _formKey,
            child: TextFormField(
              controller: _textFieldController,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Enter some text',
              ),
            ),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: _submitForm,
            child: Text('Submit'),
          ),
          SizedBox(height: 20.0),
          _submittedData != null
              ? Text('Submitted Data: $_submittedData')
              : Container(),
        ],
      ),
    );
  }
}
