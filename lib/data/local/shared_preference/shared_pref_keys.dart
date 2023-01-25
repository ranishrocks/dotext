enum SharedPrefKeys {
  loggedIn('logged_in', PrefTypes.bool),
  userName('user_name', PrefTypes.string),
  undefined('undefined', PrefTypes.undefined);
  
  const SharedPrefKeys(this.code, this.type);    
  final String code;
  final PrefTypes type;  
  
  factory SharedPrefKeys.getByCode(String code){
    return SharedPrefKeys.values.firstWhere(
      (value) => value.code == code, 
      orElse: () => SharedPrefKeys.undefined);
  }
}

enum PrefTypes {int, bool, double, string, stringList, undefined}