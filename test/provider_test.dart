import 'package:beauty_online_shop/models/cart_model.dart';
import 'package:beauty_online_shop/models/perfumery.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCartModel extends Mock implements CartModel {
  List<int> _itemIDsInCart;
  MockCartModel(this._itemIDsInCart);

  int get totalPrice {
    int totalPrice = 0;
    for (var id in _itemIDsInCart) {
      totalPrice += searchByID(id)!.properties[id]!.price;
    }
    return totalPrice;
  }
}

void main() {
  late MockCartModel testcart;
  late MockCartModel testcart2;
  late MockCartModel testcart3;
  late MockCartModel testcart4;
  late MockCartModel testcart5;

  setUp(() {
    testcart = MockCartModel([0, 0, 0, 0, 0]);
    testcart2 = MockCartModel([2, 3, 1, 4, 4, 5]);
    testcart3 = MockCartModel([1, 4, 6, 3, 5]);
    testcart4 = MockCartModel([0, 3, 2, 4, 3, 7, 4, 3, 7, 5]);
    testcart5 = MockCartModel([1, 6, 3, 4, 3, 4, 3, 4, 3, 4, 6]);
  });
  test('calculating total price', () {
    expect(testcart.totalPrice, 249000);
  });
  test('calculating total price', () {
    expect(testcart2.totalPrice, 174450);
  });
  test('calculating total price', () {
    expect(testcart3.totalPrice, 137467);
  });
  test('calculating total price', () {
    expect(testcart4.totalPrice, 295950);
  });
  test('calculating total price', () {
    expect(testcart5.totalPrice, 290434);
  });
}
