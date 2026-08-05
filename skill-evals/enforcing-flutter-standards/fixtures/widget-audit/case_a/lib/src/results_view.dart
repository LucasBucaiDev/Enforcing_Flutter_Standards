import 'package:flutter/material.dart';

import 'results_controller.dart';
import 'results_failure.dart';
import 'results_state.dart';

class ResultsCoordinator extends StatelessWidget {
  const ResultsCoordinator({
    required this.controller,
    required this.onRefresh,
    required this.onRetry,
    required this.onPageSizeChanged,
    super.key,
  });

  final ResultsController controller;
  final Future<void> Function() onRefresh;
  final VoidCallback onRetry;
  final ValueChanged<int> onPageSizeChanged;

  @override
  Widget build(BuildContext context) {
    return ResultsScope(
      controller: controller,
      child: ResultsView(
        status: controller.status,
        hasData: controller.hasData,
        page: controller.page,
        failure: controller.failure,
        pageSize: controller.pageSize,
        canLoadMore: controller.canLoadMore,
        isLoadingMore: controller.isLoadingMore,
        onRefresh: onRefresh,
        onRetry: onRetry,
        onPageSizeChanged: onPageSizeChanged,
      ),
    );
  }
}

class ResultsView extends StatelessWidget {
  const ResultsView({
    required this.status,
    required this.hasData,
    required this.page,
    required this.failure,
    required this.pageSize,
    required this.canLoadMore,
    required this.isLoadingMore,
    required this.onRefresh,
    required this.onRetry,
    required this.onPageSizeChanged,
    super.key,
  });

  final ResultsStatus status;
  final bool hasData;
  final List<String>? page;
  final RepositoryFailure? failure;
  final int pageSize;
  final bool canLoadMore;
  final bool isLoadingMore;
  final Future<void> Function() onRefresh;
  final VoidCallback onRetry;
  final ValueChanged<int> onPageSizeChanged;

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case ResultsStatus.initial:
        return const Center(child: Text('Choose a filter'));
      case ResultsStatus.loading:
        return Semantics(
          key: const Key('loading-indicator'),
          label: 'Loading results',
          child: const Text('Loading results'),
        );
      case ResultsStatus.ready:
        final currentPage = page;
        if (currentPage == null) {
          return const SizedBox.shrink(key: Key('results-body'));
        }
        return _ResultsBody(
          records: currentPage,
          selectedPageSize: pageSize,
          canLoadMore: canLoadMore,
          isLoadingMore: isLoadingMore,
          onRefresh: onRefresh,
          onPageSizeChanged: onPageSizeChanged,
        );
      case ResultsStatus.failure:
        return Semantics(
          key: const Key('message-banner'),
          child: Row(
            children: [
              Text(_messageFor(failure)),
              const SizedBox(width: 12),
              TextButton(onPressed: onRetry, child: const Text('Retry')),
            ],
          ),
        );
    }
  }

  String _messageFor(RepositoryFailure? failure) {
    return switch (failure) {
      RepositoryFailure.connection =>
        'The records could not be refreshed. Check the connection and try again.',
      RepositoryFailure.access =>
        'Access is required before records can be loaded.',
      null => 'The records are currently unavailable.',
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
    required this.onPageSizeChanged,
  });

  final List<String> records;
  final int selectedPageSize;
  final bool canLoadMore;
  final bool isLoadingMore;
  final Future<void> Function() onRefresh;
  final ValueChanged<int> onPageSizeChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const Key('results-body'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text('Available records for the selected reporting period'),
            const SizedBox(width: 12),
            DropdownButton<int>(
              value: selectedPageSize,
              items: const [
                DropdownMenuItem(value: 10, child: Text('10 per page')),
                DropdownMenuItem(value: 20, child: Text('20 per page')),
              ],
              onChanged: (value) {
                if (value != null) onPageSizeChanged(value);
              },
            ),
            IconButton(
              tooltip: 'Refresh',
              onPressed: onRefresh,
              icon: const Icon(Icons.refresh),
            ),
            TextButton(
              onPressed: canLoadMore
                  ? () => ResultsScope.of(context).loadNext()
                  : null,
              child: const Text('Load more'),
            ),
          ],
        ),
        for (final record in records) Text(record),
      ],
    );
  }
}
