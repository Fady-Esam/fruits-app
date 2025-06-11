
import 'package:fruits_app/core/classes/svg_images_handler.dart';

class BottomNavigationBarEntity {
  final String activeImage, inActiveImage;
  final String name;

  BottomNavigationBarEntity(
      {required this.activeImage,
      required this.inActiveImage,
      required this.name});
}

List<BottomNavigationBarEntity> get bottomNavigationBarItems => [
      BottomNavigationBarEntity(
          activeImage: SvgImagesHandler.imagesVuesaxBoldHome,
          inActiveImage: SvgImagesHandler.imagesVuesaxOutlineHome,
          name: 'الرئيسية'),
      BottomNavigationBarEntity(
          activeImage: SvgImagesHandler.imagesVuesaxBoldProducts,
          inActiveImage: SvgImagesHandler.imagesVuesaxOutlineProducts,
          name: 'المنتجات'),
      BottomNavigationBarEntity(
          activeImage: SvgImagesHandler.imagesVuesaxBoldShoppingCart,
          inActiveImage: SvgImagesHandler.imagesVuesaxOutlineShoppingCart,
          name: 'سلة التسوق'),
      BottomNavigationBarEntity(
          activeImage: SvgImagesHandler.imagesVuesaxBoldUser,
          inActiveImage: SvgImagesHandler.imagesVuesaxOutlineUser,
          name: 'حسابي'),
    ];
