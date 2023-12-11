import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:expenso70/db/app_database.dart';
import 'package:expenso70/models/expense_model.dart';
import 'package:meta/meta.dart';

part 'expense_event.dart';
part 'expense_state.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  AppDataBase db;
  ExpenseBloc({required this.db}) : super(ExpenseInitial()) {
    on<AddExpenseEvent>((event, emit) async{
      emit(ExpenseLoading());
      var check = await db.addExpense(event.newExpense);

      if(check){
        var allExp = await db.getAllExpenses();
        emit(ExpenseLoaded(allExpenses: allExp));
      } else {
        emit(ExpenseError(errorMsg: "Note not added!!"));
      }


    });

    on<FetchAllExpenses>((event, emit) async{
      emit(ExpenseLoading());
      var allExp = await db.getAllExpenses();
      emit(ExpenseLoaded(allExpenses: allExp));
    });
  }
}
