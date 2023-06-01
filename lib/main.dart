import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(
        title: '',
      ),
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
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = "";
  var bgColor = Colors.blue.shade200;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.amber,
          title: const Text('yourBMI', style: TextStyle(color: Colors.blue)),
        ),
        body: Container(
          color: bgColor,
          child: Center(
            child: Container(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text(
                    'BMI',
                    style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  TextField(
                    controller: wtController,
                    decoration: const InputDecoration(
                        label: Text('Enter your weight(in Kg)'),
                        prefixIcon: Icon(Icons.line_weight)),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  TextField(
                    controller: ftController,
                    decoration: const InputDecoration(
                        label: Text('Enter your height(in feet)'),
                        prefixIcon: Icon(Icons.height)),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  TextField(
                    controller: inController,
                    decoration: const InputDecoration(
                        label: Text('Enter your height(in inch)'),
                        prefixIcon: Icon(Icons.height)),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        var wt = wtController.text.toString();
                        var ft = ftController.text.toString();
                        var inch = inController.text.toString();
                        if (wt != "" && ft != "" && inch != "") {
                          var iWt = int.parse(wt);
                          var iFt = int.parse(ft);
                          var iInch = int.parse(inch);

                          var tInch = (iFt * 12) + iInch;
                          var tCm = tInch * 2.54;
                          var tM = tCm / 100;
                          var bmi = iWt / (tM * tM);
                          var msg = "";
                          if (bmi > 25) {
                            msg = "You are OverWeight";
                            bgColor = Color.fromARGB(255, 252, 37, 37);
                          } else if (bmi < 18) {
                            msg = "You are UnderWeight";
                            bgColor = Colors.red.shade200;
                          } else {
                            msg = "You are Healthy";
                            bgColor = Colors.green.shade200;
                          }
                          setState(() {
                            result =
                                "$msg\nYour BMI is:${bmi.toStringAsFixed(2)}";
                          });
                        } else {
                          setState(() {
                            result = "Please Fill All the required Blank";
                          });
                        }
                      },
                      child: const Text('Calculate')),
                  SizedBox(
                    height: 11,
                  ),
                  Text(
                    result,
                    style: const TextStyle(fontSize: 19),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
