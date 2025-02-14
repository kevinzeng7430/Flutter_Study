import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:net_article/api/article_api.dart';
import 'package:net_article/model/article.dart';
import 'package:flutter/cupertino.dart';
import 'package:easy_refresh/easy_refresh.dart';

import 'article_detail_page.dart';

class AriticleCotent extends StatefulWidget {
  const AriticleCotent({Key? key}) : super(key: key);

  @override
  State<AriticleCotent> createState() => _AriticleCotentState();
}

class _AriticleCotentState extends State<AriticleCotent> {
  List<Article> _articles = [];

  ArticleApi api = ArticleApi();

  bool _loading = false;
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    _loading = true;
    setState(() {});
    _articles = await api.loadArticles(0);
    _loading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {  //如果 _loading 为 true，则执行代码块中的内容。
      return Center( //Center 小部件用于将子小部件居中显示。
        child: Wrap(
          spacing: 10, //设置子小部件之间的间距为 10 像素。
          direction: Axis.vertical, //设置排列方向为垂直方向。
          crossAxisAlignment:WrapCrossAlignment.center, //设置子小部件在交叉轴（水平轴）上的对齐方式为居中对齐。
          children: const [
            CupertinoActivityIndicator(), //显示一个 iOS 风格的加载指示器。
            Text(
              "数据加载中，请稍后...",
              style: TextStyle(color: Colors.grey),  //显示一条加载提示文本，文本颜色为灰色。
            )
          ],
        ),
      );
    }

    return EasyRefresh( //小部件：用于实现下拉刷新和上拉加载更多的功能。
      header: const ClassicHeader( //ClassicHeader 是 EasyRefresh 提供的一个经典风格的下拉刷新头部。
        dragText: "下拉加载",
        armedText: "释放刷新",
        readyText: "开始加载",
        processingText: "正在加载",
        processedText: "刷新成功",
      ),
      footer: const ClassicFooter(processingText: "正在加载"),
      // dragText: "下拉加载"：当用户下拉时显示的文本。
      // armedText: "释放刷新"：当用户下拉到一定距离时显示的文本。
      // readyText: "开始加载"：当用户释放手指准备刷新时显示的文本。
      // processingText: "正在加载"：刷新过程中显示的文本。
      // processedText: "刷新成功"：刷新完成后显示的文本。
      // ClassicFooter 是 EasyRefresh 提供的一个经典风格的上拉加载更多底部。
      // processingText: "正在加载"：加载过程中显示的文本。

      onRefresh: _onRefresh,
      onLoad: _onLoad, //指定加载更多时调用的方法。
      child: ListView.builder( //用于创建一个可滚动的列表视图。
        itemExtent: 80,
        itemCount: _articles.length,
        itemBuilder: _buildItemByIndex,
        // itemExtent: 80：设置每个列表项的高度为 80 像素。
        // itemCount: _articles.length：设置列表项的数量为 _articles 列表的长度。
        // itemBuilder: _buildItemByIndex：指定构建每个列表项的方法。
      ),
    );
  }

  void _onRefresh() async {
    _articles = await api.loadArticles(0);
    setState(() {});
  }

  void _onLoad() async {
    int nextPage = _articles.length ~/ 20;
    List<Article> newArticles = await api.loadArticles(nextPage);
    _articles = _articles + newArticles;
    setState(() {});
  }

  Widget _buildItemByIndex(BuildContext context, int index) {
    print('点击了第 $index 个 item}');
    return ArticleItem(
      article: _articles[index], //index，从0开始自动增长
      onTap: _jumpToPage, //把当前article传给_jumpToPage
    );
  }

  void _jumpToPage(Article article) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ArticleDetailPage(article: article), //跳转到详情界面
      ),
    );
  }
}

class ArticleItem extends StatelessWidget {
  final Article article;
  final ValueChanged<Article> onTap;

  const ArticleItem({Key? key, required this.article, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(article),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      article.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  // Spacer(),
                  Text(
                    article.time,
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    article.url,
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
