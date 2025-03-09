import 'package:get/get.dart';

import 'package:app_graphql/models/user.dart';
import 'package:app_graphql/services/user_service.dart';

class UserController extends GetxController {
  final UserService _userService = UserService();

  final RxList<User> users = <User>[].obs;
  final RxBool isLoading = false.obs;
  final RxString error = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    isLoading.value = true;
    error.value = '';

    try {
      final result = await _userService.getUsers();
      users.value = result;
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      error.value = e.toString();
    }
  }
}
