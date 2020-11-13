import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main () {
  test('AssetImage from package', () {
    const image = AssetImage(
      'assets/images/Logo.png',
      package: 'test_package',
    );
    expect(image.keyName, 'packages/test_package/assets/images/Logo.png');
  });
  test('ExactAssetImage from package', () {
    const image = ExactAssetImage(
      'assets/images/Logo.png',
      scale: 1.5,
      package: 'test_package',
    );
    expect(image.keyName, 'packages/test_package/assets/images/Logo.png');
  });

  test('AssetImage from package', () {
    const image = AssetImage(
      'assets/images/Hamburger.png',
      package: 'test_package',
    );
    expect(image.keyName, 'packages/test_package/assets/images/Hamburger.png');
  });
  test('ExactAssetImage from package', () {
    const image = ExactAssetImage(
      'assets/images/Hamburger.png',
      scale: 1.5,
      package: 'test_package',
    );
    expect(image.keyName, 'packages/test_package/assets/images/Hamburger.png');
  });

  test('AssetImage from package', () {
    const image = AssetImage(
      'assets/images/panier.png',
      package: 'test_package',
    );
    expect(image.keyName, 'packages/test_package/assets/images/panier.png');
  });
  test('ExactAssetImage from package', () {
    const image = ExactAssetImage(
      'assets/images/panier.png',
      scale: 1.5,
      package: 'test_package',
    );
    expect(image.keyName, 'packages/test_package/assets/images/panier.png');
  });

}