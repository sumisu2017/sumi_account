<?php
$adminmenu = array();

$i                      = 1;
$adminmenu[$i]['title'] = _MI_TAD_ADMIN_HOME;
$adminmenu[$i]['link']  = 'admin/index.php';
$adminmenu[$i]['desc']  = _MI_TAD_ADMIN_HOME_DESC;
$adminmenu[$i]['icon']  = 'images/admin/home.png';

$i++;
$adminmenu[$i]['title'] = _MI_ACCOUNT_ADMENU1; //_MI_account_ADMENU1
$adminmenu[$i]['link']  = "admin/main.php";
$adminmenu[$i]['desc']  = _MI_ACCOUNT_ADMENU1_DESC; //_MI_account_ADMENU1_DESC
$adminmenu[$i]['icon']  = 'images/admin/button.png';

$i++;
$adminmenu[$i]['title'] = _MI_ACCOUNT_ADMENU2; //_MI_account_ADMENU1
$adminmenu[$i]['link']  = "admin/expense.php";
$adminmenu[$i]['desc']  = _MI_ACCOUNT_ADMENU2_DESC; //_MI_account_ADMENU1_DESC
$adminmenu[$i]['icon']  = 'images/admin/calculator.png';

$i++;
$adminmenu[$i]['title'] = _MI_TAD_ADMIN_ABOUT;
$adminmenu[$i]['link']  = 'admin/about.php';
$adminmenu[$i]['desc']  = _MI_TAD_ADMIN_ABOUT_DESC;
$adminmenu[$i]['icon']  = 'images/admin/about.png';
