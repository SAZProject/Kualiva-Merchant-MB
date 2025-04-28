import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kualiva_merchant_mb/_data/dio_client.dart';
import 'package:kualiva_merchant_mb/_repository/common/token_manager.dart';
import 'package:kualiva_merchant_mb/_repository/user/auth_repository.dart';
import 'package:kualiva_merchant_mb/auth/bloc/auth_bloc.dart';

class MainProvider extends StatelessWidget {
  const MainProvider({super.key, required this.mainChild});

  final Widget mainChild;

  @override
  Widget build(BuildContext context) {
    return _multiRepository(_multiBloc(mainChild));
  }

  Widget _multiRepository(Widget child) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) {
          final tokenManager = TokenManager(const FlutterSecureStorage(
            /// TODO For ios need more configuration
            /// https://pub.dev/packages/flutter_secure_storage
            aOptions: AndroidOptions(encryptedSharedPreferences: true),
          ));
          return tokenManager;
        }),
        RepositoryProvider(create: (context) {
          return DioClient(
            context.read<TokenManager>(),
          );
        }),
        RepositoryProvider(create: (context) {
          return AuthRepository(
            context.read<TokenManager>(),
            context.read<DioClient>(),
          );
        }),
      ],
      child: child,
    );
  }

  Widget _multiBloc(Widget child) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return AuthBloc(context.read<AuthRepository>());
        }),
      ],
      child: child,
    );
  }
}
