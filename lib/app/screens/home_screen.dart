import 'package:flutter/material.dart';
import 'package:micro_commons_design_system/app/widgets/card_micro_app_info.dart';
import 'package:micro_commons_design_system/app/widgets/badge_info.dart';
import 'package:micro_commons_micro_apps/models/micro_apps_componets.dart';
import 'package:micro_commons_micro_apps/mocks/micro_app_data.dart'
    as data_apps;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    final List<MicroAppsComposition> listMicro = data_apps.data;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.only(bottomRight: Radius.circular(50)),
              color: const Color(0xFF363F93),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF363f93).withOpacity(0.3),
                  offset: const Offset(-10, 0),
                  blurRadius: 20,
                  spreadRadius: 4,
                ),
              ],
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 25,
                  left: 0,
                  child: Container(
                    height: 100,
                    width: 300,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  top: 55,
                  left: 20,
                  child: Text(
                    'Micro Apps',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff363f93)),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.05,
          ),
          SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: listMicro.length,
              itemBuilder: (BuildContext context, int index) {
                return CardMicroAppInfo(
                    title: listMicro[index].title,
                    commandCreate: listMicro[index].commandCreate,
                    description: listMicro[index].description,
                    image: listMicro[index].image,
                    height: height,
                    width: width);
              },
            ),
          ),
          Expanded(
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView(
                children: [
                  BadgeInfo(
                    title: 'VERSION',
                    description: 'version: 1.0.1\n{major} . {minor} . {patch}',
                    width: width,
                  ),
                  BadgeInfo(
                    title: 'TAGs',
                    description:
                        'Listagem de Tags: git tag -n\nCriação de Tags: git tag \'v<mejor.minor.patch>\'\nEnviar as Tags: git push --tags',
                    width: width,
                  ),
                  BadgeInfo(
                    title: 'DEPENDENCIES',
                    description:
                        'git:\nurl: gitUrl\n ref: v1.0.0 # <- Aqui vai a Tag versionada',
                    width: width,
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
