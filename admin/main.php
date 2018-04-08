<?php
/*-----------引入檔案區--------------*/
$xoopsOption['template_main'] = "account_adm_main.tpl";
include_once "header.php";
include_once "../function.php";

/*-----------function區--------------*/

//顯示預設頁面內容
function expense_list()
{
    global $xoopsTpl;
    $main = "expense_list template 快快給我出來 "; //"後台頁面開發中123";
    $xoopsTpl->assign('content', $main);
}
//新增支出傳票的表單
function expense_form()
{
    global $xoopsTpl, $xoopsUser, $TadUpFiles;
    include_once XOOPS_ROOT_PATH . "/class/xoopsformloader.php";
    //建立表單
    $form = new XoopsThemeForm('支出傳票', 'myForm', 'main.php', 'post', true);
    // //建立類別選項
    // $select       = new XoopsFormRadio('類別或主題', 'topic_sn', $topic_sn);
    // $options['1'] = '街巷故事';
    // $options['2'] = '市井觀點';
    // $options['3'] = '私房知識塾';
    // $select->addOptionArray($options);
    // $form->addElement($select);
    //建立標題欄位
    // $form->addElement(new XoopsFormText('文章標題', 'title', 60, 100, $title), true);
    // //所見即所得編輯器
    // include_once XOOPS_ROOT_PATH . "/modules/tadtools/ck.php";
    // $ck = new CKEditor("snews", "content", $content);
    // $ck->setHeight(250);
    // $editor = $ck->render();
    // $form->addElement(new XoopsFormLabel('文章內容', $editor));
    // //精選（是否選單）
    // $form->addElement(new XoopsFormRadioYN('精選', 'focus', $focus));
    // //作者輸入框
    // $username = $xoopsUser->name();
    // $form->addElement(new XoopsFormText('作者', 'username', 60, 100, $username));

    //上傳表單
    $form->setExtra("enctype='multipart/form-data'");
    // $TadUpFiles->set_col('sn', $sn);
    // $upform = $TadUpFiles->upform(true, 'pic', null, true, '.jpg,.png');
    // $form->addElement(new XoopsFormLabel('封面圖', $upform));

    //上傳附檔表單
    $TadUpFiles->set_col('expense', $sn);
    $upform = $TadUpFiles->upform(true, 'expense', null, true, '.xml');
    $form->addElement(new XoopsFormLabel('附檔', $upform));

    //使用者編號
    $uid = $xoopsUser->uid();
    $form->addElement(new XoopsFormHidden('uid', $uid));
    //下個動作
    $form->addElement(new XoopsFormHidden('op', 'expense_insert'));
    //儲存按鈕
    $form->addElement(new XoopsFormButton('', '', '儲存', 'submit'));
    //產生程式碼
    $snews_form = $form->render();
    //將表單送到樣板
    $xoopsTpl->assign('expense_form', $expense_form);

}

function expense_insert()
{
    global $xoopsDB, $TadUpFiles;

    $myts = MyTextSanitizer::getInstance();

    foreach ($_POST as $key => $value) {
        $$key = $myts->addSlashes($value);
        // echo "<p>\${$key}={$$key}</p>";
    }

    // $tbl = $xoopsDB->prefix('snews');
    // $sql = "insert into `$tbl` (`focus`, `topic_sn`, `sort`, `title`, `content`, `username`, `create_time`, `update_time`, `uid`) values('{$focus}', '{$topic_sn}', '{$sort}', '{$title}', '{$content}', '{$username}', now(), now(), '{$uid}')";
    // $xoopsDB->query($sql) or web_error($sql);
    // $sn = $xoopsDB->getInsertId(); //取得最後新增的編號

    // $TadUpFiles->set_col('sn', $sn);
    // $TadUpFiles->upload_file('pic', 1920, 640, null, $title, true, true, null, 'png;jpg');

    // $TadUpFiles->set_col('snews', $sn);
    // $TadUpFiles->upload_file('snews');

    return $sn;
}

/*-----------執行動作判斷區----------*/
include_once $GLOBALS['xoops']->path('/modules/system/include/functions.php');
$op = system_CleanVars($_REQUEST, 'op', '', 'string');
// $sn = system_CleanVars($_REQUEST, 'sn', 0, 'int');
switch ($op) {

    case "expense_form":
        expense_form();
        break;

    case "expense_insert":
        $sn = expense_insert();
        header("location: ../index.php?sn={$sn}");
        exit;

    default:
        expense_list();
        $op = 'expense_list';
        break;
}

include_once 'footer.php';
