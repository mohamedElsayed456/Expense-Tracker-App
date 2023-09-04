import 'package:expence_tracker_app/widgets/chart/chart.dart';
import 'package:expence_tracker_app/widgets/expenses_list/expenses_list.dart';
import 'package:expence_tracker_app/models/expense_model.dart';
import 'package:expence_tracker_app/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses>{

  final List<Expense>registeredExpenses=[
    Expense(
      title: 'Flutter course',
      amount:19.99,
      date:DateTime.now(),
      category:Category.food,
      ),
      Expense(
      title: 'Cinema',
      amount:15.99,
      date:DateTime.now(),
      category:Category.liesure,
      ),
  ];

  void openAddExpenseOverlay(){
    showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
       builder:(context){
        return NewExpense(onAddExpense:addExpense);
     }
    );
  }
  void addExpense(Expense expense){
      setState((){
        registeredExpenses.add(expense);
      });
    }

  void removeExpense(Expense expense){
   final expenseIndex=registeredExpenses.indexOf(expense);

    setState((){
      registeredExpenses.remove(expense); 
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
        duration:const Duration(seconds:3),
        content:const Text('Expense deleted'),
        action: SnackBarAction(
          label:'Undo',
           onPressed: (){
               setState(() {
                 registeredExpenses.insert(expenseIndex, expense);
               });
           }
           ),
        )
      );
    } 

  @override
  Widget build(BuildContext context){
    final width=MediaQuery.of(context).size.width;

    Widget maincontent= const Center(
      child:Text('No expenses found,Start adding some!')
      );
      if(registeredExpenses.isNotEmpty){
        maincontent=ExpensesList(
            expenses: registeredExpenses,
            onRemoveExpense:removeExpense,
        );
      }

    return Scaffold(
      appBar: AppBar(
        title:const Text('Flutter ExpensesTracker'),
        actions: [
          IconButton(
            onPressed:openAddExpenseOverlay,
             icon:const Icon(Icons.add),
             ),
         ],
      ),
      body:width<600?Column(
        children: [
          Chart(expenses:registeredExpenses),
          const SizedBox(height: 20,),
          Expanded(
            child: maincontent
            ),
        ],
      ):Row(
        children: [
          Expanded(child: Chart(expenses:registeredExpenses)),
          Expanded(
            child: maincontent
            ),
        ],
      )
    );
  }
}