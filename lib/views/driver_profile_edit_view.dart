import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:step_global_demo/customWidgets/banner_widget.dart';
import 'package:step_global_demo/modules/driver.dart';
import 'package:step_global_demo/server/server_handler.dart';
import 'package:step_global_demo/views/driver_profile_view.dart';

class DriverProfileEditView extends StatefulWidget {
  final Driver driver;

  DriverProfileEditView({Key? key, required this.driver}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DriverProfileEditState();
  }
}

class _DriverProfileEditState extends State<DriverProfileEditView> {
  late Driver _driver;
  String _baseLocation = 'VIC';

  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _recordKeeperController = TextEditingController();

  @override
  void initState() {
    _driver = this.widget.driver;
    super.initState();
  }

  Future<void> updateProfile() async {
    Driver driver = Driver(
        _driver.driver_id,
        _firstNameController.text.trim() == '' ? _driver.driver_firstname : _firstNameController.text,
        _lastNameController.text.trim() == '' ? _driver.driver_lastname : _lastNameController.text,
        _driver.driver_license,
        _baseLocation,
        _recordKeeperController.text.trim() == '' ? _driver.recordKeeper : _recordKeeperController.text,
        _baseLocation);
    try {
      await ServerHandler.updateDriver(driver);
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Success'),
          content: Text('Driver Profile has been updated.'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DriverProfile()),
                  );
                },
                child: Text('OK'))
          ],
        )
      );
    }catch(e){
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text('Oops'),
            content: Text('Something wrong happened, please try again.'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'))
            ],
          )
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            BannerWidget(driver: _driver),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('First Name: '),
                      Expanded(
                        child: TextField(
                          controller: _firstNameController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: _driver.driver_firstname),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text('Last Name: '),
                      Expanded(
                        child: TextField(
                          controller: _lastNameController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: _driver.driver_lastname),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text('Record Keeper: '),
                      Expanded(
                        child: TextField(
                          controller: _recordKeeperController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: _driver.recordKeeper),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text('Base Location: '),
                      DropdownButton<String>(
                        value: _baseLocation,
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        underline: Container(
                          height: 2,
                          color: Colors.grey,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            _baseLocation = newValue!;
                          });
                        },
                        items: <String>[
                          'VIC',
                          'NSW',
                          'QLD',
                          'SA',
                          'TAS',
                          'WA',
                          'NT',
                          'Other'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Home Base Time Zone: ' + _baseLocation),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
            TextButton(
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Center(
                  child: Text(
                    'Save Change',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              onPressed: () {
                updateProfile();
              },
            )
          ],
        ),
      ),
    );
  }
}
