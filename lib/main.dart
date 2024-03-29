import 'package:first_app/pages/index_page.dart';
import 'package:flutter/material.dart';
import './config/index.dart';
import './provide/current_index_provide.dart';
import 'package:provide/provide.dart';
import './pages/index_page.dart';
void main() {
  var currentIndexProvide = CurrentIndexProvide();

  var providers = new Providers();

  providers
    ..provide(Provider<CurrentIndexProvide>.value(currentIndexProvide));
  
  runApp(ProviderNode(child: MyApp(), providers: providers));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: KString.mainTitle,
        theme: ThemeData(primaryColor: KColor.primaryColor),
        home: IndexPage(),
      ),
    );
  }
}