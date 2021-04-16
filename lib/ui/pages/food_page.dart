part of 'pages.dart';

class FoodPage extends StatefulWidget {
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double listItemWidth =
        MediaQuery.of(context).size.width - 2 * defaultMargin;
    return ListView(
      children: [
        Column(
          children: [
            // HEADER Title dan User Profile Image
            Container(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              color: Colors.white,
              height: 100,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center, //biar ketengah
                    children: [
                      Text(
                        "Food Market",
                        style: blackFontStyle1,
                      ),
                      Text(
                        "Let's get some foods",
                        style:
                            greyFontStyle.copyWith(fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8), //radius foto
                        image: DecorationImage(
                            //image: NetworkImage(
                            //'https://i.pinimg.com/474x/8a/f4/7e/8af47e18b14b741f6be2ae499d23fcbe.jpg'),
                            //image: NetworkImage(mockUser.picturePath),
                            image: NetworkImage(
                                (context.bloc<UserCubit>().state as UserLoaded)
                                    .user
                                    .picturePath),
                            fit: BoxFit.cover)),
                  )
                ],
              ),
            ),
            // LIST OF FOOD
            Container(
              height: 250,
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    children: mockFoods
                        .map((e) => Padding(
                              padding: EdgeInsets.only(
                                  left: (e == mockFoods.first)
                                      ? defaultMargin
                                      : 0,
                                  right: defaultMargin),
                              child: GestureDetector(
                                  onTap: () {
                                    Get.to(FoodDetailsPage(
                                      transaction: Transaction(
                                          food: e,
                                          user: (context.bloc<UserCubit>().state
                                                  as UserLoaded)
                                              .user),
                                      onBackButtonPressed: () {
                                        Get.back();
                                      },
                                    ));
                                  },
                                  child: FoodCard(e)),
                            ))
                        .toList(),
                  )
                ],
              ),
            ),
            // LIST OF FOOD (TABS)
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(children: [
                CustomTabBar(
                  titles: ['New Taste', 'Popular', 'Recommended'],
                  selectedIndex: selectedIndex,
                  onTap: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                ),
                SizedBox(height: 16),
                Builder(builder: (_) {
                  List<Food> foods = (selectedIndex == 0)
                      ? mockFoods
                      : (selectedIndex == 1)
                          ? []
                          : [];
                  return Column(
                    children: foods
                        .map((e) => Padding(
                              padding: EdgeInsets.fromLTRB(
                                  // padding jarak buat antar food list item
                                  defaultMargin,
                                  0,
                                  defaultMargin,
                                  16),
                              child: FoodListItem(
                                  food: e,
                                  itemWidth: listItemWidth), // list makanan
                            ))
                        .toList(),
                  );
                }),
              ]),
            ),
            SizedBox(
              height: 80,
            )
          ],
        )
      ],
    );
  }
}
