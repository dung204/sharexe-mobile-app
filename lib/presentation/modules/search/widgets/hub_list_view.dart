import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sharexe/generated/assets/assets.gen.dart';
import 'package:sharexe/presentation/modules/search/cubit/search_cubit.dart';
import 'package:sharexe/presentation/modules/search/cubit/search_state.dart';

class HubListView extends StatelessWidget {
  const HubListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Center(child: Text('Type to search hubs')),
          loading: () => const Center(child: CircularProgressIndicator()),
          empty: () => const Center(child: Text('No hubs found')),
          error: (message) => Center(child: Text('Error: $message')),
          loaded: (hubs) => ListView.builder(
            padding: const EdgeInsets.only(top: 8),
            itemCount: hubs.length,
            itemBuilder: (context, index) {
              final hub = hubs[index];
              return ListTile(
                leading: Assets.images.mapPin.svg(width: 40, height: 40),
                title: Text(hub.name),
                subtitle: Text(hub.address),
                onTap: () {
                  context.pop(hub);
                },
              );
            },
          ),
        );
      },
    );
  }
}
