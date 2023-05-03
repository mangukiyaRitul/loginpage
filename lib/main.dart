import 'package:flutter/material.dart';

import 'Myhomepage.dart';

void main()
{
  runApp(Mylogin());

}

class Mylogin extends StatefulWidget {
  const Mylogin({Key? key}) : super(key: key);

  @override
  State<Mylogin> createState() => _MyloginState();
}

class _MyloginState extends State<Mylogin> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Myhomepage(),
    );
  }
}
