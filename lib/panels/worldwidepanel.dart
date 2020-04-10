import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WorldwidePanel extends StatelessWidget {
  final Map worldData;

  const WorldwidePanel({Key key, this.worldData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2),
        children: <Widget>[
          Image.network(
            worldData['countryInfo']['flag'],
            height: 10,
            fit: BoxFit.fitWidth,
            width: MediaQuery.of(context).size.width,
          ),
          SizedBox(
            width: 10,
          ),
          StatusPanel(
            title: 'TOTAL Cases',
            panelColor: Colors.orange[100],
            textColor: Colors.black,
            count: worldData['cases'].toString(),
          ),
          StatusPanel(
            title: 'ACTIVE CASES',
            panelColor: Colors.blue[100],
            textColor: Colors.black,
            count: worldData['active'].toString(),
          ),
          StatusPanel(
            title: 'RECOVERED',
            panelColor: Colors.green[100],
            textColor: Colors.black,
            count: worldData['recovered'].toString(),
          ),
          StatusPanel(
            title: 'DEATHS',
            panelColor: Colors.red[200],
            textColor: Colors.black,
            count: worldData['deaths'].toString(),
          ),
          StatusPanel(
            title: 'Today Cases',
            panelColor: Colors.indigo[100],
            textColor: Colors.black,
            count: worldData['todayCases'].toString(),
          ),
          StatusPanel(
            title: 'Critical Cases',
            panelColor: Colors.yellow[100],
            textColor: Colors.black,
            count: worldData['critical'].toString(),
          ),
        ],
      ),
    );
  }
}

class StatusPanel extends StatelessWidget {
  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  const StatusPanel(
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
