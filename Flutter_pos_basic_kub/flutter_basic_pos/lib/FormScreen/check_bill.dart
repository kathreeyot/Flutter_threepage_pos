import 'package:flutter/material.dart';
import '../required data/menu_item.dart';
import 'package:esc_pos_printer/esc_pos_printer.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';

class CheckBillScreen extends StatelessWidget {
  final List<MenuItem> selectedItems;

  const CheckBillScreen({Key? key, required this.selectedItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Confirmation'),
      ),
      body: ListView.builder(
        itemCount: selectedItems.length,
        itemBuilder: (ctx, index) {
          final selectedItem = selectedItems[index];
          return ListTile(
            title: Text(selectedItem.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(selectedItem.description),
                Text(
                  'Quantity: ${selectedItem.quantity}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            trailing: Text(
              '${(selectedItem.price * selectedItem.quantity).toStringAsFixed(2)} บาท',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('Print Bill'),
        ),
      ),
    );
  }
}
