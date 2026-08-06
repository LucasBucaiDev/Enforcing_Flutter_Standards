import 'dart:async';

import 'package:flutter/foundation.dart';

import 'results_failure.dart';
import 'results_state.dart';

class ResultsController extends ChangeNotifier {
  ResultsController({
    required this.status,
    required List<String> records,
    required int selectedPageSize,
    required bool canLoadMore,
    required PresentationFailure? failure,
    required Future<void> Function() onLoadNext,
    required void Function(Object error, StackTrace stackTrace) onLoadError,
  }) : _records = List.unmodifiable(records),
       _selectedPageSize = _validatedPageSize(selectedPageSize),
       canLoadMore = _validatedAvailability(status, records, canLoadMore),
       _failure = _validatedFailure(status, failure),
       _onLoadNext = onLoadNext,
       _onLoadError = onLoadError;

  final ResultsStatus status;
  final List<String> _records;
  int _selectedPageSize;
  final bool canLoadMore;
  bool _isLoadingMore = false;
  final PresentationFailure? _failure;
  final Future<void> Function() _onLoadNext;
  final void Function(Object error, StackTrace stackTrace) _onLoadError;
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
    if (status != ResultsStatus.content || !canLoadMore) {
      return Future<void>.value();
    }
    final activeLoad = _activeLoad;
    if (activeLoad != null) return activeLoad;

    final completer = Completer<void>();
    final trackedOperation = completer.future.whenComplete(() {
      _activeLoad = null;
      _isLoadingMore = false;
      notifyListeners();
    });
    _activeLoad = trackedOperation;
    _isLoadingMore = true;
    notifyListeners();
    Future<void>.sync(_onLoadNext).then(
      completer.complete,
      onError: (Object error, StackTrace stackTrace) {
        try {
          _onLoadError(error, stackTrace);
          completer.complete();
        } catch (handlerError, handlerStackTrace) {
          completer.completeError(handlerError, handlerStackTrace);
        }
      },
    );
    return trackedOperation;
  }

  static bool _validatedAvailability(
    ResultsStatus status,
    List<String> records,
    bool canLoadMore,
  ) {
    if (status == ResultsStatus.content && records.isEmpty) {
      throw ArgumentError('Content status requires records');
    }
    if (status != ResultsStatus.content && records.isNotEmpty) {
      throw ArgumentError('Records require content status');
    }
    if (status != ResultsStatus.content && canLoadMore) {
      throw ArgumentError('Pagination requires content status');
    }
    return canLoadMore;
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
