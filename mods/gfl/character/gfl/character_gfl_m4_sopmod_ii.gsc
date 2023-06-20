// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
	character\gfl\_utility::detach_all_attachments();
	self.charactername = "M4 SOPMOD II";
	self setmodel("h2_gfl_m4_sopmod_ii_body");
	self.headmodel = "h2_gfl_m4_sopmod_ii_head";
	character\gfl\_utility::attach_all_attachments();
	self.voice = "taskforce";
	self setclothtype( "vestlight" );
}

precache()
{
	precachemodel("h2_gfl_m4_sopmod_ii_body");
	precachemodel("h2_gfl_m4_sopmod_ii_head");
}
