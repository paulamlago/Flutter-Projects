import 'package:flutter/material.dart';
import 'stocksProvider.dart';
import 'models/stockModel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StocksListing(),
    );
  }
}

class StocksListing extends StatefulWidget {
  @override
  _StocksListingState createState() => _StocksListingState();
}

class _StocksListingState extends State<StocksListing> {
  List<StockModel> stocks = List<StockModel>();

  fetchStocks() async {
    var data = await StocksProvider.getJson();

    setState(() {
      List<dynamic> results = data['results'];
      results.forEach((element) {
        stocks.add(StockModel.fromJson(element));
      });
    });
  }

  @override
  void initState() {
    super.initState();
    print("Fetching...");
    fetchStocks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("USA stocks")),
        body: Container(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: stocks == null ? 0 : stocks.length,
            itemBuilder: (context, index) {
              return Container(
                  height: 50.0,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(8.0),
                  child: StockInfo(stocks[index]));
            },
          ),
        ));
  }
}

class StockInfo extends StatelessWidget {
  final StockModel stock;

  StockInfo(this.stock);

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Container(
        alignment: Alignment.center,
        child: Text(stock.symbol),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            shape: BoxShape.rectangle,
            border: Border.all(
              color: Colors.purple,
              width: 0.7,
            )),
        width: MediaQuery.of(context).size.width * 0.9,
        height: 40,
      )
    ]);
  }
}
