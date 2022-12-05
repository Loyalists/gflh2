// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
	character\gfl\_utility::detach_all_attachments();
	self.charactername = "FNC";
	thread character\gfl\_utility::set_character_name();
	self setmodel("h2_gfl_fnc_body");
	self.headmodel = "h2_gfl_fnc_head";
	self.accessorymodels = [ "h2_gfl_fnc_clothes" ];
	self attach(self.headmodel, "", true);
	character\gfl\_utility::attach_accessorymodels();
	self.voice = "american";
	self setclothtype( "vestlight" );
}

precache()
{
	precachemodel("h2_gfl_fnc_body");
	precachemodel("h2_gfl_fnc_head");
	precachemodel("h2_gfl_fnc_clothes");
}
