// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
	character\gfl\_utility::detach_all_attachments();
	self.charactername = "G36C";
	self setmodel("s1_gfl_g36c_body");
	self.headmodel = "s1_gfl_g36c_head";
	self.accessorymodels = [ "s1_gfl_g36c_vest" ];
	character\gfl\_utility::attach_all_attachments();
	self.voice = "american";
	self setclothtype( "vestlight" );
}

precache()
{
	precachemodel("s1_gfl_g36c_body");
	precachemodel("s1_gfl_g36c_head");
	precachemodel("s1_gfl_g36c_vest");
}
