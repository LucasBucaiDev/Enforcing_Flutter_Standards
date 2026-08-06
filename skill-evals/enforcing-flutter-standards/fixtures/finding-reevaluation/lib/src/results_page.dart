import 'package:flutter/material.dart';

import 'results_content.dart';
import 'results_controller.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({
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
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, _) {
          return ResultsContent(
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
          );
        },
      ),
    );
  }
}
