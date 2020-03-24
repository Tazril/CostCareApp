import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cost_care/Screens/OverView/OverViewScreen.dart';

class ProcedureTile extends StatelessWidget {
  final procedure;
  const ProcedureTile({Key key, this.procedure}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => OverViewPage(procedure)));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xffFFEEE0), borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
        child: Row(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  procedure.name,
                  style: TextStyle(
                    color: Color(0xffFC9535),
                    fontSize: 19,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  procedure.hospitalName,
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  "${procedure.distance} kms away",
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  "updated on ${procedure.lastUpdated}",
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                )
              ],
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 9),
              decoration: BoxDecoration(
                  color: Color(0xffFBB97C),
                  borderRadius: BorderRadius.circular(13)),
              child: Text(
                "\$${procedure.charge}",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}
