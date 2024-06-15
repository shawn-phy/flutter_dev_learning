import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'queries.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: Query(
        options: QueryOptions(
          document: gql(getUsersQuery),
        ),
        builder: (QueryResult result, {fetchMore, refetch}) {
          if (result.hasException) {
            print(result.exception.toString());
            return Center(child: Text(result.exception.toString()));
          }

          if (result.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (result.data == null) {
            return const Center(child: Text('No data found.'));
          }

          
          print(result.data); // debug statement 

          List<dynamic> users = result.data?['attendees'] ?? []; 
          //ffs I am tired of runtime errors

          // checking if users list is empty. 
          if (users.isEmpty) {
            print('No users found');
            return const Center(child: Text('No users found.'));
          }

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index] as Map<String, dynamic>;
              return ListTile(
                title: Text('${user['firstName']} ${user['lastName']}'),
                subtitle: Text(user['email']),
              );
            },
          );
        },
      ),
    );
  }
}
