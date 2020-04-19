import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WorldwidePanel2 extends StatelessWidget {
  final Map worldData2;

  const WorldwidePanel2({Key key, this.worldData2}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2),
        children: <Widget>[

          StatusPanel2(
            title: 'TOTAL Cases',
            panelColor: Colors.orange[100],
            textColor: Colors.black,
            count: worldData2['cases'].toString(),
          ),
          StatusPanel2(
            title: 'ACTIVE CASES',
            panelColor: Colors.blue[100],
            textColor: Colors.black,
            count: worldData2['active'].toString(),
          ),
          StatusPanel2(
            title: 'RECOVERED',
            panelColor: Colors.green[100],
            textColor: Colors.black,
            count: worldData2['recovered'].toString(),
          ),
          StatusPanel2(
            title: 'DEATHS',
            panelColor: Colors.red[200],
            textColor: Colors.black,
            count: worldData2['deaths'].toString(),
          ),
          StatusPanel2(
            title: 'Today Cases',
            panelColor: Colors.indigo[100],
            textColor: Colors.black,
            count: worldData2['todayCases'].toString(),
          ),
          StatusPanel2(
            title: 'Critical Cases',
            panelColor: Colors.yellow[100],
            textColor: Colors.black,
            count: worldData2['critical'].toString(),
          ),
          StatusPanel2(
            title: 'Affected Countries',
            panelColor: Colors.brown[100],
            textColor: Colors.black,
            count: worldData2['affectedCountries'].toString(),
          ),
        ],
      ),
    );
  }
}

class StatusPanel2 extends StatelessWidget {
  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  const StatusPanel2(
      {Key key, this.panelColor, this.textColor, this.title, this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(10),
      height: 80,
      width: width / 2,
      color: panelColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: textColor),
          ),
          Text(
            count,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: textColor),
          )
        ],
      ),
    );
  }
}
