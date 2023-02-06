import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../blocs/checkout/personalInfoBloc/personal_info_bloc.dart';
import '../../repositories/User/userRepository.dart';
import 'forms/personalInfo.dart';

class PersonalInfoPage extends StatelessWidget {
  const PersonalInfoPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(
      builder: (_) => const PersonalInfoPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: BlocProvider(
        create: (context) => PersonalInfoBloc(
          userRepository: context.read<UserRepository>(),
        ),
        child: const PersonalInfoForm(),
      ),
    );
  }
}