import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'NaiKat Diceroll'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  late StateMachineController _riveController;

  @override
  void initState() {
    super.initState();
  }

  void _onRiveInit(Artboard artboard) {
    _riveController =
        StateMachineController.fromArtboard(artboard, 'State Machine 1')!;
    artboard.addController(_riveController);
  }

  void _rollDice(int number) {
    print(number);
    final _trigger =
        _riveController.findInput<bool>('t_' + number.toString()) as SMITrigger;
    _trigger.fire();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: [
                  OutlinedButton(
                      onPressed: () {
                        _rollDice(1);
                      },
                      child: Text("1")),
                  Spacer(),
                  OutlinedButton(
                      onPressed: () {
                        _rollDice(2);
                      },
                      child: Text("2")),
                  Spacer(),
                  OutlinedButton(
                      onPressed: () {
                        _rollDice(3);
                      },
                      child: Text("3")),
                  Spacer(),
                  OutlinedButton(
                      onPressed: () {
                        _rollDice(4);
                      },
                      child: Text("4")),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Spacer(),
                  OutlinedButton(
                      onPressed: () {
                        _rollDice(5);
                      },
                      child: Text("5")),
                  Spacer(),
                  OutlinedButton(
                      onPressed: () {
                        _rollDice(6);
                      },
                      child: Text("6")),
                  Spacer(),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: SizedBox(
                  width: 300,
                  height: 300,
                  child: RiveAnimation.asset(
                    "assets/diceroll.riv",
                    onInit: _onRiveInit,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
