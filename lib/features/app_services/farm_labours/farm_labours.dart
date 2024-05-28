import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:krishi_vikas/features/app_services/farm_labours/farm_labours_services.dart';
import 'package:krishi_vikas/utils/colors.dart';

class FarmLabours extends StatelessWidget {
  const FarmLabours({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Farm Labours")),
        body: FutureBuilder(
          future: FarmLaboursServices().getAllFarmLaboursRecords(),
          builder: (context, snapshot) {
            List data = snapshot.data;
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SpinKitCircle(color: primary_green);
            } else {
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  if (snapshot.hasData) {
                    return ListTile(
                      title: Text(data[index]["username"]),
                      subtitle: Text(data[index]["gender"]),
                    );
                  } else if (snapshot.hasError) {
                    return const Text("Error");
                  } else {
                    return const Text("No Data");
                  }
                },
              );
            }
          },
        ));
  }
}
