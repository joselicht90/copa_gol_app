// ignore_for_file: file_names
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show Bloc;
import 'package:fluttertoast/fluttertoast.dart';

class GlobalBloc extends Bloc<GlobalEvent, GlobalState> {
  GlobalBloc() : super(Idle()) {
    on<ShowSnackBar>((event, emit) => _showSnackbar(event));
    on<ShowToast>((event, emit) => _showToast(event));
    on<ShowLoadingModal>((event, emit) => _showLoadingModal(event));
    on<HideLoadingModal>((event, emit) => _hideLoadingModal(event));
  }

  //Event Handlers
  void _showSnackbar(ShowSnackBar event) {
    try {
      ScaffoldMessenger.of(event.context).showSnackBar(
        SnackBar(
          content: Text(event.message),
        ),
      );
    } catch (e) {
      if (kDebugMode) print(e);
    }
  }

  void _showToast(ShowToast event) {
    Fluttertoast.showToast(
      msg: event.message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      fontSize: 16.0,
    );
  }

  void _showLoadingModal(ShowLoadingModal event) {
    showDialog(
      context: event.context,
      builder: (_) => const Dialog(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  void _hideLoadingModal(HideLoadingModal event) {
    Navigator.of(event.context).pop();
  }
}

//Events
abstract class GlobalEvent {}

class ShowSnackBar extends GlobalEvent {
  final BuildContext context;
  final String message;

  ShowSnackBar({
    required this.context,
    required this.message,
  });
}

class ShowToast extends GlobalEvent {
  final BuildContext context;
  final String message;

  ShowToast({
    required this.context,
    required this.message,
  });
}

class ShowLoadingModal extends GlobalEvent {
  final BuildContext context;

  ShowLoadingModal({
    required this.context,
  });
}

class HideLoadingModal extends GlobalEvent {
  final BuildContext context;

  HideLoadingModal({
    required this.context,
  });
}

//States
abstract class GlobalState {}

class Idle extends GlobalState {}
