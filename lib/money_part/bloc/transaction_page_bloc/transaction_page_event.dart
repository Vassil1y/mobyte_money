part of 'transaction_page_bloc.dart';

abstract class TransactionEvent {
  const TransactionEvent();
}

class ChangeTypeButtonColorToTrueEvent extends TransactionEvent {
  const ChangeTypeButtonColorToTrueEvent();
}

class ChangeTypeButtonColorToFalseEvent extends TransactionEvent {
  const ChangeTypeButtonColorToFalseEvent();
}

class ChangeStatusButtonColorToTrueEvent extends TransactionEvent {
  const ChangeStatusButtonColorToTrueEvent();
}

class ChangeStatusButtonColorToFalseEvent extends TransactionEvent {
  const ChangeStatusButtonColorToFalseEvent();
}

class ChangeDateFieldEvent extends TransactionEvent {
  const ChangeDateFieldEvent({required this.dateTime});

  final String dateTime;
}

class ChangeCategoryFieldEvent extends TransactionEvent {
  const ChangeCategoryFieldEvent({required this.category});

  final String category;
}

class ChangeAmountFieldEvent extends TransactionEvent {
  const ChangeAmountFieldEvent({required this.amount});

  final int amount;
}

class ChangeDescriptionFieldEvent extends TransactionEvent {
  const ChangeDescriptionFieldEvent({required this.description});

  final String description;
}

class AddButtonPressedEvent extends TransactionEvent {
  const AddButtonPressedEvent();
}

class EmptyEvent extends TransactionEvent {
  const EmptyEvent();
}
