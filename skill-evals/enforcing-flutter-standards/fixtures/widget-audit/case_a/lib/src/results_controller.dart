import 'package:flutter/widgets.dart';

import 'results_failure.dart';
import 'results_state.dart';

class ResultsController extends ChangeNotifier {
  ResultsController({
    required this.status,
    required this.hasData,
    required List<String>? page,
    required this.failure,
    required this.pageSize,
    required this.canLoadMore,
    required this.isLoadingMore,
    required Future<void> Function() onLoadNext,
  }) : page = page == null ? null : List.unmodifiable(page),
       _onLoadNext = onLoadNext;

  final ResultsStatus status;
  final bool hasData;
  final List<String>? page;
  final RepositoryFailure? failure;
  final int pageSize;
  final bool canLoadMore;
  final bool isLoadingMore;
  final Future<void> Function() _onLoadNext;

  Future<void> loadNext() => _onLoadNext();
}

class ResultsScope extends InheritedNotifier<ResultsController> {
  const ResultsScope({
    required ResultsController controller,
    required super.child,
    super.key,
  }) : super(notifier: controller);

  static ResultsController of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ResultsScope>()!
        .notifier!;
  }
}
