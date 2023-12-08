import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          toolbarHeight: 80,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "";
  Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text("BMI Calculator"),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: Container(
        color: bgColor ?? Colors.lime.shade100,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'BMI',
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: wtController,
                  decoration: const InputDecoration(
                    labelText: 'Enter your Weight(in Kgs)',
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: ftController,
                  decoration: const InputDecoration(
                    labelText: 'Enter your Height(in cms)',
                    prefixIcon: Icon(Icons.height_outlined),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () {
                    var wt = wtController.text.toString();
                    var ft = ftController.text.toString();

                    if (wt != "" && ft != "") {
                      var iWt = double.parse(wt);
                      var iFt = double.parse(ft);
                      var tM = iFt / 100;
                      var iBmi = iWt / (tM * tM);

                      var message = "";

                      if (iBmi > 25) {
                        message = "You are Overweight";
                        bgColor = Colors.red.shade500;
                      } else if (iBmi < 18.5) {
                        message = "You are Underweight";
                        bgColor = Colors.orange.shade500;
                      } else {
                        message = "You are Normal";
                        bgColor = Colors.green.shade500;
                      }
                      setState(() {
                        result =
                            "$message \n Your BMI is ${iBmi.toStringAsFixed(2)}";
                      });
                    } else {
                      setState(() {
                        result = "Please enter all the required values";
                      });
                    }
                  },
                  child: const Text("Calculate"),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  result,
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
