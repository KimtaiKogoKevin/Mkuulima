import '../../models/User.dart';

class UserRepository {
  Users? _user;

  Future<Users?> getUser() async {
    await Future.delayed(const Duration(seconds: 1));
    return _user ?? Users.empty();
  }

  Future<void> updatePersonalInfo({
    required String name,
    required String email,
    required String phoneNumber,
  }) async {
    _user ??= Users.empty();
    await Future.delayed(const Duration(seconds: 1));
    _user = _user?.copyWith(
      personalInfo:
      PersonalInfo(name: name, email: email, phoneNumber: phoneNumber),
    );
  }

  Future<void> updateBillingAddress({
    required String street,
    required String apartment,
    required String city,
    required String country,
    required String postcode,
  }) async {
    _user ??= Users.empty();
    await Future.delayed(const Duration(seconds: 1));
    _user = _user?.copyWith(
      billingAddress: BillingAddress(
        street: street,
        apartment: apartment,
        city: city,
        country: country,
        postcode: postcode,
      ),
    );
  }

  Future<void> updatePayment({
    required String cardName,
    required String cardNumber,
    required String expiryDate,
    required String cvvNumber,
  }) async {
    _user ??= Users.empty();
    await Future.delayed(const Duration(seconds: 1));
    _user = _user?.copyWith(
      payment: Payment(
        cardName: cardName,
        cardNumber: cardNumber,
        expiryDate: expiryDate,
        cvvNumber: cvvNumber,
      ),
    );
  }
}