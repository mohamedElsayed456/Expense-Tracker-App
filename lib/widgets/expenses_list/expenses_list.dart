import 'package:expence_tracker_app/models/expense_model.dart';
import 'package:expence_tracker_app/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    required this.expenses,
    required this.onRemoveExpense,
    super.key,
    });

  final List<Expense>expenses;
  final void Function(Expense expense)onRemoveExpense;

  @override
  Widget build(BuildContext context){
    return ListView.builder(
      itemBuilder: (ctx, index){
        return Dismissible(
          background: Container(
            color: Theme.of(context).colorScheme.error.withOpacity(0.75),
            margin: EdgeInsets.symmetric(
              horizontal: Theme.of(context).cardTheme.margin!.horizontal,
            ),
          ),
          key: ValueKey(expenses[index]),
          onDismissed:(direction) {
            onRemoveExpense(expenses[index]);
          },
          child: ExpenseItem(expenses[index]));
      },
      itemCount:expenses.length,
    );
  }
}