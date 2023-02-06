import 'dart:math';

class PackageCalculator{

  PackageCalculator({required this.interest, required this.hours, required this.experience});

  final int interest;
  final int hours;
  final int experience;

  int log2(int num) => (log(num) / log(2)).floor();


  double _package=10;

  String calculatePackage(){
    _package = (((interest * log2(hours*experience)) + hours*experience)*3)/20;
    return _package.toStringAsFixed(1);
  }

  String getFeedback(){
    if(_package>=40){
      return 'You Got a Super dream Package, now get your parents some gifts and keep improving';
    }
    else if(_package<=15){
      return 'You got a bit low package but still you can do mucch better, just work on  upskilling yourself';
    }
    else{
      return 'It\'s Just a start You can get much more than that soon. keep working Hard';
    }
  }

}