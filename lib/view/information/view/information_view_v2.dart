import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:smoking_application/core/base/view/base_view.dart';
import 'package:smoking_application/view/information/viewmodal/informations_viewmodal.dart';
import '../../../core/base/state/base_state.dart';

class InformationsView extends StatefulWidget {
  const InformationsView({Key? key}) : super(key: key);

  @override
  State<InformationsView> createState() => _InformationsViewState();
}

class _InformationsViewState extends BaseState<InformationsView> {
  late InformationsViewModal informationsViewModal;

  @override
  Widget build(BuildContext context) {
    return BaseView(
      onBuilder: _scaffoldBody,
      onInitModal: () {
        informationsViewModal = InformationsViewModal();
        informationsViewModal.init();
      },
      onDispose: () {},
    );
  }

  Widget _scaffoldBody(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Health"),
        centerTitle: true,
      ),
      body: _listViewBuilder(),
    );
  }

  ListView _listViewBuilder() {
    return ListView.builder(
      addAutomaticKeepAlives: true,
      itemCount: informationsViewModal.timeAndHealthInfos.length,
      itemBuilder: (BuildContext context, int index) {
        return SizedBox(
          child: Card(
            child: ListTile(
              onTap: (() {
                //SHOW POPUP
                debugPrint(informationsViewModal.userInfo?[0].toString());
              }),
              leading: _circlePercentIndicator(
                index,
                context,
                informationsViewModal.timeCalculation(index),
              ),
              subtitle: Text(informationsViewModal.timeAndHealthInfos.values
                  .elementAt(index)),
              title: Text(informationsViewModal.timeAndHealthInfos.keys
                  .elementAt(index)),
              trailing: const Icon(Icons.keyboard_arrow_right_rounded),
            ),
          ),
        );
      },
    );
  }

  CircularPercentIndicator _circlePercentIndicator(
    int index,
    BuildContext context,
    double percent,
  ) {
    return CircularPercentIndicator(
      addAutomaticKeepAlive: false,
      curve: Curves.easeOut,
      animationDuration: 2000,
      animation: true,
      radius: 24.0,
      lineWidth: 5,
      percent: percent,
      progressColor: Theme.of(context).colorScheme.primary,
      center: Text("${(percent * 100).toStringAsFixed(0)}%"),
    );
  }
}
