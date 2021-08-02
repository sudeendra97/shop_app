import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Screens/cartscreen.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/providers/productsblueprint.dart';
import 'package:shop_app/widgets/appdrawer.dart';
import 'package:shop_app/widgets/badge.dart';
import 'package:shop_app/widgets/productgrid.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductOverviewScreen extends StatefulWidget {
  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showOnlyFavorites = false;
  var _isInit = true;
  var _IsLoading = false;

  void initState() {
    super.initState();
    // Provider.of<Products>(context).fetchAndSetProduct();wont work because of .of context will trigger build method but build method will not yet be completed
//but if we set listen = false then it may work
    // Future.delayed(Duration.zero).then(
    //   (value) {
    //     Provider.of<Products>(context).fetchAndSetProduct();
    //   },
    // ); HACK
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _IsLoading = true;
      });

      Provider.of<Products>(context).fetchAndSetProduct().then((value) {
        _IsLoading = false;
      });
    }
    _isInit = false;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            onSelected: (FilterOptions selectedValue) {
              setState(
                () {
                  if (selectedValue == FilterOptions.Favorites) {
                    _showOnlyFavorites = true;
                  } else {
                    _showOnlyFavorites = false;
                  }
                },
              );
            },
            itemBuilder: (_) => [
              const PopupMenuItem(
                child: Text('only Favorites'),
                value: FilterOptions.Favorites,
              ),
              const PopupMenuItem(
                child: Text('show All'),
                value: FilterOptions.All,
              )
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, child) => Badge(
              child: child!,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
              icon: const Icon(
                Icons.shopping_cart,
              ),
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: _IsLoading
          ? Center(
              // ignore: prefer_const_constructors
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Loading Data', style: TextStyle(fontSize: 20)),
                    SizedBox(
                      height: 5,
                    ),
                    const CircularProgressIndicator(),
                  ]),
            )
          : ProductsGrid(_showOnlyFavorites),
    );
  }
}
