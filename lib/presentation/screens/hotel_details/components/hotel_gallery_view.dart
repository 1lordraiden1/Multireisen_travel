import 'package:flutter/material.dart' hide Image;
import 'package:qfly/bloc/cubit/home/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qfly/constant/colors.dart';
import 'package:qfly/constant/text_styles_manager.dart';
import 'package:qfly/presentation/screens/display_images/display_image_screen.dart';
import 'package:qfly/presentation/widgets/shimmer/fancy_image_shape.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../data/model/hotel/hotel.dart';

class HotelGalleryView extends StatelessWidget {
  const HotelGalleryView({
    super.key,
    required this.homeCubit,
    required this.images,
  });

  final HomeCubit homeCubit;
  final List<Image> images;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
        bloc: homeCubit,
        builder: (context, snapshot) {
          return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DisplayImagesScreen(
                    img: images
                        .map(
                          (e) => e.url!,
                        )
                        .toList(),
                  ),
                )),
            child: Stack(
              children: [
                Expanded(
                  child: Container(
                    child: FancyImageShape(
                      radius: BorderRadius.only(
                        bottomLeft: Radius.circular(15.r),
                      ),
                      imagePath: images.isEmpty
                          ? 'https://www.usatoday.com/gcdn/-mm-/05b227ad5b8ad4e9dcb53af4f31d7fbdb7fa901b/c=0-64-2119-1259/local/-/media/USATODAY/USATODAY/2014/08/13/1407953244000-177513283.jpg?width=660&height=373&fit=crop&format=pjpg&auto=webp'
                          : homeCubit.selectedImage.url == null
                              ? images.first.url!
                              : homeCubit.selectedImage.url!,
                    ),
                  ),
                ),
                Positioned(
                  width: 350,
                  left: 10,
                  bottom: 30,
                  child: SizedBox(
                    height: 60,
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemBuilder: (_, index) => GestureDetector(
                        onTap: () {
                          homeCubit.selectHotelImageHandler(images[index]);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: homeCubit.selectedImage == images[index]
                                  ? primaryColor
                                  : grey,
                              width: 3,
                              style: BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: FancyImageShape(
                            imagePath: images[index].url!,
                            radius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            height: 60,
                            width: 60,
                          ),
                        ),
                      ),
                      separatorBuilder: (_, __) => const SizedBox(
                        width: 10,
                      ),
                      itemCount: images.length,
                    ),
                  ),
                ),
                Positioned(
                  top: 15,
                  left: 10,
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_back,
                    ),
                    color: white,
                  ),
                ),
              ],
            ),
          );
        });
  }
}
