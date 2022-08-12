
import 'package:flutter_bloc/flutter_bloc.dart';

part 'transaction_page_event.dart';
part 'transaction_page_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState>{
  TransactionBloc() : super(
    const TransactionInitial()
  ){
    on<TransactionEvent>((event, emit)  {
      if (event is ChangeTypeButtonColorToTrueEvent){
        emit(
          const ChangeTypeButtonColorToTrue()
        );
      }
      if (event is ChangeTypeButtonColorToFalseEvent){
        emit(
          const ChangeTypeButtonColorToFalse()
        );
      }
      if (event is ChangeStatusButtonColorToTrueEvent){
        emit(
          const ChangeStatusButtonColorToTrue()
        );
      }
      if (event is ChangeStatusButtonColorToFalseEvent){
        emit(
          const ChangeStatusButtonColorToFalse()
        );
      }
    });
  }

}