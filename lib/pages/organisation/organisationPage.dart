import 'dart:math';

import 'package:chatbot/pages/organisation/controller/organisationPageController.dart';
import 'package:chatbot/pages/organisation/model/organisation_details.dart';
import 'package:chatbot/utils/logger.dart';
import 'package:chatbot/utils/textUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

class OrganisationPage extends StatefulWidget {
  const OrganisationPage({super.key});

  @override
  State<OrganisationPage> createState() => _OrganisationPageState();
}

class _OrganisationPageState extends State<OrganisationPage> {
  List<dynamic> sections = [];
  List<Map<String, dynamic>> allData = [];

  List<OrganisationDetails> departmentDetails = [];
  // late List<dynamic> section;
  Future<void> loadJsonData() async {
    final String jsonContent =
        await rootBundle.loadString('assets/jsons/organisations.json');
    final dynamic jsonData = json.decode(jsonContent);
    sections = jsonData['sections'];
  }

  void loadDepartmentDetails() async {
    for (int i = 0; i < sections.length; i++) {
      // OrganisationDetails temp = OrganisationDetails(imageUrl: sections[i], name: name, description: description)
      Logger.logA("${sections[i]['items'].length}");

      for (int j = 0; j < sections[i]['items'].length; j++) {
        OrganisationDetails temp = OrganisationDetails(
            imageUrl: sections[i]['items'][j]['imageurl'],
            name: sections[i]['items'][j]['name'],
            description: sections[i]['items'][j]['description']);
        departmentDetails.add(temp);
        // Logger.logA("${sections[i]['items'][j]['name']}");
      }
    }
  }

  @override
  void initState() {
    loadJsonData();
    loadDepartmentDetails();
    super.initState();

    // Your initialization code goes here
    // For example, you can initialize variables, fetch data, or set up listeners.
  }

  @override
  Widget build(BuildContext context) {
    double sizeH = MediaQuery.of(context).size.height;
    List<Color> colorList = [
      const Color(0xFFFFA69E),
      const Color(0xFFB8F2E6),
      const Color(0xFFAED9E0),
      const Color(0xFFFAF3DD),
    ];
    List<String> category = [
      "All",
      "Health Care",
      "Security",
      "Hospitality",
      "Services",
      "Research",
      "Development",
    ];

    Random random = Random();
    int randomIndex = random.nextInt(colorList.length);
    return Scaffold(
      appBar: AppBar(
          // backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Center(
              child: txt("Organisations", size: 26, weight: FontWeight.w400))),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: Consumer<OrganisationPageController>(
                    builder: (context, data, child) {
                      return ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 5,
                        ),
                        scrollDirection: Axis.horizontal,
                        itemCount: sections.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () => data.changeSelectedIndex(index),
                            child: Container(
                              height: 35,
                              padding: const EdgeInsets.only(
                                top: 0,
                                bottom: 0,
                                left: 20,
                                right: 20,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                  color: const Color(0xFF17C3CE),
                                ),
                                color: data.selectedIndex == index
                                    ? const Color(0xFF17C3CE)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: txt(sections[index]['title'],
                                    size: 14,
                                    color: data.selectedIndex == index
                                        ? Colors.white
                                        : const Color(0xFF17C3CE)),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 654,
                  width: double.infinity,
                  child: ListView.builder(
                      itemCount: category.length,
                      itemBuilder: (BuildContext context, int ind) {
                        return Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                txt(sections[ind]['title'], size: 24),
                                const Icon(
                                  Icons.arrow_right_alt,
                                  color: Color(0xFF17C3CE),
                                  size: 40,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              // color: Colors.grey,
                              // width: 180,
                              height: 0.225 * sizeH,
                              child: ListView.separated(
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                        width: 15,
                                      ),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: sections[ind]['items'].length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    Logger.logA(
                                        "${sections[ind]['items'].length}");
                                    int randomIndex =
                                        random.nextInt(colorList.length);
                                    return Container(
                                      padding: const EdgeInsets.all(10),
                                      height: 226,
                                      width: 160,
                                      decoration: BoxDecoration(
                                          color: colorList[randomIndex],
                                          borderRadius:
                                              BorderRadius.circular(17)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            // padding: const EdgeInsets.only(
                                            //     top: 10, left: 20),
                                            height: 75,
                                            width: 65,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(17),
                                              color: Colors.white,
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    sections[ind]['items']
                                                        [index]['imageurl']),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          txt(
                                            sections[ind]['items'][index]
                                                ['name'],
                                            textAlign: TextAlign.start,
                                            isBold: true,
                                            size: 16,
                                            // weight: FontWeight.w600,
                                            maxLine: 2,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          txt(
                                            sections[ind]['items'][index]
                                                ['description'],
                                            size: 12,
                                            color: Color(0xFF919191),
                                            textAlign: TextAlign.start,
                                            // weight: FontWeight.w600,
                                            maxLine: 2,
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        );
                      }),
                )
              ],
            ),
          ),
          Positioned(
              bottom: 20,
              right: 20,
              child: InkWell(
                onTap: () => setState(() {}),
                child: CircleAvatar(
                  backgroundColor: Color(
                    0xFF62b6cb,
                  ),
                  minRadius: 30,
                  maxRadius: 30,
                  child: Icon(
                    Icons.refresh,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
