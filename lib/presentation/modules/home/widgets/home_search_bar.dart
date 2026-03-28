import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sharexe/domain/entities/hub_entity.dart';
import 'package:sharexe/presentation/modules/home/cubit/home_cubit.dart';

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
            onTap: () async {
              final selectedHubFromSearch = await context.push<HubEntity?>(
                '/search',
              );

              if (selectedHubFromSearch != null && context.mounted) {
                context.read<HomeCubit>().selectHub(selectedHubFromSearch);
              }
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
