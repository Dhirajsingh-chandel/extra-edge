import 'package:extra_edge/controller/rocket_info.dart';
import 'package:extra_edge/model/roket_info_model.dart';
import 'package:extra_edge/resource/color_manager.dart';
import 'package:extra_edge/resource/string_manager.dart';
import 'package:extra_edge/resource/style_manager.dart';
import 'package:extra_edge/resource/value_manager.dart';
import 'package:extra_edge/resource/widget/card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RocketInfo extends StatefulWidget {
  final String? id;

  const RocketInfo({Key? key, this.id}) : super(key: key);

  @override
  State<RocketInfo> createState() => _RocketInfoState();
}

class _RocketInfoState extends State<RocketInfo> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final dataProvider = context.read<RocketInfoProvider>();
      dataProvider.fetchRocketInfo(widget.id.toString());
    });
  }

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final dataProvider = context.read<RocketInfoProvider>();
    return Scaffold(
        appBar: AppBar(
          title: const Text(AppString.rocketInfo),
        ),
        body: Consumer<RocketInfoProvider>(builder: (context, value, child) {
                return dataProvider.rocketInfoModel != null
                    ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 05,
                    ),
                    Text(
                      "Rocket Name : ${dataProvider.rocketInfoModel!.name.toString()}",
                      style: getBoldStyle(
                          color: ColorManager.black, fontSize: AppSize.s16),
                    ),
                    const Divider(),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30)),
                      width: size.width * 0.90,
                      height: size.height * 0.10,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: dataProvider.rocketInfoModel!.flickrImages!.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: ColorManager.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.network(
                                fit: BoxFit.cover,
                                dataProvider.rocketInfoModel!.flickrImages![index]),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                        height: size.height * 0.65,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 05,
                            ),
                            Text(
                              "Active State : ${dataProvider.rocketInfoModel!.active.toString()}",
                              style: getBoldStyle(
                                  color: ColorManager.black,
                                  fontSize: AppSize.s16),
                            ),
                            const Divider(),
                            Text(
                              "Cost per Launch :  ${dataProvider.rocketInfoModel!.costPerLaunch.toString()}",
                              style: getBoldStyle(
                                  color: ColorManager.black,
                                  fontSize: AppSize.s16),
                            ),
                            const Divider(),
                            Text(
                              "Success Rate percent : ${dataProvider.rocketInfoModel!.successRatePct.toString()}",
                              style: getBoldStyle(
                                  color: ColorManager.black,
                                  fontSize: AppSize.s16),
                            ),
                            const Divider(),
                            Text(
                              "Description : ${dataProvider.rocketInfoModel!.description.toString()}",
                              style: getBoldStyle(
                                  color: ColorManager.black,
                                  fontSize: AppSize.s16),
                            ),
                            const Divider(),
                            Text(
                              "Wikipedia link : ${dataProvider.rocketInfoModel!.wikipedia.toString()}",
                              style: getBoldStyle(
                                  color: ColorManager.blue,
                                  fontSize: AppSize.s16),
                            ),
                            const Divider(),
                            Text(
                              "Height & Diameter in Feet/Inches : ${dataProvider.rocketInfoModel!.height!.feet.toString()} & "
                              "${dataProvider.rocketInfoModel!.diameter!.feet.toString()}",
                              style: getBoldStyle(
                                  color: ColorManager.black,
                                  fontSize: AppSize.s16),
                            ),
                          ],
                        ))
                  ],
                )
                    : Center(
                    child: CircularProgressIndicator(),
                );}
              )
              );
  }
}
