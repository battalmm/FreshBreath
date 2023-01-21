// ignore: implementation_imports
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:smoking_application/core/base/view/base_view.dart';
import 'package:smoking_application/view/test/test_modal_view/testmw.dart';

class TestView1 extends StatefulWidget {
  const TestView1({Key? key}) : super(key: key);

  @override
  State<TestView1> createState() => _TestViewState();
}

class _TestViewState extends State<TestView1> {
  late TestModalWiev viewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<TestModalWiev>(
      onInitModal: () {
        viewModel = TestModalWiev();
        viewModel.init();
      },
      onBuilder: (
        context,
      ) {
        return scaffoldBody;
      },
    );
  }

  Scaffold get scaffoldBody {
    debugPrint("**************scaffoldBody tetiklendi****************  ");

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(height: 66),
            _difference(),
            const Divider(height: 66),
            _setTime(),
            const Divider(height: 66),
            _timeSeconf(),
            const Divider(height: 66),
            _timeThird(),
            _timefourth()
          ],
        ),
      ),
    );
  }

  Widget _difference() => Observer(
        builder: (context) => Text(
          viewModel.timeDifference.toString(),
        ),
      );

  Widget _timeSeconf() => Observer(
        builder: (context) => Text(
          viewModel.user == null ? "Loading..." : viewModel.user.toString(),
        ),
      );

  Widget _timeThird() => Observer(
        builder: (context) => Text(
          viewModel.user == null
              ? "Loading..."
              : viewModel.user!.getSeconds.toString(),
        ),
      );

  Widget _timefourth() => Observer(
        builder: (context) => Text(
          viewModel.user == null
              ? "Loading..."
              : viewModel.user!.getMinutes.toString(),
        ),
      );

  Widget _setTime() => Observer(
      builder: (context) => ElevatedButton(
          onPressed: () {
            viewModel.refreshPickedTimeAndSave();
          },
          child: Text(viewModel.pickedTime.toString())));
}
