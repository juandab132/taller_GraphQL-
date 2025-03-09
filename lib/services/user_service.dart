import 'package:flutter/material.dart';
import 'package:app_graphql/config/graphql_config.dart';

import 'package:app_graphql/models/user.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class UserService {
  static final ValueNotifier<GraphQLClient> _client =
      GraphQLConfig.clientToQuery();

  static String getUsersQuery = '''
    query {
      users {
        id
        name
        email
        phone
      }
    }
  ''';

  Future<List<User>> getUsers() async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(getUsersQuery),
        fetchPolicy: FetchPolicy.networkOnly,
      );

      final QueryResult result = await _client.value.query(options);

      if (result.hasException) {
        throw Exception(result.exception.toString());
      }

      final List<dynamic> usersData = result.data?['users'] ?? [];
      return usersData.map((userData) => User.fromJson(userData)).toList();
    } catch (e) {
      throw Exception('Error fetching users: $e');
    }
  }
}
