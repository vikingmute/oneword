-- phpMyAdmin SQL Dump
-- version 3.5.3
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2013 年 04 月 19 日 10:24
-- 服务器版本: 5.1.36-community-log
-- PHP 版本: 5.3.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `vbooks`
--

-- --------------------------------------------------------

--
-- 表的结构 `book`
--

CREATE TABLE IF NOT EXISTS `book` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `publish` varchar(50) NOT NULL,
  `image` varchar(100) NOT NULL,
  `pages` int(10) NOT NULL,
  `isbn` int(15) NOT NULL,
  `summary` varchar(1000) NOT NULL,
  `uid` varchar(20) NOT NULL,
  `dlink` varchar(20) NOT NULL,
  `tags` varchar(100) NOT NULL,
  `type` int(10) NOT NULL DEFAULT '0',
  `link_id` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `book`
--

INSERT INTO `book` (`id`, `title`, `author`, `publish`, `image`, `pages`, `isbn`, `summary`, `uid`, `dlink`, `tags`, `type`, `link_id`) VALUES
(1, 'JavaScript Patterns', 'Stoyan Stefanov', 'O''Reilly Media, Inc.', 'http://img3.douban.com/lpic/s4460994.jpg', 236, 2147483647, 'What''s the best approach for developing an application with JavaScript? This book helps you answer that question with numerous JavaScript coding patterns and best practices. If you''re an experienced developer looking to solve problems related to objects, functions, inheritance, and other language-specific categories, the abstractions and code templates in this guide are ideal -- whether you''re writing a client-side, server-side, or desktop application with JavaScript.    Written by JavaScript expert Stoyan Stefanov -- Senior Yahoo! Technical and architect of YSlow 2.0, the web page performance optimization tool --  JavaScript Patterns  includes practical advice for implementing each pattern discussed, along with several hands-on examples. You''ll also learn about anti-patterns: common programming approaches that cause more problems than they solve.    Explore useful habits for writing high-quality JavaScript code, such as avoiding globals, using single var declarations, and more   Learn', '', '', 'Javascript/1', 1, 0),
(2, 'Developing Backbone.js Applications', 'Addy Osmani', 'O''Reilly Media', 'http://img3.douban.com/lpic/s9114173.jpg', 150, 2147483647, 'Get a complete run-down of the popular Backbone.js framework for structuring JavaScript applications. This practical guide takes you through Model - view - controller (MVC) theory, and shows you how to build applications using Backbone''s models, views, collections and routers. You''ll also learn advanced topics such as modular development with Backbone.js and RequireJS. This detailed book provides an authoritative and centralized repository of information to help you develop real-world apps with Backbone. Build applications using modern tech stacks, including Node and Express Solve the routing problems with Backbone and jQuery Mobile Get tips about scaffolding tools', '', '', 'Javascript/1#jQuery/2#backbone.js/3', 0, 0),
(3, 'HTML5', 'Mark Pilgrim', 'O''Reilly Media', 'http://img3.douban.com/lpic/s4570418.jpg', 224, 2147483647, 'If you don''t know about the new features available in HTML5, now''s the time to find out. This book provides practical information about how and why the latest version of this markup language will significantly change the way you develop for the Web. HTML5 is still evolving, yet browsers such as Safari, Mozilla, Opera, and Chrome already support many of its features -- and mobile browsers are even farther ahead. HTML5: Up & Running carefully guides you though the important changes in this version with lots of hands-on examples, including markup, graphics, and screenshots. You''ll learn how to use HTML5 markup to add video, offline capabilities, and more -- and you''ll be able to put that functionality to work right away. * Learn new semantic elements, such as  ,  , and   * Meet Canvas, a 2D drawing surface you can program with JavaScript * Embed video in your web pages without third-party plugins * Use Geolocation to let web application visitors share their physical location * Take advant', '', '', 'CSS3/6#HTML5/7', 1, 0),
(4, 'Stunning CSS3', 'Zoe Mickley Gillenwater', 'New Riders Press', 'http://img3.douban.com/lpic/s4616463.jpg', 320, 2147483647, 'CSS3 adds powerful new functionality to the web''s visual style language to help you create beautiful and engaging designs more easily than ever. With CSS3, you can create eye-catching visual effects such as semitransparent backgrounds, gradients, and drop shadows without using images; display text in beautiful, unique, non-web-safe fonts; create animations without Flash; and customize a design to the user''s unique device or screen size without JavaScript. You''ll learn how to accomplish these effects and more by working through a series of practical yet cutting-edge projects. Each chapter walks you through standalone exercises that you can integrate into projects you''re working on, or use as inspiration. You''ll learn all of the most popular, useful, and well-supported CSS3 techniques, plus:  * How to use CSS3 to enhance your pages, not just in terms of looks, but also in terms of usability, accessibility, and efficiency* When and how to provide workarounds and fallbacks for older, non-s', '', '', 'CSS3/6', 1, 0),
(5, 'Node.js in Action', 'Mike Cantelon', 'Manning', 'http://img3.douban.com/lpic/s10668875.jpg', 300, 2147483647, '* Simplifies web application development * Outlines valuable online resources * Teaches Node.js from the ground up Node.js is an elegant server-side JavaScript development environment perfect for scalable, high-performance web applications. Node allows developers to access HTTP and general TCP/IP functionality using a minimalist server-side JavaScript interface. Node.js in Action  is an example-driven tutorial that starts at square one and goes through all the features, techniques, and concepts needed to build production-quality Node applications. First it shows how to set up a Node development environment and the community-created extensions. Then it runs through some simple demonstration programs and introduces asynchronous programming, a requirement for real-time applications such as chat, online games, and live statistics. It also shows how to create serious web applications using NodeUPSILON s HTTP API and introduces community frameworks that make web development easier and faster', '', '', 'node.js/4#Javascript/1', 0, 0),
(6, 'PHP and MySQL Web Development', 'Luke Welling', 'Sams', 'http://img3.douban.com/lpic/s4084950.jpg', 1008, 2147483647, 'Book Description\nPHP and MySQL Web Development teaches you to develop dynamic, secure, commerical Web sites. Using the same accessible, popular teaching style of the three previous editions, this book has been thoroughly updated to reflect the rapidly changing landscape of MySQL and PHP. This fourth edition incorporates changes in the 5.1 specs of PHP and MySQL, as well as reflecting new trends in Web development in general. Some new highlights include coverage of Ajax, social networking sites, security concerns, and the PEAR repository of PHP extensions and applications.', '', '', 'Mysql/9#PHP/5', 1, 0),
(7, 'Learning Python', 'Mark Lutz', 'O''Reilly Media', 'http://img5.douban.com/lpic/s10347319.jpg', 1216, 2147483647, 'Amazon.com Review\nThe authors of Learning Python show you enough essentials of the Python scripting language to enable you to begin solving problems right away, then reveal more powerful aspects of the language one at a time. This approach is sure to appeal to programmers and system administrators who have urgent problems and a preference for learning by semi-guided experimentation.\nFirst off, Learning Python shows the relationships among Python scripts and their interpreter (in a mostly platform-neutral way). Then, the authors address the mechanics of the language itself, providing illustrations of how Python conceives of numbers, strings, and other objects as well as the operators you use to work with them. Dictionaries, lists, tuples, and other data structures specific to Python receive plenty of attention including complete examples.\nAuthors Mark Lutz and David Ascher build on that fundamental information in their discussions of functions and modules, which evolve into coverage of ', '', '', 'Python/8', 0, 0),
(8, 'The Ruby Programming Language', 'David Flanagan', 'O''Reilly Media, Inc.', 'http://img3.douban.com/lpic/s3593250.jpg', 448, 2147483647, 'Ruby has gained some attention through the popular Ruby on Rails web development framework, but the language alone is worthy of more consideration -- a lot more. This book offers a definition explanation of this powerful and extremely flexible language, which draws inspiration from Lisp, Smalltalk and Perl, but uses a grammar that''s easy for C and Java programmers to learn.\nWith The Ruby Programming Language, you will quickly learn your way around versions 1.8 and 1.9, and discover why this pure object-oriented language is also suitable for procedural and functional programming styles. You''ll learn Ruby''s lexical structure, primary expressions, conditionals, syntax, classes, the data it manipulates, and more. Ruby blurs the distinction between language and platform, so this book includes a tour of the core Ruby API. But the primary subject is the language itself, including:\n* Ruby''s lexical structure including basic issues like character set, case sensitivity and reserved words\n* Numbe', 'abcdefghigk', '/uploads/92608.jpg', 'Ruby/10', 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `tag`
--

CREATE TABLE IF NOT EXISTS `tag` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `detail` varchar(500) NOT NULL,
  `level` int(10) NOT NULL DEFAULT '0',
  `pid` int(10) NOT NULL DEFAULT '0',
  `count` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `tag`
--

INSERT INTO `tag` (`id`, `name`, `detail`, `level`, `pid`, `count`) VALUES
(1, 'Javascript', 'something detail', 0, 0, 0),
(2, 'jQuery', 'a js framework', 0, 0, 0),
(3, 'backbone.js', 'another js framework', 0, 0, 0),
(4, 'node.js', 'a v8 server js', 0, 0, 0),
(5, 'PHP', 'nice stuff', 0, 0, 0),
(6, 'CSS3', 'the makeup', 0, 0, 0),
(7, 'HTML5', 'things to make you hyper', 0, 0, 0),
(8, 'Python', 'like a whisper', 0, 0, 0),
(9, 'Mysql', 'database stuff', 0, 0, 0),
(10, 'Ruby', 'not a kind of gem', 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `tbrela`
--

CREATE TABLE IF NOT EXISTS `tbrela` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `bid` int(10) NOT NULL,
  `tid` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bid` (`bid`,`tid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- 转存表中的数据 `tbrela`
--

INSERT INTO `tbrela` (`id`, `bid`, `tid`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 2, 2),
(4, 2, 3),
(5, 3, 6),
(6, 3, 7),
(7, 4, 6),
(8, 5, 4),
(9, 5, 1),
(10, 6, 9),
(11, 6, 5),
(12, 7, 8),
(13, 8, 10);

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `collection` varchar(100) DEFAULT NULL,
  `last_login` varchar(50) NOT NULL,
  `flag` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `uname`, `collection`, `last_login`, `flag`) VALUES
(1, 'vikingmute@gmail.com', '6b10b56a29081f8aeb61ad4bd07271bf', 'viking', NULL, '', 'iXLZfpwyTr5CPMM');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
