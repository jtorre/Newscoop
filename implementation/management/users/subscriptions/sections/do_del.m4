B_HTML
INCLUDE_PHP_LIB(<*$ADMIN_DIR/users/subscriptions/sections*>)
B_DATABASE

CHECK_BASIC_ACCESS
CHECK_ACCESS(<*ManageSubscriptions*>)

B_HEAD
	X_EXPIRES
	X_TITLE(<*Deleting subscription*>)
<?php  if ($access == 0) { ?>dnl
	X_AD(<*You do not have the right to delete subscriptions.*>)
<?php  } ?>dnl
E_HEAD

<?php  if ($access) { ?>dnl
B_STYLE
E_STYLE

B_BODY

<?php 
    todefnum('Subs');
    todefnum('Sect');
    todefnum('Pub');
    todefnum('User');
?>dnl
B_HEADER(<*Deleting subscription*>)
B_HEADER_BUTTONS
X_HBUTTON(<*Sections*>, <*users/subscriptions/sections/?User=<?php  p($User); ?>&Pub=<?php  p($Pub); ?>&Subs=<?php  p($Subs); ?>*>)
X_HBUTTON(<*Subscriptions*>, <*users/subscriptions/?User=<?php  p($User); ?>*>)
X_HBUTTON(<*Users*>, <*users/*>)
X_HBUTTON(<*Home*>, <*home.php*>)
X_HBUTTON(<*Logout*>, <*logout.php*>)
E_HEADER_BUTTONS
E_HEADER

<?php 
    query ("SELECT UName FROM Users WHERE Id=$User", 'q_usr');
    if ($NUM_ROWS) {
	query ("SELECT SectionNumber FROM SubsSections WHERE IdSubscription=$Subs", 'q_ssubs');
	if ($NUM_ROWS) {
	    query ("SELECT Name FROM Publications WHERE Id=$Pub", 'q_pub');
	    if ($NUM_ROWS) {
		fetchRow($q_usr);
		fetchRow($q_ssubs);
		fetchRow($q_pub);
?>dnl

B_CURRENT
X_CURRENT(<*User account*>, <*<B><?php  pgetHVar($q_usr,'UName'); ?></B>*>)
X_CURRENT(<*Publication*>, <*<B><?php  pgetHVar($q_pub,'Name'); ?></B>*>)
E_CURRENT

<P>
B_MSGBOX(<*Deleting subscription*>)
<?php 
    query ("DELETE FROM SubsSections WHERE IdSubscription=$Subs AND SectionNumber=$Sect");
    if ($AFFECTED_ROWS > 0) { ?>dnl
	X_MSGBOX_TEXT(<*<LI><?php  putGS('The subscription to the section $1 has been deleted.','<B>'.getHVar($q_ssubs,'SectionNumber').'</B>'); ?></LI>*>)
<?php  } else { ?>dnl
	X_MSGBOX_TEXT(<*<LI><?php  putGS('The subscription to the section $1 could not be deleted.','<B>'.getHVar($q_ssubs,'SectionNumber').'</B>'); ?></LI>*>)
<?php  } ?>dnl
	B_MSGBOX_BUTTONS
<?php  if ($AFFECTED_ROWS > 0) { ?>dnl
		REDIRECT(<*Done*>, <*Done*>, <*X_ROOT/users/subscriptions/sections/?Pub=<?php  p($Pub); ?>&User=<?php  p($User); ?>&Subs=<?php  p($Subs); ?>*>)
<?php  } else { ?>dnl
		REDIRECT(<*OK*>, <*OK*>, <*X_ROOT/users/subscriptions/sections/del.php?Pub=<?php  p($Pub); ?>&User=<?php  p($User); ?>&Subs=<?php  p($Subs); ?>&Sec=<?php  p($Sect); ?>*>)
<?php  } ?>dnl
	E_MSGBOX_BUTTONS
E_MSGBOX
<P>

<?php  } else { ?>dnl
<BLOCKQUOTE>
	<LI><?php  putGS('No such publication.'); ?></LI>
</BLOCKQUOTE>
<?php  } ?>dnl

<?php  } else { ?>dnl
<BLOCKQUOTE>
	<LI><?php  putGS('No such subscription.'); ?></LI>
</BLOCKQUOTE>
<?php  } ?>dnl

<?php  } else { ?>dnl
<BLOCKQUOTE>
	<LI><?php  putGS('No such user account.'); ?></LI>
</BLOCKQUOTE>
<?php  } ?>dnl

X_HR
X_COPYRIGHT
E_BODY
<?php  } ?>dnl

E_DATABASE
E_HTML
