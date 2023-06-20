// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
	character\gfl\_utility::detach_all_attachments();
	self.charactername = "FNC";
	self setmodel("h2_gfl_fnc_body");
	self.headmodel = "h2_gfl_fnc_head";
	self.accessorymodels = [ "h2_gfl_fnc_clothes" ];
	character\gfl\_utility::attach_all_attachments();
	self.voice = "american";
	self setclothtype( "vestlight" );
}

precache()
{
	precachemodel("h2_gfl_fnc_body");
	precachemodel("h2_gfl_fnc_head");
	precachemodel("h2_gfl_fnc_clothes");
}
