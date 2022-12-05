import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String defaulvalue = "22/12/2002";
  DateTime _date = DateTime.now();
  Future<Null> _selectDate(BuildContext context) async {
    DateTime? _datePicker = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(2015),
        lastDate: DateTime.now()) as DateTime?;
    if (_datePicker != null && _datePicker != _date) {
      _date = _datePicker;
      defaulvalue = _datePicker.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(12),
          // ignore: prefer_const_constructors
          child: TextFormField(
            controller: TextEditingController(text: defaulvalue),
            decoration: InputDecoration(
              suffix: InkWell(
                onTap: () {
                  setState(() {
                    _selectDate(context);
                  });
                },
                // ignore: prefer_const_constructors
                child: Icon(
                  Icons.date_range,
                ),
              ),
              border: OutlineInputBorder(),
            ),
            onChanged: (context) => {defaulvalue = context},
          ),
        ),
      ),
    );
  }
}
