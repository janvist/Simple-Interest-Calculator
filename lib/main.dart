import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Simple Interest Calculator App",
    home: SI(),
    theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blue,
        accentColor: Colors.indigoAccent),
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
  var _currentItemSelected = 'Rupees';

  TextEditingController principalcontroller = TextEditingController();
  TextEditingController roicontroller = TextEditingController();
  TextEditingController termcontroller = TextEditingController();

  var displayresult= " ";

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.titleMedium;
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
                style: textStyle,
                controller: principalcontroller,
                decoration: InputDecoration(
                    labelText: 'Principal',
                    labelStyle: textStyle,
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
                style: textStyle,
                controller: roicontroller,
                decoration: InputDecoration(
                    labelText: 'In percentage',
                    labelStyle: textStyle,
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
                        style: textStyle,
                        controller: termcontroller,
                        decoration: InputDecoration(
                            labelText: 'Term',
                            labelStyle: textStyle,
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
                      value: _currentItemSelected,
                      style: textStyle,
                      onChanged: (dynamic newvalueselected) {
                        _ondropdownitemselected(newvalueselected);
                      },
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
                        child: ElevatedButton(
                      child: Text("Calculate", textScaleFactor: 1.5),
                      onPressed: () {
                        setState(() {
                          this.displayresult= _calculatetotalreturn();
                        });
                      },
                    )),
                    Expanded(
                        child: ElevatedButton(
                      child: Text(
                        "Reset",
                        style: textStyle,
                      ),
                      onPressed: () {},
                    )),
                  ],
                )),
            Padding(
              padding: EdgeInsets.all(_minimumpadding * 2),
              child: Text(
                this. displayresult,
                style: textStyle,
                textScaleFactor: 1.5,
              ),
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

  void _ondropdownitemselected(dynamic newvalueselected) {
    setState(() {
      this._currentItemSelected = newvalueselected;
    });
  }

String _calculatetotalreturn() {
  double p = double.parse(principalcontroller.text);
  double r = double.parse(roicontroller.text);
  double t = double.parse(termcontroller.text);

  double totalamount = p + (p * r * t) / 100;

  String result = 'After $t years, your investment will be worth $totalamount $_currentItemSelected';

  return result;
}
}
