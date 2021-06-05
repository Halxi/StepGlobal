import 'package:flutter/material.dart';
import 'package:step_global_demo/customWidgets/banner_widget.dart';
import 'package:step_global_demo/modules/driver.dart';
import 'package:step_global_demo/server/server_handler.dart';
import 'package:step_global_demo/theme/demo_theme.dart';
import 'package:step_global_demo/views/driver_profile_edit_view.dart';

class DriverProfile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DriverProfileState();
  }
}

class _DriverProfileState extends State<DriverProfile> {
  late Driver _driver;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      ///floating action button
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Edit'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DriverProfileEditView(driver: _driver)),
          );
        },
        icon: Icon(Icons.edit),
      ),

      ///future builder control exception while fetching data from the server
      body: FutureBuilder(
          future: ServerHandler.fetchDriver(),
          builder: (BuildContext context, AsyncSnapshot<Driver> snapshot) {
            List<Widget> children;
            if (snapshot.hasData) {
              _driver = snapshot.data!;
              children = <Widget>[
                BannerWidget(driver: _driver),
                SizedBox(
                  height: 1,
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: DemoTheme.demoDecoration(Colors.blue, Colors.black),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'Driver License: ' + _driver.driver_license,
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'Record Keeper: ' + _driver.recordKeeper,
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'Base Location: ' + _driver.baseLocation,
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'Home Base Time Zone: ' + _driver.homeBaseTimeZone,
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ];
            } else if (snapshot.hasError) {
              children = <Widget>[
                const Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text('Error: ${snapshot.error}'),
                )
              ];
            } else {
              children = const <Widget>[
                SizedBox(
                  child: CircularProgressIndicator(),
                  width: 60,
                  height: 60,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text('Awaiting result...'),
                )
              ];
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: children,
              ),
            );
          }),
    );
  }
}
