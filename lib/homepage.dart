import 'dart:convert';

import 'package:coronaapp/datasource.dart';
import 'package:coronaapp/pages/countryPage.dart';
import 'package:coronaapp/panels/infoPanel.dart';
import 'package:coronaapp/panels/worldwidepanel.dart';
import 'package:coronaapp/panels/mosteffectedcountries.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Map worldData;
  fetchWorldWideData() async {
    http.Response response =
    await http.get('https://corona.lmao.ninja/countries/sri%20lanka');
    setState(() {
      worldData = json.decode(response.body);
    });
  }

  List countryData;
  fetchcountryData() async {
    http.Response response =
    await http.get('https://corona.lmao.ninja/countries?sort=cases');
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchWorldWideData();
    fetchcountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('COVIOD-19 Records'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 90,
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              color: Colors.brown[100],
              child: Text(DataSource.quote,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22)),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'COVID-19 SRI LANKA',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CountryPage()));
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            color: primaryBlack,
                            borderRadius: BorderRadius.circular(15)),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Regional',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ],
              ),
            ),
            worldData == null
                ? CircularProgressIndicator()
                : WorldwidePanel(
              worldData: worldData,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'Most Affected Countries',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            countryData == null
                ? Container()
                : MostAffectedPanel(
              countryData: countryData,
            ),
            InfoPanel(),
            SizedBox(
              height: 20,
            ),
            Center(
                child: Text(
                  'PREVENTION IS BETTER THAN CURE',
                  style: TextStyle(fontSize: 16),
                )),
            Center(
                child: Text(
                  '-SachinSagi-',
                  style: TextStyle(fontSize: 15),
                )),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}