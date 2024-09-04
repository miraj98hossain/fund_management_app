import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fund_management_app/models/transaction_model.dart';

sealed class TransactionEvent {}

final class Deposit extends TransactionEvent {
  final num amount;
  final String accountNo;
  Deposit({
    required this.amount,
    required this.accountNo,
  });
}

final class Tranfer extends TransactionEvent {
  final num amount;
  final String accountNo;
  Tranfer({
    required this.amount,
    required this.accountNo,
  });
}

final class Withdraw extends TransactionEvent {
  final num amount;
  final String accountNo;
  Withdraw({
    required this.amount,
    required this.accountNo,
  });
}

sealed class TransactionState {}

final class TransactionInitial extends TransactionState {
  final num transactionsBalance;
  TransactionInitial({required this.transactionsBalance});
}

final class TransactionLoading extends TransactionState {}

final class TransactionLoaded extends TransactionState {
  final num transactionsBalance;
  final List<Transaction> transactions;
  TransactionLoaded(
      {required this.transactionsBalance, required this.transactions});
}

final class TransactionError extends TransactionState {
  final Object error;
  TransactionError({required this.error});
}

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  num _transactionsBalance = 0;
  final List<Transaction> _transactions = [];
  TransactionBloc() : super(TransactionInitial(transactionsBalance: 0)) {
    on<Deposit>((event, emit) async {
      emit(TransactionLoading());
      _transactionsBalance += event.amount;
      _transactions.add(Transaction(
        amount: event.amount,
        accountNumber: event.accountNo,
        date: DateTime.now(),
        type: "deposit",
      ));
      await Future.delayed(const Duration(seconds: 1), () {
        emit(TransactionLoaded(
          transactionsBalance: _transactionsBalance,
          transactions: _transactions,
        ));
      });
    });
    on<Tranfer>((event, emit) async {
      emit(TransactionLoading());
      if (_transactionsBalance <= 0 || _transactionsBalance < event.amount) {
        emit(TransactionError(error: "Insufficient Balance"));
      } else {
        _transactionsBalance -= event.amount;
        _transactions.add(Transaction(
          amount: event.amount,
          accountNumber: event.accountNo,
          date: DateTime.now(),
          type: "transfer",
        ));
        await Future.delayed(const Duration(seconds: 1), () {
          emit(TransactionLoaded(
            transactionsBalance: _transactionsBalance,
            transactions: _transactions,
          ));
        });
      }
    });
    on<Withdraw>((event, emit) async {
      emit(TransactionLoading());
      if (_transactionsBalance <= 0 || _transactionsBalance < event.amount) {
        emit(TransactionError(error: "Insufficient Balance"));
      } else {
        _transactionsBalance -= event.amount;
        _transactions.add(Transaction(
          amount: event.amount,
          accountNumber: event.accountNo,
          date: DateTime.now(),
          type: "withdraw",
        ));
        await Future.delayed(const Duration(seconds: 1), () {
          emit(TransactionLoaded(
            transactionsBalance: _transactionsBalance,
            transactions: _transactions,
          ));
        });
      }
    });
  }
}
