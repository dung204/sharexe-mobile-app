import 'package:flutter/material.dart';
import 'package:sharexe/configs/theme/app_styles.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        const SizedBox(height: 20),
        Text('Login with your email to continue', style: textTheme.bodyMedium),
        const SizedBox(height: 20),

        TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: AppStyles.input.auth(
            hintText: 'name@example.com',
            suffixIcon: const Icon(Icons.clear),
          ),
        ),

        const Spacer(),

        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(onPressed: () {}, child: const Text('Next')),
        ),
      ],
    );
  }
}
