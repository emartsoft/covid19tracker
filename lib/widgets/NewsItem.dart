import 'package:covid19tracker/models/NewsModel.dart';
import 'package:flutter/material.dart';

class NewsItem extends StatelessWidget {
  final News news;
  final bool enabled;
  final GestureTapCallback onTap;
  final GestureLongPressCallback onLongPress;
  final bool selected;

  const NewsItem({
    Key key,
    this.news,
    this.enabled: true,
    this.onTap,
    this.onLongPress,
    this.selected: false,
  })  : assert(news != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = <Widget>[];
    TextTheme textTheme = Theme.of(context).textTheme;

    // background image
    children.add(LayoutId(
      id: _Block.bg,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: FadeInImage.assetNetwork(
          image: '${news.urlToImage}',
          fit: BoxFit.fitWidth,
          placeholder: 'assets/covid19icon.png',
          placeholderCacheHeight: 100,
          placeholderCacheWidth: 100,
          placeholderScale: 0.5,
        ),
      ),
    ));

    // news title and author
    children.add(
      LayoutId(
        id: _Block.text,
        child: Card(
          color: Colors.black54,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(children: [
              Text(
                '${news.title}',
                maxLines: 2,
                softWrap: true,
                style: textTheme.headline4.copyWith(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  '- ${news.source?.name ?? 'unknown'}',
                  style: textTheme.bodyText2.copyWith(
                      color: Colors.white70,
                      fontSize: 14.0,
                      fontStyle: FontStyle.italic),
                ),
              )
            ]),
          ),
        ),
      ),
    );

    return new InkWell(
      onTap: enabled ? onTap : null,
      onLongPress: enabled ? onLongPress : null,
      child: Semantics(
        selected: selected,
        enabled: enabled,
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: 200.0, maxHeight: 200.0),
          child: CustomMultiChildLayout(
            delegate: ItemLayoutDelegate(),
            children: children,
          ),
        ),
      ),
    );
  }
}

enum _Block {
  bg,
  text,
}

class ItemLayoutDelegate extends MultiChildLayoutDelegate {
  @override
  void performLayout(Size size) {
    if (hasChild(_Block.bg)) {
      layoutChild(_Block.bg, new BoxConstraints.tight(size));
      positionChild(_Block.bg, Offset.zero);
    }

    if (hasChild(_Block.text)) {
      layoutChild(_Block.text,
          new BoxConstraints.tight(Size(size.width, size.height * 0.4)));
      positionChild(
          _Block.text, new Offset(0.0, size.height - size.height * 0.4));
    }
  }

  @override
  bool shouldRelayout(MultiChildLayoutDelegate oldDelegate) => false;
}
