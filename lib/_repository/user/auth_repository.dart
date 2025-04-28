import 'package:kualiva_merchant_mb/_data/dio_client.dart';
import 'package:kualiva_merchant_mb/_repository/common/token_manager.dart';
import 'package:kualiva_merchant_mb/auth/model/user_model.dart';
import 'package:kualiva_merchant_mb/common/utility/lelog.dart';

class AuthRepository {
  AuthRepository(this._tokenManager, this._dioClient);

  final DioClient _dioClient;
  final TokenManager _tokenManager;

  Future<bool> checkToken() async {
    String? token = await _tokenManager.readToken();
    if (token == null) return false;
    return true;
  }

  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    final res = await _dioClient.dio().then((dio) {
      return dio.post('/merchant/auth/login', data: {
        'email': email,
        'password': password,
      });
    });
    final accessToken = res.data['data']['accessToken'].toString();
    final refreshToken = res.data['data']['refreshToken'].toString();
    LeLog.rd(this, login, res.data['data'].toString());

    await Future.wait([
      _tokenManager.writeAccessToken(accessToken),
      _tokenManager.writeRefreshToken(refreshToken),
    ], eagerError: true);

    LeLog.rd(this, login, 'Login Success');

    return UserModel.fromMap(res.data['data']['user'] as Map<String, dynamic>);
  }
}
