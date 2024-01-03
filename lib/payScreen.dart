import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paymob_api/paymob_api.dart';

import 'frame_view.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);



  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool isDone = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: pay(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.data != null) {
              return FrameView(
                url: '${snapshot.data}',
                onPaymetCompleted: (url) {
                  print(url);
                  var m = getParamsFromUrl(url ?? '');
                  if (m['id'] != null && m['success'] == 'true' && !isDone) {
                    isDone = true;
                    print(m['id']);
                  }
                },
              );
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
Map<String, String> getParamsFromUrl(String url) {
  Uri uri = Uri.parse(Uri.decodeFull(url));
  Map<String, String> params = uri.queryParametersAll.map((key, value) {
    return MapEntry(key, value.length == 1 ? value.first : value.join(','));
  });

  return params;
}