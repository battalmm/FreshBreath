import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:smoking_application/core/base/view/base_view.dart';

class TestView2 extends StatefulWidget {
 const TestView2({
    Key? key,
  }) : super(key: key);

  @override
  State<TestView2> createState() => _TestView2State();
}

class _TestView2State extends State<TestView2> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      onBuilder: _scaffoldBuild,
      onInitModal: () {},
    );
  }

  Widget _scaffoldBuild(BuildContext context) {
    // TextEditingController sigaraController = TextEditingController();
    // TextEditingController zamanController = TextEditingController();
    // TextEditingController paraController = TextEditingController();
    // TextEditingController sayiController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            const Text("home"),
            const Text("sigaraController"),
            const Text("zamanController"),
            ElevatedButton(
              onPressed: () {},
              child: const Text("DENENEEMEMEMMEME"),
            ),
            CircularPercentIndicator(
              radius: 25,
            )
          ],
        ),
      ),
    );
  }
}
