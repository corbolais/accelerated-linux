#
# (C) Tenable Network Security
#
#

if ( ! defined_func("bn_random") ) exit(0);
if(description)
{
 script_id(13745);
 script_version ("$Revision: 1.5 $");
 name["english"] = "Solaris 9 (sparc) : 116559-01";
 
 script_name(english:name["english"]);
 
 desc["english"] = "
The remote host is missing Sun Security Patch number 116559-01
( powerd pmconfig patch).

You should install this patch for your system to be up-to-date.

Solution : http://sunsolve.sun.com/search/document.do?assetkey=1-21-116559-01-1
Risk factor : High";


 script_description(english:desc["english"]);
 
 summary["english"] = "Check for patch 116559-01"; 
 script_summary(english:summary["english"]);
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2004 Tenable Network Security");
 family["english"] = "Solaris Local Security Checks";
 script_family(english:family["english"]);
 
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Solaris/showrev");
 exit(0);
}



include("solaris.inc");

e =  solaris_check_patch(release:"5.9", arch:"sparc", patch:"116559-01", obsoleted_by:"", package:"SUNWpmu");

if ( e < 0 ) security_hole(0);
