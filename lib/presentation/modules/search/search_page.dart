import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharexe/core/di/injection.dart';
import 'package:sharexe/presentation/modules/search/cubit/search_cubit.dart';
import 'package:sharexe/presentation/modules/search/widgets/hub_list_view.dart';
import 'package:sharexe/presentation/modules/search/widgets/search_input_bar.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SearchCubit>(),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: const SafeArea(
          child: Column(
            children: [
              SearchInputBar(),
              Expanded(child: HubListView()),
            ],
          ),
        ),
      ),
    );
  }
}
