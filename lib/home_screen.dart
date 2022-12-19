import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int isTouched = 0;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController!.addListener(
      () {
        setState(
          () {
            isTouched = _tabController!.index;
            //print(isTouched);
          },
        );
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAFAFA),
      appBar: getAppBar(),
      body: getTabView(),
    );
  }

  TabBarView getTabView() {
    return TabBarView(
      controller: _tabController,
      children: [
        sliverTabAdvice(),
        sliverTabFavorite(),
      ],
    );
  }

  CustomScrollView sliverTabFavorite() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 20, bottom: 20, right: 28, left: 28),
            child: Row(
              children: [
                Text(
                  'مشاهده بیشتر',
                  style: TextStyle(
                      fontFamily: 'SM', fontSize: 14, color: Colors.red),
                ),
                Spacer(),
                Text(
                  'خبر های داغ',
                  style: TextStyle(fontFamily: 'SM', fontSize: 16),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: getTypeOneNews(),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(top: 20, bottom: 0, right: 28, left: 28),
            child: Row(
              children: [
                Text(
                  'مشاهده بیشتر',
                  style: TextStyle(
                      fontFamily: 'SM', fontSize: 14, color: Colors.red),
                ),
                Spacer(),
                Text(
                  'خبر هایی که علاقه داری',
                  style: TextStyle(fontFamily: 'SM', fontSize: 16),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: getListBuildNewsType2(),
        )
      ],
    );
  }

  CustomScrollView sliverTabAdvice() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 20, bottom: 20, right: 28, left: 28),
            child: Row(
              children: [
                Text(
                  'مشاهده بیشتر',
                  style: TextStyle(
                      fontFamily: 'SM', fontSize: 14, color: Colors.red),
                ),
                Spacer(),
                Text(
                  'خبر های داغ',
                  style: TextStyle(fontFamily: 'SM', fontSize: 16),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: getTypeOneNews(),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(top: 20, bottom: 0, right: 28, left: 28),
            child: Row(
              children: [
                Text(
                  'مشاهده بیشتر',
                  style: TextStyle(
                      fontFamily: 'SM', fontSize: 14, color: Colors.red),
                ),
                Spacer(),
                Text(
                  'خبر هایی که علاقه داری',
                  style: TextStyle(fontFamily: 'SM', fontSize: 16),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: getListBuildNewsType2(),
        )
      ],
    );
  }

  Widget getContainerNewsType2(String varText, String varTitle, varFile) {
    return Container(
      height: 132,
      width: 380,
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        //crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  varTitle,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'SM',
                    color: Color(0xff1C1F2E),
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: SizedBox(
                    width: 230,
                    child: Text(
                      varText,
                      overflow: TextOverflow.visible,
                      softWrap: true,
                      style: TextStyle(
                        fontSize: 8,
                        fontFamily: 'SM',
                        color: Color(0xffBFC3C8),
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.menu,
                        size: 14,
                      ),
                      SizedBox(
                        width: 150,
                      ),
                      Text(
                        'خبرگزاری آخرین خبر',
                        style: TextStyle(
                          fontSize: 8,
                          fontFamily: 'SM',
                          color: Color(0xff1C1F2E),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          //Spacer(),
          Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: Container(
                  height: 116,
                  width: 116,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: Image.network(
                      varFile.url,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 11,
                right: 21,
                child: Container(
                  height: 28,
                  width: 69,
                  decoration: BoxDecoration(
                    color: Color(0xffFF033E).withOpacity(0.5),
                    borderRadius: BorderRadius.all(
                      Radius.circular(14),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'تکنولوژی',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'SM',
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  FutureBuilder<List<ParseObject>> getListBuildNewsType2() {
    return FutureBuilder<List<ParseObject>>(
      future: getNews(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: Container(
                width: 100,
                height: 100,
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              ),
            );
          default:
            if (snapshot.hasError) {
              return Center(
                child: Text("Error..."),
              );
            }
            if (!snapshot.hasData) {
              return Center(
                child: Text("No Data..."),
              );
            } else {
              return Container(
                height: 600,
                width: 380,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    var varTitle = '';
                    var varText = '';
                    ParseFile? varFile;
                    if (snapshot.data![index].get<int>('status') == 0) {
                      var varNews = snapshot.data![index];
                      varTitle = varNews.get<String>('title')!;
                      varText = varNews.get<String>('text')!;
                      varFile = snapshot.data![index].get<ParseFile>('image');
                    } else {
                      if (snapshot.data![index] == 0) {
                        Icon(Icons.menu);
                      }
                      return Container();
                    }
                    //final varImage = varNews.get<Image>('image')!;
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                      child: getContainerNewsType2(varText, varTitle, varFile),
                    );
                  },
                ),
              );
            }
        }
      },
    );
  }

  AppBar getAppBar() {
    return AppBar(
      bottom: TabBar(
        controller: _tabController,
        padding: EdgeInsets.symmetric(horizontal: 24),
        indicator: BoxDecoration(
          color: Color(0xffFF033E),
          borderRadius: BorderRadius.all(
            Radius.circular(17.5),
          ),
        ),
        indicatorColor: Colors.transparent,
        tabs: [
          Tab(
            child: Text(
              'دنبال میکنید',
              style: isTouched == 0
                  ? TextStyle(
                      fontFamily: 'SM', color: Colors.white, fontSize: 16)
                  : TextStyle(
                      fontSize: 16,
                      fontFamily: 'SM',
                      color: Color(0xffBFC3C8),
                    ),
            ),
          ),
          Tab(
            child: Text(
              'پیشنهادی',
              style: isTouched == 1
                  ? TextStyle(
                      fontFamily: 'SM', color: Colors.white, fontSize: 16)
                  : TextStyle(
                      fontSize: 16,
                      fontFamily: 'SM',
                      color: Color(0xffBFC3C8),
                    ),
            ),
          ),
        ],
      ),
      elevation: 0,
      backgroundColor: Color(0xffFAFAFA),
      centerTitle: true,
      leading: Icon(
        Icons.notifications_active,
        color: Colors.black,
      ),
      title: Container(
        width: 70,
        height: 32,
        child: Image.asset('assets/images/logo_news.png'),
      ),
    );
  }

  FutureBuilder<List<ParseObject>> getTypeOneNews() {
    return FutureBuilder<List<ParseObject>>(
      future: getNews(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: Container(
                width: 100,
                height: 100,
                child: CircularProgressIndicator(),
              ),
            );
          default:
            if (snapshot.hasError) {
              return Center(
                child: Text("Error..."),
              );
            }
            if (!snapshot.hasData) {
              return Center(
                child: Text("No Data..."),
              );
            } else {
              return Container(
                height: 279,
                child: GestureDetector(
                  onTap: () {},
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      var varTitle = '';
                      var varText = '';
                      ParseFile? varFile;
                      if (snapshot.data![index].get<int>('status') == 1) {
                        var varNews = snapshot.data![index];
                        varTitle = varNews.get<String>('title')!;
                        varText = varNews.get<String>('text')!;
                        varFile = snapshot.data![index].get<ParseFile>('image');
                      } else {
                        return Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Container(),
                        );
                      }
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                            getContainerNewsType1(varText, varTitle, varFile),
                      );
                    },
                  ),
                ),
              );
            }
        }
      },
    );
  }
}

Future<List<ParseObject>> getNews() async {
  QueryBuilder<ParseObject> queryTodo =
      QueryBuilder<ParseObject>(ParseObject('news'));
  final ParseResponse apiResponse = await queryTodo.query();

  if (apiResponse.success && apiResponse.results != null) {
    return apiResponse.results as List<ParseObject>;
  } else {
    return [];
  }
}

Widget getContainerNewsType1(String varText, String varTitle, varFile) {
  return Container(
    decoration: BoxDecoration(
      color: Color(0xffFFFFFF),
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
    ),
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Container(
              height: 140,
              width: 270,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: Image.network(
                  varFile.url,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'چند دقیقه قبل',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontFamily: 'SM',
                    color: Color(0xffBFC3C8),
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Spacer(),
                Text(
                  varTitle,
                  style: TextStyle(
                    fontFamily: 'SM',
                    color: Color(0xffBFC3C8),
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(
                  width: 3,
                ),
                Icon(
                  Icons.flash_on,
                  size: 15,
                  color: Color(
                    0xffFF033E,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(
                  width: 250,
                  child: Text(
                    varText,
                    softWrap: false,
                    style: TextStyle(
                      fontFamily: 'SM',
                      color: Color(0xff1C1F2E),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 30),
                  child: Icon(
                    Icons.menu_sharp,
                  ),
                ),
                Spacer(),
                Text(
                  'خبرگزاری آخرین خبر',
                  style: TextStyle(
                    fontFamily: 'SM',
                    color: Color(0xff1C1F2E),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                //Image.asset('assets/images/logo_news_name1.png')
              ],
            ),
          )
        ],
      ),
    ),
    height: 294,
    width: 279,
  );
}
