import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Referrals',
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Table(
            border: TableBorder.all(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            columnWidths: {
              0: FractionColumnWidth(0.6),
            },
            children: [
              buildRow(
                ['Referral Name', 'Amount(Rs)'],
                true,
              ),
              buildRow(
                ['Saswata Saha', 'Cell 2'],
              ),
              buildRow(
                ['Sougoto Roy Choudhary', 'Cell 2'],
              ),
              buildRow(
                ['Debjit Sarkar', 'Cell 2'],
              ),
            ],
          ),
        ),
      ),
    );
  }

  TableRow buildRow(List<String> cells, [bool isHeading = false]) => TableRow(
        children: cells.map((e) {
          return Container(
            padding: const EdgeInsets.all(16),
            color: Colors.transparent,
            alignment: Alignment.center,
            child: Text(
              textAlign: TextAlign.center,
              isHeading ? e.toUpperCase() : e,
            ),
          );
        }).toList(),
      );
}
