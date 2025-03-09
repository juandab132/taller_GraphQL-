import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app_graphql/controllers/user_controller.dart';
import 'package:app_graphql/screens/user_detail_screen.dart';
import 'package:app_graphql/widgets/user_card.dart';

class HomeScreen extends StatelessWidget {
  final UserController userController = Get.find<UserController>();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GraphQL Users'), elevation: 2),
      body: RefreshIndicator(
        onRefresh: () => userController.fetchUsers(),
        child: Obx(() {
          if (userController.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else if (userController.error.value.isNotEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Error: ${userController.error.value}',
                    style: TextStyle(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => userController.fetchUsers(),
                    child: Text('Reintentar'),
                  ),
                ],
              ),
            );
          } else if (userController.users.isEmpty) {
            return Center(child: Text('No hay usuarios disponibles'));
          } else {
            return ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: userController.users.length,
              itemBuilder: (context, index) {
                final user = userController.users[index];
                return UserCard(
                  user: user,
                  onTap: () {
                    Get.to(() => UserDetailScreen(user: user));
                  },
                );
              },
            );
          }
        }),
      ),
    );
  }
}
