// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    dialog();
    _id_CED8();
    _id_C40F();
    _id_C306();
    _id_CD92();
    breach_anims();
    _id_BB63();
    _id_B58D();
    _id_C659();
    _id_AD72();
    _id_AB17();
    maps\_vehicle::_id_CCF4( "script_vehicle_uaz_hardtop_physics", _id_C782::setanims, ::_id_BCD0 );
}
#using_animtree("generic_human");

_id_CED8()
{
    level.scr_anim["ghost"]["temp_cellphone"] = %patrol_bored_idle_cellphone;
    level.scr_anim["ghost"]["temp_walkto"] = %patrol_bored_patrolwalk;
    level.scr_anim["generic"]["estate_ghost_radio"] = %h2_estate_ghost_radio;
    maps\_anim::addnotetrack_dialogue( "generic", "dialog", "estate_ghost_radio", "est_gst_regroup" );
    maps\_anim::addnotetrack_dialogue( "generic", "dialog", "estate_ghost_radio", "est_gst_photos" );
    maps\_anim::addnotetrack_dialogue( "generic", "dialog", "estate_ghost_radio", "est_scr_rogerthat" );
    maps\_anim::addnotetrack_dialogue( "generic", "dialog", "estate_ghost_radio", "est_gst_nosign" );
    maps\_anim::addnotetrack_dialogue( "generic", "dialog", "estate_ghost_radio", "est_pri_atleast50" );
    maps\_anim::addnotetrack_dialogue( "generic", "dialog", "estate_ghost_radio", "est_gst_goldmine" );
    maps\_anim::addnotetrack_dialogue( "generic", "dialog", "estate_ghost_radio", "est_shp_everything" );
    maps\_anim::addnotetrack_dialogue( "generic", "dialog", "estate_ghost_radio", "est_gst_alreadyonit" );
    maps\_anim::addnotetrack_dialogue( "generic", "dialog", "estate_ghost_radio", "est_shp_eta5mins" );
    maps\_anim::addnotetrack_dialogue( "generic", "dialog", "estate_ghost_radio", "est_gst_starttransfer" );
    maps\_anim::addnotetrack_dialogue( "generic", "dialog", "estate_ghost_radio", "est_gst_rearsecurity" );
    maps\_anim::addnotetrack_flag( "generic", "ghost_gives_regroup_order", "ghost_gives_regroup_order", "estate_ghost_radio" );
    maps\_anim::addnotetrack_flag( "generic", "house_briefing_is_over", "house_briefing_is_over", "estate_ghost_radio" );
    maps\_anim::addnotetrack_flag( "generic", "dsm_ready_to_use", "dsm_ready_to_use", "estate_ghost_radio" );
    level.scr_anim["generic"]["estate_house_photoshoot"] = %h2_estate_house_photoshoot;
    maps\_anim::addnotetrack_attach( "generic", "attach_camera", "electronics_camera_pointandshoot_animated", "TAG_INHAND", "estate_house_photoshoot" );
    maps\_anim::addnotetrack_detach( "generic", "detach_camera", "electronics_camera_pointandshoot_animated", "TAG_INHAND", "estate_house_photoshoot" );
    level.scr_anim["generic"]["exposed_crouch_extendedpainA"] = %exposed_crouch_extendedpaina;
}

_id_C40F()
{
    level.scr_anim["ghost"]["downhill_run"] = %estate_downhill_1;
    level.scr_anim["generic"]["downhill_run"] = %estate_downhill_1;
    level.scr_anim["ozone"]["downhill_run"] = %estate_downhill_1;
    level.scr_anim["scarecrow"]["downhill_run"] = %estate_downhill_1;
    level.scr_anim["ghost"]["run"] = %run_lowready_f;
    level.scr_anim["generic"]["run"] = %run_lowready_f;
    level.scr_anim["ozone"]["run"] = %run_lowready_f;
    level.scr_anim["scarecrow"]["run"] = %run_lowready_f;
}

breach_anims()
{
    level.scr_anim["generic"]["exposed_idle_reactA"] = %exposed_idle_reacta;
    level.scr_anim["generic"]["favela_chaotic_cornerR_med90"] = %favela_chaotic_cornerr_med90;
    level.scr_anim["generic"]["favela_chaotic_cornerCrL_fire_mid"] = %favela_chaotic_cornercrl_fire_mid;
    level.scr_anim["generic"]["favela_chaotic_cornerCrR_fire_mid"] = %favela_chaotic_cornercrr_fire_mid;
    level.scr_anim["generic"]["favela_chaotic_crouchcover_fireA"] = %favela_chaotic_crouchcover_firea;
    level.scr_anim["generic"]["favela_chaotic_crouchcover_fireB"] = %favela_chaotic_crouchcover_fireb;
    level.scr_anim["generic"]["breach_react_blowback_v1"] = %breach_react_blowback_v1;
    level.scr_anim["generic"]["breach_react_blowback_v2"] = %breach_react_blowback_v2;
    level.scr_anim["generic"]["breach_react_blowback_v3"] = %breach_react_blowback_v3;
    level.scr_anim["generic"]["breach_react_knife_charge"] = %breach_react_knife_charge;
    level.scr_anim["generic"]["breach_react_knife_charge_death"] = %death_shotgun_back_v1;
}

_id_B58D()
{
    level.scr_anim["ghost"]["estate_ending_drag"] = %estate_drag_friendly;
    level.scr_anim["ghost_ending"]["estate_ending_part1"] = %h2_estate_chopper_sequence_ghost;
    maps\_anim::addnotetrack_dialogue( "ghost_ending", "dialog", "estate_ending_part1", "est_gst_comeongetup" );
    maps\_anim::addnotetrack_dialogue( "ghost_ending", "dialog", "estate_ending_part1", "est_gst_getupgetup" );
    maps\_anim::addnotetrack_dialogue( "ghost_ending", "dialog", "estate_ending_part1", "est_gst_wegotit" );
    maps\_anim::addnotetrack_dialogue( "ghost_ending", "dialog", "estate_ending_part1", "est_gst_no" );
    level.scr_anim["shepherd_ending"]["estate_ending_part1"] = %h2_estate_chopper_sequence_leader;
    maps\_anim::addnotetrack_dialogue( "shepherd_ending", "shepherd_dsm_talk", "estate_ending_part1", "est_shp_havethedsm" );
    maps\_anim::addnotetrack_dialogue( "shepherd_ending", "shepherd_talk_looseend", "estate_ending_part1", "est_shp_looseend" );
    maps\_anim::addnotetrack_customfunction( "shepherd_ending", "shepherd_vilain", ::ee_cheat_villain_shepherd, "estate_ending_part1" );
    maps\_anim::addnotetrack_sound( "shepherd_ending", "shepherd_starts_walking", "estate_ending_part1", "scn_estate_finale_shepherd_foley_01" );
    level.scr_anim["guy1_ending"]["estate_ending_part1"] = %h2_estate_chopper_sequence_enemy1;
    level.scr_anim["guy2_ending"]["estate_ending_part1"] = %h2_estate_chopper_sequence_enemy2;
    level.scr_anim["guy1_ending"]["estate_ending_part2"] = %h2_estate_body_toss_guy1;
    level.scr_anim["guy2_ending"]["estate_ending_part2"] = %h2_estate_body_toss_guy2;
    level.scr_anim["body_ending"]["estate_ending_part2"] = %h2_estate_body_toss_body;
    level.scr_anim["guy1_ending"]["estate_ending_part2_2ndbody"] = %h2_estate_body_2nd_toss_guy1;
    level.scr_anim["guy2_ending"]["estate_ending_part2_2ndbody"] = %h2_estate_body_2nd_toss_guy2;
    level.scr_anim["ghost_ending_dead"]["estate_ending_part2_2ndbody"] = %h2_estate_2nd_body_toss_body;
    maps\_anim::addnotetrack_sound( "ghost_ending_dead", "ghost_drop_floor", "estate_ending_part2_2ndbody", "scn_estate_betrayal_drop_ghost_01" );
    level.scr_anim["gasolineGuy"]["estate_ending_part3"] = %h2_estate_ending_gasoline_guy1;
    level.scr_anim["shepherd_ending"]["estate_ending_part3"] = %h2_estate_ending_gasoline_leader;
    maps\_anim::addnotetrack_customfunction( "gasolineGuy", "gas_splash_start", ::_id_BD3B );
    maps\_anim::addnotetrack_customfunction( "ghost_ending_dead", "bodyfall large", ::_id_BDEA );
    maps\_anim::addnotetrack_customfunction( "ghost_ending", "blood_splat", ::_id_CCEB );
}

ee_cheat_villain_shepherd( var_0 )
{
    var_0 thread _id_C0C3::addspecialmonitors();
}

play_shepherd_ending_gun_anim()
{
    waitframe();
    self setanim( %h2_estate_chopper_sequence_gun );
}

play_cannister_guy_cannister_anim()
{
    waitframe();
    self setanim( %h2_estate_ending_gasoline_cannister );
}

_id_CCEB( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "flesh_hit_body_fatal_exit" ), var_0, "J_SpineUpper" );
}

_id_BD3B( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "gas_can_splash" ), var_0, "TAG_FX" );
}

_id_B909( var_0 )
{
    self endon( "gas_drip_end" );

    for (;;)
    {
        playfxontag( common_scripts\utility::getfx( "gas_can_splash" ), var_0, "TAG_FX" );
        wait 0.03;
    }
}

_id_AB1A( var_0 )
{
    self notify( "gas_splash_end" );
}

_id_C718( var_0 )
{
    self notify( "gas_drip_end" );
}

_id_BDEA( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "bodydump_dust_large" ), var_0, "J_SpineLower" );
}

_id_C306()
{
    level.scr_anim["ghillie"]["prone_2_stand"] = %prone_2_stand;
    level.scr_anim["ghillie"]["prone_2_stand_firing"] = %prone_2_stand_firing;
}

dialog()
{
    level.scr_radio["est_snp1_inposition"] = "est_snp1_inposition";
    level.scr_radio["est_sld1_rogerthat"] = "est_sld1_rogerthat";
    level.scr_radio["est_sld2_solidcopy"] = "est_sld2_solidcopy";
    level.scr_sound["ghost"]["est_gst_engageonsight"] = "est_gst_engageonsight";
    level.scr_sound["ghost"]["est_gst_letsgoletsgo"] = "est_gst_letsgoletsgo";
    level.scr_sound["ghost"]["est_gst_ambush"] = "est_gst_ambush";
    level.scr_sound["ozone"]["est_tf1_ambush"] = "est_tf1_ambush";
    level.scr_sound["scarecrow"]["est_tf2_ambush"] = "est_tf2_ambush";
    level.scr_sound["ghost"]["est_gst_targetsleftside"] = "est_gst_targetsleftside";
    level.scr_sound["ghost"]["est_gst_counterattack"] = "est_gst_counterattack";
    level.scr_sound["ghost"]["est_gst_loseeminsmoke"] = "est_gst_loseeminsmoke";
    level.scr_sound["scarecrow"]["est_scr_presighted"] = "est_scr_presighted";
    level.scr_sound["ghost"]["est_gst_hostchopper"] = "est_gst_hostchopper";
    level.scr_radio["est_snp1_trucksleaving"] = "est_snp1_trucksleaving";
    level.scr_sound["ghost"]["est_gst_trucksgetaway"] = "est_gst_trucksgetaway";
    level.scr_sound["ghost"]["est_gst_bulletproofed"] = "est_gst_bulletproofed";
    level.scr_radio["est_snp1_firingjavelin"] = "est_snp1_firingjavelin";
    level.scr_sound["ghost"]["est_gst_dangerclose"] = "est_gst_dangerclose";
    level.scr_radio["est_snp1_twoaway"] = "est_snp1_twoaway";
    level.scr_radio["est_snp1_neutralized"] = "est_snp1_neutralized";
    level.scr_radio["est_snp1_decoys"] = "est_snp1_decoys";
    level.scr_sound["ghost"]["est_gst_advancingonhouse"] = "est_gst_advancingonhouse";
    level.scr_sound["ghost"]["est_gst_clearperimieter"] = "est_gst_clearperimieter";
    level.scr_sound["ghost"]["est_gst_breachnclear"] = "est_gst_breachnclear";
    level.scr_radio["est_gst_officeclear"] = "est_gst_officeclear";
    level.scr_radio["est_gst_diningroomclr"] = "est_gst_diningroomclr";
    level.scr_radio["est_gst_clear"] = "est_gst_clear";
    level.scr_radio["est_gst_letsgo2"] = "est_gst_letsgo2";
    level.scr_radio["est_gst_lockedrooms"] = "est_gst_lockedrooms";
    level.scr_radio["est_scr_getupstairs"] = "est_scr_getupstairs";
    level.scr_radio["est_gst_checkbasement"] = "est_gst_checkbasement";
    level.scr_radio["est_gst_sitrep"] = "est_gst_sitrep";
    level.scr_radio["est_scr_noonesleaving"] = "est_scr_noonesleaving";
    level.scr_radio["est_gst_thrukitchen"] = "est_gst_thrukitchen";
    level.scr_radio["est_ozn_rogerthat"] = "est_ozn_rogerthat";
    level.scr_radio["est_scr_mainfloor"] = "est_scr_mainfloor";
    level.scr_radio["est_gst_mainfloor"] = "est_gst_mainfloor";
    level.scr_radio["est_scr_gotyourback"] = "est_scr_gotyourback";
    level.scr_radio["est_scr_basement"] = "est_scr_basement";
    level.scr_radio["est_gst_basement"] = "est_gst_basement";
    level.scr_radio["est_scr_topfloor"] = "est_scr_topfloor";
    level.scr_radio["est_gst_topfloor"] = "est_gst_topfloor";
    level.scr_radio["est_gst_regroup"] = "est_gst_regroup";
    level.scr_sound["ghost"]["est_gst_photos"] = "est_gst_photos";
    level.scr_radio["est_scr_rogerthat"] = "est_scr_rogerthat";
    level.scr_sound["ghost"]["est_gst_nosign"] = "est_gst_nosign";
    level.scr_radio["est_pri_somuchforintel"] = "est_pri_somuchforintel";
    level.scr_radio["est_pri_atleast50"] = "est_pri_atleast50";
    level.scr_sound["ghost"]["est_gst_goldmine"] = "est_gst_goldmine";
    level.scr_radio["est_shp_everything"] = "est_shp_everything";
    level.scr_sound["ghost"]["est_gst_alreadyonit"] = "est_gst_alreadyonit";
    level.scr_radio["est_shp_eta5mins"] = "est_shp_eta5mins";
    level.scr_sound["ghost"]["est_gst_starttransfer"] = "est_gst_starttransfer";
    level.scr_sound["ghost"]["est_gst_rearsecurity"] = "est_gst_rearsecurity";
    level.scr_radio["est_ozn_onmyway"] = "est_ozn_onmyway";
    level.scr_radio["est_pri_searching"] = "est_pri_searching";
    level.scr_radio["est_pri_gettingcloser"] = "est_pri_gettingcloser";
    level.scr_radio["est_pri_goingsilent"] = "est_pri_goingsilent";
    level.scr_radio["est_gst_filesoff"] = "est_gst_filesoff";
    level.scr_radio["est_gst_startdownload"] = "est_gst_startdownload";
    level.scr_radio["est_snp1_mainroad"] = "est_snp1_mainroad";
    level.scr_radio["est_snp1_60seconds"] = "est_snp1_60seconds";
    level.scr_radio["est_gst_withintel"] = "est_gst_withintel";
    level.scr_radio["est_gst_weaponscache"] = "est_gst_weaponscache";
    level.scr_radio["est_snp1_15seconds"] = "est_snp1_15seconds";
    level.scr_radio["est_gst_15seconds"] = "est_gst_15seconds";
    level.scr_radio["est_scr_inposition"] = "est_scr_inposition";
    level.scr_radio["est_ozn_readyengage"] = "est_ozn_readyengage";
    level.scr_radio["est_ozn_stockup"] = "est_ozn_stockup";
    level.scr_radio["est_snp1_fastattack"] = "est_snp1_fastattack";
    level.scr_radio["est_gst_helosnw"] = "est_gst_helosnw";
    level.scr_radio["est_scr_frontlawn"] = "est_scr_frontlawn";
    level.scr_radio["est_ozn_mainwindows"] = "est_ozn_mainwindows";
    level.scr_radio["est_gst_useclaymores"] = "est_gst_useclaymores";
    level.scr_radio["est_scr_whatwasthat"] = "est_scr_whatwasthat";
    level.scr_radio["est_snp1_hostilesse"] = "est_snp1_hostilesse";
    level.scr_radio["est_snp1_thinemout"] = "est_snp1_thinemout";
    level.scr_radio["est_gst_fieldtose"] = "est_gst_fieldtose";
    level.scr_radio["est_ozn_eyeson"] = "est_ozn_eyeson";
    level.scr_radio["est_snp1_troopswest"] = "est_snp1_troopswest";
    level.scr_radio["est_gst_boathouse"] = "est_gst_boathouse";
    level.scr_radio["est_ozn_249sandrpgs"] = "est_ozn_249sandrpgs";
    level.scr_radio["est_gst_cutemdown"] = "est_gst_cutemdown";
    level.scr_radio["est_snp1_boathousewest"] = "est_snp1_boathousewest";
    level.scr_radio["est_gst_westsideofhouse"] = "est_gst_westsideofhouse";
    level.scr_radio["est_snp1_additionalhostile"] = "est_snp1_additionalhostile";
    level.scr_radio["est_gst_solarpanelseast"] = "est_gst_solarpanelseast";
    level.scr_radio["est_scr_comethrutrees"] = "est_scr_comethrutrees";
    level.scr_radio["est_gst_easttrail"] = "est_gst_easttrail";
    level.scr_radio["est_snp1_tangodown"] = "est_snp1_tangodown";
    level.scr_radio["est_snp1_gotone"] = "est_snp1_gotone";
    level.scr_radio["est_snp1_hostneut"] = "est_snp1_hostneut";
    level.scr_radio["est_snp1_thatsakill"] = "est_snp1_thatsakill";
    level.scr_radio["est_snp1_thatsone"] = "est_snp1_thatsone";
    level.scr_radio["est_snp1_tangodown2"] = "est_snp1_tangodown2";
    level.scr_radio["est_snp1_droppedhim"] = "est_snp1_droppedhim";
    level.scr_radio["est_snp1_hesdown"] = "est_snp1_hesdown";
    level.scr_radio["est_snp1_moving"] = "est_snp1_moving";
    level.scr_radio["est_snp1_displacing"] = "est_snp1_displacing";
    level.scr_radio["est_snp1_rpgteameast"] = "est_snp1_rpgteameast";
    level.scr_radio["est_ozn_rpgteameast"] = "est_ozn_rpgteameast";
    level.scr_radio["est_snp1_rpgteamwest"] = "est_snp1_rpgteamwest";
    level.scr_radio["est_gst_rpgteamwest"] = "est_gst_rpgteamwest";
    level.scr_radio["est_snp1_rpgteamsw"] = "est_snp1_rpgteamsw";
    level.scr_radio["est_ozn_rpgteamsw"] = "est_ozn_rpgteamsw";
    level.scr_radio["est_ozn_imhit"] = "est_ozn_imhit";
    level.scr_radio["est_snp1_ozoneisdown"] = "est_snp1_ozoneisdown";
    level.scr_radio["est_scr_imhit"] = "est_scr_imhit";
    level.scr_radio["est_snp1_scarecrowdown"] = "est_snp1_scarecrowdown";
    level.scr_radio["est_gst_stayclose"] = "est_gst_stayclose";
    level.scr_radio["est_gst_dontstray"] = "est_gst_dontstray";
    level.scr_radio["est_gst_fallback"] = "est_gst_fallback";
    level.scr_radio["est_gst_tryingtostop"] = "est_gst_tryingtostop";
    level.scr_radio["est_gst_lostthedsm"] = "est_gst_lostthedsm";
    level.scr_radio["est_gst_destroyedthedsm"] = "est_gst_destroyedthedsm";
    level.scr_radio["est_gst_dsmcomplete"] = "est_gst_dsmcomplete";
    level.scr_radio["est_gst_getouttahere"] = "est_gst_getouttahere";
    level.scr_radio["est_shp_almostatlz"] = "est_shp_almostatlz";
    level.scr_sound["ghost"]["est_gst_onourway"] = "est_gst_onourway";
    level.scr_sound["ghost"]["est_gst_bracketing"] = "est_gst_bracketing";
    level.scr_sound["ghost"]["est_gst_gettothelz"] = "est_gst_gettothelz";
    level.scr_sound["ghost"]["est_gst_gotyoucovered"] = "est_gst_gotyoucovered";
    level.scr_sound["ghost"]["est_gst_illcoveryou"] = "est_gst_illcoveryou";
    level.scr_sound["ghost"]["est_gst_keepmoving"] = "est_gst_keepmoving";
    level.scr_sound["ghost"]["est_gst_gogo"] = "est_gst_gogo";
    level.scr_radio["est_gst_gotyouroach"] = "est_gst_gotyouroach";
    level.scr_radio["est_gst_redsmoke"] = "est_gst_redsmoke";
    level.scr_radio["est_fp1_visual"] = "est_fp1_visual";
    level.scr_radio["est_gst_clearedhot"] = "est_gst_clearedhot";
    level.scr_radio["est_fp1_clearedhot"] = "est_fp1_clearedhot";
    level.scr_radio["est_hp1_gunsgunsguns"] = "est_hp1_gunsgunsguns";
    level.scr_radio["est_gst_hanginthere"] = "est_gst_hanginthere";
    level.scr_sound["ghost_ending"]["est_gst_comeongetup"] = "est_gst_comeongetup";
    level.scr_sound["ghost_ending"]["est_gst_getupgetup"] = "est_gst_getupgetup";
    level.scr_radio["est_hp1_rocketattck"] = "est_hp1_rocketattck";
    level.scr_radio["est_hp2_hitemhard"] = "est_hp2_hitemhard";
    level.scr_radio["est_hp1_imonit"] = "est_hp1_imonit";
    level.scr_radio["est_hp1_linedup"] = "est_hp1_linedup";
    level.scr_radio["est_hp2_watchforsnipers"] = "est_hp2_watchforsnipers";
    level.scr_sound["ghost_ending"]["est_gst_wegotit"] = "est_gst_wegotit";
    level.scr_sound["shepherd_ending"]["est_shp_welldone"] = "est_shp_welldone";
    level.scr_sound["ghost_ending"]["est_gst_no"] = "est_gst_no";
    level.scr_radio["est_hp2_sanitized"] = "est_hp2_sanitized";
    level.scr_radio["est_hp1_holdingpattern"] = "est_hp1_holdingpattern";
    level.scr_radio["est_pri_comein"] = "est_pri_comein";
    level.scr_radio["est_pri_holdleftflank"] = "est_pri_holdleftflank";
    level.scr_radio["est_pri_donottrust"] = "est_pri_donottrust";
    level.scr_radio["est_pri_getdown"] = "est_pri_getdown";
    level.scr_radio["est_pri_underattack"] = "est_pri_underattack";
}
#using_animtree("script_model");

_id_CD92()
{
    level.scr_animtree["bouncingbetty"] = #animtree;
    level.scr_anim["bouncingbetty"]["bouncing_betty_detonate"] = %bouncing_betty_detonate;
    level.scr_model["bouncingbetty"] = "projectile_bouncing_betty_grenade";
}

_id_BB63()
{
    level.scr_anim["breach_door_model_estate"]["breach"] = %breach_player_door_v2;
    level.scr_animtree["breach_door_model_estate"] = #animtree;
    level.scr_model["breach_door_model_estate"] = "h2_est_com_door_02";
    level.scr_anim["breach_door_hinge_estate"]["breach"] = %breach_player_door_hinge_v1;
    level.scr_animtree["breach_door_hinge_estate"] = #animtree;
    level.scr_model["breach_door_hinge_estate"] = "h2_est_com_door_piece_02";
}
#using_animtree("player");

_id_C659()
{
    level.scr_animtree["playerview"] = #animtree;
    level.scr_model["playerview"] = "h2_gfl_st_ar15_viewhands_player";
    level.scr_animtree["worldbody"] = #animtree;
    level.scr_model["worldbody"] = "h2_gfl_st_ar15_viewbody";
    level.scr_anim["worldbody"]["estate_ending_drag"] = %h2_estate_drag_player;
    level.scr_anim["worldbody"]["estate_ending_part1"] = %h2_estate_chopper_sequence_player;
    level.scr_anim["worldbody"]["estate_ending_part2"] = %h2_estate_body_toss_player;
    maps\_anim::addnotetrack_customfunction( "playerview", "bodyfall large", ::_id_BE92 );
    level.scr_anim["worldbody"]["dsm_in"] = %h2_estate_dsm_vm_in;
    level.scr_anim["worldbody"]["dsm_out"] = %h2_estate_dsm_vm_out;
}

_id_BE92( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "bodydump_dust_large" ), var_0, "J_Wrist_RI" );
}
#using_animtree("vehicles");

_id_AD72()
{
    level.scr_animtree["pavelow"] = #animtree;
    level.scr_anim["pavelow"]["estate_ending_part1"] = %h2_estate_chopper_sequence_pavelow;
}
#using_animtree("script_model");

_id_AB17()
{
    level.scr_animtree["lamp"] = #animtree;
    level.scr_anim["lamp"]["idle"] = %h2_est_industrial_lamp_off_idle;
    level.scr_animtree["flower"] = #animtree;
    level.scr_anim["flower"]["idle"] = %h2_hanging_flowerpot_idle;
    level.scr_animtree["chandelier_small"] = #animtree;
    level.scr_anim["chandelier_small"]["idle"] = %h2_estate_chandelier_small;
    level.scr_animtree["chandelier_big"] = #animtree;
    level.scr_anim["chandelier_big"]["idle"] = %h2_estate_chandelier_big;
    level.scr_animtree["cigar"] = #animtree;
    level.scr_model["cigar"] = "prop_price_cigar";
    level.scr_anim["cigar"]["estate_ending_part3"] = %h2_estate_ending_gasoline_leader_cigar;
    level.scr_animtree["dsm"] = #animtree;
    level.scr_model["dsm"] = "mil_wireless_dsm";
    level.scr_anim["dsm"]["estate_ending_part1"] = %h2_estate_chopper_sequence_dsm;
    level.scr_animtree["dsm"] = #animtree;
    level.scr_model["dsm"] = "mil_wireless_dsm";
    level.scr_anim["dsm"]["dsm_in"] = %h2_estate_dsm_in;
    level.scr_anim["dsm"]["dsm_out"] = %h2_estate_dsm_out;
}
#using_animtree("vehicles");

_id_BCD0( var_0 )
{
    var_0 = _id_C782::set_vehicle_anims( var_0 );
    var_0[0].vehicle_getoutanim = %uaz_driver_exit_into_stand_door_alt;
    var_0[1].vehicle_getoutanim = %uaz_passenger_exit_into_stand_door_alt;
    var_0[2].vehicle_getoutanim = %uaz_rear_driver_exit_into_stand_door_alt;
    var_0[3].vehicle_getoutanim = %uaz_passenger2_exit_into_stand_door_alt;
    return var_0;
}
