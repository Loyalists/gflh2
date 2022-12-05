// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
	character\gfl\_utility::detach_all_attachments();
	self.charactername = "AK-12";
	thread character\gfl\_utility::set_character_name();
	self setmodel("h2_gfl_ak12_body");
	self.headmodel = "h2_gfl_ak12_head";
	self.accessorymodels = [ "h2_gfl_ak12_hair", "h2_gfl_ak12_outline" ];
	self attach(self.headmodel, "", true);
	character\gfl\_utility::attach_accessorymodels();
	self.voice = "russian";
	self setclothtype( "vestlight" );
}

precache()
{
	precachemodel("h2_gfl_ak12_body");
	precachemodel("h2_gfl_ak12_head");
	precachemodel("h2_gfl_ak12_hair");
	precachemodel("h2_gfl_ak12_outline");
}
