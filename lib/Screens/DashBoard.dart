import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cost_care/Screens/ProcedureList.dart';
import 'package:cost_care/api/data.dart';
import 'package:cost_care/model/speciality.dart';
import 'package:cost_care/utils/Category.dart';
import 'package:cost_care/utils/NearbyHospital.dart';
import 'package:cost_care/utils/Specialist.dart';
import 'package:cost_care/utils/TextStyles.dart';
import 'package:cost_care/utils/Consts.dart';

String selectedCategorie = "Adults";

class Dashboard extends StatefulWidget {
  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  List<SpecialityModel> specialities;

  @override
  void initState() {
    super.initState();
    specialities = getSpeciality();
  }

  List<String> categories = ["Adults", "Childrens", "Womens", "Mens"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 250.0,
              width: 500.0,
              child: Stack(
                alignment: AlignmentDirectional.topStart,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      "assets/home1.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 60.0, left: 20, right: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          BoldText("Search for", 30.0, kblack),
                          BoldText("Procedures", 30.0, kblack)
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 30.0, left: 20, right: 20),
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: TextField(
                          onSubmitted: (String str) {
                            setState(() {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) {
                                return ProcedureList(str);
                                // return OverViewPage();
                              }));
                            });
                          },
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search),
                              hintText: 'Enter Search'),
                        )),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Categories",
                      style: TextStyle(
                          color: Colors.black87.withOpacity(0.8),
                          fontSize: 25,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 16.0),
                    child: Container(
                      height: 30,
                      child: ListView.builder(
                          itemCount: categories.length,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CategorieTile(
                              categorie: categories[index],
                              isSelected:
                                  selectedCategorie == categories[index],
                              context: this,
                            );
                          }),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 16.0),
                    child: Container(
                      height: 250,
                      child: ListView.builder(
                          itemCount: specialities.length,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return SpecialistTile(
                              imgAssetPath: specialities[index].imgAssetPath,
                              speciality: specialities[index].speciality,
                              noOfHospitals: specialities[index].noOfHospitals,
                              backColor: specialities[index].backgroundColor,
                            );
                          }),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Nearby Hospitals ",
                      style: TextStyle(
                          color: Colors.black87.withOpacity(0.8),
                          fontSize: 25,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 400,
                    height: 250,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      children: <Widget>[
                        NearbyHospital("assets/sheraton.jpg",
                            "Miami HealthCare", "Miami", 4.5),
                        NearbyHospital("assets/Meridien.jpg", "Gotham Hospital",
                            "Gotham", 4.8),
                        NearbyHospital("assets/ibis.jpg", "AltonHospital",
                            "Los Angeles", 3.1),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
