// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
	character\gfl\_utility::detach_all_attachments();
	self.charactername = "PPSh-41";
	self setmodel("h1_gfl_ppsh41_body");
	self.headmodel = "h1_gfl_ppsh41_head";
	character\gfl\_utility::attach_all_attachments();
	self.voice = "russian";
	self setclothtype( "vestlight" );
}

precache()
{
	precachemodel("h1_gfl_ppsh41_body");
	precachemodel("h1_gfl_ppsh41_head");
}
