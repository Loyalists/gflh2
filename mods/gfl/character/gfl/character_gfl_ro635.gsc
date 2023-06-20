// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
	character\gfl\_utility::detach_all_attachments();
	self.charactername = "RO635";
	self setmodel("h2_gfl_ro635_body");
	self.headmodel = "h2_gfl_ro635_head";
	self.accessorymodels = [ "h2_gfl_ro635_hair" ];
	character\gfl\_utility::attach_all_attachments();
	self.voice = "american";
	self setclothtype( "vestlight" );
}

precache()
{
	precachemodel("h2_gfl_ro635_body");
	precachemodel("h2_gfl_ro635_head");
	precachemodel("h2_gfl_ro635_hair");
}
