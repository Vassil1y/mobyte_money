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

class NewState extends TransactionState {
  final String new1;
  final bool new2;

  const NewState(this.new1, this.new2);

  NewState copyWith(String? new1, bool? new2) {
    return NewState(new1 ?? this.new1, new2 ?? this.new2);
  }
}

class LoadedList extends TransactionState {
  final List<Map<String, dynamic>> list;

  const LoadedList({required this.list});
}

class FetchState extends TransactionState {
  final List<TransactionClass> transactionsList;

  const FetchState({required this.transactionsList});
}
