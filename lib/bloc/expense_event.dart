part of 'expense_bloc.dart';

@immutable
abstract class ExpenseEvent {}

class AddExpenseEvent extends ExpenseEvent{
  ExpenseModel newExpense;

  AddExpenseEvent({required this.newExpense});
}

class FetchAllExpenses extends ExpenseEvent{}
