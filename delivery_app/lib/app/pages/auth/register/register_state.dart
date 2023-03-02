import 'package:match/match.dart';

part 'register_state.g.dart';

@match
enum RegisterStatus {
   initial,
   register,
   success, 
   error 
}

class RegisterState {
  
}