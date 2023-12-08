import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gfo/ui/consultant/Consultant_registration.dart';
import 'package:gfo/utils/colors.dart';
import 'package:gfo/utils/routes/routesName.dart';

class ConsultantProfileDetailScreen extends StatefulWidget {
  const ConsultantProfileDetailScreen({super.key});

  @override
  State<ConsultantProfileDetailScreen> createState() =>
      _ConsultantProfileDetailScreenState();
}

class _ConsultantProfileDetailScreenState extends State<ConsultantProfileDetailScreen> {
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
            title: Text('Andrea Hirata',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black)),
            subtitle: Text('9987654321',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: colorDark3)),
            trailing: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context,RoutesName.consultantRegistratinScreen);
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
                Text('Name - Andrea Hirata',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey)),
                SizedBox(
                  height: 20,
                ),
                Text('Contact No. - 98765432112',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey)),
                SizedBox(
                  height: 20,
                ),
                Text('E-mail Id - AndreaHirata@gmail.com',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey)),
                SizedBox(
                  height: 20,
                ),
                Text('Adhar No- 1234 4321 2211 2244',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey)),
                SizedBox(
                  height: 20,
                ),
                Text('PAN No. - 12345AZE23',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey)),
                SizedBox(
                  height: 20,
                ),
                Text('Education - Graduation',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey)),
                SizedBox(
                  height: 20,
                ),
                Text('Current or Ex-designation - UI UX designer',
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
                Text('Account Holder name - Andrea Hirata',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey)),
                SizedBox(
                  height: 20,
                ),
                Text('Account No. - 23*********543',
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