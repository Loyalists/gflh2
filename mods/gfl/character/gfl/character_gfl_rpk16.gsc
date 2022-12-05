// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
	character\gfl\_utility::detach_all_attachments();
	self.charactername = "RPK-16";
	thread character\gfl\_utility::set_character_name();
	self setmodel("h2_gfl_rpk16_body");
	self.headmodel = "h2_gfl_rpk16_head";
	self.accessorymodels = [ "h2_gfl_rpk16_outline" ];
	self attach(self.headmodel, "", true);
	character\gfl\_utility::attach_accessorymodels();
	self.voice = "american";
	self setclothtype( "vestlight" );
}

precache()
{
	precachemodel("h2_gfl_rpk16_body");
	precachemodel("h2_gfl_rpk16_head");
	precachemodel("h2_gfl_rpk16_outline");
}
