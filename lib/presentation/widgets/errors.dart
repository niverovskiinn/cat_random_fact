import 'package:flutter/material.dart';
import 'package:cat_random_fact/core/errors/failure.dart';
import 'package:cat_random_fact/resourses/strings.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackbarError(
        BuildContext context, Failure failure) =>
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(failure.message ?? AppStrings.unknownError)));

class ErrorInfo extends StatelessWidget {
  final Failure failure;
  const ErrorInfo({super.key, required this.failure});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              AppStrings.error,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: Colors.red),
              textAlign: TextAlign.center,
            ),
            if (failure.message != null)
              Text(
                failure.message!,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
          ],
        ));
  }
}
