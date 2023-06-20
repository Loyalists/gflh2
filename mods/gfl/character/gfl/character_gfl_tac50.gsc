// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
	character\gfl\_utility::detach_all_attachments();
	self.charactername = "TAC-50";
	self setmodel("h2_gfl_tac50_body");
	self.headmodel = "h2_gfl_tac50_head";
	self.accessorymodels = [ "h2_gfl_tac50_clothes", "h2_gfl_tac50_outline" ];
	character\gfl\_utility::attach_all_attachments();
	self.voice = "american";
	self setclothtype( "vestlight" );
}

precache()
{
	precachemodel("h2_gfl_tac50_body");
	precachemodel("h2_gfl_tac50_head");
	precachemodel("h2_gfl_tac50_clothes");
	precachemodel("h2_gfl_tac50_outline");
}
