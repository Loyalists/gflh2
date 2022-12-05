// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    _id_AEB8();
    _id_BDBA();
    _id_CC1A();
    player_animations();
    _id_D14F();
    _id_AC3C();
}
#using_animtree("generic_human");

_id_AEB8()
{
    level.scr_anim["generic"]["combatwalk_F_spin"] = %combatwalk_f_spin;
    level.scr_anim["dunn"]["hunted_woundedhostage_check"] = %hunted_woundedhostage_check_soldier;
    level.scr_anim["dunn"]["hunted_woundedhostage_check_soldier_end"] = %hunted_woundedhostage_check_soldier_end;
    level.scr_sound["dunn"]["dcemp_cpd_huah3"] = "dcemp_cpd_huah3";
    level.scr_sound["dunn"]["dcemp_cpd_westwing"] = "dcemp_cpd_westwing";
    level.scr_sound["dunn"]["dcemp_cpd_placeishistory"] = "dcemp_cpd_placeishistory";
    level.scr_sound["foley"]["dcemp_fly_cutchatter"] = "dcemp_fly_cutchatter";
    level.scr_sound["foley"]["dcemp_fly_fortourists"] = "dcemp_fly_fortourists";
    level.scr_sound["marine1"]["dcemp_ar1_feetdry"] = "dcemp_ar1_feetdry";
    level.scr_sound["generic"]["dcemp_ar2_letsgo"] = "dcemp_ar2_letsgo";
    level.scr_sound["generic"]["dcemp_ar3_hustleup"] = "dcemp_ar3_hustleup";
    level.scr_face["generic"]["dcemp_ar3_hustleup"] = %dcemp_ar3_hustleup;
    level.scr_sound["generic"]["dcemp_ar3_thisway"] = "dcemp_ar3_thisway";
    level.scr_sound["generic"]["dcemp_ar3_movemove"] = "dcemp_ar3_movemove";
    level.scr_anim["dead_guy"]["hunted_woundedhostage_check"] = %hunted_woundedhostage_check_hostage;
    level.scr_anim["dead_guy"]["hunted_woundedhostage_idle_start"][0] = %hunted_woundedhostage_idle_start;
    level.scr_anim["dead_guy"]["hunted_woundedhostage_idle_end"] = %hunted_woundedhostage_idle_end;
    level.scr_anim["generic"]["death_sitting_pose_v1"] = %death_sitting_pose_v1;
    level.scr_anim["generic"]["tunnel_door_open_guy"] = %cargoship_open_cargo_guyl;
    level.scr_anim["dunn"]["DCemp_door_sequence"] = %dcemp_door_sequence_dunn;
    level.scr_anim["foley"]["DCemp_door_sequence_foley_approch"] = %dcemp_door_sequence_foley_approch;
    level.scr_anim["foley"]["DCemp_door_sequence_foley_idle"][0] = %dcemp_door_sequence_foley_idle;
    level.scr_anim["foley"]["DCemp_door_sequence_foley_wave"] = %dcemp_door_sequence_foley_wave;
    maps\_anim::addnotetrack_dialogue( "dunn", "dcemp_cpd_westwing_ps", "DCemp_door_sequence", "dcemp_cpd_westwing" );
    maps\_anim::addnotetrack_flag( "dunn", "foley_dialogue", "tunnels_foley_dialogue", "DCemp_door_sequence" );
    maps\_anim::addnotetrack_dialogue( "dunn", "dcemp_cpd_placeishistory_ps", "DCemp_door_sequence", "dcemp_cpd_placeishistory" );
    level.scr_anim["foley"]["intro"] = %h2_dcwhitehouse_tunnel_intro_foley;
    level.scr_anim["dunn"]["intro"] = %h2_dcwhitehouse_tunnel_intro_dunn;
    level.scr_anim["dunn"]["intro_loop"][0] = %h2_dcwhitehouse_tunnel_intro_dunn_idle;
    level.scr_anim["dunn"]["intro_out"] = %h2_dcwhitehouse_tunnel_intro_dunn_02;
    level.scr_anim["marine1"]["intro"] = %h2_dcwhitehouse_tunnel_intro_ranger;
    level.scr_anim["generic"]["wave_idle"][0] = %h2_dcwhitehouse_hustleup_idle;
    level.scr_anim["generic"]["wave_whiskey"] = %h2_dcwhitehouse_hustleup_get_to_whiskey;
    level.scr_anim["generic"]["wave_come_on"] = %h2_dcwhitehouse_hustleup_come_on;
    level.scr_anim["generic"]["wave_move"] = %h2_dcwhitehouse_hustleup_move;
    maps\_anim::addnotetrack_dialogue( "generic", "dialog", "wave_whiskey", "dcemp_ar3_hustleup" );
    maps\_anim::addnotetrack_dialogue( "generic", "dialog", "wave_come_on", "dcemp_ar3_thisway" );
    maps\_anim::addnotetrack_dialogue( "generic", "dialog", "wave_move", "dcemp_ar3_movemove" );
}

_id_BDBA()
{
    level.scr_sound["marshall"]["dcemp_cml_moremen"] = "dcemp_cml_moremen";
    level.scr_sound["dunn"]["dcemp_cpd_partystarted"] = "dcemp_cpd_partystarted";
    level.scr_sound["dunn"]["dcemp_cpd_radiooverhere"] = "dcemp_cpd_radiooverhere";
    level.scr_sound["dunn"]["dcemp_cpd_talkingabout"] = "dcemp_cpd_talkingabout";
    level.scr_sound["dunn"]["dcemp_cpd_happensnow"] = "dcemp_cpd_happensnow";
    level.scr_sound["foley"]["dcemp_fly_rogerstayfrosty"] = "dcemp_fly_rogerstayfrosty";
    level.scr_sound["foley"]["dcemp_fly_workyourwayleft"] = "dcemp_fly_workyourwayleft";
    level.scr_sound["foley"]["dcemp_fly_ramirezgo"] = "dcemp_fly_ramirezgo";
    level.scr_sound["foley"]["dcemp_fly_takeleftflank"] = "dcemp_fly_takeleftflank";
    level.scr_sound["foley"]["dcemp_fly_punchthrough"] = "dcemp_fly_punchthrough";
    level.scr_sound["foley"]["dcemp_fly_machineguns"] = "dcemp_fly_machineguns";
    level.scr_sound["foley"]["dcemp_fly_flattenthecity"] = "dcemp_fly_flattenthecity";
    level.scr_sound["foley"]["dcemp_fly_lessthantwomins"] = "dcemp_fly_lessthantwomins";
    level.scr_sound["foley"]["dcemp_fly_30seconds"] = "dcemp_fly_30seconds";
    level.scr_sound["foley"]["dcemp_fly_60seconds"] = "dcemp_fly_60seconds";
    level.scr_sound["foley"]["dcemp_fly_90seconds"] = "dcemp_fly_90seconds";
    level.scr_sound["foley"]["dcemp_fly_poptheflares"] = "dcemp_fly_poptheflares";
    level.scr_sound["foley"]["dcemp_fly_waraintover"] = "dcemp_fly_waraintover";
    level.scr_sound["foley"]["dcemp_fly_backdownstairs"] = "dcemp_fly_backdownstairs";
    level.scr_radio["dcemp_fp1_hammerdown"] = "dcemp_fp1_hammerdown";
    level.scr_radio["dcemp_fp1_highvalue"] = "dcemp_fp1_highvalue";
    level.scr_radio["dcemp_fp1_greenflares"] = "dcemp_fp1_greenflares";
    level.scr_radio["dcemp_fp1_willabort"] = "dcemp_fp1_willabort";
    level.scr_radio["dcemp_fp1_2minutes"] = "dcemp_fp1_2minutes";
    level.scr_radio["dcemp_fp1_90secs"] = "dcemp_fp1_90secs";
    level.scr_radio["dcemp_fp1_1minute"] = "dcemp_fp1_1minute";
    level.scr_radio["dcemp_fp1_30secs"] = "dcemp_fp1_30secs";
    level.scr_radio["dcemp_fp1_beenauthorized"] = "dcemp_fp1_beenauthorized";
    level.scr_radio["dcemp_fp1_bombsaway"] = "dcemp_fp1_bombsaway";
    level.scr_radio["dcemp_fp1_abortabort"] = "dcemp_fp1_abortabort";
    level.scr_radio["dcemp_fp1_closeone"] = "dcemp_fp1_closeone";
    level.scr_radio["dcemp_fp1_wordtohq"] = "dcemp_fp1_wordtohq";
    level.scr_radio["dcemp_fp2_abortmission"] = "dcemp_fp2_abortmission";
    level.scr_radio["dcemp_fp3_rollingout"] = "dcemp_fp3_rollingout";
    level.scr_radio["dcemp_fp4_abortingmission"] = "dcemp_fp4_abortingmission";
    level.scr_radio["dcemp_fp1_closeone2"] = "dcemp_fp1_closeone";
    level.scr_anim["rappel_guy"]["rappel_stand_idle_1"][0] = %launchfacility_a_setup_2_rappel_1;
    level.scr_anim["rappel_guy"]["rappel_stand_idle_2"][0] = %launchfacility_a_setup_2_rappel_2;
    level.scr_anim["rappel_guy"]["rappel_stand_idle_3"][0] = %launchfacility_a_rappel_idle_3;
    level.scr_anim["rappel_guy"]["rappel_drop"] = %launchfacility_a_rappel_1;
    level.scr_anim["generic"]["doorburst_wave"] = %doorburst_wave;
    level.scr_anim["flare_guy"]["dcemp_flare_reshoot_start_idle"][0] = %dcemp_flare_reshoot_start_idle;
    level.scr_anim["flare_guy"]["dcemp_flare_reshoot_start"] = %dcemp_flare_reshoot_start;
    maps\_anim::addnotetrack_attach( "flare_guy", "attach flare", "mil_emergency_flare", "tag_inhand", "dcemp_flare_reshoot_start" );
    maps\_anim::addnotetrack_customfunction( "flare_guy", "start flare", maps\dc_whitehouse_code::_id_B94B, "dcemp_flare_reshoot_start" );
    maps\_anim::addnotetrack_flag( "flare_guy", "attach flare", "flareguy_flare_popped", "dcemp_flare_reshoot_start" );
    level.scr_anim["flare_guy"]["dcemp_flare_reshoot_end"] = %h2_dcemp_flare_reshoot_end;
    maps\_anim::addnotetrack_flag( "flare_guy", "detach flare", "flare_guy_drop_flares", "dcemp_flare_reshoot_end" );
    maps\_anim::addnotetrack_flag( "flare_guy", "start_dunn_animation", "start_ending_dialog", "dcemp_flare_reshoot_end" );
    level.scr_anim["flare_guy"]["dcemp_flare_reshoot_start_short"] = %dcemp_flare_reshoot_start_short;
    maps\_anim::addnotetrack_attach( "flare_guy", "attach flare", "mil_emergency_flare", "tag_inhand", "dcemp_flare_reshoot_start_short" );
    maps\_anim::addnotetrack_customfunction( "flare_guy", "start flare", maps\dc_whitehouse_code::_id_B94B, "dcemp_flare_reshoot_start_short" );
    maps\_anim::addnotetrack_flag( "flare_guy", "attach flare", "flareguy_flare_popped", "dcemp_flare_reshoot_start_short" );
    level.scr_anim["flare_guy"]["dcemp_flare_idle"][0] = %casual_stand_idle;
    level.scr_anim["flare_guy"]["dcemp_flare_idle"][1] = %casual_stand_idle_twitch;
    level.scr_anim["flare_guy"]["dcemp_flare_idle"][2] = %casual_stand_idle_twitchb;
    level.scr_anim["dunn"]["ending_dialogue_in"] = %h2_dcwhite_flare_end_dunn;
    level.scr_anim["dunn"]["ending_dialogue_idle"][0] = %h2_dcwhite_flare_end_dunn_idle;
    level.scr_anim["dunn"]["ending_dialogue_out"] = %h2_dcwhite_flare_end_dunn_out;
    maps\_anim::addnotetrack_dialogue( "dunn", "dialog", "ending_dialogue_out", "dcwhite_cpd_burnitdown" );
    level.scr_anim["flare_guy"]["whitehouse_ending_runuphill"] = %whitehouse_ending_runuphill;
    level.scr_anim["marshall"]["DCemp_whitehouse_briefing"] = %h2_dcemp_whitehouse_briefing_marshall;
    maps\_anim::addnotetrack_customfunction( "marshall", "drop_bino", maps\dc_whitehouse::dropbinocular, "DCemp_whitehouse_briefing" );
    maps\_anim::addnotetrack_flag( "marshall", "grab_gun", "marshallTakeBackWeapon", "DCemp_whitehouse_briefing" );
    level.scr_anim["marshall"]["DCemp_whitehouse_briefing_idle"][0] = %h2_dcemp_whitehouse_briefing_marshall_idle;
    level.scr_anim["marshall"]["DCemp_whitehouse_briefing_idle2"][0] = %h2_dcemp_whitehouse_briefing_marshall_idle2;
    level.scr_anim["foley"]["DCemp_whitehouse_briefing"] = %h2_dcemp_whitehouse_briefing_foley;
    level.scr_anim["marshall"]["dcw_briefing_marshall_moremen"] = %h2_dcemp_whitehouse_briefing_marshall_moremen;
    maps\_anim::addnotetrack_dialogue( "marshall", "dcemp_cml_moremen", "dcw_briefing_marshall_moremen", "dcemp_cml_moremen" );
    maps\_anim::addnotetrack_dialogue( "foley", "dcemp_fly_situationhere_ps", "DCemp_whitehouse_briefing", "dcemp_fly_situationhere" );
    maps\_anim::addnotetrack_dialogue( "marshall", "dcemp_cml_highground_ps", "DCemp_whitehouse_briefing", "dcemp_cml_highground" );
    maps\_anim::addnotetrack_dialogue( "marshall", "dcemp_cml_retakeit_ps", "DCemp_whitehouse_briefing", "dcemp_cml_retakeit" );
    maps\_anim::addnotetrack_dialogue( "marshall", "dcemp_cml_getyoursquad_ps", "DCemp_whitehouse_briefing", "dcemp_cml_getyoursquad" );
    maps\_anim::addnotetrack_dialogue( "foley", "dcemp_fly_squadoscarmike_ps", "DCemp_whitehouse_briefing", "dcemp_fly_squadoscarmike" );
    maps\_anim::addnotetrack_flag( "marshall", "dcemp_cml_getyoursquad_ps", "whitehouse_moveout", "DCemp_whitehouse_briefing" );
    maps\_anim::addnotetrack_flag( "marshall", "dcemp_cml_getyoursquad_ps", "music_cue", "DCemp_whitehouse_briefing" );
    level.scr_anim["foley"]["oval_office_in"] = %h2_dcemp_wh_radio_foley_in;
    level.scr_anim["foley"]["oval_office_idle"][0] = %h2_dcemp_wh_radio_foley_idle;
    level.scr_anim["foley"]["oval_office"] = %h2_dcemp_wh_radio_foley;
    level.scr_anim["dunn"]["oval_office_in"] = %h2_dcemp_wh_radio_dunn_in;
    level.scr_anim["dunn"]["oval_office_idle"][0] = %h2_dcemp_wh_radio_dunn_idle;
    level.scr_anim["dunn"]["oval_office"] = %h2_dcemp_wh_radio_dunn;
    maps\_anim::addnotetrack_customfunction( "dunn", "add_speaker_reveal_mix", maps\dc_whitehouse_aud::start_speaker_reveal_mix, "oval_office" );
    maps\_anim::addnotetrack_flag( "dunn", "kick", "oval_office_door_open", "oval_office" );
    level.scr_sound["dunn"]["dcwhite_cpd_readingthis"] = "dcwhite_cpd_readingthis";
    level.scr_sound["dunn"]["dcwhite_cpd_rogerthat"] = "dcwhite_cpd_rogerthat";
    level.scr_sound["foley"]["dcwhite_fly_dunngetdoor"] = "dcwhite_fly_dunngetdoor";
    level.scr_sound["foley"]["dcwhite_fly_dunn"] = "dcwhite_fly_dunn";
    level.scr_sound["foley"]["dcwhite_fly_thatswhy"] = "dcwhite_fly_thatswhy";
    var_0 = [];
    var_0["death_explosion_up10"] = %death_explosion_up10;
    var_0["death_explosion_left11"] = %death_explosion_left11;
    var_0["death_explosion_stand_B_v2"] = %death_explosion_stand_b_v2;
    level._id_A81B = var_0;
    level.scr_sound["foley"]["dcemp_fly_gettoroof"] = "dcemp_fly_gettoroof";
    level.scr_sound["foley"]["dcemp_fly_useyourflares"] = "dcemp_fly_useyourflares";
    level.scr_sound["flare_guy"]["dcemp_ar1_moscow"] = "dcemp_ar1_moscow";
    level.scr_face["flare_guy"]["dcemp_ar1_moscow"] = %dcemp_ar1_moscow;
    level.scr_sound["dunn"]["dcwhite_cpd_burnitdown"] = "dcwhite_cpd_burnitdown";
    level.scr_sound["flare_guy"]["dcwhite_ar1_huah"] = "dcwhite_ar1_huah";
    level.scr_face["flare_guy"]["dcwhite_ar1_huah"] = %dcwhite_ar1_huah;
    level.scr_sound["foley"]["dcemp_fly_timeisright"] = "dcemp_fly_timeisright";
    level.scr_face["foley"]["dcemp_fly_timeisright"] = %dcemp_fly_timeisright;
}
#using_animtree("script_model");

_id_CC1A()
{
    level.scr_animtree["rope"] = #animtree;
    level.scr_model["rope"] = "rappelrope100_ri";
    level.scr_anim["rope"]["rappel_stand_idle_1"][0] = %launchfacility_a_rappel_idle_1_100ft_rope;
    level.scr_anim["rope"]["rappel_stand_idle_2"][0] = %launchfacility_a_rappel_idle_2_100ft_rope;
    level.scr_anim["rope"]["rappel_stand_idle_3"][0] = %launchfacility_a_rappel_idle_3_100ft_rope;
    level.scr_anim["rope"]["rappel_drop"] = %launchfacility_a_rappel_1_100ft_rope;
    level.scr_animtree["painting"] = #animtree;
    level.scr_model["painting"] = "picture_frame_07_animated";
    level.scr_anim["painting"]["oval_office"] = %h2_dcemp_wh_radio_painting;
    level.scr_animtree["door"] = #animtree;
    level.scr_model["door"] = "h2_wh_oval_office_secret_door_anim";
    level.scr_anim["door"]["oval_office"] = %h2_dcemp_wh_radio_door;
    level.scr_animtree["chandelier"] = #animtree;
    level.scr_model["chandelier"] = "h2_light_chandelier_vintage_04_on";
    level.scr_anim["chandelier"]["swing"] = %h2_wh_lobby_chandelier_hit;
    level.scr_anim["chandelier"]["idle"] = %h2_wh_lobby_chandelier_idle;
    level.scr_anim["chandelier"]["swing_fall"] = %h2_wh_lobby_chandelier_grenade_hit;
    level.scr_anim["chandelier"]["idle_fall"] = %h2_wh_lobby_chandelier_grenade_idle;
    level.scr_animtree["pan"] = #animtree;
    level.scr_model["pan"] = "h2_com_pan_metal_animated";
    level.scr_anim["pan"]["pan_metal_idle"][0] = %h2_com_pan_metal_animated;
    level.scr_model["pan"] = "h2_com_pan_copper_animated";
    level.scr_anim["pan"]["pan_copper_idle"][0] = %h2_com_pan_copper_animated;
    level.scr_animtree["lantern"] = #animtree;
    level.scr_model["lantern"] = "h2_dcb_lamp_ceiling_animate";
    level.scr_anim["lantern"]["idle"][0] = %h2_dcb_lamp_ceiling_idle;
}

_id_D14F()
{
    level.scr_animtree["tunnel_door"] = #animtree;
    level.scr_model["tunnel_door"] = "tag_origin";
    level.scr_anim["tunnel_door"]["DCemp_door_sequence"] = %dcemp_door_sequence_door;
}

_id_AC3C()
{
    level.scr_animtree["h2_chains_alone_03_animated"] = #animtree;
    level.scr_model["h2_chains_alone_03_animated"] = "h2_chains_alone_03_animated";
    level.scr_anim["h2_chains_alone_03_animated"]["idle"][0] = %h2_chains_03_alone_animated;
    level.scr_animtree["h2_wh_tunnel_hanging_lamp"] = #animtree;
    level.scr_model["h2_wh_tunnel_hanging_lamp"] = "h2_wh_tunnel_hanging_lamp";
    level.scr_anim["h2_wh_tunnel_hanging_lamp"]["idle"][0] = %h2_wh_tunnel_hanging_lamp_idle;
    level.scr_animtree["h2_wh_neon_attached_animated"] = #animtree;
    level.scr_model["h2_wh_neon_attached_animated"] = "h2_wh_neon_attached_animated";
    level.scr_anim["h2_wh_neon_attached_animated"]["idle"][0] = %h2_wh_neon_attached;
}
#using_animtree("player");

player_animations()
{
    level.scr_animtree["flare_rig"] = #animtree;
    level.scr_model["flare_rig"] = "h2_gfl_ump9_viewhands_player";
    level.scr_anim["flare_rig"]["flare"] = %dcemp_player_flare_wave;
    maps\_anim::addnotetrack_flag( "flare_rig", "fx", "flare_start_fx", "flare" );
    maps\_anim::addnotetrack_flag( "flare_rig", "fx", "whitehouse_hammerdown_jets_safe", "flare" );
    level.scr_animtree["iss_rig"] = #animtree;
    level.scr_model["iss_rig"] = "viewhands_player_iss";
    level.scr_anim["iss_rig"]["ISS_animation"] = %iss_player_rotate;
    level.scr_anim["iss_rig"]["ISS_float_away"] = %iss_player_float_away;
    level.scr_animtree["worldhands"] = #animtree;
    level.scr_model["worldhands"] = "h2_gfl_ump9_viewhands_player";
    level.scr_anim["worldhands"]["player_turret_in"] = %h2_dcwhitehouse_turret_player_in;
    level.scr_anim["worldhands"]["player_turret_out"] = %h2_dcwhitehouse_turret_player_out;
    level.scr_anim["worldhands"]["player_turret_idle"][0] = %h2_dcwhitehouse_turret_player_idle;
    level.scr_anim["worldhands"]["player_turret_fire"][0] = %h2_dcwhitehouse_turret_player_fire;
}
#using_animtree("door");

_id_CF4F()
{
    level.scr_animtree["door"] = #animtree;
    level.scr_model["door"] = "com_door_01_handleleft2";
    level.scr_anim["door"]["shotgunbreach_door_immediate"] = %shotgunbreach_door_immediate;
}
