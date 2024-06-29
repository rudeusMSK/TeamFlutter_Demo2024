import 'package:flutter/material.dart';

// select item: (default)
int selectedIndex = 1;

//final List<String> categoryItems = <String>[];
// demo:
const String iconAddress = "lib\\public\\icons\\category\\";
final List<String> entries = <String>[
  '${iconAddress}All.png',
  '${iconAddress}Adidas.png',
  '${iconAddress}Fila.png',
  '${iconAddress}Nike.png',
  '${iconAddress}Puna.png',
];

final List<int> colorCodes = <int>[600, 500, 100];

Widget homebody(BuildContext context) {
  return Column(
    children: [
      // Title:
      productTitle(context),
      // Category Items:
      categoryListView(context),
      // Products Items:
      Expanded(child: productListView(context)),
    ],
  );
}

/*
    widgets:
*/

// Title:
Widget productTitle(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(top: 20, left: 5, right: 5, bottom: 0),
    padding: const EdgeInsets.all(5),
    child: const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            'èn choai nêu prồ đúch',
            style: TextStyle(
              color: Color(0xFF152354),
              fontSize: 30,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Product',
            style: TextStyle(
              color: Color(0xFF152354),
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    ),
  );
}

// Category Items:
Widget categoryListView(BuildContext context) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 2),
    height: 80,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.all(2),
              width:100,
              height: 100,
              decoration: const BoxDecoration(
                // color: Colors.primaries[index % Colors.primaries.length],
                color: Color(0xFFD9D9D9),
                shape: BoxShape.circle,
              ),
              // icon:
              child: Center(
                child: Image.asset(entries[index],
                  width: 60,
                  height: 60,
                ),
              ),
            ),
          ],);
      },),
  );
}

// Products Items:
Widget productListView(BuildContext context) {
//  const title = 'Grid List';
  return GridView.count(
    crossAxisCount: 2,
    children: List.generate(100, (index) {
      return Center(
        child: Container(
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.fromLTRB(50, 2, 50, 100),
          decoration: BoxDecoration(
            color: const Color(0xFFF8F8FA),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            'Item $index',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
      );
    }),
  );
}
