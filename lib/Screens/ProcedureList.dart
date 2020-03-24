import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cost_care/api/api.dart';
import 'package:cost_care/model/procedure.dart';
import 'package:cost_care/utils/ProcedureTile.dart';

class ProcedureList extends StatefulWidget {
  final query;

  ProcedureList(this.query);

  @override
  _ProcedureListState createState() => _ProcedureListState(query);
}

class _ProcedureListState extends State<ProcedureList> {
  List<Procedure> data;

  final query;

  _ProcedureListState(this.query);

  Future<bool> getAPIResponse() async {
    var result = await getProcedureList();
    print(result);
    setState(() {
      data = result;
    });
    return true;
  }

  var _controller;
  @override
  void initState() {
    super.initState();
    getAPIResponse();
    _controller = new TextEditingController(text: query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: TextField(
                  controller: _controller,
                  onSubmitted: (String str) {},
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search), hintText: 'Enter Search'),
                )),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (ctx, idx) {
                return Card(
                    elevation: 5,
                    child: ProcedureTile(
                      procedure: data[idx],
                    ));
              },
              itemCount: data == null ? 0 : data.length,
            ),
          ),
        ],
      ),
    );
  }
}
