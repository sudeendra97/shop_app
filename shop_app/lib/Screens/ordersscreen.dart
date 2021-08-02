import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/orders.dart' show Orders;
import 'package:shop_app/widgets/appdrawer.dart';
import 'package:shop_app/widgets/orderitem.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  static const routeName = '/orders';

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  // var _isLoading = false;

  // @override
  // void initState() {

  //todo all this is not necessary because we are using future builder method
  //   Future.delayed(Duration.zero).then((value) async {
  //    setState(() {
  // _isLoading = true;
  // //    });
  // Provider.of<Orders>(context, listen: false)
  //     .fetchAndSetOrders()
  //     .then((value) {
  //   setState(() {
  //     _isLoading = false;
  //   });
  // });

  //   super.initState();
  // }

  late Future _orderFuture;
  Future _obtainOrderFuture() {
    return Provider.of<Orders>(context, listen: false).fetchAndSetOrders();
  }

  @override
  void initState() {
    _orderFuture = _obtainOrderFuture();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('building Orders');
    //this below line will cause build method  to run infinitely because when fetch and set orders will run it wll notify the listeners
    //below listener will run and it will call build method again and build agin runs whole process
    // todo final orderData = Provider.of<Orders>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your orders'),
        ),
        drawer: AppDrawer(),
        body: FutureBuilder(
          future: _orderFuture,
          builder: (ctx, dataSnapShop) {
            if (dataSnapShop.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (dataSnapShop.error != null) {
                return const Center(
                  child: Text('An error Occured'),
                );
              } else {
                return Consumer<Orders>(
                  builder: (ctx, orderData, child) => ListView.builder(
                    itemCount: orderData.orders.length,
                    itemBuilder: (BuildContext context, int index) =>
                        OrderItem(orderData.orders[index]),
                  ),
                );
              }
            }
          },
        ));
  }
}
