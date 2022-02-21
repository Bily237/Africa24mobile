import 'dart:math';

import 'package:africa24/colors.dart';
import 'package:flutter/material.dart';

class VanillaExpansion extends StatefulWidget {
  final List<Widget> children;
  final String title;
  final String date;
  final String time;
  const VanillaExpansion({
    Key? key,
    required this.children,
    required this.title,
    required this.date,
    required this.time,
  }) : super(key: key);

  @override
  _VanillaExpansionState createState() => _VanillaExpansionState();
}

class _VanillaExpansionState extends State<VanillaExpansion>
    with TickerProviderStateMixin {
  bool _isExpanded = false;
// ignore: prefer_const_constructors
  Icon presentationicon = Icon(
    Icons.arrow_forward_ios_rounded,
    color: Kbuttoncolor,
    size: 40,
  );
  late AnimationController controller;
  late Animation animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 450));
    animation = Tween(begin: 0.0, end: pi / 2)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      InkWell(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    const VerticalDivider(
                      color: KPrimarycolor,
                      width: 5,
                      thickness: 2,
                      indent: 12,
                      endIndent: 0,
                    ),
                    Expanded(
                      flex: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Text(
                              widget.title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: const TextStyle(
                                fontSize: 20,
                                color: KPrimarycolor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(children: [
              const SizedBox(
                width: 5,
              ),
              const Icon(
                Icons.watch_later_rounded,
                size: 14.0,
                color: Colors.green,
              ),
              Row(
                children: [
                  Text(widget.time,
                      style:
                      const TextStyle(fontSize: 14, color: Colors.green)),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text("|"),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(widget.date,
                      style:
                      const TextStyle(fontSize: 14, color: Colors.green)),
                ],
              ),
            ]),
          ],
        ),
        onTap: () {
          if (animation.status == AnimationStatus.completed) {
            controller.reverse();
            presentationicon = const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Kbuttoncolor,
              size: 40,
            );
          } else if (animation.status == AnimationStatus.dismissed) {
            controller.forward();
            presentationicon = const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.red,
              size: 40,
            );
          }
          _hanleTap();
        },
      ),
      if (_isExpanded) ...widget.children
    ]);
  }

  void _hanleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }
}
