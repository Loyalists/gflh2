// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
	character\gfl\_utility::detach_all_attachments();
	self.charactername = "SP9";
	thread character\gfl\_utility::set_character_name();
	self setmodel("h2_gfl_sp9_body");
	self.headmodel = "h2_gfl_sp9_head";
	self.accessorymodels = [ "h2_gfl_sp9_hair", "h2_gfl_sp9_outline" ];
	self attach(self.headmodel, "", true);
	character\gfl\_utility::attach_accessorymodels();
	self.voice = "russian";
	self setclothtype( "vestlight" );
}

precache()
{
	precachemodel("h2_gfl_sp9_body");
	precachemodel("h2_gfl_sp9_head");
	precachemodel("h2_gfl_sp9_hair");
	precachemodel("h2_gfl_sp9_outline");
}
