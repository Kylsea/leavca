import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Leav',
      theme: ThemeData(
          // This is the theme of the application.
          ),
      home: MyPageView(),
    );
  }
}

class TimeValue {
  final int _key;
  final String _value;
  String _asset;
  TimeValue(this._key, this._value, this._asset);
}

class MyPageView extends StatefulWidget {
  MyPageView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyPageViewState createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  PageController _pageController;
  int _currentTimeValue = 1;
  String _currentMethod = 'Apple Pay';
  String _currentMethodAsset = 'images/apple_pay.png';
  double _sliderValue = 15;
  double _billAmount = 179.40;
  String _billAmountDecimal = (179.40).toStringAsFixed(2);
  TextEditingController tipController = TextEditingController();
  String _tip = (0.15 * 179.40).toStringAsFixed(2);
  String total;

  Future<String> createAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Custom Tip'),
            content: TextField(
              controller: tipController,
            ),
            actions: <Widget>[
              MaterialButton(
                elevation: 5.0,
                child: Text('Enter'),
                onPressed: () {
                  Navigator.of(context).pop(tipController.text.toString());
                },
              )
            ],
          );
        });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();

    tipController.dispose();
    super.dispose();
  }

  void _refresh() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _tip = tipController.text;
      _sliderValue = (double.parse(_tip) / _billAmount * 100).roundToDouble();
    });
  }

  final _buttonOptions = [
    TimeValue(1, "Apple Pay", 'images/apple_pay.png'),
    TimeValue(2, "Google Pay", 'images/google_pay.png'),
  ];

  BoxDecoration billDecoration() {
    return BoxDecoration(
      border: Border.all(
        color: Color(0xFFDADADB),
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(10.0), //Try 5?
      ),
    );
  }

  BoxDecoration paymentDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
      boxShadow: [BoxShadow(offset: Offset(0.0, 10.0), blurRadius: 20.0),],
    );
  }

  @override
  Widget build(BuildContext context) {
    total =
        (_billAmount + (_billAmount * (_sliderValue / 100))).toStringAsFixed(2);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        controller: _pageController,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40.0, right: 40.0),
            child: Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  //LOGO
                  Flexible(
                    flex: 3,
                    fit: FlexFit.loose,
                    child: Image(
                      image: AssetImage('images/logo2x.png'),
                      width: 182.0,
                      height: 122.0,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.loose,
                    child: Text(
                      'HÔTEL RENAISSANCE',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: 'OpenSans',
                        color: Color(0xFF6D6D6D),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 4,
                    fit: FlexFit.loose,
                    child: Container(
                      decoration: billDecoration(),
                      padding: EdgeInsets.only(bottom: 10.0),
                      height: 224.0,
                      child: CupertinoScrollbar(
                        child: ListView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          children: <Widget>[
                            DataTable(
                              columns: [
                                DataColumn(label: Text('Q')),
                                DataColumn(label: Text('Item')),
                                DataColumn(label: Text('Price')),
                              ],
                              rows: [
                                DataRow(cells: [
                                  DataCell(Text('1x')),
                                  DataCell(Text('Vin Rouge')),
                                  DataCell(Text('\$40.00')),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('1x')),
                                  DataCell(Text('Steak')),
                                  DataCell(Text('\$16.95')),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('1x')),
                                  DataCell(Text('Crème Brulée')),
                                  DataCell(Text('\$22.00')),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('1x')),
                                  DataCell(Text('Burrata')),
                                  DataCell(Text('\$12.45')),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('1x')),
                                  DataCell(Text('Vin Rouge')),
                                  DataCell(Text('\$40.00')),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('1x')),
                                  DataCell(Text('Steak')),
                                  DataCell(Text('\$16.95')),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('1x')),
                                  DataCell(Text('Crème Brulée')),
                                  DataCell(Text('\$22.00')),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('1x')),
                                  DataCell(Text('Burrata')),
                                  DataCell(Text('\$12.45')),
                                ]),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.loose,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 30.0,
                        right: 30.0,
                      ),
                      child: Divider(
                        thickness: 1.0,
                        color: Color(0xFF707070),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    fit: FlexFit.loose,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 50.0, right: 50.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Subtotal',
                                style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 0.43),
                                ),
                              ),
                              Text(
                                '\$ 132.20',
                                style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 0.43),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 50.0, right: 50.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'TPS',
                                style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 0.43),
                                ),
                              ),
                              Text(
                                '\$ 19.83',
                                style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 0.43),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 50.0, right: 50.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'TVQ',
                                style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 0.43),
                                ),
                              ),
                              Text(
                                '\$ 27.37',
                                style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 0.43),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.loose,
                    child: Text(
                      '$_billAmountDecimal',
                      style: TextStyle(
                          fontSize: 40.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Tip',
                              style: TextStyle(
                                color: Color(0xFF737375),
                                fontSize: 20.0,
                              ),
                            ),
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    '$_sliderValue% |',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Color(0xFF757577),
                                    ),
                                  ),
                                  FlatButton(
                                    padding:
                                        EdgeInsets.only(left: 0.0, right: 0.0),
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          _tip,
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              color: Color(0xFF00C598)),
                                        ),
                                        Icon(
                                          Icons.edit,
                                          size: 20.0,
                                          color: Color(0xFF00C598),
                                        ),
                                      ],
                                    ),
                                    onPressed: () {
                                      createAlertDialog(context)
                                          .then((onValue) {
                                        _refresh();
                                      });
                                    },
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            left: 0,
                            right: 0,
                          ),
                          child: SliderTheme(
                            data: SliderThemeData(
                              trackShape: CustomTrackShape(),
                              trackHeight: 14.0,
                              activeTrackColor:
                                  Color.fromRGBO(0, 197, 152, 0.39),
                              inactiveTrackColor: Color(0xFFEEEEEE),
                              overlayColor: Color.fromRGBO(0, 197, 152, 0.10),
                              thumbColor: Color(0xFF00C598),
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 15,
                                  disabledThumbRadius: 15),
                            ),
                            child: Slider(
                              value: _sliderValue.roundToDouble(),
                              onChanged: (tipAmount) {
                                setState(
                                  () {
                                    _sliderValue = tipAmount.roundToDouble();
                                    _tip = (_billAmount * (_sliderValue / 100))
                                        .toStringAsFixed(2);
                                  },
                                );
                              },
                              min: 0,
                              max: 100,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Color(0xFFEEEEEF),
                  ),
                  Flexible(
                    child: FlatButton(
                      padding: EdgeInsets.only(left: 0.0, right: 0.0),
                      onPressed: () {
                        if (_pageController.hasClients) {
                          _pageController.animateToPage(
                            1,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(right: 5.0),
                                  child: Image.asset(
                                    _currentMethodAsset,
                                    scale: 3.0,
                                  ),
                                ),
                                Text('$_currentMethod'),
                              ],
                            ),
                          ),
                          Text(
                            'Change',
                            style: TextStyle(
                              color: Color(0xFF00C598),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Color(0xFFEEEEEF),
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Total',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20.0,
                          ),
                        ),
                        Text(
                          '\$$total',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    flex: 1,
                    child: Container(
                      width: double.infinity,
                      height: 52,
                      child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          color: Color(0xFF00C598),
                          child: Image.asset('images/pay.png'),
                          onPressed: () {}),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Color(0xFF00C598),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CupertinoNavigationBar(
                    padding: EdgeInsetsDirectional.only(start: 0.0),
                    border: Border.all(width: 0.0),
                    leading: FlatButton(
                      padding: EdgeInsets.only(left: 0.0),
                      onPressed: () {
                        if (_pageController.hasClients) {
                          _pageController.animateToPage(
                            0,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.chevron_left,
                              color: Colors.white, size: 35.0),
                          Text(
                            'Back',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                        ],
                      ),
                    ),
                    trailing: Image.asset('images/logo_paymentPage.png'),
                    backgroundColor: Color(0xFF00C598),
                  ),
                  Text(
                    '$total',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 60.0,
                    ),
                  ),
                  SizedBox(
                    height: 42.0,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(top: 20.0, left: 20.0),
                      decoration: paymentDecoration(),
                      width: double.infinity,
                      child: Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Payment Methods',
                              style: TextStyle(fontSize: 15.0),
                            ),
                          ),
                          SizedBox(
                            height: 7.0,
                          ),
                          Divider(
                            height: 1.5,
                            color: Color(0xFF707070),
                          ),
                          Expanded(
                            child: Container(
                              child: ListView(
                                physics: NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.all(8.0),
                                children: _buttonOptions
                                    .map(
                                      (timeValue) => Container(
                                        padding: EdgeInsets.only(bottom: 15),
                                        
                                        child: RadioListTile(
                                          activeColor: Color(0xFF00C598),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          groupValue: _currentTimeValue,
                                          title: Text(timeValue._value),
                                          secondary:
                                              Image.asset(timeValue._asset),
                                          value: timeValue._key,
                                          onChanged: (val) {
                                            if (_pageController.hasClients) {
                                              Future.delayed(
                                                  const Duration(
                                                      milliseconds: 300), () {
                                                setState(() {
                                                  _pageController.animateToPage(
                                                    0,
                                                    duration: const Duration(
                                                        milliseconds: 600),
                                                    curve: Curves.easeInOut,
                                                  );
                                                });
                                              });
                                            }
                                            setState(() {
                                              debugPrint('VAL = $val');
                                              _currentTimeValue = val;
                                              _currentMethod = timeValue._value;
                                              _currentMethodAsset =
                                                  timeValue._asset;
                                            });
                                          },
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  Rect getPreferredRect({
    @required RenderBox parentBox,
    Offset offset = Offset.zero,
    @required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
