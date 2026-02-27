import 'package:flutter/material.dart';

final class AppColors {
  AppColors._();

  // --- Brand Colors (Lấy từ nút Get Started & Logo) ---
  static const Color primary = Color(0xFF40D6AC); // Màu xanh ngọc chủ đạo
  static const Color primaryDark = Color(
    0xFF2EA082,
  ); // Màu tối hơn (dùng khi press/hover)

  // Màu phụ (Lấy từ màu đỏ của Pin map hoặc icon xe taxi)
  static const Color secondary = Color(
    0xFFFF5252,
  ); // Màu đỏ cam (Location Pin) - Dùng làm điểm nhấn

  // --- Background Colors ---
  static const Color background = Color(
    0xFFF3F4F6,
  ); // Màu nền xám nhạt (Layer dưới của màn Auth)
  static const Color surface = Color(0xFFFFFFFF); // Màu nền trắng (Card, Input)

  // --- Status Colors ---
  static const Color error = Color(
    0xFFEF4444,
  ); // Màu lỗi (Giữ nguyên chuẩn Tailwind)
  static const Color success = Color(0xFF10B981); // Màu thành công (nếu cần)

  // --- On Colors (Màu chữ/icon trên nền màu) ---
  static const Color onPrimary = Color(0xFFFFFFFF); // Chữ trắng trên nền xanh
  static const Color onSecondary = Color(0xFFFFFFFF); // Chữ trắng trên nền đỏ
  static const Color onBackground = Color(0xFF1F2937); // Chữ đen trên nền xám
  static const Color onSurface = Color(0xFF1F2937); // Chữ đen trên nền trắng
  static const Color onError = Color(0xFFFFFFFF); // Chữ trắng trên nền đỏ lỗi

  // Additional colors
  static const Color grey50 = Color(0xFFF9FAFB);
  static const Color grey100 = Color(0xFFF3F4F6);
  static const Color grey200 = Color(0xFFE5E7EB);
  static const Color grey300 = Color(0xFFD1D5DB);
  static const Color grey400 = Color(0xFF9CA3AF);
  static const Color grey500 = Color(0xFF6B7280);
  static const Color grey600 = Color(0xFF4B5563);
  static const Color grey700 = Color(0xFF374151);
  static const Color grey800 = Color(0xFF1F2937);
  static const Color grey900 = Color(0xFF111827);
}
