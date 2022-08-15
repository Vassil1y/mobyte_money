part of 'transaction_page_bloc.dart';

abstract class TransactionState {
  const TransactionState();
}

class TransactionInitial extends TransactionState {
  const TransactionInitial();
}

class ChangeTypeButtonColorToTrueState extends TransactionState {
  const ChangeTypeButtonColorToTrueState();
}

class ChangeTypeButtonColorToFalseState extends TransactionState {
  const ChangeTypeButtonColorToFalseState();
}

class ChangeStatusButtonColorToTrueState extends TransactionState {
  const ChangeStatusButtonColorToTrueState();
}

class ChangeStatusButtonColorToFalseState extends TransactionState {
  const ChangeStatusButtonColorToFalseState();
}

class ChangeDateFieldState extends TransactionState {
  const ChangeDateFieldState({required this.dateTime});

  final String dateTime;
}

class ChangeCategoryFieldState extends TransactionState {
  const ChangeCategoryFieldState({required this.category});

  final String category;
}

class ChangeAmountFieldState extends TransactionState {
  const ChangeAmountFieldState({required this.amount});

  final int amount;
}

class ChangeDescriptionState extends TransactionState {
  const ChangeDescriptionState({required this.description});

  final String description;
}

class AddButtonPressedDoneState extends TransactionState {
  const AddButtonPressedDoneState();
}

class AddButtonPressedFailedState extends TransactionState {
  const AddButtonPressedFailedState();
}

class EmptyState extends TransactionState {
  const EmptyState();
}
