// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
	character\gfl\_utility::detach_all_attachments();
	self.charactername = "P90";
	self setmodel("h2_gfl_p90_body");
	self.headmodel = "h2_gfl_p90_head";
	self.accessorymodels = [ "h2_gfl_p90_clothes" ];
	character\gfl\_utility::attach_all_attachments();
	self.voice = "american";
	self setclothtype( "vestlight" );
}

precache()
{
	precachemodel("h2_gfl_p90_body");
	precachemodel("h2_gfl_p90_head");
	precachemodel("h2_gfl_p90_clothes");
}
