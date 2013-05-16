CREATE TABLE `baton` (
  `baton_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` binary(13) NOT NULL,
  `title` varchar(100) NOT NULL,
  `details` text NOT NULL,
  `diary_count` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`baton_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `baton_diary` (
  `baton_id` bigint(20) unsigned NOT NULL,
  `diary_number` int(10) unsigned NOT NULL,
  `user_id` binary(13) NOT NULL,
  `title` varchar(100) NOT NULL,
  `body` text NOT NULL,
  `details` text NOT NULL,
  `like_count` int(10) unsigned NOT NULL,
  `comment_count` int(10) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`baton_id`,`diary_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `baton_member` (
  `baton_id` bigint(20) unsigned NOT NULL,
  `user_id` binary(13) NOT NULL,
  `last_diary_number` int(10) unsigned NOT NULL,
  `like_count` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`baton_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
