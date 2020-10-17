import 'package:flutter/material.dart';
import 'package:shoopappfinal/providers/orders.dart';



class OrderItemWidget extends StatelessWidget {

  final OrderItem order;

  OrderItemWidget(this.order);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text("\$${order.amount}"),
            subtitle: Text(order.dateTime.toString()),
            trailing: IconButton(
              icon: Icon(Icons.expand_more),
              onPressed: (){},
            ),
          )
        ],
      ),
    );
  }
}
