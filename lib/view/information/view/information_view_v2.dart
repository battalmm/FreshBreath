import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:smoking_application/core/base/view/base_view.dart';
import 'package:smoking_application/core/extensions/string_extension.dart';
import 'package:smoking_application/core/init/language/locale_keys.g.dart';
import 'package:smoking_application/core/init/navigation/navigation_service.dart';
import 'package:smoking_application/view/information/viewmodal/informations_viewmodal.dart';
import '../../../core/base/state/base_state.dart';
import '../../../core/extensions/context_extension.dart';

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
        title: Text(LocaleKeys.Informations_informationsHeader.translate),
        centerTitle: true,
      ),
      body: _listViewBuilder(),
    );
  }

  ListView _listViewBuilder() {
    return ListView.builder(
      controller: informationsViewModal.scrollController,
      addAutomaticKeepAlives: true,
      itemCount: informationsViewModal.timeAndHealthInfos.length,
      itemBuilder: (BuildContext context, int index) {
        return SizedBox(
          child: Card(
            child: ListTile(
              onTap: (() {
                /////**********
                ///
                ///
                ///
                showModalBottomSheet(
                  context: context,
                  useSafeArea: false,
                  isDismissible: true,
                  backgroundColor: Theme.of(context).colorScheme.background,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(context.mediumCircularBorderRadius),
                    ),
                  ),
                  builder: (context) {
                    return CustomSheet();
                  },
                );
                debugPrint(index.toString());

                ///
                ///
                ///
                ////////*********
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

class CustomSheet extends StatelessWidget {
  const CustomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [SheetHeader(), Expanded(child: DetailedHealthInformations())],
    );
  }
}

class SheetHeader extends StatelessWidget {
  const SheetHeader({Key? key, String? header})
      : header = header ?? "NULL_HEADER",
        super(key: key);

  final String header;

  @override
  Widget build(BuildContext context) {
    final _headersVerticalAllignment = context.mediaQueryHeightSmall / 3;
    return SizedBox(
      height: context.mediaQueryHeightSmall,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: _headersVerticalAllignment,
            child: Text(
              header,
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.headlineSmall!.fontSize,
              ),
            ),
          ),
          Positioned(
            top: _headersVerticalAllignment,
            right: context.mediaQueryWidth / 15,
            child: InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  NavigationService.instance.pop();
                },
                child: const Icon(
                  Icons.cancel,
                  size: 30,
                )),
          )
        ],
      ),
    );
  }
}

class DetailedHealthInformations extends StatelessWidget {
  const DetailedHealthInformations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Bu kısmı hallet
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Center(
                child: Container(
              child: Placeholder(),
            )),
          ),
          Center(
              child: Container(
            child: Placeholder(),
          )),
        ],
      ),
    );
  }
}

// class DetailedHealthInformations extends StatefulWidget {
//   const DetailedHealthInformations({Key? key}) : super(key: key);

//   @override
//   State<DetailedHealthInformations> createState() =>
//       _DetailedHealthInformationsState();
// }

// class _DetailedHealthInformationsState
//     extends State<DetailedHealthInformations> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
