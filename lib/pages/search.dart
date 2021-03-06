import 'package:coronaapp/datasource.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';

class Search extends SearchDelegate{

  final List countryList;

  Search(this.countryList);


  @override
  ThemeData appBarTheme(BuildContext context) {
    // TODO: implement appBarTheme
    return ThemeData(
      primaryColor: primaryBlack,
      brightness: DynamicTheme.of(context).brightness
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
  return [
    IconButton(icon: Icon(Icons.clear), onPressed: (){
        query='';
    })
  ];
  }

  @override
  Widget buildLeading(BuildContext context) {
      return IconButton(icon: Icon(Icons.arrow_back), onPressed:(){
        Navigator.pop(context);
      },);
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
   return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    final suggestionList=query.isEmpty?countryList:countryList.where((element)=>element['country'].toString().toLowerCase().startsWith(query)).toList();


    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context,index){
      return Card(
        child: Container(
          height: 130,
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      suggestionList[index]['country'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Image.network(
                      suggestionList[index]['countryInfo']['flag'],
                      height: 50,
                      width: 60,
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'CONFIRMED:' +
                              suggestionList[index]['cases'].toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                        Text(
                          'NEW CASES:' +
                              suggestionList[index]['todayCases'].toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Text(
                          'ACTIVE:' +
                              suggestionList[index]['active'].toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                        Text(
                          'RECOVERED:' +
                              suggestionList[index]['recovered'].toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green),
                        ),
                        Text(
                          'DEATHS:' +
                              suggestionList[index]['deaths'].toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800]),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      );
    });
  }

}