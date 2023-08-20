import 'package:expense_tracker/Models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {

  final List<Expense> _registerExpenses = [
    Expense(
    title: 'Flutter Course', 
    amount: 19.99, 
    date: DateTime.now(), 
    category: Category.work
    ),
    Expense(
    title: 'Cinema', 
    amount: 14.99, 
    date: DateTime.now(), 
    category: Category.leisure
    ),
  ];

  void _openAddExpenseOverLay() {
    showModalBottomSheet(context: context, builder: (ctx) { // =>
      return const NewExpense();
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Expenss Tracker'),
        actions: [
          IconButton(onPressed: _openAddExpenseOverLay, 
          icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [
          const Text("The Chart"),
          Expanded(
            child: ExpensesList(expenses: _registerExpenses),
          ),
        ],
      ),
    );
  }
}