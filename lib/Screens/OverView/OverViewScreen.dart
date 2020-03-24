import 'package:flutter/material.dart';
import 'package:cost_care/Screens/OverView/Location.dart';
import 'package:cost_care/api/api.dart';
import 'package:cost_care/model/hospital.dart';
import 'package:cost_care/model/procedure.dart';
import 'package:cost_care/utils/TextStyles.dart';
import 'package:cost_care/utils/Consts.dart';
import 'package:url_launcher/url_launcher.dart';

import 'ReviewList.dart';

class OverViewPage extends StatefulWidget {
  final Procedure procedure;
  OverViewPage(this.procedure);

  @override
  _OverViewPageState createState() => _OverViewPageState(procedure);
}

class _OverViewPageState extends State<OverViewPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  final procedure;
  _OverViewPageState(this.procedure);

  @override
  void initState() {
    super.initState();
    getAPIResponse(this.procedure.hospitalId);
    tabController = new TabController(length: 3, vsync: this);
  }

  Hospital hospital;
  Future<bool> getAPIResponse(int hospitalId) async {
    var result = await getHospital(hospitalId);
    setState(() {
      hospital = result;
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            child: Container(
                width: MediaQuery.of(context).size.width,
                child: Image.asset("assets/hospital.jpg")),
          ),
          Positioned(
            top: 200.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 400,
                child: Scaffold(
                  appBar: TabBar(
                    labelColor: kdarkBlue,
                    labelStyle: TextStyle(
                        fontFamily: "nunito", fontWeight: FontWeight.bold),
                    controller: tabController,
                    indicatorColor: kdarkBlue,
                    tabs: <Widget>[
                      Tab(text: "OverView"),
                      Tab(text: "Location"),
                      Tab(text: "Review"),
                    ],
                  ),
                  backgroundColor: kwhite,
                  body: Stack(
                    children: <Widget>[
                      TabBarView(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                BoldText(procedure.hospitalName, 20.0, kblack),
                                Row(
                                  children: <Widget>[
                                    BoldText("4.5 Stars", 12.0, korange),
                                    SizedBox(
                                      width: 16.0,
                                    ),
                                    Icon(
                                      Icons.location_on,
                                      color: kgreyDark,
                                      size: 15.0,
                                    ),
                                    NormalText("Oran", kgreyDark, 15.0),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                NormalText("${procedure.distance} kms away",
                                    kgreyDark, 16.0),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Container(
                                  height: 2,
                                  color: kgreyFill,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    BoldText(procedure.name, 20.0, kblack),
                                    // BoldText("More", 16, kdarkBlue)
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                NormalText(
                                    "Price: \$${procedure.charge} \nLast updated On: ${procedure.lastUpdated}",
                                    kblack,
                                    12.0),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Container(
                                  height: 2,
                                  color: kgreyFill,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    BoldText("Contact", 20.0, kblack),
                                    // BoldText("More", 16, kdarkBlue),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    contactItem(Icons.web, "Website",
                                        url: hospital?.webUrl),
                                    contactItem(Icons.live_help, "Query",
                                        url: hospital?.queryUrl),
                                    contactItem(Icons.call, "Call"),
                                  ],
                                )
                              ],
                            ),
                          ),
                          LocationView(),
                          ReviewList(),
                        ],
                        controller: tabController,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  contactItem(IconData icon, String text, {String url}) {
    return GestureDetector(
      onTap: () => {if (url != null) _launchURL(url)},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            icon,
            color: kdarkBlue,
          ),
          NormalText(text, kdarkBlue, 12)
        ],
      ),
    );
  }

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
