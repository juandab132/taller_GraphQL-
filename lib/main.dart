import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:app_graphql/config/graphql_config.dart';
import 'package:app_graphql/controllers/country_controller.dart';
import 'package:app_graphql/screens/home_screen.dart';

void main() async {
  await initHiveForFlutter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(CountryController());

    return GraphQLProvider(
      client: GraphQLConfig.clientToQuery(),
      child: GetMaterialApp(
        title: 'Flutter GraphQL',
        theme: ThemeData(primarySwatch: Colors.indigo),
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
