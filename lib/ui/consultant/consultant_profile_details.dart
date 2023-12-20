import 'package:flutter/material.dart';
import 'package:gfo/model/consultant/consultantProfileModel.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:gfo/ui/consultant/Consultant_registration.dart';
import 'package:gfo/utils/colors.dart';
import 'package:gfo/utils/routes/routesName.dart';

class ConsultantProfileDetailScreen extends StatefulWidget {
  Map<String, dynamic>? arguments;
  ConsultantProfileDetailScreen({super.key, this.arguments});

  @override
  State<ConsultantProfileDetailScreen> createState() =>
      _ConsultantProfileDetailScreenState();
}

class _ConsultantProfileDetailScreenState
    extends State<ConsultantProfileDetailScreen> {
  Data? profileData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profileData = widget.arguments!['profileData'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                child: Image.asset(
                  'assets/images/sellerprofile.png',
                )),
            title: Text(
                profileData!.name.toString().substring(0, 1).toUpperCase() +
                    profileData!.name!.substring(1),
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black)),
            subtitle: Text(profileData!.phone.toString(),
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: colorDark3)),
            trailing: GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                    context, RoutesName.consultantRegistratinScreen,
                    arguments: {"profileData": profileData, "isEdit": true});
              },
              child: Icon(
                Icons.edit_outlined,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    'Name - ${profileData!.name.toString().substring(0, 1).toUpperCase() + profileData!.name!.substring(1)}',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey)),
                SizedBox(
                  height: 20,
                ),
                Text('Contact No. - ${profileData!.phone.toString()}',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey)),
                SizedBox(
                  height: 20,
                ),
                Text('E-mail Id - ${profileData!.email.toString()}',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey)),
                SizedBox(
                  height: 20,
                ),
                Text('Adhar No- ${profileData!.aadhaarNumber.toString()}',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey)),
                SizedBox(
                  height: 20,
                ),
                Text('PAN No. - ${profileData!.panNumber.toString()}',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey)),
                SizedBox(
                  height: 20,
                ),
                Text('Education - ${profileData!.education.toString()}',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey)),
                SizedBox(
                  height: 20,
                ),
                Text(
                    'Current or Ex-designation - ${profileData!.designation.toString()}',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey)),
                SizedBox(
                  height: 30,
                ),
                Text('Bank Details',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black)),
                SizedBox(
                  height: 20,
                ),
                Text(
                    'Account Holder name - ${profileData!.bankAccName.toString()}',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey)),
                SizedBox(
                  height: 20,
                ),
                Text('Account No. - ${profileData!.accNo.toString()}',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
