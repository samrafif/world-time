import 'package:flutter/material.dart';

Table buildTable() {
  return Table(
    border: TableBorder.all(),
    children: [
      TableRow( children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children:[
            Text('✔'),
            Text('Permissions')
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              children:[
                Text('✖'),
                Text('Limitations')
              ]),
        ),
      ]),
      TableRow( children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Commercial use'),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Liability'),
        )
      ]),
      TableRow( children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(' Modification'),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Warranty'),
        )
      ]),
      TableRow( children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Distribution'),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(''),
        )
      ]),
      TableRow( children: [
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Text('Distribution'),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(''),
     )
    ]),
      TableRow( children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Patent use'),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(''),
        )
      ]),
      TableRow( children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Private use'),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(''),
        )
      ]),
    ]);
}
