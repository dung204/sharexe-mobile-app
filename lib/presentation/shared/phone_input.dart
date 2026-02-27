import 'package:country_flags/country_flags.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:sharexe/configs/theme/app_colors.dart';
import 'package:sharexe/configs/theme/app_styles.dart';

class PhoneInput extends StatefulWidget {
  const PhoneInput({
    required this.controller,
    super.key,
    this.validator,
    this.onCountryChanged,
  });

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onCountryChanged;

  @override
  State<PhoneInput> createState() => _PhoneInputState();
}

class _PhoneInputState extends State<PhoneInput> {
  String _countryCodeIso = 'VN';
  String _dialCode = '+84';

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      keyboardType: TextInputType.phone,
      style: AppStyles.text.bodyLarge,
      decoration: AppStyles.input.auth(
        hintText: 'Mobile Number',

        // --- PREFIX ICON (Lấy từ hàm build bên dưới) ---
        prefixIcon: _buildCountrySelector(context),
      ),
    );
  }

  Widget _buildCountrySelector(BuildContext context) {
    final theme = Theme.of(context);
    final borderColor =
        theme.inputDecorationTheme.enabledBorder?.borderSide.color;

    return GestureDetector(
      onTap: () {
        showCountryPicker(
          context: context,
          showPhoneCode: true,
          onSelect: (country) {
            // Cập nhật mã vùng khi người dùng chọn quốc gia
            setState(() {
              _countryCodeIso = country.countryCode;
              _dialCode = '+${country.phoneCode}';
            });
            // Gọi callback nếu có
            widget.onCountryChanged?.call(_dialCode);
          },
        );
      }, // Xử lý mở dialog chọn quốc gia
      child: Container(
        padding: const EdgeInsets.only(left: 12, right: 8),
        color: Colors.transparent, // Để bấm được vào vùng trống
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 4,
          children: [
            // Cờ (Hard-code ví dụ, sau này bind theo _countryCode)
            SizedBox(
              width: 25,
              height: 18,
              child: CountryFlag.fromCountryCode(_countryCodeIso),
            ),
            const SizedBox(width: 2),
            Text(_dialCode),
            const Icon(Icons.arrow_drop_down, color: AppColors.grey600),
            // Divider
            Container(width: 1, height: 24, color: borderColor ?? Colors.grey),
          ],
        ),
      ),
    );
  }
}
