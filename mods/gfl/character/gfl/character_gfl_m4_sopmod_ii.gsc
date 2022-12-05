// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
	character\gfl\_utility::detach_all_attachments();
	self.charactername = "M4 SOPMOD II";
	thread character\gfl\_utility::set_character_name();
	self setmodel("h2_gfl_m4_sopmod_ii_body");
	self.headmodel = "h2_gfl_m4_sopmod_ii_head";
	self.accessorymodels = [ "h2_gfl_m4_sopmod_ii_hair" ];
	self attach(self.headmodel, "", true);
	character\gfl\_utility::attach_accessorymodels();
	self.voice = "taskforce";
	self setclothtype( "vestlight" );
}

precache()
{
	precachemodel("h2_gfl_m4_sopmod_ii_body");
	precachemodel("h2_gfl_m4_sopmod_ii_head");
	precachemodel("h2_gfl_m4_sopmod_ii_hair");
}
