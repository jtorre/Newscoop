<?php

require_once($_SERVER['DOCUMENT_ROOT']. "/$ADMIN_DIR/users/users_common.php");
require_once($_SERVER['DOCUMENT_ROOT']. "/classes/Log.php");

list($access, $User) = check_basic_access($_REQUEST);

read_user_common_parameters(); // $uType, $userOffs, $ItemsPerPage, search parameters
$uType = 'Subscribers';
compute_user_rights($User, $canManage, $canDelete);
if (!$canManage) {
	camp_html_display_error(getGS('You do not have the right to change user account information.'));
	exit;
}

$userId = Input::Get('User', 'int', 0);
$editUser = new User($userId);
if ($editUser->getUserName() == '') {
	camp_html_display_error(getGS('No such user account.'));
	exit;
}
$startIP = Input::Get('StartIP', 'string', '');
$ipAccess =& new IPAccess($userId, $startIP);
$startIPstring = $ipAccess->getStartIPstring();
$addresses = $ipAccess->getAddresses();

if (!$ipAccess->delete()) {
	header("Location: /$ADMIN/users/edit.php?uType=Subscribers&User=$userId");
	exit;
}

$resMsg = getGS("The IP address group $1 has been deleted.", "$startIPstring:$addresses");
header("Location: /$ADMIN/users/edit.php?uType=Subscribers&User=$userId&res=OK&resMsg=" . urlencode($resMsg));

?>
