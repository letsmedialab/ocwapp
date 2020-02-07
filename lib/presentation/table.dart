import 'package:flutter/material.dart';
import 'package:ocwapp/actions/user_action.dart';

Widget table(List<DataRow> data) {
  return SingleChildScrollView(
    child: Column(
      children: <Widget>[
        DataTable(
          columnSpacing: 10,
          columns: [
            DataColumn(
                label: Text(
              "Snr",
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w300,
                  fontSize: 20),
            )),
            DataColumn(
                label: Text("Number",
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w300,
                        fontSize: 20))),
            DataColumn(
                label: Text(
              "Date&Time",
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w300,
                  fontSize: 20),
            )),
            DataColumn(
                label: Text(
              "Seconds",
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w300,
                  fontSize: 20),
            )),
          ],
          rows: data,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FloatingActionButton(
                onPressed: () async {
                  OnRefreshWallet();
                  await Future.delayed((Duration(seconds: 2)));
                  return null;
                },
                tooltip: 'Refresh',
                child: Icon(Icons.refresh),
              ),
            ],
          ),
        ), //
      ],
    ),
  );
}
