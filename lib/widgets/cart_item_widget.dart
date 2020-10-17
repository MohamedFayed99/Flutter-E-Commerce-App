import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoopappfinal/providers/cart.dart';

class CartItemWidget extends StatelessWidget {

  final String id;
  final String productId;
  final String title;
  final double price;
  final int quantity;

  CartItemWidget(
      this.id,
      this.productId,
      this.title,
      this.price,
      this.quantity
      );
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key:ValueKey(id),
      background: Container(
        color: Colors.red,
        child: Icon(
          Icons.delete,size: 40,
          color: Colors.white,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(horizontal: 15,vertical: 4),
      ),
      onDismissed: (direction){
        Provider.of<Cart>(context,listen: false).removeItem(productId);
      },
      direction: DismissDirection.endToStart,

      confirmDismiss: (direction){
        return showDialog(
          context: context,

        builder: (context) => AlertDialog(
          title: Text('Are you sure?'),
          content: Text('Do you want to remove the item from the cart?'),
          actions: [
            FlatButton(
              child: Text('No'),
              onPressed: (){
                Navigator.of(context).pop(false);
              },
            ),
            FlatButton(
              child: Text('Yes'),
              onPressed: (){
                Navigator.of(context).pop(true);
              },
            ),
          ],
        )
        );
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15,vertical: 4),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: FittedBox(
                    child: Text("\$$price"),
                ),
              ),
            ),
            title: Text(title),
            subtitle: Text('Total: \$${(price * quantity)}'),
            trailing: Text('$quantity'),
          ),
        ),

      ),
    );
  }
}
