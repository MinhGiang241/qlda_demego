// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qlda_demego/bloc/asset/asset_update/asset_update_bloc.dart';

import 'package:qlda_demego/screens/application/absent_letter.dart';
import 'package:qlda_demego/screens/application/break_time_letter.dart';
import 'package:qlda_demego/screens/application/change_shift_letter.dart';
import 'package:qlda_demego/screens/root/root_screen.dart';
import 'package:qlda_demego/screens/splash/splash_screen.dart';
import 'package:qlda_demego/services/provider/auth_provider.dart';
import 'package:qlda_demego/services/provider/sign_in_provider.dart';
import 'package:provider/provider.dart';
import '../bloc/asset/asset_list/asset_list_bloc.dart';
import '../screens/application/application_screen.dart';
import '../screens/application/confirm_letter_screen.dart';
import '../screens/application/letter_detail_screen.dart';
import '../screens/application/reply_letter_screen.dart';
import '../screens/assets/asset_detail.dart';
import '../screens/assets/asset_screen.dart';
import '../screens/assets/create_request_purchase_screen.dart';
import '../screens/assets/export_request_screen.dart';
import '../screens/assets/import_request_screen.dart';
import '../screens/assets/update_asset_screen.dart';
import '../screens/auth/sign_in/sign_in_screen.dart';
import '../screens/extra_task/create_extra_task_screen.dart';
import '../screens/extra_task/edit_extra_task_screen.dart';
import '../screens/extra_task/extra_task_detail_screen.dart';
import '../screens/extra_task/extra_task_list_screen.dart';
import '../screens/extra_task/kanban_assign_screen.dart';
import '../screens/extra_task/kanban_task_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/letter/detail_request_letter_screen.dart';
import '../screens/letter/request_letter_list_screen.dart';
import '../screens/missing/missing_object_detail_screen.dart';
import '../screens/missing/missing_object_list_screen.dart';
import '../screens/period_task/edit_task_config_screen.dart';
import '../screens/period_task/period_task_list_screen.dart';

class AppRoutes {
  Route onGenerateRoute(RouteSettings routeSetting) {
    switch (routeSetting.name) {
      case RootScreen.routeName:
        return MaterialPageRoute(
          settings: routeSetting,
          builder: (_) => const RootScreen(),
        );
      case SplashScreen.routeName:
        return MaterialPageRoute(
          settings: routeSetting,
          builder: (_) => ChangeNotifierProvider<AuthProvider>(
            create: (context) => AuthProvider()..start(),
            builder: (context, child) => SplashScreen(),
          ),
        );
      case SignInScreen.routeName:
        return MaterialPageRoute(
          settings: routeSetting,
          builder: (_) => MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (context) => AuthProvider()..start(),
              ),
              ChangeNotifierProvider(
                create: (context) =>
                    SignInProvider(authPrv: context.read<AuthProvider>()),
              ),
            ],
            builder: ((context, child) => SignInScreen()),
          ),
        );
      case HomeScreen.routeName:
        return MaterialPageRoute(
          settings: routeSetting,
          builder: (context) => const HomeScreen(),
        );
      case ApplicationScreen.routeName:
        return MaterialPageRoute(
          settings: routeSetting,
          builder: (context) => const ApplicationScreen(),
        );
      case AbsentLetter.routeName:
        return MaterialPageRoute(
          settings: routeSetting,
          builder: ((context) => AbsentLetter()),
        );
      case BreakTimeLetter.routeName:
        return MaterialPageRoute(
          settings: routeSetting,
          builder: ((context) => BreakTimeLetter()),
        );
      case ChangeShiftLetter.routeName:
        return MaterialPageRoute(
          settings: routeSetting,
          builder: ((context) => ChangeShiftLetter()),
        );
      case LetterDetailScreen.routeName:
        return MaterialPageRoute(
          settings: routeSetting,
          builder: ((context) => LetterDetailScreen()),
        );
      case ReplyLetterScreen.routeName:
        return MaterialPageRoute(
          settings: routeSetting,
          builder: ((context) => ReplyLetterScreen()),
        );
      case ConfirmLetterScreen.routeName:
        return MaterialPageRoute(
          settings: routeSetting,
          builder: ((context) => ConfirmLetterScreen()),
        );
      case AssetScreen.routeName:
        return MaterialPageRoute(
          settings: routeSetting,
          builder: (context) => BlocProvider(
            create: (_) => AssetListBloc(),
            child: AssetScreen(),
          ),
        );
      case AssetDetailScreen.routeName:
        return MaterialPageRoute(
          settings: routeSetting,
          builder: ((context) => AssetDetailScreen()),
        );
      case UpdateAssetScreen.routeName:
        return MaterialPageRoute(
          settings: routeSetting,
          builder: (context) => BlocProvider(
            create: (context) => AssetUpdateBloc(context),
            child: UpdateAssetScreen(),
          ),
        );
      case CreateRequestPurchaseScreen.routeName:
        return MaterialPageRoute(
          settings: routeSetting,
          builder: ((context) => CreateRequestPurchaseScreen()),
        );
      case ExportRequestScreen.routeName:
        return MaterialPageRoute(
          settings: routeSetting,
          builder: ((context) => ExportRequestScreen()),
        );
      case ImportRequestScreen.routeName:
        return MaterialPageRoute(
          settings: routeSetting,
          builder: ((context) => ImportRequestScreen()),
        );
      case RequestLetterListScreen.routeName:
        return MaterialPageRoute(
          settings: routeSetting,
          builder: ((context) => RequestLetterListScreen()),
        );
      case DetailRequestLetterScreen.routeName:
        return MaterialPageRoute(
          settings: routeSetting,
          builder: ((context) => DetailRequestLetterScreen()),
        );
      case ExtraTaskListScreen.routeName:
        return MaterialPageRoute(
          settings: routeSetting,
          builder: ((context) => ExtraTaskListScreen()),
        );
      case CreateExtraTaskScreen.routeName:
        return MaterialPageRoute(
          settings: routeSetting,
          builder: ((context) => CreateExtraTaskScreen()),
        );
      case ExtraTaskDetailScreen.routeName:
        return MaterialPageRoute(
          settings: routeSetting,
          builder: ((context) => ExtraTaskDetailScreen()),
        );
      case EditExtraTaskScreen.routeName:
        return MaterialPageRoute(
          settings: routeSetting,
          builder: ((context) => EditExtraTaskScreen()),
        );
      case KanbanTaskScreen.routeName:
        return MaterialPageRoute(
          settings: routeSetting,
          builder: ((context) => KanbanTaskScreen()),
        );
      case KanbanAssignTask.routeName:
        return MaterialPageRoute(
          settings: routeSetting,
          builder: ((context) => KanbanAssignTask()),
        );
      case PeriodTaskListScreen.routeName:
        return MaterialPageRoute(
          settings: routeSetting,
          builder: ((context) => PeriodTaskListScreen()),
        );
      case EditTaskConfigScreen.routeName:
        return MaterialPageRoute(
          settings: routeSetting,
          builder: ((context) => EditTaskConfigScreen()),
        );
      case MissingObjectListScreen.routeName:
        return MaterialPageRoute(
          settings: routeSetting,
          builder: ((context) => MissingObjectListScreen()),
        );
      case MissingObjectDetailScreen.routeName:
        return MaterialPageRoute(
          settings: routeSetting,
          builder: ((context) => MissingObjectDetailScreen()),
        );
      default:
        return MaterialPageRoute(
          settings: routeSetting,
          builder: (_) => const SplashScreen(),
        );
    }
  }
}
