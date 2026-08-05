enum RecoveryAction { retry, signIn, none }

enum PresentationFailure { temporary, accessRequired }

extension PresentationFailureDetails on PresentationFailure {
  String get message => switch (this) {
    PresentationFailure.temporary => 'The records are currently unavailable.',
    PresentationFailure.accessRequired => 'Access is required',
  };

  RecoveryAction get recoveryAction => switch (this) {
    PresentationFailure.temporary => RecoveryAction.retry,
    PresentationFailure.accessRequired => RecoveryAction.signIn,
  };
}
