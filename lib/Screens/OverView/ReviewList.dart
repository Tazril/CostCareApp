import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cost_care/utils/TextStyles.dart';
import 'package:cost_care/utils/Consts.dart';

class ReviewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  BoldText("Reviews", 20.0, kblack),
                  BoldText("See all", 16, kdarkBlue),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: 50.0,
                    decoration: BoxDecoration(
                      color: korange,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.star,
                          color: kwhite,
                          size: 15.0,
                        ),
                        BoldText("4.5", 15.0, kwhite),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  NormalText("(420 reviews)", kgreyDark, 14),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              reviewProfile("Hichem", "5.0", "05,Mar,2020"),
              reviewProfile("Walid", "3.5", "17,feb,2020"),
              reviewProfile("kratos", "4.0", "10,jan,2020"),
            ],
          ),
        ),
      ),
    );
  }

  Widget reviewProfile(String name, String review, String date) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              width: 24,
              height: 24,
              child: CircleAvatar(
                backgroundColor: kgreyDark,
                child: Icon(
                  Icons.person,
                  size: 12,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            BoldText(name, 16, kblack)
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: <Widget>[
            Container(
              width: 50.0,
              decoration: BoxDecoration(
                color: korange,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.star,
                    color: kwhite,
                    size: 15.0,
                  ),
                  BoldText(review, 15.0, kwhite),
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            NormalText(date, kgreyDark, 12.0)
          ],
        ),
        SizedBox(
          height: 10,
        ),
        NormalText(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit,"
            " sed do eiusmod tempor incididunt ut labore et dolore magna"
            " aliqua. Ut enim ad minim veniam.",
            kblack,
            12.0),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
