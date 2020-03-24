import 'package:flutter/cupertino.dart';
import 'package:cost_care/utils/TextStyles.dart';
import 'package:cost_care/utils/Consts.dart';

class LocationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            BoldText("Location", 20.0, kblack),
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset(
                "assets/plazamap.png",
                fit: BoxFit.fill,
                height: MediaQuery.of(context).size.width - 90,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
