import 'package:learn_flutter/di.dart';
import 'package:learn_flutter/model/account_model.dart';
import 'package:learn_flutter/services/api_service.dart';

class LoginApi {
  final api = getIt<ApiService>();

  Future<AccountModel> loginApi(String email, String password) async {
    try {
      final response = await api.get("/accounts", query: {"email": email});

      final data = response.data as List;

      if (data.isEmpty) {
        throw Exception("INVALID_EMAIL");
      }

      final account = data.first;

      if (account["password"] != password) {
        throw Exception("WRONG_CREDENTIALS");
      }

      return AccountModel.fromJson(account);
    } catch (e) {
      throw Exception(e);
    }
  }
}
