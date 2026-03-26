import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharexe/configs/theme/app_styles.dart';
import 'package:sharexe/presentation/modules/auth/cubit/auth_cubit.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Email Field
        TextFormField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: AppStyles.input.auth(hintText: 'name@example.com'),
        ),
        const SizedBox(height: 16),

        // Password Field
        TextFormField(
          controller: _passwordController,
          obscureText: true,
          decoration: AppStyles.input.auth(hintText: 'Password'),
        ),
        const SizedBox(height: 24),

        // Sign Up Button
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              final email = _emailController.text.trim();
              final password = _passwordController.text;
              if (email.isNotEmpty && password.isNotEmpty) {
                context.read<AuthCubit>().signUpWithEmailAndPassword(
                  email,
                  password,
                );
              }
            },
            child: const Text('Sign Up'),
          ),
        ),
      ],
    );
  }
}
