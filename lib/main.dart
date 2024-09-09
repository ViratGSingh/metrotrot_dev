import 'package:app/features/destination/data/models/dest_metro.dart';
import 'package:app/features/favourites/presentation/cubit/favourites_cubit.dart';
import 'package:app/features/from_search/data/models/from_fav_recom.dart';
import 'package:app/features/from_search/data/models/from_metro.dart';
import 'package:app/features/from_search/data/models/from_search_info.dart';
import 'package:app/features/home/presentation/widgets/onboarding/main.dart';
import 'package:app/features/nearby/data/datasources/nearby_service.dart';
import 'package:app/features/nearby/data/repositories/nearby_repository.dart';
import 'package:app/features/nearby/presentation/cubit/nearby_cubit.dart';
import 'package:app/features/to_search/data/models/dest_search_info.dart';
import 'package:app/features/to_search/data/models/to_fav_recom.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:app/features/directions/data/datasources/directions_service.dart';
import 'package:app/features/directions/data/repositories/directions_repository.dart';
import 'package:app/features/directions/presentation/cubit/directions_cubit.dart';
import 'package:app/features/from_search/data/datasources/from_search_service.dart';
import 'package:app/features/from_search/data/repositories/from_search_repository.dart';
import 'package:app/features/from_search/presentation/cubit/from_search_cubit.dart';
import 'package:app/features/home/data/datasources/home_service.dart';
import 'package:app/features/home/data/repositories/home_repository.dart';
import 'package:app/features/home/presentation/cubit/home_cubit.dart';
import 'package:app/features/home/presentation/pages/home.dart';
import 'package:app/features/to_search/data/datasources/to_search_service.dart';
import 'package:app/features/to_search/data/repositories/from_search_repository.dart';
import 'package:app/features/to_search/presentation/cubit/to_search_cubit.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:isar/isar.dart';
import 'package:app/features/home/data/models/directions.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  bool isFirst;
  WidgetsFlutterBinding.ensureInitialized();
  // initializing the firebase app
  await Firebase.initializeApp();
  final dir = await getApplicationDocumentsDirectory();
  Isar isar = Isar.getInstance() ??
      await Isar.open([
        DirectionsSchema,
        SavedFromRecommendationSchema,
        SavedToRecommendationSchema,
        SavedFromMetroSchema,
        SavedDestMetroSchema,
        FromSearchInfoSchema,
        DestSearchInfoSchema
      ],
      directory: dir.path
      );
  // int totalDirections = await isar.directions.count();

  // print(FirebaseAuth.instance.currentUser);
  // if (totalDirections != 0 || FirebaseAuth.instance.currentUser != null) {
  //   isFirst = false;
  // } else {
  //   //print(FirebaseAuth.instance.currentUser);
  //   isFirst = true;
  // }
  // print(isFirst);
  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  bool isFirst;
  MyApp({super.key, this.isFirst = false});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => HomeRepository(
            nearbyMetroService: HomeService(
              httpClient: http.Client(),
            ),
          ),
        ),
        RepositoryProvider(
          create: (context) => FromSearchRepository(
            fromSearchService: FromSearchService(
              httpClient: http.Client(),
            ),
          ),
        ),
        RepositoryProvider(
          create: (context) => ToSearchRepository(
            toSearchService: ToSearchService(
              httpClient: http.Client(),
            ),
          ),
        ),
        // RepositoryProvider(
        //   create: (context) => DestMetroRepository(
        //     destMetroService: DestMetroService(
        //       httpClient: http.Client(),
        //     ),
        //   ),
        // ),
        RepositoryProvider(
          create: (context) => DirectionsRepository(
            directionsService: DirectionsService(
              httpClient: http.Client(),
            ),
          ),
        ),
        RepositoryProvider(
          create: (context) => NearbyRepository(
            nearbyMetroService: NearbyService(
              httpClient: http.Client(),
            ),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<HomeCubit>(
            create: (BuildContext context) =>
                HomeCubit(homeRepository: context.read<HomeRepository>()),
          ),
          BlocProvider<NearbyCubit>(
            create: (BuildContext context) =>
                NearbyCubit(nearbyRepository: context.read<NearbyRepository>()),
          ),
          BlocProvider<FromSearchCubit>(
            create: (BuildContext context) => FromSearchCubit(
                fromSearchRepository: context.read<FromSearchRepository>()),
          ),
          BlocProvider<ToSearchCubit>(
            create: (BuildContext context) => ToSearchCubit(
                toSearchRepository: context.read<ToSearchRepository>()),
          ),
          // BlocProvider<DestMetroCubit>(
          //   create: (BuildContext context) => DestMetroCubit(
          //       destMetroRepository: context.read<DestMetroRepository>()),
          // ),
          BlocProvider<DirectionsCubit>(
            create: (BuildContext context) => DirectionsCubit(
                directionsRepository: context.read<DirectionsRepository>()),
          ),
          BlocProvider<FavouritesCubit>(
            create: (BuildContext context) => FavouritesCubit(),
          ),
        ],
        child: MaterialApp(
            title: 'MetroTrot',
            debugShowCheckedModeBanner: false,
            builder: (context, child) {
                  return MediaQuery(
                    data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                    child: child!,
                  );
                },
            theme: ThemeData(
              colorScheme:
                  ColorScheme.fromSeed(seedColor: Colors.white).copyWith(
                surfaceTint: Colors.transparent,
              ),
              appBarTheme: AppBarTheme(
                elevation: 4.0,
                shadowColor: Theme.of(context).colorScheme.shadow,
              ),
            ),
            home: const HomePage()
            //: const IntroScreen(),
            ),
      ),
    );
  }
}
