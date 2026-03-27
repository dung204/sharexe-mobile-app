import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharexe/presentation/modules/search/cubit/search_cubit.dart';

class SearchInputBar extends StatelessWidget {
  const SearchInputBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      // Match chính xác với Positioned(top: 16, left: 16, right: 16)
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // NÚT TRÒN BACK (Thay thế vị trí của UserAvatar)
          Container(
            width: 48, // Kích thước xấp xỉ UserAvatar để lúc fade nhìn mượt
            height: 48,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: IconButton.filled(
              icon: const Icon(Icons.arrow_back),
              color: colorScheme.onSurface,
              style: IconButton.styleFrom(backgroundColor: colorScheme.primary),
              onPressed: () => context.pop(),
            ),
          ),

          const SizedBox(width: 12), // Khoảng cách y hệt HomePage
          // THANH SEARCH ĐANG ACTIVE (Đón Hero bay tới)
          Expanded(
            child: SizedBox(
              height: 48,
              child: Hero(
                tag: 'search_bar_hero',
                child: Material(
                  elevation: 6,
                  color: Theme.of(context).cardColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(
                      color: colorScheme.primary,
                      width: 2,
                      strokeAlign: BorderSide.strokeAlignInside,
                    ),
                  ),
                  child: Padding(
                    // Chỉnh lại padding dọc một chút để ôm vừa cái TextField
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 2,
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.search, color: colorScheme.primary),
                        const SizedBox(width: 6),

                        // Ô nhập liệu thực sự
                        Expanded(
                          child: TextField(
                            autofocus: true, // Tự động bật bàn phím
                            onChanged: (text) => context
                                .read<SearchCubit>()
                                .onSearchTextChanged(text),
                            decoration: InputDecoration(
                              fillColor: Theme.of(context).cardColor,
                              hintText: 'Where do you want to go?',
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                              hintStyle: TextStyle(
                                color: Colors.grey.shade400,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 6),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
