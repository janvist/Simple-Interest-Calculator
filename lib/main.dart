import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Simple Interest Calculator App",
    home: SI(),
  ));
}

class SI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SIState();
  }
}

class _SIState extends State<SI> {
  var _currencies = ['Rupees', 'Dollar', 'Pounds'];
  final _minimumpadding = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Simple Interest Calculator",
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            getimage(),
            Padding(
              padding: EdgeInsets.only(
                  top: _minimumpadding,
                  bottom: _minimumpadding,
                  left: _minimumpadding),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Principal',
                    hintText: 'Enter principal e.g. 12000 ',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: _minimumpadding,
                  bottom: _minimumpadding,
                  left: _minimumpadding),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'In percentage',
                    hintText: 'enter rate of interest e.g. 2',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(
                    top: _minimumpadding,
                    bottom: _minimumpadding,
                    left: _minimumpadding),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'Term',
                            hintText: 'Time in years ',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      ),
                    ),
                    Container(
                      width: _minimumpadding * 5,
                    ),
                    Expanded(
                        child: DropdownButton<String>(
                      items: _currencies.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      value: 'Rupees',
                      onChanged: (dynamic newvalueselected) {},
                    )),
                  ],
                )),
            Padding(
                padding: EdgeInsets.only(
                    top: _minimumpadding,
                    bottom: _minimumpadding,
                    left: _minimumpadding),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: RaisedButton(
                      child: Text("Calculate"),
                      onPressed: () {},
                    )),
                    Expanded(
                        child: RaisedButton(
                      child: Text("Reset"),
                      onPressed: () {},
                    )),
                  ],
                )),
            Padding(
              padding: EdgeInsets.all(_minimumpadding * 2),
              child: Text('TO do text'),
            )
          ],
        ),
      ),
    );
  }

  Widget getimage() {
    AssetImage assetImage = AssetImage('images/bank.png');
    Image image = Image(
      image: assetImage,
      width: 250.0,
      height: 250.0,
    );

    return Container(
      child: image,
      margin: EdgeInsets.all(_minimumpadding * 10),
      alignment: Alignment.center,
    );
  }
}
