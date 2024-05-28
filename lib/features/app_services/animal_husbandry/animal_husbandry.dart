import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:krishi_vikas/features/app_services/animal_husbandry/animal_services.dart';
import 'package:krishi_vikas/utils/colors.dart';

class AnimalHusbandry extends StatelessWidget {
  const AnimalHusbandry({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Animal Husbandry")),
        body: FutureBuilder(
          future: AnimalServices().getAllAnimalRecords(),
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
                      title: Text(data[index]["animal_type"]),
                      subtitle: Text(data[index]["description"]),
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
