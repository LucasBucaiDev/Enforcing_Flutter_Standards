import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_audit_case_b/widget_audit_case_b.dart';

void main() {
  testWidgets('renders content at the compact surface', (tester) async {
    final controller = _controller(status: ResultsStatus.content);

    await _pumpFixture(
      tester,
      controller: controller,
      width: 280,
      textScale: 2,
    );

    expect(tester.takeException(), isNull);
    expect(find.text('Alpha'), findsOneWidget);
  });

  test('rejects a selection outside the available values', () {
    final controller = _controller(status: ResultsStatus.content);

    expect(() => controller.selectPageSize(30), throwsArgumentError);
  });

  test('rejects an incomplete failure state', () {
    expect(
      () => _controller(status: ResultsStatus.failure),
      throwsArgumentError,
    );
  });

  test('starts idle until a load operation is active', () {
    final controller = _controller(status: ResultsStatus.content);

    expect(controller.isLoadingMore, isFalse);
  });

  test('rejects incoherent state combinations', () {
    expect(
      () => _controller(
        status: ResultsStatus.empty,
        records: const ['Unexpected'],
      ),
      throwsArgumentError,
    );
    expect(
      () => _controller(status: ResultsStatus.content, records: const []),
      throwsArgumentError,
    );
    expect(
      () => _controller(status: ResultsStatus.loading, canLoadMore: true),
      throwsArgumentError,
    );
  });

  testWidgets('updates the selected page size', (tester) async {
    final controller = _controller(status: ResultsStatus.content);
    await _pumpFixture(tester, controller: controller, width: 800);

    await tester.tap(find.byType(DropdownButton<int>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('10 per page').last);
    await tester.pumpAndSettle();

    expect(controller.selectedPageSize, 10);
  });

  testWidgets('renders the owned recovery action and announcement', (
    tester,
  ) async {
    final semantics = tester.ensureSemantics();
    var signInCount = 0;
    final controller = _controller(
      status: ResultsStatus.failure,
      failure: PresentationFailure.accessRequired,
    );

    await _pumpFixture(
      tester,
      controller: controller,
      width: 800,
      onSignIn: () => signInCount++,
    );

    expect(find.text('Retry'), findsNothing);
    expect(find.text('Continue'), findsOneWidget);
    await tester.tap(find.text('Continue'));
    expect(signInCount, 1);
    final node = tester.getSemantics(find.byKey(const Key('message-banner')));
    expect(node.flagsCollection.isLiveRegion, isTrue);
    semantics.dispose();
  });

  testWidgets('exposes one loading announcement', (tester) async {
    final semantics = tester.ensureSemantics();
    final controller = _controller(status: ResultsStatus.loading);

    await _pumpFixture(tester, controller: controller);

    final label = tester
        .getSemantics(find.byKey(const Key('loading-indicator')))
        .label;
    expect(RegExp('Loading results').allMatches(label), hasLength(1));
    semantics.dispose();
  });

  test('serializes concurrent commands', () async {
    final completer = Completer<void>();
    var starts = 0;
    final controller = _controller(
      status: ResultsStatus.content,
      onLoadNext: () {
        starts++;
        return completer.future;
      },
    );

    final first = controller.loadNext();
    final second = controller.loadNext();

    expect(starts, 1);
    expect(controller.isLoadingMore, isTrue);
    completer.complete();
    await Future.wait([first, second]);
    expect(controller.isLoadingMore, isFalse);
  });

  test('does not load when pagination is unavailable', () async {
    var starts = 0;
    final controller = _controller(
      status: ResultsStatus.content,
      canLoadMore: false,
      onLoadNext: () async {
        starts++;
      },
    );

    await controller.loadNext();

    expect(starts, 0);
    expect(controller.isLoadingMore, isFalse);
  });

  test('serializes listener-reentrant commands', () async {
    final completer = Completer<void>();
    var starts = 0;
    var reentered = false;
    final controller = _controller(
      status: ResultsStatus.content,
      onLoadNext: () {
        starts++;
        return completer.future;
      },
    );
    controller.addListener(() {
      if (controller.isLoadingMore && !reentered) {
        reentered = true;
        unawaited(controller.loadNext());
      }
    });

    final operation = controller.loadNext();

    expect(starts, 1);
    completer.complete();
    await operation;
    expect(controller.isLoadingMore, isFalse);
  });

  testWidgets('scrolls a large record set within bounded height', (
    tester,
  ) async {
    final controller = _controller(
      status: ResultsStatus.content,
      records: List.generate(60, (index) => 'Record $index'),
    );

    await _pumpFixture(
      tester,
      controller: controller,
      width: 280,
      height: 320,
      textScale: 2,
    );

    expect(tester.takeException(), isNull);
    await tester.scrollUntilVisible(
      find.text('Record 59'),
      200,
      scrollable: find.byType(Scrollable),
    );
    expect(find.text('Record 59'), findsOneWidget);
  });

  test('reports command failures and clears loading', () async {
    Object? reportedError;
    final controller = _controller(
      status: ResultsStatus.content,
      onLoadNext: () => throw StateError('synthetic failure'),
      onLoadError: (error, _) => reportedError = error,
    );

    await controller.loadNext();

    expect(reportedError, isA<StateError>());
    expect(controller.isLoadingMore, isFalse);
  });
}

ResultsController _controller({
  required ResultsStatus status,
  PresentationFailure? failure,
  Future<void> Function()? onLoadNext,
  void Function(Object error, StackTrace stackTrace)? onLoadError,
  List<String>? records,
  bool? canLoadMore,
}) {
  final controller = ResultsController(
    status: status,
    records:
        records ??
        (status == ResultsStatus.content ? const ['Alpha', 'Beta'] : const []),
    selectedPageSize: 20,
    canLoadMore: canLoadMore ?? status == ResultsStatus.content,
    failure: failure,
    onLoadNext: onLoadNext ?? () async {},
    onLoadError: onLoadError ?? (_, _) {},
  );
  addTearDown(controller.dispose);
  return controller;
}

Future<void> _pumpFixture(
  WidgetTester tester, {
  required ResultsController controller,
  double width = 400,
  double height = 600,
  double textScale = 1,
  VoidCallback? onSignIn,
}) {
  return tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: MediaQuery(
          data: MediaQueryData(
            size: Size(width, height),
            textScaler: TextScaler.linear(textScale),
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              width: width,
              height: height,
              child: ResultsCoordinator(
                controller: controller,
                onRefresh: () async {},
                onRetry: () {},
                onSignIn: onSignIn ?? () {},
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
