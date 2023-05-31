import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc_test/logic/change_theme/theme_bloc.dart';
import 'package:hydrated_bloc_test/logic/counter/counter_bloc.dart';
import 'package:hydrated_bloc_test/screens/home_screen.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorage.webStorageDirectory
          : await getApplicationDocumentsDirectory());
  runApp(const MainAppClass());
}

class MainAppClass extends StatelessWidget {
  const MainAppClass({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeBloc(),
        ),
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            home: const HomePage(),
            debugShowCheckedModeBanner: false,
            theme: state.color,
          );
        },
      ),
    );
  }
}
