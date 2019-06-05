class Post {
   Post({
    this.title,
    this.author,
    this.imageUrl,
    this.description,
  });

  final String title;
  final String author;
  final String imageUrl;
  final String description;
  bool selected = false;
}

final List<Post> posts = [
  Post(
      title: 'Candy Shop',
      author: 'qiaoluheng',
      description: 'Flutter是谷歌的移动UI框架，可以快速在iOS和Android上构建高质量的原生用户界面。 Flutter可以与现有的代码一起工作。在全世界，Flutter正在被越来越多的开发者和组织使用，并且Flutter是完全免费、开源的。',
      imageUrl:
          'http://a4.att.hudong.com/15/80/01300000934991132306802478416.jpg'),
  Post(
      title: 'Childhood in a picture',
      author: 'qiaoluheng2',
      description: '快速发布聚焦于原生体验的功能。分层的架构允许您完全自定义，从而实现难以置信的快速渲染和富有表现力、灵活的设计。',
      imageUrl:
          'http://img.pconline.com.cn/images/upload/upc/tx/itbbs/1409/11/c9/38468199_1410412930091.jpg'),
  Post(
      title: 'Contained',
      author: 'qiaoluheng',
      description:'Flutter包含了许多核心的widget，如滚动、导航、图标和字体等，这些都可以在iOS和Android上达到原生应用一样的性能。',
      imageUrl:
          'http://img5.duitang.com/uploads/blog/201401/16/20140116161649_KAxYH.thumb.700_0.jpeg'),
  Post(
      title: 'Angular',
      author: 'Jory',
      description:'毫秒级的热重载，修改后，您的应用界面会立即更新。使用丰富的、完全可定制的widget在几分钟内构建原生界面。',
      imageUrl: 'http://img.news18a.com/bseries/5c988adeae040_6.jpg'),
  Post(
      title: 'The Old Fashioned',
      author: 'White',
      description:'通过平台相关的API、第三方SDK和原生代码让您的应用变得强大易用。 Flutter允许您复用现有的Java、Swift或ObjC代码，访问iOS和Android上的原生系统功能和系统SDK。',
      imageUrl: 'http://images.ccoo.cn/news/20111014/2011101420054184.jpg'),
  Post(
      title: 'Contained',
      author: 'Blue',
      description:'通过平台相关的API、第三方SDK和原生代码让您的应用变得强大易用。 Flutter允许您复用现有的Java、Swift或ObjC代码，访问iOS和Android上的原生系统功能和系统SDK。',
      imageUrl:
          'http://a1.att.hudong.com/00/75/01300000934991132315756564233.jpg'),
  Post(
      title: 'Pruple Color',
      author: 'Orange',
      description:'通过平台相关的API、第三方SDK和原生代码让您的应用变得强大易用。 Flutter允许您复用现有的Java、Swift或ObjC代码，访问iOS和Android上的原生系统功能和系统SDK。',
      imageUrl: 'http://img.lanrentuku.com/img/allimg/1309/5-130919100015.png'),
  Post(
      title: 'Keyclack',
      author: 'luheng',
      description:'通过平台相关的API、第三方SDK和原生代码让您的应用变得强大易用。 Flutter允许您复用现有的Java、Swift或ObjC代码，访问iOS和Android上的原生系统功能和系统SDK。',
      imageUrl:
          'http://a1.att.hudong.com/00/75/01300000934991132315756564233.jpg'),
  Post(
      title: 'Overkill',
      author: 'qiaoheng',
      description:'通过平台相关的API、第三方SDK和原生代码让您的应用变得强大易用。 Flutter允许您复用现有的Java、Swift或ObjC代码，访问iOS和Android上的原生系统功能和系统SDK。',
      imageUrl: 'http://img.lanrentuku.com/img/allimg/1610/5-161016101014.png'),
  Post(
      title: 'Free Hugs',
      author: 'API',
      description:'通过平台相关的API、第三方SDK和原生代码让您的应用变得强大易用。 Flutter允许您复用现有的Java、Swift或ObjC代码，访问iOS和Android上的原生系统功能和系统SDK。',
      imageUrl: 'http://img.news18a.com/bseries/5c988adeae040_6.jpg'),
  Post(
      title: 'Dragon',
      author: 'SDK',
      description:'通过平台相关的API、第三方SDK和原生代码让您的应用变得强大易用。 Flutter允许您复用现有的Java、Swift或ObjC代码，访问iOS和Android上的原生系统功能和系统SDK。',
      imageUrl:
          'http://a1.att.hudong.com/00/75/01300000934991132315756564233.jpg'),
  Post(
      title: 'Say Hello',
      author: 'Mohaed Chahin',
      description:'通过平台相关的API、第三方SDK和原生代码让您的应用变得强大易用。 Flutter允许您复用现有的Java、Swift或ObjC代码，访问iOS和Android上的原生系统功能和系统SDK。通过平台相关的API、第三方SDK和原生代码让您的应用变得强大易用。 Flutter允许您复用现有的Java、Swift或ObjC代码，访问iOS和Android上的原生系统功能和系统SDK。通过平台相关的API、第三方SDK和原生代码让您的应用变得强大易用。 Flutter允许您复用现有的Java、Swift或ObjC代码，访问iOS和Android上的原生系统功能和系统SDK。通过平台相关的API、第三方SDK和原生代码让您的应用变得强大易用。 Flutter允许您复用现有的Java、Swift或ObjC代码，访问iOS和Android上的原生系统功能和系统SDK。通过平台相关的API、第三方SDK和原生代码让您的应用变得强大易用。 Flutter允许您复用现有的Java、Swift或ObjC代码，访问iOS和Android上的原生系统功能和系统SDK。通过平台相关的API、第三方SDK和原生代码让您的应用变得强大易用。 Flutter允许您复用现有的Java、Swift或ObjC代码，访问iOS和Android上的原生系统功能和系统SDK。通过平台相关的API、第三方SDK和原生代码让您的应用变得强大易用。 Flutter允许您复用现有的Java、Swift或ObjC代码，访问iOS和Android上的原生系统功能和系统SDK。通过平台相关的API、第三方SDK和原生代码让您的应用变得强大易用。 Flutter允许您复用现有的Java、Swift或ObjC代码，访问iOS和Android上的原生系统功能和系统SDK。通过平台相关的API、第三方SDK和原生代码让您的应用变得强大易用。 Flutter允许您复用现有的Java、Swift或ObjC代码，访问iOS和Android上的原生系统功能和系统SDK。通过平台相关的API、第三方SDK和原生代码让您的应用变得强大易用。 Flutter允许您复用现有的Java、Swift或ObjC代码，访问iOS和Android上的原生系统功能和系统SDK。通过平台相关的API、第三方SDK和原生代码让您的应用变得强大易用。 Flutter允许您复用现有的Java、Swift或ObjC代码，访问iOS和Android上的原生系统功能和系统SDK。通过平台相关的API、第三方SDK和原生代码让您的应用变得强大易用。 Flutter允许您复用现有的Java、Swift或ObjC代码，访问iOS和Android上的原生系统功能和系统SDK。通过平台相关的API、第三方SDK和原生代码让您的应用变得强大易用。 Flutter允许您复用现有的Java、Swift或ObjC代码，访问iOS和Android上的原生系统功能和系统SDK。通过平台相关的API、第三方SDK和原生代码让您的应用变得强大易用。 Flutter允许您复用现有的Java、Swift或ObjC代码，访问iOS和Android上的原生系统功能和系统SDK。通过平台相关的API、第三方SDK和原生代码让您的应用变得强大易用。 Flutter允许您复用现有的Java、Swift或ObjC代码，访问iOS和Android上的原生系统功能和系统SDK。通过平台相关的API、第三方SDK和原生代码让您的应用变得强大易用。 Flutter允许您复用现有的Java、Swift或ObjC代码，访问iOS和Android上的原生系统功能和系统SDK。通过平台相关的API、第三方SDK和原生代码让您的应用变得强大易用。 Flutter允许您复用现有的Java、Swift或ObjC代码，访问iOS和Android上的原生系统功能和系统SDK。通过平台相关的API、第三方SDK和原生代码让您的应用变得强大易用。 Flutter允许您复用现有的Java、Swift或ObjC代码，访问iOS和Android上的原生系统功能和系统SDK。通过平台相关的API、第三方SDK和原生代码让您的应用变得强大易用。 Flutter允许您复用现有的Java、Swift或ObjC代码，访问iOS和Android上的原生系统功能和系统SDK。通过平台相关的API、第三方SDK和原生代码让您的应用变得强大易用。 Flutter允许您复用现有的Java、Swift或ObjC代码，访问iOS和Android上的原生系统功能和系统SDK。通过平台相关的API、第三方SDK和原生代码让您的应用变得强大易用。 Flutter允许您复用现有的Java、Swift或ObjC代码，访问iOS和Android上的原生系统功能和系统SDK。通过平台相关的API、第三方SDK和原生代码让您的应用变得强大易用。 Flutter允许您复用现有的Java、Swift或ObjC代码，访问iOS和Android上的原生系统功能和系统SDK。通过平台相关的API、第三方SDK和原生代码让您的应用变得强大易用。 Flutter允许您复用现有的Java、Swift或ObjC代码，访问iOS和Android上的原生系统功能和系统SDK。通过平台相关的API、第三方SDK和原生代码让您的应用变得强大易用。 Flutter允许您复用现有的Java、Swift或ObjC代码，访问iOS和Android上的原生系统功能和系统SDK。通过平台相关的API、第三方SDK和原生代码让您的应用变得强大易用。 Flutter允许您复用现有的Java、Swift或ObjC代码，访问iOS和Android上的原生系统功能和系统SDK。通过平台相关的API、第三方SDK和原生代码让您的应用变得强大易用。 Flutter允许您复用现有的Java、Swift或ObjC代码，访问iOS和Android上的原生系统功能和系统SDK。通过平台相关的API、第三方SDK和原生代码让您的应用变得强大易用。 Flutter允许您复用现有的Java、Swift或ObjC代码，访问iOS和Android上的原生系统功能和系统SDK。通过平台相关的API、第三方SDK和原生代码让您的应用变得强大易用。 Flutter允许您复用现有的Java、Swift或ObjC代码，访问iOS和Android上的原生系统功能和系统SDK。通过平台相关的API、第三方SDK和原生代码让您的应用变得强大易用。 Flutter允许您复用现有的Java、Swift或ObjC代码，访问iOS和Android上的原生系统功能和系统SDK。通过平台相关的API、第三方SDK和原生代码让您的应用变得强大易用。 Flutter允许您复用现有的Java、Swift或ObjC代码，访问iOS和Android上的原生系统功能和系统SDK。',
      imageUrl:
          'http://s9.rr.itc.cn/r/wapChange/201610_12_10/a82qfm8406299199855.jpg'),
  Post(
      title: 'space Skull',
      author: 'Mohaed Chahin',
      description:'通过平台相关的API、第三方SDK和原生代码让您的应用变得强大易用。 Flutter允许您复用现有的Java、Swift或ObjC代码，访问iOS和Android上的原生系统功能和系统SDK。',
      // imageUrl: 'http://test.com'
      imageUrl:
          'http://s9.rr.itc.cn/r/wapChange/201610_12_10/a82qfm8406299199855.jpg'),
  Post(
      title: 'white',
      author: 'QLHWHITE',
      description:'通过平台相关的API、第三方SDK和原生代码让您的应用变得强大易用。 Flutter允许您复用现有的Java、Swift或ObjC代码，访问iOS和Android上的原生系统功能和系统SDK。',
      imageUrl:
          'http://s9.rr.itc.cn/r/wapChange/201610_12_10/a82qfm8406299199855.jpg'),
  Post(
      title: 'Undo',
      author: 'Mohaed Chahin',
      description:'通过平台相关的API、第三方SDK和原生代码让您的应用变得强大易用。 Flutter允许您复用现有的Java、Swift或ObjC代码，访问iOS和Android上的原生系统功能和系统SDK。',
      imageUrl: 'http://freethumbs.dreamstime.com/1628/big/free_16288560.jpg')
];
