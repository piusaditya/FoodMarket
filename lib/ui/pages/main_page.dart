part of 'pages.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedPage = 0;
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          SafeArea(
            child: Container(
              color: 'FAFAFC'.toColor(),
            ),
          ),
          SafeArea(
            child: PageView(
              controller: pageController,
              // meminta fungsi  menerima parameter int index yang = selectedPage
              // untuk geser2 pindah body main page
              onPageChanged: (index) {
                setState(() {
                  selectedPage = index;
                });
              },
              children: [
                Center(
                  child: FoodPage(),
                ),
                Center(
                  child: IllustrationPage(
                    title: 'Ouch! Hungry',
                    subtitle: 'Seems like you have not\nordered any food yet',
                    picturePath: 'assets/love_burger.png',
                    buttonTap1: () {},
                    buttonTitle1: 'Find Foods',
                    buttonTap2: (){}
                  ),
                ),
                Center(
                  child: Text("Profile"),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomBottomNavBar(
              selectedIndex: selectedPage,
              // saat NavBar diklik minta input int index yg dipilih
              onTap: (index) {
                setState(() {
                  selectedPage = index;
                });
                pageController.jumpToPage(selectedPage);
              },
            ),
          ),
        ],
      ),
    );
  }
}
