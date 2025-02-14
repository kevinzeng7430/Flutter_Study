# <span style="color:blue">命令行

以下命令让你可以使用 flutter 命令行工具来创建、分析、测试以及运行一个应用程序：
```
flutter create my_app
cd my_app
flutter analyze
flutter test
flutter run lib/main.dart
```
使用 flutter 命令行工具运行 pub 相关命令：
```
flutter pub get
flutter pub outdated
flutter pub upgrade
```
<span style="color:red">如果git的项目因为依赖问题无法运行，可以新建一个项目,将git项目的lib目录拷贝到新建的项目下，然后```flutter pub get```重新注入依赖</span>

# Contollers in Flutter:的用途

在 Flutter 中，`Controller` 是一种常用的机制，用于管理和控制各种 UI 组件的状态和行为。不同的组件可能有不同的控制器，但它们的基本用途都是相似的：管理组件的状态、响应用户输入、控制组件的行为等。以下是一些常见的控制器及其用途：

### 1. `TextEditingController`

**用途**：
- 管理 `TextField` 或 `TextFormField` 的文本内容。
- 监听文本变化。
- 设置或获取文本字段的值。

**示例**：
```dart
final TextEditingController _controller = TextEditingController();

@override
void initState() {
  super.initState();
  _controller.addListener(() {
    print('Text changed: ${_controller.text}');
  });
}

@override
Widget build(BuildContext context) {
  return TextField(
    controller: _controller,
  );
}

@override
void dispose() {
  _controller.dispose();
  super.dispose();
}
```
在 Flutter 中，`TextField` 组件的 `controller` 属性用于关联一个 `TextEditingController` 对象。这个控制器的作用主要有以下几个方面：

#### 1. 管理文本内容

- **设置初始值**：可以在初始化控制器时设置文本字段的初始值。
- **获取当前值**：可以通过控制器获取当前文本字段的内容。
- **更新文本内容**：可以通过控制器更新文本字段的内容。

#### 2. 监听文本变化

- **监听文本变化**：可以为控制器添加监听器，当文本字段的内容发生变化时，监听器会被触发。

#### 3. 控制焦点

- **请求焦点**：可以通过控制器请求文本字段获得焦点。
- **移除焦点**：可以通过控制器移除文本字段的焦点。

#### 4. 清空文本

- **清空文本**：可以通过控制器清空文本字段的内容。

#### 示例代码

以下是一个完整的示例，展示了如何使用 `TextEditingController` 来管理 `TextField` 的文本内容和监听文本变化：

以下是带有详细注释的代码，解释了每一部分的工作原理：

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('TextField Controller Example')), // 设置应用栏标题
        body: MyTextField(), // 将主界面设置为 MyTextField 组件
      ),
    );
  }
}

class MyTextField extends StatefulWidget {
  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  final TextEditingController _controller = TextEditingController(); // 创建一个 TextEditingController 实例

  @override
  void initState() {
    super.initState();
    // 设置初始值
    _controller.text = 'Initial Value'; // 初始化文本字段的内容为 "Initial Value"

    // 添加监听器
    _controller.addListener(() {
      print('Text changed: ${_controller.text}'); // 每当文本字段的内容发生变化时，打印当前内容
    });
  }

  @override
  void dispose() {
    // 释放资源
    _controller.dispose(); // 释放控制器资源，防止内存泄漏
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0), // 设置内边距，使内容居中显示
      child: Column(
        children: [
          TextField(
            controller: _controller, // 将控制器关联到 TextField
            decoration: InputDecoration(labelText: 'Enter text'), // 设置输入框的提示文本
          ),
          SizedBox(height: 20), // 添加垂直间距
          ElevatedButton(
            onPressed: () {
              // 获取当前值
              String currentText = _controller.text; // 获取当前文本字段的内容
              print('Current text: $currentText'); // 打印当前内容
            },
            child: Text('Get Text'), // 按钮文本
          ),
          ElevatedButton(
            onPressed: () {
              // 更新文本内容
              _controller.text = 'Updated Value'; // 更新文本字段的内容为 "Updated Value"
            },
            child: Text('Set Text'), // 按钮文本
          ),
          ElevatedButton(
            onPressed: () {
              // 清空文本
              _controller.clear(); // 清空文本字段的内容
            },
            child: Text('Clear Text'), // 按钮文本
          ),
        ],
      ),
    );
  }
}
```

### 详细解释

1. **导入包**：
   ```dart
   import 'package:flutter/material.dart';
   ```
   - 导入 Flutter 的 Material Design 包，包含了许多常用的 UI 组件和工具。

2. **主函数**：
   ```dart
   void main() {
     runApp(MyApp());
   }
   ```
   - `main` 函数是应用程序的入口点。
   - `runApp` 函数启动应用程序，并将 `MyApp` 作为根组件。

3. **`MyApp` 类**：
   ```dart
   class MyApp extends StatelessWidget {
     @override
     Widget build(BuildContext context) {
       return MaterialApp(
         home: Scaffold(
           appBar: AppBar(title: Text('TextField Controller Example')),
           body: MyTextField(),
         ),
       );
     }
   }
   ```
   - `MyApp` 是一个无状态组件，用于构建应用程序的根组件。
   - `MaterialApp` 是一个常用的 Flutter 应用程序框架，提供了主题、路由等基础功能。
   - `Scaffold` 是一个 Material Design 布局结构，包含应用栏（`AppBar`）和主体内容（`body`）。
   - `AppBar` 设置了应用栏的标题。
   - `body` 设置了主界面的内容为 `MyTextField` 组件。

4. **`MyTextField` 类**：
   ```dart
   class MyTextField extends StatefulWidget {
     @override
     //每一个SataefulWidget必须重写createState方法，返回一个State子类对象，用于管理组件的状态
     _MyTextFieldState createState() => _MyTextFieldState();
   }
  
   /*要求返回类型是_MyTextFieldState，完整写法
   _MyTextFieldState createState(){
    return _MyTextFieldState();
   } 
   */
   ```
   - `MyTextField` 是一个有状态组件，用于构建包含 `TextField` 的界面。
   - `createState` 方法返回 `_MyTextFieldState` 实例，用于管理组件的状态。

5. **`_MyTextFieldState` 类**：
   ```dart
   class _MyTextFieldState extends State<MyTextField> {
     final TextEditingController _controller = TextEditingController();

     @override
     void initState() {
       super.initState();
       _controller.text = 'Initial Value';
       _controller.addListener(() {
         print('Text changed: ${_controller.text}');
       });
     }

     @override
     void dispose() {
       _controller.dispose();
       super.dispose();
     }

     @override
     Widget build(BuildContext context) {
       return Padding(
         padding: EdgeInsets.all(16.0),
         child: Column(
           children: [
             TextField(
               controller: _controller,
               decoration: InputDecoration(labelText: 'Enter text'),
             ),
             SizedBox(height: 20),
             ElevatedButton(
               onPressed: () {
                 String currentText = _controller.text;
                 print('Current text: $currentText');
               },
               child: Text('Get Text'),
             ),
             ElevatedButton(
               onPressed: () {
                 _controller.text = 'Updated Value';
               },
               child: Text('Set Text'),
             ),
             ElevatedButton(
               onPressed: () {
                 _controller.clear();
               },
               child: Text('Clear Text'),
             ),
           ],
         ),
       );
     }
   }
   ```
   - `_MyTextFieldState` 是 `MyTextField` 的状态管理类。
   - `TextEditingController` 用于管理 `TextField` 的文本内容。
   - `initState` 方法在组件初始化时调用，设置初始值并添加监听器。
   - `dispose` 方法在组件销毁时调用，释放控制器资源。
   - `build` 方法构建组件的 UI。
     - `Padding` 用于设置内边距，使内容居中显示。
     - `Column` 用于垂直排列子组件。
     - `TextField` 是一个文本输入框，通过 `controller` 关联到 `_controller`。
     - `SizedBox` 用于添加垂直间距。
     - `ElevatedButton` 是一个带背景色的按钮，分别用于获取当前文本、更新文本和清空文本。

### 2. `AnimationController`

**用途**：
- 管理动画的状态和生命周期。
- 控制动画的开始、停止、前进、后退等。
- 监听动画的变化。

**示例**：
```dart
class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Container(
              width: _controller.value * 100,
              height: _controller.value * 100,
              color: Colors.blue,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_controller.isCompleted) {
            _controller.reverse();
          } else {
            _controller.forward();
          }
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
```

### 3. `PageController`

**用途**：
- 管理 `PageView` 的页面滚动。
- 控制页面的切换。
- 获取当前页面的索引。

**示例**：
```dart
class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: <Widget>[
          Container(color: Colors.red),
          Container(color: Colors.green),
          Container(color: Colors.blue),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'School'),
        ],
        currentIndex: _controller.page?.round() ?? 0,
        onTap: (index) {
          _controller.animateToPage(
            index,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        },
      ),
    );
  }
}
```

### 4. `TabController`

**用途**：
- 管理 `TabBar` 和 `TabBarView` 的标签页切换。
- 控制标签页的索引。
- 监听标签页的变化。

**示例**：
```dart
class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tab Controller Example'),
        bottom: TabBar(
          controller: _controller,
          tabs: [
            Tab(text: 'Tab 1'),
            Tab(text: 'Tab 2'),
            Tab(text: 'Tab 3'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          Center(child: Text('Content of Tab 1')),
          Center(child: Text('Content of Tab 2')),
          Center(child: Text('Content of Tab 3')),
        ],
      ),
    );
  }
}
```

### 总结

控制器在 Flutter 中主要用于管理组件的状态和行为，提供了一种集中管理和响应用户输入的方式。通过使用控制器，可以更方便地控制和监听组件的各种属性和事件，从而实现复杂的 UI 交互和动态效果。