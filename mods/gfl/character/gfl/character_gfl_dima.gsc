// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
	character\gfl\_utility::detach_all_attachments();
	self.charactername = "Dima";
	self setmodel("h2_gfl_dima_body");
	self.headmodel = "h2_gfl_dima_head";
	self.accessorymodels = [ "h2_gfl_dima_outline" ];
	character\gfl\_utility::attach_all_attachments();
	self.voice = "russian";
	self setclothtype( "vestlight" );
}

precache()
{
	precachemodel("h2_gfl_dima_body");
	precachemodel("h2_gfl_dima_head");
	precachemodel("h2_gfl_dima_outline");
}
