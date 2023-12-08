import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gfo/utils/colors.dart';

class SellerAddGalleryScreen extends StatefulWidget {
  const SellerAddGalleryScreen({super.key});

  @override
  State<SellerAddGalleryScreen> createState() => _SellerAddGalleryScreenState();
}

class _SellerAddGalleryScreenState extends State<SellerAddGalleryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: Theme.of(context).iconTheme,
        elevation: 0,
        title: Text(
          'Add Product',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(CupertinoIcons.bell),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Text('Add Gallery',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.black)),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Item Thumbnail',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black)),
                Text('Upload',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: secondaryColorLight)),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 335,
              width: 350,
              decoration: BoxDecoration(color: Colors.grey[200]),
              child: Center(
                  child: SvgPicture.asset('assets/gallerythumbnail.svg')),
            ),
            SizedBox(
              height: 30,
            ),
            Text('Item Gallery',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.black)),
            Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // number of items in each row
                    mainAxisSpacing: 3.0, // spacing between rows
                    crossAxisSpacing: 3.0, // spacing between columns
                  ),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Image.asset('assets/galleryitem.png'),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
