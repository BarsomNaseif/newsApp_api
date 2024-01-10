import 'package:flutter/material.dart';
import 'package:newsapi/constant/statusrequest.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(child: Text('loading'))
        : statusRequest == StatusRequest.offlinefailure
            ? Center(child: Text('offlinefailure'))
            : statusRequest == StatusRequest.serverfailure
                ? Center(child: Text('serverfailure'))
                : statusRequest == StatusRequest.failure
                    ? Center(child: Text('failure'))
                    : widget;
  }
}

class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataRequest(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(child: Center(child: Text('loading')))
        : statusRequest == StatusRequest.offlinefailure
            ? Center(child: Center(child: Text('offlinefailure')))
            : statusRequest == StatusRequest.serverfailure
                ? Center(child: Center(child: Text('serverfailure')))
                : widget;
  }
}
