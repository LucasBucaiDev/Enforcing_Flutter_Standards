import 'package:flutter/foundation.dart';

import 'results_failure.dart';
import 'results_state.dart';

class ResultsController extends ChangeNotifier {
  ResultsController({
    required this.status,
    required List<String> records,
    required int selectedPageSize,
    required this.canLoadMore,
    required bool isLoadingMore,
    required PresentationFailure? failure,
    required Future<void> Function() onLoadNext,
  }) : _records = List.unmodifiable(records),
       _selectedPageSize = _validatedPageSize(selectedPageSize),
       _isLoadingMore = isLoadingMore,
       _failure = _validatedFailure(status, failure),
       _onLoadNext = onLoadNext;

  final ResultsStatus status;
  final List<String> _records;
  int _selectedPageSize;
  final bool canLoadMore;
  bool _isLoadingMore;
  final PresentationFailure? _failure;
  final Future<void> Function() _onLoadNext;
  Future<void>? _activeLoad;

  List<String> get records => _records;
  int get selectedPageSize => _selectedPageSize;
  bool get isLoadingMore => _isLoadingMore;
  PresentationFailure? get failure => _failure;

  void selectPageSize(int value) {
    final validated = _validatedPageSize(value);
    if (validated == _selectedPageSize) return;
    _selectedPageSize = validated;
    notifyListeners();
  }

  Future<void> loadNext() {
    final activeLoad = _activeLoad;
    if (activeLoad != null) return activeLoad;

    _isLoadingMore = true;
    notifyListeners();
    final operation = Future<void>.sync(_onLoadNext);
    final trackedOperation = operation.whenComplete(() {
      _activeLoad = null;
      _isLoadingMore = false;
      notifyListeners();
    });
    _activeLoad = trackedOperation;
    return trackedOperation;
  }

  static int _validatedPageSize(int value) {
    if (!pageSizeOptions.contains(value)) {
      throw ArgumentError.value(value, 'value', 'Unsupported page size');
    }
    return value;
  }

  static PresentationFailure? _validatedFailure(
    ResultsStatus status,
    PresentationFailure? failure,
  ) {
    if (status == ResultsStatus.failure && failure == null) {
      throw ArgumentError('Failure status requires a presentation failure');
    }
    if (status != ResultsStatus.failure && failure != null) {
      throw ArgumentError('Presentation failure requires failure status');
    }
    return failure;
  }
}
