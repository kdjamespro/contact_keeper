import 'package:contact_keeper/features/contact_keeper/presentation/bloc/contact/contact_bloc.dart';
import 'package:contact_keeper/features/contact_keeper/presentation/bloc/contact/contact_event.dart';
import 'package:contact_keeper/features/contact_keeper/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:contact_keeper/features/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ContactBloc>(
      create: (context) => s1()..add(const GetAllContacts()),
      child: MaterialApp(
        title: 'Contact Keeper',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
