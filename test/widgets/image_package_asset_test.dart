import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main () {
  test('AssetImage from package', () {
    const image = AssetImage(
      'assets/images/logo.png',
      package: 'test_package',
    );
    expect(image.keyName, 'packages/test_package/assets/images/logo.png');
  });
  test('ExactAssetImage from package', () {
    const image = ExactAssetImage(
      'assets/images/logo.png',
      scale: 1.5,
      package: 'test_package',
    );
    expect(image.keyName, 'packages/test_package/assets/images/logo.png');
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

  test('AssetImage from package', () {
    const image = AssetImage(
      'assets/images/AquaSummer.png',
      package: 'test_package',
    );
    expect(image.keyName, 'packages/test_package/assets/images/AquaSummer.png');
  });
  test('ExactAssetImage from package', () {
    const image = ExactAssetImage(
      'assets/images/AquaSummer.png',
      scale: 1.5,
      package: 'test_package',
    );
    expect(image.keyName, 'packages/test_package/assets/images/AquaSummer.png');
  });

  test('AssetImage from package', () {
    const image = AssetImage(
      'assets/images/panier_cercle.png',
      package: 'test_package',
    );
    expect(image.keyName, 'packages/test_package/assets/images/panier_cercle.png');
  });
  test('ExactAssetImage from package', () {
    const image = ExactAssetImage(
      'assets/images/panier_cercle.png',
      scale: 1.5,
      package: 'test_package',
    );
    expect(image.keyName, 'packages/test_package/assets/images/panier_cercle.png');
  });

}