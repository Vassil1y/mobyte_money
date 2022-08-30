import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_admin/firebase_admin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/pages/classes/transaction_class.dart';

part 'transaction_page_event.dart';

part 'transaction_page_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final storeInstance = FirebaseFirestore.instance;
  final authInstance = FirebaseAuth.instance;
  final List<TransactionClass> _transactions = [];

  TransactionBloc() : super(const TransactionInitial()) {
    TransactionClass transactionPrototype = TransactionClass();

    on<TransactionEvent>(
      (event, emit) async{
        if(event is FetchEvent){
          await _onFetch("", emit);
          print(_transactions);

          emit(FetchState(transactionsList: _transactions));
        }

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
        if(event is ClearDataEvent){
          transactionPrototype = TransactionClass();
          emit(const EmptyState());
        }
        if (event is AddButtonPressedEvent) {
          final data = {
            "type": transactionPrototype.transactionType,
            "status": transactionPrototype.transactionStatus,
            "data": transactionPrototype.date,
            "category": transactionPrototype.category,
            "amount": transactionPrototype.amount,
            "description": transactionPrototype.description
          };
          try {
            storeInstance
                .collection("transactions")
                .doc((authInstance.currentUser?.email)!.toString())
                .collection("transactions")
                .add(data);
            transactionPrototype = TransactionClass();
            emit(const AddButtonPressedDoneState());
          } on FirebaseStorageError catch (e) {
            print(e);

            emit(const AddButtonPressedFailedState());
          }

          //ADD
          // QuerySnapshot querySnapshot = await _storeInstance.collection('users').get();
          // print(querySnapshot.docs[0].id);
          // Хранить лист в блоке, отдавать в стейте отфильтрованные
        }
        if (event is GetSomeData) {}
      },
    );
  }

  Future<void> _onFetch(String date, Emitter emit) async {
    _transactions.clear();
    try {
      var rawTransactions = await storeInstance
          .collection("transactions")
          .doc((authInstance.currentUser?.email)!.toString())
          .collection("transactions")
          .get();
      for (var i = 0; i < rawTransactions.docs.length; i++) {
        var item = rawTransactions.docs[i];
        var data = item.data();
        // print(data["data"]);
        final TransactionClass transaction = TransactionClass(
          date: data["data"],
        );
        _transactions.add(transaction);
        emit(FetchState(transactionsList: _transactions));
      }


      return;
      // if(date.isNotEmpty){
        final transactions = _transactions.where((element) => element.date == date).toList();
        emit(FetchState(transactionsList: transactions));
        // return;
      // }

    } catch (e) {
      print(e);
    }
  }
}
