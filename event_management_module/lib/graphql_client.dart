import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLConfig {
  static final HttpLink httpLink = HttpLink(
    'https://10.0.2.2:7046/graphql', // For Android emulator
    // 'https://localhost:5001/graphql', // For iOS simulator
    // 'https://<host-machine-ip>:5001/graphql', // For physical device
    defaultHeaders: {
      'Content-Type': 'application/json',
    },
  );

  static ValueNotifier<GraphQLClient> initializeClient() {
    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        cache: GraphQLCache(store: InMemoryStore()),
        link: httpLink,
      ),
    );
    return client;
  }
}
