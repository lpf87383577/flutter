==Dart是flutter的开发语言，Dart是单线程的语言==

参考出处：https://www.jianshu.com/p/06aebcad0543

在Dart中，一切都是对象，一切对象都是class的实例，哪怕是数字类型、方法甚至null都是对象，所有的对象都是继承自Object，虽然Dart是强类型语言，但变量类型是可选的因为Dart可以自动推断变量类型。

#### 变量
##### 变量定义
没有赋初值的变量都会有默认值null
```
main() {

//系统会自动判断类型 runtimeType;
  var a = 1;
  
  int b = 10;
  
  String s = "hello";
  
  bool b = true;
  
  //动态参数，类型可以变化的
  dynamic c = 0.5;
}
```

final和const
如果你绝不想改变一个变量，使用final或const，不要使用var或其他类型，一个被final修饰的变量只能被赋值一次，一个被const修饰的变量是一个编译时常量（const常量毫无疑问也是final常量）。可以这么理解：final修饰的变量是不可改变的，而const修饰的表示一个常量（编译时就确定值）。

##### 变量类型
```
main() {
  // numbers
  var a = 0;
  int b = 1;
  double c = 0.1;

  // strings
  var s1 = 'hello';
  String s2 = "world";

  // booleans
  var real = true;
  bool isReal = false;

  // lists
  var arr = [1, 2, 3, 4, 5];
  List<String> arr2 = ['hello', 'world', "123", "456"];
  List<dynamic> arr3 = [1, true, 'haha', 1.0];

  // maps
  var map = new Map();
  map['name'] = 'zhangsan';
  map['age'] = 10;
  Map m = new Map();
  m['a'] = 'a';

  //runes，Dart 中 使用runes 来获取UTF-32字符集的字符。String的 codeUnitAt and codeUnit属性可以获取UTF-16字符集的字符
  var clapping = '\u{1f44f}';
  print(clapping); // 打印的是拍手emoji的表情

  // symbols
  print(#s == new Symbol("s")); // true
```
#### 函数
##### 函数的返回值
Dart是一个面向对象的编程语言，所以即使是函数也是一个对象，也有一种类型Function，这就意味着函数可以赋值给某个变量或者作为参数传给另外的函数。虽然Dart推荐你给函数加上返回值，但是不加返回值的函数同样可以正常工作，另外你还可以用=>代替return语句，比如下面的代码：

```
// 声明返回值
int add(int a, int b) {
  return a + b;
}

// 不声明返回值
add2(int a, int b) {
  return a + b;
}

// =>是return语句的简写
add3(a, b) => a + b; 

main() {
  print(add(1, 2)); // 3
  print(add2(2, 3)); // 5
  print(add3(1, 2)); // 3
}
```
##### 命名参数

定义命名参数时，你可以以 {type paramName} 或者 {paramName: type} 两种方式声明参数，而调用命名参数时，需要以 funcName(paramName: paramValue) 的形式调用。命名参数的参数并不是必须的，所以上面的代码中，如果调用sayHello()不带任何参数，也是可以的，只不过最后打印出来的结果是：hello, my name is null，在Flutter开发中，你可以使用@required注解来标识一个命名参数，这代表该参数是必须的，你不传则会报错

```
sayHello({String name}) {
  print("hello, my name is $name");
}

sayHello2({name: String}) {
  print("hello, my name is $name");
}

main() {
  // 打印 hello, my name is zhangsan
  sayHello(name: 'zhangsan');

  // 打印 hello, my name is wangwu
  sayHello2(name: 'wangwu');
}
```
##### 位置参数
```
sayHello(String name, int age, [String hobby]) { // 位置参数可以有多个，比如[String a, int b]
  StringBuffer sb = new StringBuffer();
  sb.write("hello, this is $name and I am $age years old");
  if (hobby != null) {
    sb.write(", my hobby is $hobby");
  }
  print(sb.toString());
}

main() {
  // hello, this is zhangsan and I am 20 years old
  sayHello("zhangsan", 20);
  // hello, this is zhangsan and I am 20 years old, my hobby is play football
  sayHello("zhangsan", 20, "play football");
}
```
##### 参数默认值
```
// 命名参数的默认值
int add({int a, int b = 3}) { // 不能写成：int add({a: int, b: int = 3})
  return a + b;
}

// 位置参数的默认值
int sum(int a, int b, [int c = 3]) {
  return a + b + c;
}
```
##### 函数作为对象
一个函数作为参数传给另一个函数
```
printNum(int a) {
  print("$a");
}

main() {

    var f1 = printNum;
  Function f2 = printNum;
  var f3 = (int a) => print("a = $a");
  f1(1);
  f2(2);
  f3(6);
}
```
##### 匿名函数
```
test(Function callback) {
  callback("hello");
}

main() {
  test((param) {
    // 打印hello
    print(param);
  });
}

```
##### 函数返回值

所有的函数都有返回值，如果没有指定return语句，那么该函数的返回值为null

#### 运算符

```
main() {

  // 与Java相同的运算符操作
  int a = 1;
  ++a;
  a++;
  var b = 1;
  print(a == b);  // false
  print(a * b); // 3
  bool real = false;
  real ? print('real') : print('not real'); // not real
  print(real && a == b); // false
  print(real || a == 3); // true
  print(a != 2); // true
  print(a <= b); // false
  var c = 9;
  c += 10;
  print("c = $c"); // c = 19
  print(1<<2); // 4

  // 与Java不太一样的运算符操作

  // is运算符用于判断一个变量是不是某个类型的数据
  // is!则是判断变量不是某个类型的数据
  var s = "hello";
  print(s is String); // true
  var num = 6;
  print(num is! String); // true

  // ~/才是取整运算符，如果使用/则是除法运算，不取整
  int k = 1;
  int j = 2;
  print(k / j); // 0.5
  print(k ~/ j); // 0

  // as运算符类似于Java中的cast操作，将一个对象强制类型转换
  (emp as Person).teach();

  // ??=运算符 如果 ??= 运算符前面的变量为null，则赋值，否则不赋值
  var param1 = "hello", param2 = null;
  param1 ??= "world";
  param2 ??= "world";
  print("param1 = $param1"); // param1 = hello
  print("param2 = $param2"); // param2 = world
  
  // ?.运算符
  var str1 = "hello world";
  var str2 = null;
  print(str1?.length); // 11
  print(str2?.length); // null 
  print(str2.length); // 报错
}
```
##### ..运算符（级联操作）
..调用某个对象的方法（或者成员变量）时，返回值是这个对象本身，原本的返回值会被忽略掉。

```
class Person {
  eat() {
    print("I am eating...");
  }

  sleep() {
    print("I am sleeping...");
  }

  study() {
    print("I am studying...");
  }
}

main() {
  // 依次打印
  //  I am eating...
  //  I am sleeping...
  //  I am studying...
  new Person()..eat()
      ..sleep()
      ..study();
}
```
##### 控制流程
if / else switch for /while 语句跟Java中都类似，try / catch语句可能稍有不同，下面用一段代码说明：

```
main() {
  // if else语句
  int score = 80;
  if (score < 60) {
    print("so bad!");
  } else if (score >= 60 && score < 80) {
    print("just so so!");
  } else if (score >= 80) {
    print("good job!");
  }

  // switch语句
  String a = "hello";
  // case语句中的数据类型必须是跟switch中的类型一致
  switch (a) {
    case "hello":
      print("haha");
      break;
    case "world":
      print("heihei");
      break;
    default:
      print("WTF");
  }

  // for语句
  List<String> list = ["a", "b", "c"];
  for (int i = 0; i < list.length; i++) {
    print(list[i]);
  }
  for (var i in list) {
    print(i);
  }
  // 这里的箭头函数参数必须用圆括号扩起来
  list.forEach((item) => print(item));

  // while语句
  int start = 1;
  int sum = 0;
  while (start <= 100) {
    sum += start;
    start++;
  }
  print(sum);

  // try catch语句
  try {
    ...
  } catch (e) {
    // IntegerDivisionByZeroException
    print(e);
  }
  try {
    ...
  } on IntegerDivisionByZeroException { // 捕获指定类型的异常
    print("error"); // 打印出error
  } finally {
    print("over"); // 打印出over
  }
}

```
#### assert
assert 判断的条件可以是任何可以转化为 boolean 类型的对象，即使是函数也可以(此时判断的是函数返回值)。
如果assert 的判断为true, 则继续执行下面的语句。反之则会丢出一个异 AssertionError 。
```
assert(text != null);
```

### 类（Class） 
Dart中的类没有访问控制，所以你不需要用private, protected, public等修饰成员变量或成员函数，变量和函数名_开头表示是私有的。

```
class Person {
  String name;
  int age;
  String gender;
  Person(this.name, this.age, this.gender);
  sayHello() {
    print("hello, this is $name, I am $age years old, I am a $gender");
  }
}

//调用
  var p = new Person("zhangsan", 20, "male");
  p.sayHello(); // hello, this is zhangsan, I am 20 years old, I am a male
  p.age = 50;
  p.gender = "female";
  p.sayHello(); // hello, this is zhangsan, I am 50 years old, I am a female
```
##### 有命名的构造方法

```
class Point {
  num x, y;
  Point(this.x, this.y);
  // 类的命名构造方法
  Point.origin() {
    x = 0;
    y = 0;
  }
   // 命名构造方法调用了默认的构造方法
  Point.alongXAxis(num x) : this(x, 0);
  
}

main() {
  // 调用Point类的命名构造方法origin()
  var p = new Point.origin();
  var p2 = new Point(1, 2);
}
```
##### extends继承

```
//由于Human类没有默认构造方法，只有一个命名构造方法fromJson，所以
//在Man类继承Human类时，需要调用父类的fromJson方法做初始化，而且必须
//使用Man.fromJson(Map data) : super.fromJson(data)这种写法，
//而不是像Java那样将super写到花括号中。

class Human {
  String name;
  Human.fromJson(Map data) {
    print("Human's fromJson constructor");
  }
}

class Man extends Human {
  Man.fromJson(Map data) : super.fromJson(data) {
    print("Man's fromJson constructor");
  }
}
```
##### implements ,with关键字
implements和JAVA一样，with和继承类似，折叠其他类以实现代码重用。当属性和方法重复时，以当前类为准。比如上面例子调用D的c()方法打印的是 c is D。
```
class A {
  void a() {
    print('a');
  }
}

class B implements A {
  @override
  void a() {
    print('override a');
  }
}

class C {
  void c() {
    print('c');
  }
}

class E {
  String e = 'eeee';
}

class D extends A with C, E {
  void c() {
    print('c is D');
  }

  void d() {
    c();
  }
}
```

##### 成员方法

```
class Rectangle {
  num left, top, width, height;

  // 构造方法传入left, top, width, height几个参数
  Rectangle(this.left, this.top, this.width, this.height);

  // right, bottom两个成员变量提供getter/setter方法
  num get right => left + width;
  set right(num value) => left = value - width;
  num get bottom => top + height;
  set bottom(num value) => top = value - height;
}
```
##### 抽象类和抽象方法
和Java类似

##### 运算符重载
对已有的运算符重新进行定义，赋予其另一种功能，以适应不同的数据类型。

```
class Vector {
  num x, y;
  Vector(this.x, this.y);
  Vector operator +(Vector v) => new Vector(x + v.x, y + v.y);
  Vector operator -(Vector v) => new Vector(x - v.x, y - v.y);
  printVec() {
    print("x: $x, y: $y");
  }
}

main() {
  Vector v1 = new Vector(1, 2);
  Vector v2 = new Vector(3, 4);
  (v1 - v2).printVec(); // -2, -2
  (v1 + v2).printVec(); // 4, 6
}
```
##### 枚举类
和Java类似
```
enum Color { red, green, blue }
```
#### mixins
mixins是一个重复使用类中代码的方式
```
class A {
  a() {
    print("A's a");
  }
}

class B {
  b() {
    print("B's b");
  }
}

// 使用with关键字，表示类C是由类A和类B混合而构成
class C = A with B;

main() {
  C c = new C();
  c.a(); // A's a
  c.b(); // B's b
}
```

##### 静态成员变量和静态成员方法
```
// 类的静态成员变量和静态成员方法
class Cons {
  static const name = "zhangsan";
  static sayHello() {
    print("hello, this is ${Cons.name}");
  }
}

main() {
  Cons.sayHello(); // hello, this is zhangsan
  print(Cons.name); // zhangsan
}
```
#### 导包
```
//导入同级目录下util.dart文件
import './util.dart';
//as关键字为导入的某个包设置一个前缀，或者说别名
import 'package:lib2/lib2.dart' as lib2;

// 只导入lib1.dart的foo
import 'package:lib1/lib1.dart' show foo;

// 导入除了foo的所有其他部分
import 'package:lib2/lib2.dart' hide foo;
//使用deferred as可以让这个包懒加载，懒加载的包只会在该包被使用时得到加载
import 'package:greetings/hello.dart' deferred as hello;

```
#### 导入别的库
第三方公共库 https://pub.dartlang.org/

1.pubspec.yaml文件中dependencies加上http库
```
dependencies:
  flutter:
    sdk: flutter
  http: ^0.12.0//加上这句话
```
2.根目录运行命令行
```
flutter packages get
```
3.导入包http和json
```
import 'package:http/http.dart' as http;
import 'dart:convert';
```

#### 异步
async和await往往是成对出现的，如果一个方法中有耗时的操作，你需要将这个方法设置成async，并给其中的耗时操作加上await关键字，如果这个方法有返回值，你需要将返回值塞到Future中并返回，当代码执行到await时，会跳到async修饰的方法外，继续执行下面的语句，类似多线程。

```
Future checkVersion() async {
  var version = await lookUpVersion();
  // Do something with version
}
```
==从网络获取数据==
Future对象，用来表示一个潜在的value或error，并且Future的接收者可以注册一个一旦可用就处理value和error的回调。
```
import 'dart:async';
import 'package:http/http.dart' as http;

Future<String> getNetData() async{
  http.Response res = await http.get("http://www.baidu.com");
  return res.body;
}

main() {
  getNetData().then((str) {
    print(str);
    //json 解析
     var encoded = json.decode(response.body.toString());//对json进行解析
    print(encoded['result']);
  }).catchError((error) {
    	//捕获异常
            print(error);
          });;
}


```
