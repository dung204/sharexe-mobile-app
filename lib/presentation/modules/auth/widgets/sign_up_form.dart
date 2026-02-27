import 'package:flutter/material.dart';
import 'package:sharexe/configs/theme/app_styles.dart';
import 'package:sharexe/presentation/shared/phone_input.dart';

class SignUpForm extends StatelessWidget {
  SignUpForm({super.key});

  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Email Field
        TextFormField(
          decoration: AppStyles.input.auth(hintText: 'name@example.com'),
        ),
        const SizedBox(height: 16),

        // Phone Number Field
        PhoneInput(
          controller: _phoneController,
          onCountryChanged: (newCode) {},
        ),
        const SizedBox(height: 24),

        // Sign Up Button
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(onPressed: () {}, child: const Text('Sign Up')),
        ),
      ],
    );
  }
}
