import 'dart:async';

import 'package:astrology/utils/style_utl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TimerWidget extends StatefulWidget {
  final VoidCallback onTap;
  const TimerWidget({super.key, required this.onTap});

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  Timer? _timer;
  int _start = 60;

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_start == 0) {
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            if (_start != 0) return;
            widget.onTap();
          },
          child: Text(
            "Resend",
            style: _start != 0
                ? StyleUtil.style20GreyBold
                : StyleUtil.style20OrangeBold,
          ),
        ),
        _start == 0
            ? Container()
            : Row(
                children: [
                  const SizedBox(width: 8),
                  Text(
                    '(${_start ~/ 60}:${_start % 60 < 10 ? '0' : ''}${_start % 60})',
                    style: StyleUtil.style20BlackBold,
                  )
                ],
              ),
      ],
    );
  }
}
