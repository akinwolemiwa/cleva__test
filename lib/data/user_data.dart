import 'dart:convert';
import 'package:cleva_test/core/api_constant.dart';
import 'package:cleva_test/core/network/api_client.dart';
import 'package:cleva_test/data/models/user_model.dart';

class UserData {
  final ApiClient apiClient;

  UserData({required this.apiClient});

  Future<List<UserModel>> getUsers() async {
    final response = await apiClient.get(ApiConstant.urlUser);
    final List<dynamic> jsonList = json.decode(response);
    return jsonList.map((json) => UserModel.fromJson(json)).toList();
  }
}
