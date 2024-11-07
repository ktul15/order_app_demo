import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:order_app_demo/add_order/data/models/response/get_customer_response.dart';
import 'package:order_app_demo/add_order/domain/models/unit.dart';
import 'package:order_app_demo/utils/app_colors.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage(
      {super.key, required this.customer, required this.units});

  final GetCustomersResult customer;
  final List<ProductUnit> units;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.orderDetailsAppBarTitle,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: Column(
            children: [
              Container(
                color: AppColor.primaryColor,
                width: MediaQuery.of(context).size.width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(customer.name ?? ""),
                    Text(customer.discountPercentage.toString() ?? ""),
                  ],
                ),
              ),
              UnitTable(
                units: units,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UnitTable extends StatelessWidget {
  UnitTable({super.key, required this.units});

  final List<ProductUnit> units;

  final listOfTableRows = [
    TableRow(
      children: <Widget>[
        Container(
          height: 64,
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 4,
          ),
          color: Colors.grey,
          alignment: Alignment.center,
          child: const Text("Name"),
        ),
        Container(
          height: 64,
          padding: EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 4,
          ),
          color: Colors.grey,
          alignment: Alignment.center,
          child: const Text("Qty"),
        ),
        Container(
          height: 64,
          padding: EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 4,
          ),
          color: Colors.grey,
          alignment: Alignment.center,
          child: const Text("Unit Price"),
        ),
        Container(
          height: 64,
          padding: EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 4,
          ),
          color: Colors.grey,
          alignment: Alignment.center,
          child: const Text("Total Price"),
        ),
        Container(
          height: 64,
          padding: EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 4,
          ),
          color: Colors.grey,
          alignment: Alignment.center,
          child: const Text("Net Price (%)"),
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    units.map((unit) {
      final totalPrice = (unit.product.price ?? 0) * unit.quantity;
      final netPrice = totalPrice -
          ((unit.customer.discountPercentage == 0
                      ? 0
                      : (unit.customer.discountPercentage ?? 1)) /
                  100) *
              totalPrice;
      listOfTableRows.add(TableRow(children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          alignment: Alignment.center,
          child: Text(unit.product.name ?? ""),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          alignment: Alignment.center,
          child: Text(unit.quantity.toString() ?? ""),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          alignment: Alignment.center,
          child: Text(unit.product.price.toString() ?? ""),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          alignment: Alignment.center,
          child: Text(
            (totalPrice.toStringAsFixed(2)),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          alignment: Alignment.center,
          child: Text(netPrice.toStringAsFixed(2)),
        ),
      ]));
    }).toList();
    return Column(
      children: [
        Table(
          border: const TableBorder.symmetric(
              outside: BorderSide(color: Colors.black),
              inside: BorderSide(
                color: Colors.black,
              )),
          defaultColumnWidth: const IntrinsicColumnWidth(),
          columnWidths: const <int, TableColumnWidth>{
            0: FractionColumnWidth(0.40),
            1: FractionColumnWidth(0.15),
            2: FractionColumnWidth(0.15),
            3: FractionColumnWidth(0.15),
            4: FractionColumnWidth(0.15),
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: listOfTableRows,
        ),
      ],
    );
  }
}
