
import 'package:bloc/bloc.dart';


enum AuthEvent {login}

class AuthBloc extends Bloc<AuthEvent, bool>{
  AuthBloc()
  :super(false);

  //@override
  Stream<bool> mapEventToState(AuthEvent event) async*{
    switch(event){
      case AuthEvent.login:
      yield true;
      break;
    }
  }
}