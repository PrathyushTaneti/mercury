import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  @override
  void dispose() {
    dateController.dispose();
    timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return home(context, size);
  }

  Widget home(BuildContext context, Size size) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.black,
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarColor: Colors.black),
        toolbarHeight: size.height * 0.09,
        elevation: 10,
        backgroundColor: Colors.blue.shade900,
        title: const Text(
          'Mercury',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState!.openEndDrawer();
            //Scaffold.of(context).openEndDrawer();
          },
          icon: const Icon(Icons.menu_rounded),
          color: Colors.white,
        ),
      ),
      endDrawer: Drawer(
        width: size.width,
        backgroundColor: Colors.white,
        child: ListView(
          children: const [
            ListTile(
              title: Text('home'),
              leading: Icon(Icons.home),
            )
          ],
        ),
      ),
      body: Flex(
        direction: Axis.vertical,
        children: [
          Expanded(
            child: Container(
              width: size.width,
              height: size.height,
              decoration: BoxDecoration(color: Colors.blue.shade700),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    height: size.height * 0.1,
                    decoration: BoxDecoration(
                        color: Colors.blue.shade900,
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40))),
                    child: const Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            '',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: TextField(
                            controller: timeController,
                            style: const TextStyle(color: Colors.white),
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                isDense: true,
                                prefixIcon: const Icon(
                                  Icons.calendar_month,
                                  color: Colors.white,
                                ),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                labelText: 'Select Time',
                                labelStyle: const TextStyle(
                                    color: Colors.white, fontSize: 14),
                                suffixIcon: InkWell(
                                  onTap: () {
                                    timeController.clear();
                                    FocusScope.of(context).unfocus();
                                  },
                                  child: const Icon(
                                    Icons.close,
                                    color: Colors.white,
                                  ),
                                )),
                            readOnly: true,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TextField(
                            controller: dateController,
                            readOnly: true,
                            style: const TextStyle(color: Colors.white),
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                isDense: true,
                                prefixIcon: Icon(
                                  Icons.date_range,
                                  color: Colors.white,
                                ),
                                suffixIcon: InkWell(
                                  onTap: () {
                                    dateController.clear();
                                    FocusScope.of(context).unfocus();
                                  },
                                  child: Icon(Icons.close, color: Colors.white),
                                ),
                                labelText: 'Select Date',
                                labelStyle: TextStyle(
                                    color: Colors.white, fontSize: 14),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white))),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Builder(
                            builder: (context) => ElevatedButton(
                                  onPressed: () {
                                    // Scaffold.of(context).openEndDrawer();
                                    _selectDate(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      elevation: 5,
                                      backgroundColor: Colors.white,
                                      foregroundColor: Colors.blue.shade800,
                                      padding: const EdgeInsets.all(15),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      minimumSize: const Size(350, 50)),
                                  child: const Text('Calendar Control'),
                                )),
                        const SizedBox(height: 20),
                        Builder(builder: (context) {
                          return OutlinedButton(
                              onPressed: () {
                                _selectTime(context);
                              },
                              style: OutlinedButton.styleFrom(
                                  elevation: 5,
                                  backgroundColor: Colors.transparent,
                                  foregroundColor: Colors.white,
                                  side: const BorderSide(
                                      color: Colors.white, width: 1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  minimumSize: const Size(350, 50)),
                              child: const Text('Time Control'));
                        }),
                        const SizedBox(height: 20),
                        Builder(builder: (context) {
                          return TextButton(
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Container(
                                          height: size.height * 0.5,
                                          width: size.width,
                                          child: Column(
                                            children: [
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    minimumSize:
                                                        const Size(50, 30),
                                                    backgroundColor:
                                                        Colors.blue,
                                                    foregroundColor:
                                                        Colors.white),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text("Close"),
                                              ),
                                            ],
                                          ));
                                    });
                              },
                              style: TextButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.blue.shade900,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  minimumSize: const Size(350, 50)),
                              child: const Text('Some Bottom Sheet'));
                        }),
                        const SizedBox(height: 20),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData(colorScheme: const ColorScheme.dark()),
            child: child!,
          );
        },
        lastDate: DateTime(2025));
    setState(() {
      dateController.text = "${date!.day}/${date.month}/${date.year}";
    });
  }

  Future<void> _selectTime(BuildContext context) async {
    final time = await showTimePicker(
        context: context,
        initialTime: const TimeOfDay(hour: 12, minute: 00),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData(colorScheme: const ColorScheme.dark()),
            child: child!,
          );
        });
    setState(() {
      timeController.text = '${time!.hour}:${time.minute} ${time.period.name}';
    });
  }
}
