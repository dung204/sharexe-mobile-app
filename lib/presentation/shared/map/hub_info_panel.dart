import 'package:flutter/material.dart';
import 'package:sharexe/domain/entities/hub_entity.dart';

class HubInfoPanel extends StatelessWidget {
  const HubInfoPanel({
    required this.hub,
    required this.scrollController,
    required this.onClose,
    super.key,
  });

  final HubEntity hub;
  final ScrollController scrollController; // 👈 Nhận từ SlidingUpPanel
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    // Dùng ListView thay vì Column để tận dụng khả năng vuốt của panel
    return ListView(
      controller: scrollController, // Cắm controller vào đây
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).padding.bottom + 16,
        left: 20,
        right: 20,
        top: 12,
      ),
      children: [
        // 1. THANH GẠT PILL Ở GIỮA (Giống iOS)
        Center(
          child: Container(
            width: 40,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(height: 16),

        // 2. HEADER
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                hub.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.close, color: Colors.grey),
              onPressed: onClose, // Nút X
            ),
          ],
        ),

        // 3. ĐỊA CHỈ
        Row(
          children: [
            const Icon(Icons.location_on, color: Colors.grey, size: 20),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                hub.address,
                style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),

        // 4. NÚT ĐẶT XE
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {},
            child: const Text(
              'Chọn điểm này',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),

        // Cậu có thể render thêm 100 chiếc xe ở dưới này, người dùng vuốt lên panel sẽ tự kéo full màn hình!
      ],
    );
  }
}
