// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
	character\gfl\_utility::detach_all_attachments();
	self.charactername = "Type 97";
	self setmodel("h2_gfl_type97_body");
	self.headmodel = "h2_gfl_type97_head";
	self.accessorymodels = [ "h2_gfl_type97_hair" ];
	character\gfl\_utility::attach_all_attachments();
	self.voice = "american";
	self setclothtype( "vestlight" );
}

precache()
{
	precachemodel("h2_gfl_type97_body");
	precachemodel("h2_gfl_type97_head");
	precachemodel("h2_gfl_type97_hair");
}
