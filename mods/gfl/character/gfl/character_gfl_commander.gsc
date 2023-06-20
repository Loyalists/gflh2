// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
	character\gfl\_utility::detach_all_attachments();
	self.charactername = "Commander";
	self setmodel("h2_gfl_commander_body");
	self.headmodel = "h2_gfl_commander_head";
	character\gfl\_utility::attach_all_attachments();
	self.voice = "american";
	self setclothtype( "vestlight" );
}

precache()
{
	precachemodel("h2_gfl_commander_body");
	precachemodel("h2_gfl_commander_head");
}
