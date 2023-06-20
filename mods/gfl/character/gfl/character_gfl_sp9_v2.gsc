// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
	character\gfl\_utility::detach_all_attachments();
	self.charactername = "SP9";
	self setmodel("h1_gfl_sp9_v2_body");
	self.headmodel = "h1_gfl_sp9_v2_head";
	self.accessorymodels = [ "h1_gfl_sp9_v2_hair" ];
	character\gfl\_utility::attach_all_attachments();
	self.voice = "american";
	self setclothtype( "vestlight" );
}

precache()
{
	precachemodel("h1_gfl_sp9_v2_body");
	precachemodel("h1_gfl_sp9_v2_head");
	precachemodel("h1_gfl_sp9_v2_hair");
}
