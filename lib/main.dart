import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFFC41A3B),
        primaryColorLight: Color(0xFFFBE0E6),
        accentColor: Color(0xFF1B1F32),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

const MaterialColor _buttonTextColor = MaterialColor(0xFFC41A3B, <int, Color> {
  50: Color(0xFFC41A3B),
  100: Color(0xFFC41A3B),
  200: Color(0xFFC41A3B),
  300: Color(0xFFC41A3B),
  400: Color(0xFFC41A3B),
  500: Color(0xFFC41A3B),
  600: Color(0xFFC41A3B),
  700: Color(0xFFC41A3B),
  800: Color(0xFFC41A3B),
  900: Color(0xFFC41A3B),
}); 

class _MyHomePageState extends State<MyHomePage> {
  String title = 'Date Picker';

  DateTime _date = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    DateTime _datePicker = await showDatePicker(
        context: context,
        initialDate: _date, // Current Date
        firstDate: DateTime(1947), // First Date
        lastDate: DateTime(2030), // Last Date
        textDirection: TextDirection.ltr, // Header Text or Button Direction ltr or rtl
        initialDatePickerMode: DatePickerMode.day, // Day or Year Mode
        selectableDayPredicate: (DateTime val) => val.weekday == 6 || val.weekday == 7 ? false : true, // WeekDay Off
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData(
              primarySwatch: _buttonTextColor, // Button Color Ok and Cancel
              primaryColor: Color(0xFFC41A3B), // Picked or select date color
              accentColor: Color(0xFFC41A3B), // Picked or select date color
            ),
            child: child,
          );
        });

    if (_datePicker != null && _datePicker != _date) {
      setState(() {
        _date = _datePicker;
        print(
          _date.toString(),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                cursorColor: Color(0xFFC41A3B),
                readOnly: true,
                onTap: () {
                  setState(() {
                    _selectDate(context);
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Selct Date', // you can style labelText
                  labelStyle: TextStyle(fontSize: 16.0),
                  hintText: (_date.toString()), // you can style hintText
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFC41A3B), width: 2.0), // Focused Border you can style your own way
                  // borderRadius: BorderRadius.circular(50.0), // Border Radius for outline 
                  ),
                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), // Normal Border
                  )
                  ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: RaisedButton(
                onPressed: () {
                  setState(() {
                    _selectDate(context);
                  });
                },
                color: Color(0xFFC41A3B),
                child: Text(
                  'Date Picker',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(_date.toString(), style: TextStyle(fontSize: 32.0),),
            ),
          ],
        ),
      ),
    );
  }
}
