part of 'form_bloc.dart';


abstract class FormState extends Equatable {
  const FormState();
}

class FormInitial extends FormState {
  @override
  List<Object?> get props => [];
}


class FormsValidate extends FormState {

   FormsValidate(
      {
        required this.phone,
        required this.email,
        required this.password,
        required this.isEmailValid,
        required this.isPasswordValid,
        required this.isFormValid,
        required this.isLoading,
       required this.isEmail,
        required this.isPhone,
        this.errorMessage = "",
        required this.isNameValid,
        required this.isAgeValid,
        required this.isFormValidateFailed,
        this.displayName,
       // required this.age,
        required this.customButtonText,

        this.isFormSuccessful = false});

  final String email;
  final String? displayName;
 // final int age;
  final String phone;
   String customButtonText;
  final String password;
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isFormValid;
  final bool isNameValid;
  final bool isAgeValid;
  final bool isEmail;
  final bool isPhone;
  final bool isFormValidateFailed;
  final bool isLoading;
  final String errorMessage;
  final bool isFormSuccessful;

  FormsValidate copyWith(
      {String? email,
        String? password,
        String? displayName,
        bool? isEmailValid,
        bool? isPasswordValid,
        bool? isFormValid,
        bool? isLoading,
        String? phone,
       // int? age,
        String? customButtonText,
        bool? isPhone,
        bool? isEmail,
        String? errorMessage,
        bool? isNameValid,
        bool? isAgeValid,
        bool? isFormValidateFailed,
        bool? isFormSuccessful}) {
    return FormsValidate(
        email: email ?? this.email,
        phone: phone ?? this.phone,
        password: password ?? this.password,
        isEmailValid: isEmailValid ?? this.isEmailValid,
        isPasswordValid: isPasswordValid ?? this.isPasswordValid,
        isFormValid: isFormValid ?? this.isFormValid,
        isLoading: isLoading ?? this.isLoading,
        errorMessage: errorMessage ?? this.errorMessage,
        isNameValid: isNameValid ?? this.isNameValid,
       // age: age ?? this.age,
        isAgeValid: isAgeValid ?? this.isAgeValid,
        displayName: displayName ?? this.displayName,
        isFormValidateFailed: isFormValidateFailed ?? this.isFormValidateFailed,
        isFormSuccessful: isFormSuccessful ?? this.isFormSuccessful, customButtonText: this.customButtonText, isEmail: this.isEmail,isPhone: this.isPhone);
  }

  @override
  List<Object?> get props => [
    email,
    password,
    isEmailValid,
    isEmail,
    isPhone,
    phone,
    isPasswordValid,
    isFormValid,
    isLoading,
    errorMessage,
    isNameValid,
    displayName,
    //age,
    customButtonText,
    isFormValidateFailed,
    isFormSuccessful
  ];
}