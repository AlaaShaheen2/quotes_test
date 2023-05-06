import 'package:flutter/material.dart';
import 'package:quotes_test/main.dart';

class CardWidget extends StatelessWidget {
  final Function delete;
  final BestQuotes item;
  const CardWidget({super.key, required this.delete, required this.item});
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.all(12),
      color: Color.fromARGB(255, 57, 66, 150),
      child: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              item.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
              textDirection: TextDirection.rtl,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textDirection: TextDirection.rtl,
              children: [
                Text(
                  item.author,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    delete(item);
                  },
                  icon: Icon(Icons.delete),
                  iconSize: 24,
                  color: Color.fromARGB(255, 238, 132, 124),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
