import 'package:chatbot/pages/organisation/controller/organisationPageController.dart';
import 'package:chatbot/utils/textUtil.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrganisationPage extends StatelessWidget {
  const OrganisationPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> category = [
      "All",
      "Health Care",
      "Security",
      "Hospitality",
      "Services",
      "Research",
      "Development",
    ];
    return Scaffold(
      body: Padding(
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
                    itemCount: category.length,
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
                            child: txt(category[index],
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
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            txt(category[index], size: 24),
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
                          height: 202,
                          child: ListView.separated(
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                    width: 15,
                                  ),
                              scrollDirection: Axis.horizontal,
                              itemCount: 6,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  height: 226,
                                  width: 160,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(17)),
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
    );
  }
}
