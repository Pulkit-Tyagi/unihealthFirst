
import 'package:flutter/cupertino.dart';

void main() {

var data = A();
data.percentage = 1298;
print(data.percentage);

}


class A{

  late double percent;
  set percentage(var marks){
    percent=(marks*100) / 2000;
  }

  get percentage{
    return percent;
  }



}

