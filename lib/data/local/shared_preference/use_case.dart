import 'shared_pref.dart';
import 'shared_pref_keys.dart';

Future<bool> getPrefLoggedIn() async {
  var isLoggedIn = await getSharedPrefData(SharedPrefKeys.loggedIn);
  if(isLoggedIn==prefError) return false;
  if(isLoggedIn.runtimeType != bool) return false;
  return isLoggedIn;
}

void setPrefLoggedIn(bool isLoggedIn){
  setSharedPrefBool(SharedPrefKeys.loggedIn, isLoggedIn);
}