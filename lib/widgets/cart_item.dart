import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_second_time/providers/cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;

  CartItem(
    this.id,
    this.productId,
    this.quantity,
    this.price,
    this.title,
  );

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      confirmDismiss: (direction) {
        // return showModalBottomSheet(
        //     context: context,
        //     builder: (_) {
        //       return Container(
        //         padding: EdgeInsets.only(top: 10),
        //         height: 300,
        //         child: Column(
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             Text('Edit nickName'),
        //             Padding(
        //               padding: EdgeInsets.all(20),
        //               child: Container(
        //                 padding:EdgeInsets.only(right: 25,left: 25) ,
        //                 child: TextField(
        //                   decoration: InputDecoration(labelText: 'name'),
        //
        //                 ),
        //                 decoration: BoxDecoration(
        //                   border: Border.all(
        //                     width: .6,
        //                     color: Colors.black,
        //                   ),
        //                   borderRadius: BorderRadius.circular(5),
        //                 ),
        //               ),
        //             ),
        //             Row(
        //               //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //               children: [
        //                 Expanded(
        //                   child: Container(
        //                     child: FlatButton(
        //                       onPressed: () {},
        //                       child: Text('Cancel'),
        //                     ),
        //                     decoration: BoxDecoration(
        //                       border: Border.all(
        //                         width: .5,
        //                         color: Colors.grey,
        //                       ),
        //                     ),
        //                   ),
        //                 ),
        //                 Expanded(
        //                   child: Container(
        //                     child: FlatButton(
        //                       onPressed: () {},
        //                       child: Text('Save'),
        //                     ),
        //                     decoration: BoxDecoration(
        //                       border: Border.all(
        //                         width: .5,
        //                         color: Colors.grey,
        //                       ),
        //
        //                     ),
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ],
        //         ),
        //       );
        //     });
       return showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: Text('Are You Sure?'),
                content: Text('Do you want to remove the item from the cart ?'),
                actions: [

                  FlatButton(onPressed: (){
                    Navigator.of(ctx).pop(false);
                  }, child: Text('No'),),
                  FlatButton(onPressed: (){
                    Navigator.of(ctx).pop(true);
                  }, child: Text('Yes'),),
                ],
              ),

            );
      },
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      direction: DismissDirection.endToStart,
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(
          right: 20,
        ),
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
      ),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: FittedBox(
                  child: Text('\$$price'),
                ),
              ),
            ),
            title: Text(title),
            subtitle: Text('Total : \$${price * quantity}'),
            trailing: Text('$quantity x'),
          ),
        ),
      ),
    );
  }
}
