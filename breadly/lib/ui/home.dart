import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(16, 45, 0, 0),
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/bg.jpg"),
                          fit: BoxFit.fill)),
                  child: Container(
                    padding: const EdgeInsets.only(
                      right: 12,
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:  [
                        const Text("Breadly",
                            style: TextStyle(
                              fontSize: 42,
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              height: 2.2,
                            )),
                        TabBar(
                          indicatorSize: TabBarIndicatorSize.label,
                          indicatorColor: Colors.transparent,
                          controller: _tabController,
                          isScrollable: true,
                          labelColor: Colors.black,
                          labelStyle: const TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          unselectedLabelColor: Colors.green.withOpacity(0.7),
                          tabs: const [
                            Tab(text: "Chleb"),
                            Tab(text: "Pączki"),
                            Tab(text: "Kajzerki"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.265),
                  child: TabBarView(controller: _tabController, children: [
                    Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.4,
                          color: Colors.red,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.4,
                          color: Colors.red,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.4,
                          color: Colors.red,
                        )
                      ],
                    )
                  ]),
                ),
              ],
            )));
  }
}
