import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gfo/utils/routes/routesName.dart';
import 'package:gfo/viewmodel/searchViewModel.dart';
import 'package:provider/provider.dart';

import '../../model/costumer/searchModel.dart';
import '../../utils/colors.dart';
import '../../utils/valueConstants.dart';
import '../globalWidgets/textFormFieldBig.dart';

class CustomerSearchScreen extends StatefulWidget {
  const CustomerSearchScreen({super.key});

  @override
  State<CustomerSearchScreen> createState() => _CustomerSearchScreenState();
}

class _CustomerSearchScreenState extends State<CustomerSearchScreen> {
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<SearchViewModel>(
      builder: (context, value, child) {
        return SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: 18, right: 18, top: verticalSpaceMedium),
              child: TextFormFieldBig(
                onFieldSubmitted: (p0) {
                  Navigator.pushNamed(context, RoutesName.customerSearchResult,
                      arguments: {"query": _searchController.text});
                },
                controller: _searchController,
                onChanged: (query) {
                  value.getSearchSuggestions(query);
                },
                prefixIcon: Icon(
                  CupertinoIcons.search,
                  color: colorLight3,
                ),
                hintText: "Search",
                height: 50,
                maxlines: 1,
                obscureText: false,
              ),
            ),
            const SizedBox(
              height: verticalSpaceSmall,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: value.suggestions.length,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (context, index) {
                  var items = value.suggestions[index];
                  return ListTile(
                    minVerticalPadding: 0,
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, RoutesName.customerSearchResult,
                                arguments: {"query": items.title});
                          },
                          child: Text(
                            items.title.toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: colorDark3),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Divider(
                          color: colorLight2,
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ));
      },
    ));
  }
}
