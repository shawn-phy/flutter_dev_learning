import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'queries.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Events'),
      ),
      body: Query(
        options: QueryOptions(
          document: gql(getEventsQuery),
        ),
        builder: (QueryResult result, {fetchMore, refetch}) {
          if (result.hasException) {
            print(result.exception.toString());
            return Center(child: Text(result.exception.toString()));

          }

          if (result.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }


          List events = result.data?['GetEvents'];

          return ListView.builder(
            itemCount: events.length,
            itemBuilder: (context, index) {
              final event = events[index];
              return ListTile(
                title: Text(event['eventName']),
                subtitle: Text(event['location']),
              );
            },
          );
        },
      ),
    );
  }
}
