import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'queries.dart';

class AddAttendeePage extends StatefulWidget {
  @override
  _AddAttendeePageState createState() => _AddAttendeePageState();
}

class _AddAttendeePageState extends State<AddAttendeePage> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  int _eventId = 0;
  String _firstName = '';
  String _lastName = '';
  String _phone = '';
  String _registrationDate = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Attendee'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Mutation(
          options: MutationOptions(
            document: gql(addAttendeeMutation),
            onCompleted: (dynamic resultData) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Attendee Added!')));
              Navigator.pop(context);
            },
          ),
          builder: (RunMutation runMutation, QueryResult? result) {
            return Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Email'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an email';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _email = value!;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Event ID'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an event ID';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _eventId = int.parse(value!);
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'First Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a first name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _firstName = value!;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Last Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a last name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _lastName = value!;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Phone'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a phone number';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _phone = value!;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Registration Date'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a registration date';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _registrationDate = value!;
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        runMutation({
                          'email': _email,
                          'eventId': _eventId,
                          'firstName': _firstName,
                          'lastName': _lastName,
                          'phone': _phone,
                          'registrationDate': _registrationDate,
                        });
                      }
                    },
                    child: Text('Add Attendee'),
                  ),
                  if (result != null) ...[
                    if (result.hasException)
                      Text(result.exception.toString(), style: TextStyle(color: Colors.red)),
                    if (result.isLoading)
                      CircularProgressIndicator(),
                  ]
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
