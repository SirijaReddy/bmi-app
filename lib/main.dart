import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double height = 0;
  double weight = 0;
  double bmi = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BMI Calculator"),
        ),
        body: Center(
            child: Column(
          children: [
            Text(""),
            Text(""),
            Text(""),
            Text(""),
            Container(
                height: 100,
                width: 250,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Height : ${height.round()} cm",
                        style: TextStyle(fontSize: 20),
                      ),
                      Slider(
                          value: height,
                          min: 0,
                          max: 250,
                          onChanged: (value) {
                            setState(() {
                              height = value;
                            });
                          }),
                    ])),
            Text(""),
            Text(
              "Weight",
              style: TextStyle(fontSize: 20),
            ),
            Center(
                child: Container(
                    height: 70,
                    width: 220,
                    child: Center(
                        child: Row(children: [
                      FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              weight++;
                            });
                          },
                          child: const Icon(Icons.add)),
                      Text(
                        "     ${weight} kg     ",
                        style: TextStyle(fontSize: 20),
                      ),
                      FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              weight--;
                            });
                          },
                          child: const Icon(Icons.remove))
                    ])))),
            Text(""),
            Text(" "),
            Container(
                height: 200,
                width: 250,
                child: Column(children: [
                  ButtonTheme(
                    minWidth: 100.0,
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          bmi = weight / ((height / 100) * (height / 100));
                        });
                      },
                      child: Text("Calculate"),
                    ),
                  ),
                  Text(""),
                  Text(""),
                  Text(
                    "BMI ${bmi.toStringAsFixed(2)} ",
                    style: TextStyle(fontSize: 20),
                  )
                ])),
          ],
        )));
  }
}
