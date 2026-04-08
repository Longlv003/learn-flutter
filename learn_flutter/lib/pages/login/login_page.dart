import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:learn_flutter/blocs/login/login_cubit.dart';
import 'package:learn_flutter/blocs/login/login_state.dart';
import 'package:learn_flutter/routes/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;

  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Get.offAllNamed(Routes.homePage);
          }
        },
        child: Scaffold(body: Stack(children: [_buildBody(), _buildLoading()])),
      ),
    );
  }

  Widget _buildBody() {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              final loginCubit = context.read<LoginCubit>();
              final isLoading = state is LoginLoading;
              final errorMessage = state is LoginFailed ? state.error : null;

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Chào mừng bạn",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Đăng nhập tài khoản",
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                  const SizedBox(height: 30),

                  /// Email
                  TextFormField(
                    controller: _emailController,
                    cursorColor: const Color(0xFF1B8E42),
                    decoration: InputDecoration(
                      labelText: "Email",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color(0xFF1B8E42),
                          width: 2,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  /// Password
                  TextFormField(
                    controller: _passController,
                    obscureText: _obscureText,
                    cursorColor: const Color(0xFF1B8E42),
                    decoration: InputDecoration(
                      labelText: "Password",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color(0xFF1B8E42),
                          width: 2,
                        ),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () =>
                            setState(() => _obscureText = !_obscureText),
                      ),
                    ),
                  ),

                  /// Error
                  if (errorMessage != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          errorMessage,
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                  const SizedBox(height: 20),

                  /// Button
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: isLoading
                          ? null
                          : () {
                              loginCubit.loginHandle(
                                _emailController.text,
                                _passController.text,
                              );
                            },
                      child: const Text("Login"),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildLoading() {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        if (state is! LoginLoading) return const SizedBox();

        return Container(
          color: Colors.black.withAlpha(76),
          child: const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
