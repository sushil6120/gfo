import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gfo/response/status.dart';
import 'package:gfo/services/sharedPreferencesServices/sharedPreferences.dart';
import 'package:gfo/utils/colors.dart';
import 'package:gfo/utils/responsive.dart';
import 'package:gfo/utils/routes/routesName.dart';
import 'package:gfo/viewmodel/homeViewModel.dart';
import 'package:gfo/viewmodel/searchViewModel.dart';
import 'package:gfo/widgets/circular_progress.dart';
import 'package:provider/provider.dart';
// import 'package:gfo/widgets/products_widget.dart';

import '../../utils/valueConstants.dart';

class CustomerSearchResult extends StatefulWidget {
  Map<String, dynamic>? arguments;
  CustomerSearchResult({super.key, this.arguments});

  @override
  State<CustomerSearchResult> createState() => _CustomerAllProductScreenState();
}

class _CustomerAllProductScreenState extends State<CustomerSearchResult> {
  final ScrollController scrollController = ScrollController();

  SharedPreferencesViewModel sharedPreferencesViewModel =
      SharedPreferencesViewModel();
  String? query;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    query = widget.arguments!['query'];
    final productsViewModel =
        Provider.of<SearchViewModel>(context, listen: false);

    Future.wait([sharedPreferencesViewModel.getToken()]).then((value) {
      print(value[0]);

      productsViewModel.getSearchProduct(query.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: colorDark1,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.bell, color: colorDark1),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.cart, color: colorDark1),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: verticalSpaceSmall2,
                left: 14,
                right: verticalSpaceLarge,
              ),
              child: Text(
                "Search Result",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 24, fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(
              height: verticalSpaceMedium,
            ),
            Consumer<SearchViewModel>(
              builder: (context, value, child) {
                switch (value.allProductData.status) {
                  case Status.LOADING:
                    return Center(
                      child: MyCircularProgressWidget(),
                    );
                  case Status.ERROR:
                    return Center(
                      child: Text(value.allProductData.message.toString()),
                    );
                  case Status.COMPLETED:
                    return Container(
                      width: context.deviceWidth,
                      decoration: const BoxDecoration(
                        color: searchColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: GridView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 1 / 1.28,
                          crossAxisCount: 2,
                          crossAxisSpacing: 0.0,
                          mainAxisSpacing: 0.0,
                        ),
                        itemCount: value.searchProduct.length,
                        itemBuilder: (BuildContext context, int index) {
                          var items = value.searchProduct[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context,
                                  RoutesName.customerProductDetailsScreen,
                                  arguments: {
                                    "id": items.postedBy.toString(),
                                    "productId": items.sId,
                                  });
                            },
                            child: Container(
                              width: context.deviceWidth * .4,
                              height: context.deviceHeight * .25,
                              margin: const EdgeInsets.only(
                                  top: 16, left: 9, right: 9),
                              decoration: BoxDecoration(
                                color: colorLightWhite,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 30,
                                    color: colorDark3.withOpacity(.2),
                                    spreadRadius: 0,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  items.thumbnail == null ||
                                          items.thumbnail!.isEmpty
                                      ? Container(
                                          height: context.deviceHeight * .15,
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  "https://cdn5.vectorstock.com/i/1000x1000/38/19/product-promotion-black-icon-concept-vector-29963819.jpg"),
                                            ),
                                          ),
                                        )
                                      : Container(
                                          height: context.deviceHeight * .15,
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                items.thumbnail.toString(),
                                              ),
                                            ),
                                          ),
                                        ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      items.title.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 10, top: 8),
                                    child: Text(
                                      "₹ ${items.salePrice}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, top: 5, right: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text("⭐"),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10, top: 0),
                                              child: Text(
                                                "4.6",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium!
                                                    .copyWith(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, top: 0),
                                          child: Text(
                                            "86 Reviews",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                          ),
                                        ),
                                        Icon(
                                          CupertinoIcons.ellipsis_vertical,
                                          size: 16,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  default:
                    return Container();
                }
              },
            ),
            SizedBox(
              height: verticalSpaceLarge,
            ),
            SizedBox(
              height: verticalSpaceLarge,
            )
          ],
        ),
      ),
    );
  }
}
