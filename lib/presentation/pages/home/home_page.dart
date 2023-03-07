import 'package:cat_random_fact/presentation/pages/home/bloc/home_bloc.dart';
import 'package:cat_random_fact/presentation/widgets/errors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cat_random_fact/navigation/page_route_names.dart';
import 'package:cat_random_fact/resourses/strings.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeBloc _bloc;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _bloc = context.read()..add(HomeInitLoadingEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.home),
        actions: [
          IconButton(
            onPressed: () async => context.push(PageRoutePathes.savedFactsPage),
            icon: const Icon(Icons.history),
          ),
        ],
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is HomeFailure && state.fact != null) {
            showSnackbarError(context, state.fail);
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              if (state.fact != null)
                SingleChildScrollView(
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () => _bloc.add(HomeNextFactEvent()),
                            child: const Text(AppStrings.anotherFact)),
                        Container(
                          margin: const EdgeInsets.only(bottom: 8, top: 24),
                          constraints: const BoxConstraints(maxHeight: 300),
                          alignment: Alignment.center,
                          child: Image.network(
                            state.fact!.imageUrl,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              );
                            },
                          ),
                        ),
                        Text(
                          state.fact!.text,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ),
              if (state is HomeFailure && state.fact == null)
                ErrorInfo(failure: state.fail),
              if (state is HomeLoading)
                Container(
                  constraints: const BoxConstraints.expand(),
                  color: Colors.black12,
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(),
                )
            ],
          );
        },
      ),
    );
  }
}
