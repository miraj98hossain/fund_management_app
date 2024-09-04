import 'package:flutter_bloc/flutter_bloc.dart';

sealed class TransactionEvent {}

final class Deposit extends TransactionEvent {
  final num amount;
  Deposit({required this.amount});
}

final class Tranfer extends TransactionEvent {
  final num amount;
  Tranfer({required this.amount});
}

final class Withdraw extends TransactionEvent {
  final num amount;
  Withdraw({required this.amount});
}

sealed class TransactionState {}

final class TransactionInitial extends TransactionState {
  final num transactionsBalance;
  TransactionInitial({required this.transactionsBalance});
}

final class TransactionLoading extends TransactionState {}

final class TransactionLoaded extends TransactionState {
  final num transactionsBalance;
  TransactionLoaded({required this.transactionsBalance});
}

final class TransactionError extends TransactionState {
  final Object error;
  TransactionError({required this.error});
}

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  num _transactionsBalance = 0;
  TransactionBloc() : super(TransactionInitial(transactionsBalance: 0)) {
    on<Deposit>((event, emit) async {
      emit(TransactionLoading());
      _transactionsBalance += event.amount;
      await Future.delayed(const Duration(seconds: 1), () {
        emit(TransactionLoaded(transactionsBalance: _transactionsBalance));
      });
    });
    on<Tranfer>((event, emit) async {
      emit(TransactionLoading());
      if (_transactionsBalance <= 0) {
        emit(TransactionError(error: "Insufficient Balance"));
      } else {
        _transactionsBalance -= event.amount;
        await Future.delayed(const Duration(seconds: 1), () {
          emit(TransactionLoaded(transactionsBalance: _transactionsBalance));
        });
      }
    });
    on<Withdraw>((event, emit) async {
      emit(TransactionLoading());
      if (_transactionsBalance <= 0) {
        emit(TransactionError(error: "Insufficient Balance"));
      } else {
        _transactionsBalance -= event.amount;
        await Future.delayed(const Duration(seconds: 1), () {
          emit(TransactionLoaded(transactionsBalance: _transactionsBalance));
        });
      }
    });
  }
}
