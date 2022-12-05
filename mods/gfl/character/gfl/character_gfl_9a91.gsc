// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
	character\gfl\_utility::detach_all_attachments();
	self.charactername = "9A-91";
	thread character\gfl\_utility::set_character_name();
	self setmodel("h2_gfl_9a91_body");
	self.headmodel = "h2_gfl_9a91_head";
	self.accessorymodels = [ "h2_gfl_9a91_hair" ];
	self attach(self.headmodel, "", true);
	character\gfl\_utility::attach_accessorymodels();
	self.voice = "american";
	self setclothtype( "vestlight" );
}

precache()
{
	precachemodel("h2_gfl_9a91_body");
	precachemodel("h2_gfl_9a91_head");
	precachemodel("h2_gfl_9a91_hair");
}
