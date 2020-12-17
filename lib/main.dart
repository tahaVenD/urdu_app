import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('ar', 'DZ'), Locale('ur')],
      path: 'assets/translations/langs.csv',
      fallbackLocale: Locale('en', 'US'),
      assetLoader: CsvAssetLoader(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Urdu App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('helloWorld').tr(),
            Container(height: 8),
            Text('customFont',
                style: TextStyle(
                  fontFamily: 'Urdu',
                  fontSize: 18,
                )).tr(),
            Container(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                    child: Text('English'),
                    onPressed: () {
                      context.locale = Locale('en', 'US');
                    }),
                RaisedButton(
                    child: Text('Arabic'),
                    onPressed: () {
                      context.locale = Locale('ar', 'DZ');
                    }),
                RaisedButton(
                    child: Text('Urdu'),
                    onPressed: () {
                      context.locale = Locale('ur');
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
