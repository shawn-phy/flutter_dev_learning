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

          print(result.data);


          List<dynamic> events = result.data?['events'] ?? [];

          if(events.isEmpty){
            print('events is empty');
            return const Center(child: Text('No events found.',));
          }

          return ListView.builder(
            itemCount: events.length,
            itemBuilder: (context, index) {
              final event = events[index] as Map<String, dynamic>;
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
