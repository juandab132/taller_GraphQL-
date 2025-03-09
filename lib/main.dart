import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:app_graphql/config/graphql_config.dart';
import 'package:app_graphql/controllers/user_controller.dart';
import 'package:app_graphql/screens/home_screen.dart';

void main() async {
  // Inicializar Hive para GraphQL
  await initHiveForFlutter();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Inicializar el controlador de usuarios como un singleton global
    Get.put(UserController());

    return GraphQLProvider(
      client: GraphQLConfig.clientToQuery(),
      child: GetMaterialApp(
        title: 'Flutter GraphQL App',
        theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: false),
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
