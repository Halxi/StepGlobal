import 'package:flutter/material.dart';
import 'package:step_global_demo/modules/driver.dart';
import 'package:step_global_demo/theme/demo_theme.dart';

class BannerWidget extends StatefulWidget {
  final Driver driver;

  BannerWidget({Key? key, required this.driver}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BannerWidgetState();
  }

}

class _BannerWidgetState extends State<BannerWidget> {
  late Driver _driver;

  @override
  void initState() {
    _driver = this.widget.driver;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: DemoTheme.demoDecoration(Colors.blueAccent, Colors.blue),
        child: Container(
            width: double.infinity,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  CircleAvatar(
                    child: Icon(
                      Icons.person,
                      size: 60,
                    ),
                    radius: 40.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    _driver.driver_firstname +
                        ' ' +
                        _driver.driver_lastname,
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Driver ID: ' + _driver.driver_id,
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ])));
  }

}