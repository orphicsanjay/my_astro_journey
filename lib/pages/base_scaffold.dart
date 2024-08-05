import 'package:astrology/locator.dart';
import 'package:astrology/providers/network_provider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class BaseScaffold extends StatelessWidget {
  final Widget? body;

  const BaseScaffold({super.key, this.body});

  @override
  Widget build(BuildContext context) {
    // final networkStatus = Provider.of<NetworkProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          body ?? Container(),
          if (getIt<NetworkProvider>()
              .connectionStatus
              .contains(ConnectivityResult.none))
            Positioned.fill(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'No internet connection',
                      style: TextStyle(color: Colors.red),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
