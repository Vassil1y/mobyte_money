import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/pages/classes/transaction_class.dart';

part 'transaction_page_event.dart';

part 'transaction_page_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  TransactionBloc() : super(const TransactionInitial()) {
    TransactionClass transactionPrototype = TransactionClass();

    on<TransactionEvent>((event, emit) {
      if (event is ChangeTypeButtonColorToTrueEvent) {
        transactionPrototype.transactionType = true;
        emit(const ChangeTypeButtonColorToTrueState());
      }
      if (event is ChangeTypeButtonColorToFalseEvent) {
        transactionPrototype.transactionType = false;
        emit(const ChangeTypeButtonColorToFalseState());
      }
      if (event is ChangeStatusButtonColorToTrueEvent) {
        transactionPrototype.transactionStatus = true;
        emit(const ChangeStatusButtonColorToTrueState());
      }
      if (event is ChangeStatusButtonColorToFalseEvent) {
        transactionPrototype.transactionStatus = false;
        emit(const ChangeStatusButtonColorToFalseState());
      }
      if (event is ChangeDateFieldEvent) {
        transactionPrototype.date = event.dateTime;
        emit(ChangeDateFieldState(dateTime: event.dateTime));
      }
      if (event is ChangeCategoryFieldEvent) {
        transactionPrototype.category = event.category;
        emit(ChangeCategoryFieldState(category: event.category));
      }
      if (event is ChangeAmountFieldEvent) {
        transactionPrototype.amount = event.amount;
        emit(ChangeAmountFieldState(amount: event.amount));
      }
      if (event is ChangeDescriptionFieldEvent) {
        transactionPrototype.description = event.description;
        emit(ChangeDescriptionState(description: event.description));
      }
      if (event is AddButtonPressedEvent) {
        //ADD
        // QuerySnapshot querySnapshot = await _storeInstance.collection('users').get();
        // print(querySnapshot.docs[0].id);
        emit(const AddButtonPressedDoneState());
      }
    });
  }
}
