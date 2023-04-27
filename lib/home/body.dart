import 'package:flutter/material.dart';

import '../model/data_products.dart';
import '../widgets/SingleProduct_widget.dart';
import '../model/single_product_model.dart';

class Body extends StatefulWidget {
  const Body({Key? key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> with TickerProviderStateMixin {
  late TabController _tabController;
  late TabController _tabController1;
  late TabController _tabController2;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    _tabController1 = TabController(length: 4, vsync: this);
    _tabController2 = TabController(length: 4, vsync: this);

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _tabController1.dispose();
    _tabController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 30,
      ),
      Container(
        child: TabBar(
            controller: _tabController,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(
                text: "Men",
              ),
              Tab(
                text: "Women",
              ),
              Tab(
                text: "Kids",
              ),
              Tab(
                text: "Babies",
              )
            ]),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.03,
      ),
      Expanded(
          child: TabBarView(controller: _tabController, children: [
        //1
        Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              child: TabBar(
                  controller: _tabController1,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(
                      text: "Formal",
                    ),
                    Tab(
                      text: "party",
                    ),
                    Tab(
                      text: "sports",
                    ),
                    Tab(
                      text: "casual",
                    ),
                  ]),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController1,
                children: [
                  Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: TabBar(
                            controller: _tabController2,
                            labelColor: Colors.black,
                            unselectedLabelColor: Colors.grey,
                            tabs: [
                              Tab(
                                text: "All",
                              ),
                              Tab(
                                text: "Saste",
                              ),
                              Tab(
                                text: "Mehenge",
                              ),
                              Tab(
                                text: "Free",
                              ),
                            ]),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _tabController2,
                          children: [
                            // Text("Screen 1"),

                            SingleChildScrollView(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12.0,
                                ),
                                child: GridView.builder(
                                  shrinkWrap: true,
                                  primary: true,
                                  itemCount: sigleProductData.length,
                                  physics: NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.7,
                                  ),
                                  itemBuilder: ((context, index) {
                                    var data = sigleProductData[index];
                                    return SingleProductWidget(
                                      productImage: data.productImage,
                                      productName: data.productName,
                                      productModel: data.productModel,
                                      productPrice: data.productPrice,
                                      productOldPrice: data.productOldPrice,
                                      onPressed: (){},
                                      index: 0,
                                      cartlist: cartlist,
                                    );
                                  }),
                                ),
                              ),
                            ),

                            Text("Screen 2"),
                            Text("Screen 3"),
                            Text("Screen 4"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Text("Screen 2"),
                  Text("Screen 3"),
                  Text("Screen 4"),
                ],
              ),
            ),
          ],
        ),

        //2
        Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              child: TabBar(
                  controller: _tabController1,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(
                      text: "School",
                    ),
                    Tab(
                      text: "Sports",
                    ),
                    Tab(
                      text: "Sandals",
                    ),
                    Tab(
                      text: "Dsss",
                    ),
                  ]),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController1,
                children: [
                  Text("Screen 5"),
                  Text("Screen 6"),
                  Text("Screen 7"),
                  Text("Screen 8"),
                ],
              ),
            ),
          ],
        ),

        //3
        Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              child: TabBar(
                  controller: _tabController1,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(
                      text: "School",
                    ),
                    Tab(
                      text: "Sports",
                    ),
                    Tab(
                      text: "Sandals",
                    ),
                    Tab(
                      text: "Dsss",
                    ),
                  ]),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController1,
                children: [
                  Text("Screen 9"),
                  Text("Screen 10"),
                  Text("Screen 11"),
                  Text("Screen 12"),
                ],
              ),
            ),
          ],
        ),

        //4
        Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              child: TabBar(
                  controller: _tabController1,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(
                      text: "School",
                    ),
                    Tab(
                      text: "Sports",
                    ),
                    Tab(
                      text: "Sandals",
                    ),
                    Tab(
                      text: "Dsss",
                    ),
                  ]),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController1,
                children: [
                  Text("Screen 13"),
                  Text("Screen 14"),
                  Text("Screen 15"),
                  Text("Screen 16"),
                ],
              ),
            ),
          ],
        ),
      ]))
    ]);
  }
}
