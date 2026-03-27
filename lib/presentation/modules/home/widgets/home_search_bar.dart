import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Hero(
        tag: 'search_bar_hero',

        child: Material(
          elevation: 6,
          borderRadius: BorderRadius.circular(30),
          color: Theme.of(context).cardColor,
          child: InkWell(
            borderRadius: BorderRadius.circular(30),
            onTap: () {
              context.push('/search');
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 6),
                  const Expanded(
                    child: Text(
                      'Where do you want to go?',
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
