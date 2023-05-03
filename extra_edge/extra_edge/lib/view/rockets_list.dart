import 'dart:developer';

import 'package:extra_edge/controller/rocket_info.dart';
import 'package:extra_edge/resource/color_manager.dart';
import 'package:extra_edge/resource/route_manager/route_manager.dart';
import 'package:extra_edge/resource/string_manager.dart';
import 'package:extra_edge/resource/style_manager.dart';
import 'package:extra_edge/resource/widget/card.dart';
import 'package:flutter/material.dart';
import '../controller/rocket_list_controller.dart';
import 'package:provider/provider.dart';

import 'rocket_info.dart';

class RocketPage extends StatefulWidget {
  const RocketPage({super.key});

  @override
  State<RocketPage> createState() => _RocketPageState();
}

class _RocketPageState extends State<RocketPage> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final dataProvider = context.read<RocketListProvider>();
      dataProvider.fetchRocketList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<RocketListProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppString.rocketList),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(child: Consumer<RocketListProvider>(
        builder: (context, rocketListProvider, child) {
          return dataProvider.isLoading == true
              ? const Center(child: CircularProgressIndicator(),)
          : ListView.builder(
            itemCount: rocketListProvider.rocketList.length,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: (){
                      final String id = rocketListProvider.rocketList[index].id.toString();
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  RocketInfo(id: id)));
                      log(id);
                    },
                    child: ReusableCard(
                      imageUrl: rocketListProvider
                          .rocketList[index].flickrImages![index]
                          .toString(),
                      title:
                          "${AppString.rocketName} ${rocketListProvider.rocketList[index].name.toString()}",
                      title1:
                          "${AppString.countyName} ${rocketListProvider.rocketList[index].country.toString()}",
                      subTitle1:
                          "${AppString.enginesCount} ${rocketListProvider.rocketList[index].engines!.number.toString()}",
                    ),
                  ),
                ],
              );
            },
          );
        },
      )),
    );
  }
}
