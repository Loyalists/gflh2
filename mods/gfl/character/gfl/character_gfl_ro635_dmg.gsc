// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
	character\gfl\_utility::detach_all_attachments();
	self.charactername = "RO635";
	thread character\gfl\_utility::set_character_name();
	self setmodel("h2_gfl_ro635_body");
	self.headmodel = "h2_gfl_ro635_head_dmg";
	self.accessorymodels = [ "h2_gfl_ro635_hair" ];
	self attach(self.headmodel, "", true);
	character\gfl\_utility::attach_accessorymodels();
	self.voice = "taskforce";
	self setclothtype( "vestlight" );
}

precache()
{
	precachemodel("h2_gfl_ro635_body");
	precachemodel("h2_gfl_ro635_head_dmg");
	precachemodel("h2_gfl_ro635_hair");
}
