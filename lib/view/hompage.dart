import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapi/constant/handlingdataview.dart';
import 'package:newsapi/model/artices_model.dart';
import 'package:newsapi/controller/news_controller.dart';

class hompage extends StatelessWidget {
  const hompage({super.key, this.articlesList});
  final ArticlesList? articlesList;
  @override
  Widget build(BuildContext context) {
    const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

    NewsapiController controller = Get.put(NewsapiController());
    return Scaffold(
      appBar: AppBar(
        //centerTitle: true,
        backgroundColor: Colors.grey[350],
        title: const Text(
          'NewsApp',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          DropdownMenu<String>(
            initialSelection: controller.country.last,
            onSelected: (String? value) {
             controller.dropdownValue =value;
            
            },
            dropdownMenuEntries:
                controller.country.map<DropdownMenuEntry<String>>((String value) {
              return DropdownMenuEntry<String>(value: value, label: value);
            }).toList(),
          ),
        ],
      ),
      body: GetBuilder<NewsapiController>(
          init: NewsapiController(),
          builder: (controller) {
            return ListView(children: [
              SizedBox(
                height: 70,
                //  width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.separated(
                    itemCount: controller.category.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          controller.getcategory(controller.category[index]);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            //height: 40,
                            width: 120,
                            decoration: BoxDecoration(
                                color: Colors.grey[350],
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      controller.category[index],
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ]),
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                      height: 0,
                    ),
                  ),
                ),
              ),
              HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Container(
                  width: double.infinity,
                  //height: 500,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.getNews.length,
                    itemBuilder: (context, index) {
                      var newsmodel = controller.articlesList?.articles![index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[350],
                                borderRadius: BorderRadius.circular(15)),
                            width: double.infinity,
                            child: Stack(children: [
                              Column(
                                children: [
                                  newsmodel?.urlToImage == null
                                      ? Center(
                                          child: Container(
                                            height: 200,
                                            child: Icon(Icons.error_outline,
                                                color: Colors.black),
                                          ),
                                        )
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Image.network(
                                              newsmodel!.urlToImage!,
                                              height: 200,
                                              width: double.infinity,
                                              fit: BoxFit.fill),
                                        ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        child: Text(
                                      newsmodel!.title!,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )),
                                  )
                                ],
                              ),
                              Positioned(
                                right: 7,
                                top: 10,
                                child: Container(
                                  //  width: 80,
                                  height: 35,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[350],
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(children: [
                                      Text(
                                        newsmodel.source?['name'],
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ]),
                                  ),
                                ),
                              ),
                            ])),
                      );
                    },
                  ),
                ),
              )
            ]);
          }),
    );
  }
}
