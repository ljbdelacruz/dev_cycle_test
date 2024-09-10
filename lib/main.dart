import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:temp_project/service_di.dart';

setupDependencies() async {
  await dotenv.load(fileName: "assets/.env");
  setupServiceDependencies();
}

void main() async {
  await setupDependencies();
  Future.delayed(const Duration(seconds: 3));
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
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
  
  String? displayData = "No Data";

  fetchAds() async {
    var result = await getDevCycle().getAdsData();
    if(result.isRight()){
      var rightResult = result.fold((l)=>null, (r)=>r) ?? "";
      setState(() {
        displayData = rightResult;        
      });
    } else {
      displayData = "Failure issues fetching ads data";
    }
  }

  @override
  Widget build(BuildContext context) {
    fetchAds();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Text(displayData ?? "")
          ],
        ),
      ),
    );
  }
}
