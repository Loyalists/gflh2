// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
	character\gfl\_utility::detach_all_attachments();
	self.charactername = "Guard";
	self setmodel("h2_gfl_guard_fb");
	self.accessorymodels = [ "h2_gfl_guard_visor" ];
	character\gfl\_utility::attach_all_attachments();
	self.voice = "russian";
	self setclothtype( "vestlight" );
}

precache()
{
	precachemodel("h2_gfl_guard_fb");
	precachemodel("h2_gfl_guard_visor");
}
