bool isNumeric(String s){

  if (s.isEmpty) return false;

  final n = num.tryParse(s);

  return (n==null)? false:true;
}
bool isYearGood(String s){
  var myInt = int.parse(s);
  assert(myInt is int);
  return (myInt>=2021) ?false: true;
}
