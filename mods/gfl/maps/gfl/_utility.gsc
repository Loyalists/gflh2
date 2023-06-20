precache_all_weapons()
{
	precacheitem( "m4m203_acog" );
	precacheitem( "m4m203_eotech" );
	precacheitem( "m4m203_reflex" );
	precacheitem( "m203_m4_acog" );
	precacheitem( "m203_m4_eotech" );
	precacheitem( "m203_m4_reflex" );

	precacheitem( "iw5_hbra3_sp" );
	precacheitem( "iw5_bal27_sp" );
	precacheitem( "iw5_ak12_sp" );
	precacheitem( "iw5_mp11_sp" );
	precacheitem( "iw5_uts19_sp" );
	precacheitem( "iw5_asaw_sp" );
	precacheitem( "iw5_mors_sp" );
	precacheitem( "iw5_gm6_sp" );
}

precache_all_viewmodels()
{
    precachemodel( "h2_gfl_ump45_viewbody" );
    precachemodel( "h2_gfl_ump45_viewhands" );
    precachemodel( "h2_gfl_ump45_viewhands_player" );

    precachemodel( "h2_gfl_ump9_viewbody" );
    precachemodel( "h2_gfl_ump9_viewhands" );
    precachemodel( "h2_gfl_ump9_viewhands_player" );

    precachemodel( "h2_gfl_m4_sopmod_ii_viewbody" );
    precachemodel( "h2_gfl_m4_sopmod_ii_viewhands" );
    precachemodel( "h2_gfl_m4_sopmod_ii_viewhands_player" );
}

precache_all_characters()
{
	// main characters
    character\gfl\character_gfl_hk416::precache();
	character\gfl\character_gfl_g11::precache();
    character\gfl\character_gfl_m4a1::precache();
	character\gfl\character_gfl_m4_sopmod_ii::precache();
	character\gfl\character_gfl_ro635::precache();
    character\gfl\character_gfl_rpk16::precache();
	character\gfl\character_gfl_suomi::precache();
	character\gfl\character_gfl_dima::precache();
    character\gfl\character_gfl_ak12::precache();
	character\gfl\character_gfl_commander::precache();

	// randomized npcs
	character\gfl\character_gfl_p90::precache();
	character\gfl\character_gfl_9a91::precache();
	character\gfl\character_gfl_rfb::precache();
	character\gfl\character_gfl_type97::precache();
	character\gfl\character_gfl_saiga12::precache();
	character\gfl\character_gfl_fnc::precache();
	character\gfl\character_gfl_sten::precache();
	character\gfl\character_gfl_ak74m::precache();
	character\gfl\character_gfl_sp9::precache();
	character\gfl\character_gfl_tac50::precache();
	character\gfl\character_gfl_sp9_v2::precache();
	character\gfl\character_gfl_ppsh41::precache();
	character\gfl\character_gfl_super_sass::precache();
	character\gfl\character_gfl_super_sass_nocoat::precache();
	character\gfl\character_gfl_mp7_tights::precache();
	character\gfl\character_gfl_mp7_casual_tights::precache();
	character\gfl\character_gfl_mp7::precache();
	character\gfl\character_gfl_mp7_casual::precache();
	character\gfl\character_gfl_m14::precache();
	character\gfl\character_gfl_sv98::precache();
	character\gfl\character_gfl_g36c::precache();

	// sf
	character\gfl\character_gfl_dreamer::precache();
	character\gfl\character_gfl_destroyer::precache();
	character\gfl\character_gfl_ouroboros::precache();
	character\gfl\character_gfl_vespid::precache();
	character\gfl\character_gfl_jaeger::precache();
	character\gfl\character_gfl_jaeger_goggle_up::precache();
	character\gfl\character_gfl_ripper::precache();
	character\gfl\character_gfl_guard::precache();
	character\gfl\character_gfl_guard_visor_up::precache();
}