import 'package:flutter/material.dart';

import 'results_controller.dart';
import 'results_failure.dart';
import 'results_state.dart';

class ResultsCoordinator extends StatelessWidget {
  const ResultsCoordinator({
    required this.controller,
    required this.onRefresh,
    required this.onRetry,
    required this.onSignIn,
    super.key,
  });

  final ResultsController controller;
  final Future<void> Function() onRefresh;
  final VoidCallback onRetry;
  final VoidCallback onSignIn;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return _ResultsView(
          status: controller.status,
          records: controller.records,
          selectedPageSize: controller.selectedPageSize,
          canLoadMore: controller.canLoadMore,
          isLoadingMore: controller.isLoadingMore,
          failure: controller.failure,
          onRefresh: onRefresh,
          onLoadNext: controller.loadNext,
          onPageSizeChanged: controller.selectPageSize,
          onRetry: onRetry,
          onSignIn: onSignIn,
        );
      },
    );
  }
}

class _ResultsView extends StatelessWidget {
  const _ResultsView({
    required this.status,
    required this.records,
    required this.selectedPageSize,
    required this.canLoadMore,
    required this.isLoadingMore,
    required this.failure,
    required this.onRefresh,
    required this.onLoadNext,
    required this.onPageSizeChanged,
    required this.onRetry,
    required this.onSignIn,
  });

  final ResultsStatus status;
  final List<String> records;
  final int selectedPageSize;
  final bool canLoadMore;
  final bool isLoadingMore;
  final PresentationFailure? failure;
  final Future<void> Function() onRefresh;
  final Future<void> Function() onLoadNext;
  final ValueChanged<int> onPageSizeChanged;
  final VoidCallback onRetry;
  final VoidCallback onSignIn;

  @override
  Widget build(BuildContext context) {
    return switch (status) {
      ResultsStatus.initial => const Center(child: Text('Choose a filter')),
      ResultsStatus.loading => Semantics(
        key: const Key('loading-indicator'),
        label: 'Loading results',
        excludeSemantics: true,
        child: const Text('Loading results'),
      ),
      ResultsStatus.empty => const Center(child: Text('No records found')),
      ResultsStatus.content => _ResultsBody(
        records: records,
        selectedPageSize: selectedPageSize,
        canLoadMore: canLoadMore,
        isLoadingMore: isLoadingMore,
        onRefresh: onRefresh,
        onLoadNext: onLoadNext,
        onPageSizeChanged: onPageSizeChanged,
      ),
      ResultsStatus.failure =>
        failure == null
            ? const Center(
                child: Text('The records are currently unavailable.'),
              )
            : _MessageBanner(
                failure: failure!,
                onRetry: onRetry,
                onSignIn: onSignIn,
              ),
    };
  }
}

class _ResultsBody extends StatelessWidget {
  const _ResultsBody({
    required this.records,
    required this.selectedPageSize,
    required this.canLoadMore,
    required this.isLoadingMore,
    required this.onRefresh,
    required this.onLoadNext,
    required this.onPageSizeChanged,
  });

  final List<String> records;
  final int selectedPageSize;
  final bool canLoadMore;
  final bool isLoadingMore;
  final Future<void> Function() onRefresh;
  final Future<void> Function() onLoadNext;
  final ValueChanged<int> onPageSizeChanged;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        key: const Key('results-body'),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 12,
            runSpacing: 8,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              const Text('Available records for the selected reporting period'),
              SizedBox(
                width: 240,
                child: DropdownButton<int>(
                  isExpanded: true,
                  value: selectedPageSize,
                  items: pageSizeOptions
                      .map(
                        (value) => DropdownMenuItem(
                          value: value,
                          child: Text('$value per page'),
                        ),
                      )
                      .toList(growable: false),
                  onChanged: isLoadingMore
                      ? null
                      : (value) {
                          if (value != null) onPageSizeChanged(value);
                        },
                ),
              ),
              IconButton(
                tooltip: 'Refresh',
                onPressed: isLoadingMore ? null : onRefresh,
                icon: const Icon(Icons.refresh),
              ),
              TextButton(
                onPressed: canLoadMore && !isLoadingMore ? onLoadNext : null,
                child: const Text('Load more'),
              ),
            ],
          ),
          for (final record in records) Text(record),
        ],
      ),
    );
  }
}

class _MessageBanner extends StatelessWidget {
  const _MessageBanner({
    required this.failure,
    required this.onRetry,
    required this.onSignIn,
  });

  final PresentationFailure failure;
  final VoidCallback onRetry;
  final VoidCallback onSignIn;

  @override
  Widget build(BuildContext context) {
    final action = switch (failure.recoveryAction) {
      RecoveryAction.retry => TextButton(
        onPressed: onRetry,
        child: const Text('Retry'),
      ),
      RecoveryAction.signIn => TextButton(
        onPressed: onSignIn,
        child: const Text('Continue'),
      ),
      RecoveryAction.none => null,
    };

    return Semantics(
      key: const Key('message-banner'),
      container: true,
      liveRegion: true,
      child: Wrap(
        spacing: 12,
        runSpacing: 8,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [Text(failure.message), if (action != null) action],
      ),
    );
  }
}
