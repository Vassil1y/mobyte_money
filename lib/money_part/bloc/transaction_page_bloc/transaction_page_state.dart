part of 'transaction_page_bloc.dart';

abstract class TransactionState{
  const TransactionState();
}

class TransactionInitial extends TransactionState{
  const TransactionInitial();
}

class ChangeTypeButtonColorToTrue extends TransactionState{
  const ChangeTypeButtonColorToTrue();
}

class ChangeTypeButtonColorToFalse extends TransactionState{
  const ChangeTypeButtonColorToFalse();
}
class ChangeStatusButtonColorToTrue extends TransactionState{
  const ChangeStatusButtonColorToTrue();
}
class ChangeStatusButtonColorToFalse extends TransactionState{
  const ChangeStatusButtonColorToFalse();
}