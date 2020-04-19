import 'dart:convert';

import 'package:coronaapp/datasource.dart';
import 'package:coronaapp/pages/countryPage.dart';
import 'package:coronaapp/panels/infoPanel.dart';
import 'package:coronaapp/panels/worldwidepanel.dart';
import 'package:coronaapp/panels/worldwidePanel2.dart';
import 'package:coronaapp/panels/mosteffectedcountries.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pie_chart/pie_chart.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Map worldData;
  fetchWorldWideData() async {
    http.Response response =
    await http.get('https://corona.lmao.ninja/v2/countries/sri%20lanka');
    setState(() {
      worldData = json.decode(response.body);
    });
  }

  Map worldData2;
  fetchWorldWideData2() async {
    http.Response response =
    await http.get('https://corona.lmao.ninja/v2/all');
    setState(() {
      worldData2 = json.decode(response.body);
    });
  }
  List countryData;
  fetchcountryData() async {
    http.Response response =
    await http.get('https://corona.lmao.ninja/v2/countries?sort=cases');
    setState(() {
      countryData = json.decode(response.body);
    });
  }
    Future fetchData() async{
      fetchWorldWideData();
      fetchWorldWideData2();
      fetchcountryData();
    }
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: <Widget>[
      IconButton(icon: Icon(Theme.of(context).brightness==Brightness.light?Icons.lightbulb_outline:Icons.highlight), onPressed: (){
    DynamicTheme.of(context).setBrightness(Theme.of(context).brightness==Brightness.light?Brightness.dark:Brightness.light);
    })
],
        title: Text('COVIOD-19 Records'),
      ),
      body:  SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 90,
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                color: Colors.black,
                child: Text(DataSource.quote,
                    style: TextStyle(
                        color: Colors.white,
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
                      'COVID-19 Sri Lanka',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(),

                  ],
                ),
              ),
              worldData == null
                  ? CircularProgressIndicator()
                  : WorldwidePanel(
                worldData: worldData,
              ),
              worldData==null?CircularProgressIndicator():
              PieChart(dataMap: {
                'Active':worldData['active'].toDouble(),
                'Recovered':worldData['recovered'].toDouble(),
                'Deaths':worldData['deaths'].toDouble(),

              },
              colorList: [
                Colors.blue,
                Colors.green,
                Colors.red
              ],),
              SizedBox(
                height: 30,
              ),
              Center(

                child: Text(
                  'COVID-19 World Wide',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ),
              worldData2== null
                  ? CircularProgressIndicator()
                  : WorldwidePanel2(
                worldData2: worldData2,
              ),

              worldData2==null?CircularProgressIndicator():
              PieChart(dataMap: {
                'Active':worldData2['active'].toDouble(),
                'Recovered':worldData2['recovered'].toDouble(),
                'Deaths':worldData2['deaths'].toDouble(),

              },
                colorList: [
                  Colors.blue,
                  Colors.green,
                  Colors.red
                ],),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Most Affected Countries',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
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
                              borderRadius: BorderRadius.circular(9)),
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Other Countries',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ],


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
        )
    );
  }
}