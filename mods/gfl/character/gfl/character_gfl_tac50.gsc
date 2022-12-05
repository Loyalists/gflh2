// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
	character\gfl\_utility::detach_all_attachments();
	self.charactername = "TAC-50";
	thread character\gfl\_utility::set_character_name();
	self setmodel("h2_gfl_tac50_body");
	self.headmodel = "h2_gfl_tac50_head";
	self.accessorymodels = [ "h2_gfl_tac50_clothes", "h2_gfl_tac50_outline" ];
	self attach(self.headmodel, "", true);
	character\gfl\_utility::attach_accessorymodels();
	self.voice = "russian";
	self setclothtype( "vestlight" );
}

precache()
{
	precachemodel("h2_gfl_tac50_body");
	precachemodel("h2_gfl_tac50_head");
	precachemodel("h2_gfl_tac50_clothes");
	precachemodel("h2_gfl_tac50_outline");
}
