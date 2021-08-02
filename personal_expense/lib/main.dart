import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personal_expense/Widgets/charts.dart';
import 'package:personal_expense/Widgets/transactionlist.dart';
import 'package:personal_expense/Widgets/newtransaction.dart';

import 'Models/transaction.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //   [
  //     DeviceOrientation.portraitUp,
  //     DeviceOrientation.portraitDown,
  //   ],
  // );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personel Expenses',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              title: const TextStyle(
                  fontFamily: 'Opensans',
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
              button: TextStyle(color: Colors.white),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(fontFamily: 'Opensans', fontSize: 20),
              ),
        ),
      ),
      home: MyStateApp(),
    );
  }
}

class MyStateApp extends StatefulWidget {
  @override
  State<MyStateApp> createState() => _MyStateAppState();
}

class _MyStateAppState extends State<MyStateApp> with WidgetsBindingObserver {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: 't1',
    //   title: 'New Shoes',
    //   amount: 50,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 'T2',
    //   title: 'Grocery',
    //   amount: 20,
    //   date: DateTime.now(),
    // ),
  ];
  bool _showchart = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void didChangeApplifecycleState(AppLifecycleState state) {}

  @override
  dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  List<Transaction> get _recentTransactions {
    return _userTransactions.where(
      (tx) {
        return tx.date.isAfter(
          DateTime.now().subtract(
            Duration(days: 7),
          ),
        );
      },
    ).toList();
  }

  void _addNewtransactions(String title, double amount, DateTime choosenDate) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: choosenDate,
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransactions(_addNewtransactions),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  void _deletetransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) {
        return tx.id == id;
      });
    });
  }

  List<Widget> _buildLandscapeContent(
      PreferredSizeWidget appbar, Widget txlistwidget) {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('show chart'),
          Switch.adaptive(
            value: _showchart,
            onChanged: (val) {
              setState(() {
                _showchart = val;
              });
            },
          )
        ],
      ),
      _showchart
          ? Container(
              height: (MediaQuery.of(context).size.height -
                      appbar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.7,
              child: chart(_recentTransactions),
            )
          : txlistwidget
    ];
  }

  List<Widget> _buildPortraiteContent(
      PreferredSizeWidget appbar, Widget txlistwidget) {
    return [
      Container(
        height: (MediaQuery.of(context).size.height -
                appbar.preferredSize.height -
                MediaQuery.of(context).padding.top) *
            0.3,
        child: chart(_recentTransactions),
      ),
      txlistwidget
    ];
  }

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context);
    final islanscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    //assignment need to create a builder method for cupertino and material appbar
    final ObstructingPreferredSizeWidget appbar1 = CupertinoNavigationBar(
      middle: Text('personnel expenses'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            child: Icon(CupertinoIcons.add),
            onTap: () => _startAddNewTransaction(context),
          )
        ],
      ),
    );
    final PreferredSizeWidget appbar = AppBar(
      title: Text('Personel Expenses'),
      actions: <Widget>[
        IconButton(
          onPressed: () {
            _startAddNewTransaction(context);
          },
          icon: Icon(Icons.add),
        ),
      ],
    );
    Platform.isIOS ? appbar1 : appbar;
    final txlistwidget = Container(
      height: (MediaQuery.of(context).size.height -
              appbar.preferredSize.height -
              MediaQuery.of(context).padding.top) *
          0.7,
      child: TransactionList(_userTransactions, _deletetransaction),
    );
    final pagebody = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (islanscape) ..._buildLandscapeContent(appbar, txlistwidget),
            //the below three dpts represents a spread operator
            if (!islanscape) ..._buildPortraiteContent(appbar, txlistwidget),
            if (!islanscape) txlistwidget,
          ],
        ),
      ),
    );
    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: pagebody,
            navigationBar: appbar1,
          )
        : Scaffold(
            appBar: appbar,
            body: pagebody,
            floatingActionButton: Platform.isIOS
                ? Container()
                : FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () {
                      _startAddNewTransaction(context);
                    },
                  ),
          );
  }
}
