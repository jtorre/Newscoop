B_HTML
INCLUDE_PHP_LIB(<*$ADMIN_DIR/templates*>)
B_DATABASE

CHECK_BASIC_ACCESS
CHECK_ACCESS(<*DeleteTempl*>)

<?php 
    todef('Path');
    todef('Name');
    todefnum('What');
?>dnl

B_HEAD
	X_EXPIRES
	<?php  if ($What == 1){?>dnl
		X_TITLE(<*Delete templates*>)
	<?php  }
	else ?>  X_TITLE(<*Delete folders*>)
	
<?php  if ($access == 0) {
	if ($What == 1){  ?> dnl
		X_AD(<*You do not have the right to delete templates.*>)
	<?php }
	else?> X_AD(<*You do not have the right to delete folders.*>)
<?php  } ?>dnl
E_HEAD

<?php  if ($access) { ?>dnl
B_STYLE
E_STYLE

B_BODY

<?php 	 if ($What == 1){?>
		B_HEADER(<*Delete templates*>)
	<?php }dnl
	else {?>
		 B_HEADER(<*Delete folders*>)
	<?php }?>dnl

B_HEADER_BUTTONS
X_HBUTTON(<*Templates*>, <*templates/?Path=<?php  pencURL(decS($Path)); ?>*>)
X_HBUTTON(<*Home*>, <*home.php*>)
X_HBUTTON(<*Logout*>, <*logout.php*>)
E_HEADER_BUTTONS
E_HEADER

B_CURRENT
X_CURRENT(<*Path*>, <*<B><?php  pencHTML(decURL($Path)); ?></B>*>)
E_CURRENT

<P>

<?php 	 if ($What == 1){?>dnl
		B_MSGBOX(<*Delete templates*>)
	<?php }dnl
	else {?>dnl
		B_MSGBOX(<*Delete folders*>)
	<?php } ?>dnl

<?php  if ($What == 0) { ?>dnl
	X_MSGBOX_TEXT(<*<LI><?php  putGS('Are you sure you want to delete the folder $1 from $2?','<B>'.encHTML(decS($Name)).'</B>','<B>'.encHTML(decURL(decS($Path))).'</B>'); ?></LI>*>)
<?php  } else { ?>dnl
	X_MSGBOX_TEXT(<*<LI><?php  putGS('Are you sure you want to delete the template $1 from folder $2?','<B>'.encHTML(decS($Name)).'</B>','<B>'.encHTML(decURL(decS($Path))).'</B>'); ?></LI>*>)
<?php  } ?>dnl
	B_MSGBOX_BUTTONS
		<FORM METHOD="POST" ACTION="do_del.php">
		<INPUT TYPE="HIDDEN" NAME="Path" VALUE="<?php  pencHTML(decS($Path)); ?>">
		<INPUT TYPE="HIDDEN" NAME="Name" VALUE="<?php  pencHTML(decS($Name)); ?>">
		<INPUT TYPE="HIDDEN" NAME="What" VALUE="<?php  p($What); ?>">
		SUBMIT(<*Yes*>, <*Yes*>)
		REDIRECT(<*No*>, <*No*>, <*<?php  pencHTML(decS($Path)); ?>*>)
		</FORM>
	E_MSGBOX_BUTTONS
E_MSGBOX
<P>

X_HR
X_COPYRIGHT
E_BODY
<?php  } ?>dnl

E_DATABASE
E_HTML
