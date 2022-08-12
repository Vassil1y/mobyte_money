part of 'transaction_page_bloc.dart';

abstract class TransactionEvent{
  const TransactionEvent();
}

class ChangeTypeButtonColorToTrueEvent extends TransactionEvent{
  const ChangeTypeButtonColorToTrueEvent();
}

class ChangeTypeButtonColorToFalseEvent extends TransactionEvent{
  const ChangeTypeButtonColorToFalseEvent();
}

class ChangeStatusButtonColorToTrueEvent extends TransactionEvent{
  const ChangeStatusButtonColorToTrueEvent();
}

class ChangeStatusButtonColorToFalseEvent extends TransactionEvent{
  const ChangeStatusButtonColorToFalseEvent();
}