import 'package:cat_random_fact/presentation/pages/saved_cat_facts/bloc/saved_cat_facts_bloc.dart';
import 'package:cat_random_fact/presentation/pages/saved_cat_facts/widgets/saved_cat_fact_item.dart';
import 'package:cat_random_fact/presentation/widgets/errors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cat_random_fact/resourses/strings.dart';

class SavedCatFactsPage extends StatefulWidget {
  const SavedCatFactsPage({Key? key}) : super(key: key);

  @override
  State<SavedCatFactsPage> createState() => _SavedCatFactsPageState();
}

class _SavedCatFactsPageState extends State<SavedCatFactsPage> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) =>
        context.read<SavedCatFactsBloc>()
          ..add(SavedCatFactsInitialLoadingEvent()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.saved)),
      body: BlocBuilder<SavedCatFactsBloc, SavedCatFactsState>(
        builder: (context, state) {
          if (state is SavedCatFactsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is SavedCatFactsLoaded) {
            if (state.items.isEmpty) {
              return Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    AppStrings.historyIsEmpty,
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ));
            }
            return ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 16),
              itemBuilder: (context, i) {
                final item = state.items[i];
                return SavedCatFactItem(
                  item: item,
                );
              },
              itemCount: state.items.length,
            );
          }
          if (state is SavedCatFactsFailure) {
            return ErrorInfo(failure: state.failure);
          }

          return const SizedBox();
        },
      ),
    );
  }
}
