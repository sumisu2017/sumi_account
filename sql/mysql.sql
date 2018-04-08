CREATE TABLE `expense` (
  `sn` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `year` tinyint(4) unsigned NOT NULL COMMENT '年度',
  `city` tinyint(2) unsigned NOT NULL COMMENT '縣巿代碼',
  `division` varchar(5) NOT NULL COMMENT '機關代碼',
  `voucher_no` varchar(5) NOT NULL COMMENT '傳票號碼',
  `voucher_date` varchar(8) NOT NULL COMMENT '傳票日期',
  `abstract` varchar(300) NOT NULL COMMENT '摘要內容',
  `debit_amount` mediumint(8) NOT NULL COMMENT '借方金額合計',
  `credit_account` varchar(10) NOT NULL COMMENT '貸方科目代號',
  `posting` enum('0','1') NOT NULL COMMENT '過帳標記',
  `reversal` enum('0','1') NOT NULL COMMENT '沖銷完否',
  `pay_amount` mediumint(8) NOT NULL COMMENT '本傳票應付數',
  `reversal_amount` smallint(5) NOT NULL COMMENT '沖收數',
  `real_pay` mediumint(8) NOT NULL COMMENT '實付數',
  `cash_pay` mediumint(8) NOT NULL COMMENT '現金支出',
  `treasury_pay` mediumint(8) NOT NULL COMMENT '公庫存款支出',
  `receipt` tinyint(4) unsigned NOT NULL COMMENT '單據張數',
  `create_date` varchar(8) NOT NULL COMMENT '製表日期',
  `item` tinyint(2) unsigned NOT NULL COMMENT '項數',
  `update_time` datetime NOT NULL,
  `uid` mediumint(9) unsigned NOT NULL COMMENT '編輯者',
  PRIMARY KEY (`sn`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `expense_detail` (
  `sn` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `detail_no` varchar(4) NOT NULL COMMENT '明細編號',
  `debit_account` varchar(10) NOT NULL COMMENT '借方科目代號',
  `abstract` varchar(300) NOT NULL COMMENT '摘要內容',
  `debit_amount` mediumint(8) unsigned NOT NULL COMMENT '借方金額',
  `o_kind` varchar(10) NOT NULL COMMENT '原始憑證種類',
  `o_receipt_no` varchar(10) NOT NULL COMMENT '原始憑證號數',
  `b_kind` varchar(10) NOT NULL COMMENT '分支大類',
  `use_no` varchar(10) NOT NULL COMMENT '用途別代碼',
  `b_plan_no` varchar(10) NOT NULL COMMENT '分支計畫代碼',
  `b_account` varchar(6) NOT NULL COMMENT '子目代碼',
  `payee` varchar(10) NOT NULL COMMENT '受款人編號或公司編號',
  `detail_kind` tinyint(2) unsigned NOT NULL COMMENT '使用明細類別',
  `delegate` varchar(10) NOT NULL COMMENT '委受機關',
  PRIMARY KEY (`sn`,`detail_no`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `expense_payee` (
  `sn` smallint(5) NOT NULL COMMENT '流水號',
  `payee_sn` tinyint(2) NOT NULL COMMENT '付款流水號',
  `payee` varchar(255) NOT NULL COMMENT '受款人名稱',
  `tax_id` varchar(8) NOT NULL COMMENT '統一編號',
  `tel` varchar(10) DEFAULT NULL COMMENT '電話',
  `add` varchar(255) DEFAULT NULL COMMENT '住址',
  `email` varchar(100) DEFAULT NULL COMMENT 'Email',
  `amount` mediumint(8) NOT NULL COMMENT '金額',
  `check_kind` varchar(10) DEFAULT NULL COMMENT '支票領取方式',
  `account_name` varchar(100) NOT NULL COMMENT '存帳戶名',
  `payment` varchar(7) NOT NULL COMMENT '解款行',
  `bank` varchar(100) NOT NULL COMMENT '存帳銀行',
  `bank_account` varchar(100) NOT NULL COMMENT '存款帳號',
  `a_bank` varchar(100) DEFAULT NULL COMMENT '指定兌付銀行',
  `fee` varchar(10) DEFAULT NULL COMMENT '是否要收電匯手續費',
  `mail_to` varchar(255) DEFAULT NULL COMMENT '郵件收件人',
  `mail_add` varchar(255) DEFAULT NULL COMMENT '郵件收件人地址',
  `post` varchar(10) DEFAULT NULL COMMENT '郵遞區號',
  `post2` varchar(2) DEFAULT NULL COMMENT '郵遞區號後2碼',
  `note` varchar(255) DEFAULT NULL COMMENT '附記事項',
  `use` varchar(255) DEFAULT NULL COMMENT '支出用途',
  `invice` varchar(10) DEFAULT NULL COMMENT '發票號碼',
  `memo` varchar(255) DEFAULT NULL COMMENT '備註',
  PRIMARY KEY (`sn`,`payee_sn`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `enpense_files_center` (
  `files_sn` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '檔案流水號',
  `col_name` varchar(255) NOT NULL DEFAULT '' COMMENT '欄位名稱',
  `col_sn` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '欄位編號',
  `sort` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `kind` enum('img','file') NOT NULL DEFAULT 'img' COMMENT '檔案種類',
  `file_name` varchar(255) NOT NULL DEFAULT '' COMMENT '檔案名稱',
  `file_type` varchar(255) NOT NULL DEFAULT '' COMMENT '檔案類型',
  `file_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '檔案大小',
  `description` text NOT NULL COMMENT '檔案說明',
  `counter` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '下載人次',
  `original_filename` varchar(255) NOT NULL DEFAULT '' COMMENT '檔案名稱',
  `hash_filename` varchar(255) NOT NULL DEFAULT '' COMMENT '加密檔案名稱',
  `sub_dir` varchar(255) NOT NULL DEFAULT '' COMMENT '檔案子路徑',
  PRIMARY KEY (`files_sn`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
