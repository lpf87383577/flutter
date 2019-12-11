
参考资料：https://book.flutterchina.club/
### 项目结构
==pubspec.yaml文件==
这是flutter的资源文件，里面包含版本信息，依赖，资源，文字库等。
>name：应用或包名称。

>description: 应用或包的描述、简介。

>version：应用或包的版本号。

>dependencies：应用或包依赖的其它包或插件。

>dev_dependencies：开发环境依赖的工具包（而不是flutter应用本身依赖的包）。

>flutter：flutter相关的配置选项。
```
# 依赖信息
dependencies:
  flutter:
    sdk: flutter
    
# 资源信息
   assets:
      - images/1.png    

# 文字库信息
 fonts:
    - family: Schyler
       fonts:
         - asset: fonts/Schyler-Regular.ttf
```
==lib--main.dart==是项目编写的入口文件

```
//程序的入口
void main() => runApp(MyApp());

```
## UI 基础

### Widget
flutter中几乎所有的UI都是Widget，包括手势滑动。Widget分成StatelessWidget无状态和StatefulWidget有状态两种。

##### StatelessWidget
```
class TextView extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
  
        //放回一个Widget的实例
        return null,
      ),
    );
  }

```
##### StatefulWidget
通过设置setState（）刷新Widget

```
class ColorView extends StatefulWidget {
  @override
  ColorViewState createState()=>ColorViewState();

}

class ColorViewState extends State{

  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            _active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}


```
#### Widget的生命周期

开始--> 构造函数 --> initState --> didChangeDependencies --> build --> 添加到Tree -->deactive --> dispose -->

>常见场景

Widget A打开Widget B： Navigator.push(B)

B构造函数--->B initState--->B didChangeDependencies--->B build--->A deactive--->A didChangeDependencies.

Widget B退出： Navigator.pop

A deactive--->A didChangeDependencies--->A build--->B deactive--->B dispose

可以看出， Flutter打开、关闭Widget时跟安卓、iOS的时序一样， 都是先处理即将显示的界面。


#### Text
```
Text("Hello world! I'm Jack. "*4,
  maxLines: 1,
  overflow: TextOverflow.ellipsis,
);
```

```
```

```
```

```
```