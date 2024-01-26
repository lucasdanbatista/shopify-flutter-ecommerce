import '../../mappers/cart_mapper.dart';
import '../../network/dtos/cart_line_dto.dart';
import '../../network/web_services/cart_web_service.dart';
import '../entities/cart.dart';

abstract interface class CartRepository {
  Future<Cart> getCartById(String id);

  Future<Cart> addCartLine({
    required String cartId,
    required String productVariantId,
  });

  Future<Cart> updateCartLine({
    required String cartId,
    required String cartLineId,
    required int quantity,
  });
}

class DefaultCartRepository implements CartRepository {
  final CartWebService _service;
  final CartMapper _mapper;

  DefaultCartRepository(this._service, this._mapper);

  @override
  Future<Cart> getCartById(String id) async {
    final response = await _service.getCartById(id);
    return _mapper.toEntity(response);
  }

  @override
  Future<Cart> addCartLine({
    required String cartId,
    required String productVariantId,
  }) async {
    final response = await _service.addCartLine(
      cartId: cartId,
      productVariantId: productVariantId,
    );
    return _mapper.toEntity(response);
  }

  @override
  Future<Cart> updateCartLine({
    required String cartId,
    required String cartLineId,
    required int quantity,
  }) async {
    final response = await _service.updateCartLine(
      cartId: cartId,
      cartLine: CartLineDTO(
        id: cartLineId,
        quantity: quantity,
      ),
    );
    return _mapper.toEntity(response);
  }
}
