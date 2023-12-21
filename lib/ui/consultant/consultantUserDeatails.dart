// ignore_for_file: depend_on_referenced_packages
// import 'package:omni_datetime_picker/omni_datetime_picker.dart';
// import '../globalWidgets/buttonBig.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gfo/model/consultant/ConsultantUserSingleDataModel.dart';
import 'package:gfo/response/status.dart';
import 'package:gfo/services/sharedPreferencesServices/sharedPreferences.dart';
import 'package:gfo/ui/consultant/consultant_homeScreen.dart';
import 'package:gfo/utils/colors.dart';
import 'package:gfo/utils/responsive.dart';
import 'package:gfo/utils/valueConstants.dart';
import 'package:gfo/viewmodel/consultant/consultantGetBookedAllUser.dart';
import 'package:gfo/widgets/circular_progress.dart';
import 'package:provider/provider.dart';

class ConsultantUserInfoScreen extends StatefulWidget {
  Map<String, dynamic>? arguments;
  ConsultantUserInfoScreen({super.key, this.arguments});

  @override
  State<ConsultantUserInfoScreen> createState() =>
      _ConsultantUserInfoScreenState();
}

class _ConsultantUserInfoScreenState extends State<ConsultantUserInfoScreen> {
  String? id;
  SharedPreferencesViewModel sharedPreferencesViewModel =
      SharedPreferencesViewModel();
  String? token;
  void initState() {
    // TODO: implement initState
    super.initState();
    id = widget.arguments!['id'];
    final consultantUserData =
        Provider.of<ConsultantViewModelHome>(context, listen: false);
    Future.wait([sharedPreferencesViewModel.getConsultantToken()])
        .then((value) {
      token = value[0];
      print(value[0]);
      consultantUserData.ConsultantGetSingleBookedUserApi(token.toString(), id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: colorDark1),
        ),
        body: Consumer<ConsultantViewModelHome>(
          builder: (context, value, child) {
            switch (value.consultantData.status) {
              case Status.LOADING:
                return MyCircularProgressWidget();
              case Status.ERROR:
                return Center(child: Text("data Not Found"));
              case Status.COMPLETED:
                 if(value.consultantUserSingleDataModel==null){
                           return Center(child: IconButton(onPressed: () {
                             
                           }, icon: Icon(Icons.refresh_rounded,color: primaryColor,)));
                 }else{
                  var item = value.consultantUserSingleDataModel!.data;
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: context.deviceWidth,
                        height: context.deviceHeight * .5,
                        decoration: BoxDecoration(
                            color: colorLight2,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "https://t4.ftcdn.net/jpg/02/14/74/61/360_F_214746128_31JkeaP6rU0NzzzdFC4khGkmqc8noe6h.jpg"))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: verticalSpaceMedium,
                          left: 18,
                          right: verticalSpaceLarge,
                        ),
                        child: Text(
                          item!.name.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontSize: 24, fontWeight: FontWeight.w700),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: verticalSpaceExtraSmall,
                          left: 18,
                          right: verticalSpaceLarge,
                        ),
                        child: Text(
                          "work. Location",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: colorDark3),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: verticalSpaceExtraSmall,
                          left: 18,
                          right: verticalSpaceLarge,
                        ),
                        child: Text(
                          "USD 350",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: greenColor),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: verticalSpaceExtraSmall,
                          left: 18,
                          right: verticalSpaceLarge,
                        ),
                        child: Text(
                          "dr. Gilang is one of the best doctors in the Persahabatan Hospital. He has saved more than 1000 patients in the past 3 years. He has also received many awards from domestic and abroad as the best doctors. He is available on a private or schedule. ",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: colorLight3),
                        ),
                      ),
                    ],
                  ),
                );
                 }
              default:
            }
            return Container();
          },
        ));
  }
}
