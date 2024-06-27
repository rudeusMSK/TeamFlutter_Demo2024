import 'package:flutter/material.dart';

final List<String> entries = <String>['Logo1', 'Logo2', 'Logo3'];
final List<int> colorCodes = <int>[600, 500, 100];

Widget homebody(BuildContext context) {
  return Column(
    children: [
      const Text(
        'èn choai nêu prồ đúch',
        style: TextStyle(
          color: Colors.green,
        ),
        textAlign: TextAlign.center,
      ),
      const Text(
        'Product',
        style: TextStyle(
          color: Colors.green,
        ),
        textAlign: TextAlign.left,
      ),
      categoryListView(context),
      Expanded(child: productListView(context)),
    ],
  );
}

Widget categoryListView(BuildContext context) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 2),
    height: 50, // Height of the parent Container
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(2),
              width: 160,
              height: 40,
              color: Colors.primaries[index % Colors.primaries.length],
              child: Center(child: Text('Entry ${entries[index]}')),
            ),
          ],
        );
      },
    ),
  );
}

Widget productListView(BuildContext context) {
//  const title = 'Grid List';
  return GridView.count(
    // Create a grid with 2 columns. If you change the scrollDirection to
    // horizontal, this produces 2 rows.
    crossAxisCount: 2,
    // Generate 100 widgets that display their index in the List.
    children: List.generate(100, (index) {
      return Center(
        child: Text(
          'Item $index',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      );
    }),
  );
}
