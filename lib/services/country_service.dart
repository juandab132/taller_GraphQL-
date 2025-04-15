import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:app_graphql/config/graphql_config.dart';
import 'package:app_graphql/models/country.dart';

class CountryService {
  static final ValueNotifier<GraphQLClient> _client =
      GraphQLConfig.clientToQuery();

  static String getCountriesQuery = '''
    query {
      countries {
        code
        name
        capital
      }
    }
  ''';

  Future<List<Country>> getCountries() async {
    final QueryOptions options = QueryOptions(
      document: gql(getCountriesQuery),
      fetchPolicy: FetchPolicy.networkOnly,
    );

    final result = await _client.value.query(options);

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    final List<dynamic> countriesData = result.data?['countries'] ?? [];

    return countriesData.map((json) => Country.fromJson(json)).toList();
  }
}
