// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
	character\gfl\_utility::detach_all_attachments();
	self.charactername = "Vespid";
	thread character\gfl\_utility::set_character_name();
	self setmodel("h2_gfl_vespid_body");
	self.headmodel = "h2_gfl_vespid_head";
	self attach(self.headmodel, "", true);
	self.voice = "russian";
	self setclothtype( "vestlight" );
}

precache()
{
	precachemodel("h2_gfl_vespid_body");
	precachemodel("h2_gfl_vespid_head");
}
