import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'graphql_client.dart';
import 'events_page.dart';
import 'users_page.dart';
import 'add_attendee_page.dart';

void main() {
  final client = GraphQLConfig.initializeClient();

  runApp(
    GraphQLProvider(
      client: client,
      child: CacheProvider(
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter GraphQL Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GraphQL Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => EventsPage()));
              },
              child: Text('View Events'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => UsersPage()));
              },
              child: Text('View Users'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddAttendeePage()));
              },
              child: Text('Add Attendee'),
            ),
          ],
        ),
      ),
    );
  }
}
