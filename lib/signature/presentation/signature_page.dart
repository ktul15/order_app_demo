import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:signature/signature.dart';

class SignaturePage extends StatefulWidget {
  const SignaturePage({super.key});

  @override
  State<SignaturePage> createState() => _SignaturePageState();
}

class _SignaturePageState extends State<SignaturePage> {
  late SignatureController _controller;

  @override
  void initState() {
    super.initState();
    _controller = SignatureController(
      penStrokeWidth: 5,
      penColor: Colors.black,
      exportBackgroundColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.signaturePageAppbarTitle),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Signature(
              controller: _controller,
              width: 300,
              height: 300,
              backgroundColor: Colors.white,
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                GestureDetector(
                  onTap: () {
                    _controller.clear();
                  },
                  child: Icon(
                    Icons.refresh,
                    size: 32,
                  ),
                ),
                SizedBox(
                  width: 32,
                ),
                GestureDetector(
                  onTap: () async {
                    Uint8List? bytes = await _controller.toPngBytes();
                    context.pop(bytes);
                  },
                  child: Icon(
                    Icons.check,
                    size: 32,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
