import 'package:bit_brazil/services/api.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

main() => runApp(HomeWidget());

class HomeWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Bit Brazil'),
        ),
        body: FutureBuilder(
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.done) {
              return ListView.builder(
                padding: EdgeInsets.all(8),
                itemCount: snap.data.bids.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: Text(snap.data.bids[index].price.toString()),
                    height: 50,
                  );
                },
              );
            } else {
              return Text("Data not available yet");
            }
          },
          future: getOrderbook()
        )
      )
    );
  }
}
