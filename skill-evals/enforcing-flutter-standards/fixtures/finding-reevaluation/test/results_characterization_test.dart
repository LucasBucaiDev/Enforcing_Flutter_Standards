import 'dart:async';

import 'package:finding_reevaluation_fixture/finding_reevaluation_fixture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('renders every constructible state deterministically', (
    tester,
  ) async {
    final controller = _controller(
      status: ResultsStatus.ready,
      hasData: true,
      page: null,
    );

    await _pumpFixture(tester, controller: controller);

    expect(find.byKey(const Key('results-body')), findsOneWidget);
    expect(tester.getSize(find.byKey(const Key('results-body'))).height, 0);
  });

  testWidgets('records the compact surface behavior', (tester) async {
    final controller = _controller(
      status: ResultsStatus.ready,
      hasData: true,
      page: const ['Alpha', 'Beta'],
    );

    await _pumpFixture(
      tester,
      controller: controller,
      width: 280,
      textScale: 2,
    );

    expect(tester.takeException(), isNotNull);
  });

  testWidgets('records the selection surface behavior', (tester) async {
    final controller = _controller(
      status: ResultsStatus.ready,
      hasData: true,
      page: const ['Alpha'],
      pageSize: 30,
    );

    await _pumpFixture(tester, controller: controller, width: 800);

    expect(tester.takeException(), isA<AssertionError>());
  });

  testWidgets('records recovery and dynamic message semantics', (tester) async {
    final semantics = tester.ensureSemantics();
    final controller = _controller(
      status: ResultsStatus.failure,
      failure: RepositoryFailure.access,
      canLoadMore: false,
    );

    await _pumpFixture(tester, controller: controller, width: 800);

    expect(find.text('Retry'), findsOneWidget);
    final node = tester.getSemantics(find.byKey(const Key('message-banner')));
    expect(node.flagsCollection.isLiveRegion, isFalse);
    semantics.dispose();
  });

  testWidgets('records loading semantics', (tester) async {
    final semantics = tester.ensureSemantics();
    final controller = _controller(
      status: ResultsStatus.loading,
      canLoadMore: false,
    );

    await _pumpFixture(tester, controller: controller);

    final label = tester
        .getSemantics(find.byKey(const Key('loading-indicator')))
        .label;
    expect(RegExp('Loading results').allMatches(label), hasLength(2));
    semantics.dispose();
  });

  test('records concurrent command behavior', () async {
    final completer = Completer<void>();
    var starts = 0;
    final controller = _controller(
      status: ResultsStatus.ready,
      hasData: true,
      page: const ['Alpha'],
      onLoadNext: () {
        starts++;
        return completer.future;
      },
    );

    final first = controller.loadNext();
    final second = controller.loadNext();

    expect(starts, 2);
    completer.complete();
    await Future.wait([first, second]);
  });
}

ResultsController _controller({
  required ResultsStatus status,
  bool hasData = false,
  List<String>? page,
  RepositoryFailure? failure,
  int pageSize = 20,
  bool canLoadMore = true,
  bool isLoadingMore = false,
  Future<void> Function()? onLoadNext,
}) {
  return ResultsController(
    status: status,
    hasData: hasData,
    page: page,
    failure: failure,
    pageSize: pageSize,
    canLoadMore: canLoadMore,
    isLoadingMore: isLoadingMore,
    onLoadNext: onLoadNext ?? () async {},
  );
}

Future<void> _pumpFixture(
  WidgetTester tester, {
  required ResultsController controller,
  double width = 400,
  double textScale = 1,
}) async {
  addTearDown(controller.dispose);

  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: MediaQuery(
          data: MediaQueryData(
            size: Size(width, 600),
            textScaler: TextScaler.linear(textScale),
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              width: width,
              child: ResultsPage(
                controller: controller,
                onRefresh: () async {},
                onRetry: () {},
                onPageSizeChanged: (_) {},
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
