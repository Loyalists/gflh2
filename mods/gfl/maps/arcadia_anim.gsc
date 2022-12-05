// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    generic_human();
    player_anims();
    vehicles();
    script_model();
    dialog();
}
#using_animtree("generic_human");

generic_human()
{
    level.scr_anim["zpu_gunner"]["fire_a"][0] = %zpu_gunner_fire_a;
    level.scr_anim["zpu_gunner"]["fire_b"][0] = %zpu_gunner_fire_b;
    level.scr_anim["zpu_gunner"]["gunnerdeath"] = %zpu_gunner_deathslouch;
    level.scr_anim["zpu_gunner"]["death_idle"][0] = %zpu_gunner_deathslouchidle;
    level.scr_anim["zpu_gunner"]["dismount"] = %zpu_gunner_dismount;
    level.scr_anim["fridge_guy"]["fridge_idle"][0] = %arcadia_fridge_idle;
    level.scr_anim["fridge_guy"]["fridge_react"] = %arcadia_fridge_react;
    maps\_anim::addnotetrack_customfunction( "fridge_guy", "refrig_react_foley", maps\arcadia_aud::_id_CD6A, "fridge_react" );
    level.scr_anim["panicroom_enemy"]["ending_pose"] = %arcadia_ending_scenea_enemy2_death_pose;
    level.scr_anim["panicroom_hvi"]["ending_pose"] = %arcadia_ending_scenea_dead_civilian;
    level.scr_anim["generic"]["patrol_walk"] = %patrol_bored_patrolwalk;
    level.scr_anim["generic"]["patrol_walk_twitch"] = %patrol_bored_patrolwalk_twitch;
    level.scr_anim["generic"]["patrol_stop"] = %patrol_bored_walk_2_bored;
    level.scr_anim["generic"]["patrol_start"] = %patrol_bored_2_walk;
    level.scr_anim["generic"]["patrol_turn180"] = %patrol_bored_2_walk_180turn;
    level.scr_anim["panicroom_hvi"]["h2_briefcase_pickup"] = %h2_arcadia_deadciv_fall;
    level.scr_anim["dunn"]["panicroom_dunn_intro"] = %h2_arcadia_panicroom_dunn_part1;
    level.scr_anim["dunn"]["panicroom_dunn_idle"][0] = %h2_arcadia_panicroom_dunn_idle;
    level.scr_anim["dunn"]["panicroom_dunn_outro"] = %h2_arcadia_panicroom_dunn_part2;
    maps\_anim::addnotetrack_dialogue( "dunn", "dialog", "panicroom_dunn_outro", "arcadia_cpd_checkouttats" );
    maps\_anim::addnotetrack_dialogue( "dunn", "dialog", "panicroom_dunn_outro", "arcadia_cpd_huah" );
    maps\_anim::addnotetrack_attach( "dunn", "attach_camera", "electronics_camera_pointandshoot_animated", "TAG_INHAND", "panicroom_dunn_outro" );
    level.scr_anim["foley"]["panicroom_foley_intro"] = %h2_arcadia_panicroom_foley_part1;
    maps\_anim::addnotetrack_dialogue( "foley", "dialog", "panicroom_foley_intro", "arcadia_fly_icepick2" );
    maps\_anim::addnotetrack_dialogue( "foley", "dialog", "panicroom_foley_intro", "arcadia_fly_notright" );
    level.scr_anim["foley"]["panicroom_foley_intro_idle"][0] = %h2_arcadia_panicroom_foley_earlyidle;
    level.scr_anim["foley"]["panicroom_foley_intro_walk"] = %h2_arcadia_panicroom_foley_part1_5;
    level.scr_anim["foley"]["panicroom_foley_panicroom"] = %h2_arcadia_panicroom_foley_hallway;
    maps\_anim::addnotetrack_dialogue( "foley", "dialog", "panicroom_foley_panicroom", "arcadia_fly_nosign" );
    maps\_anim::addnotetrack_dialogue( "foley", "dialog", "panicroom_foley_panicroom", "arcadia_fly_getthatbriefcase" );
    level.scr_anim["foley"]["panicroom_foley_idle"][0] = %h2_arcadia_panicroom_foley_idle;
    level.scr_anim["foley"]["panicroom_foley_outro"] = %h2_arcadia_panicroom_foley_part2;
    maps\_anim::addnotetrack_dialogue( "foley", "dialog", "panicroom_foley_outro", "arcadia_fly_photosforg2" );
    maps\_anim::addnotetrack_dialogue( "foley", "dialog", "panicroom_foley_outro", "arcadia_fly_notgoingtolike" );
    maps\_anim::addnotetrack_dialogue( "foley", "dialog", "panicroom_foley_outro", "arcadia_fly_overlordhvi" );
    maps\_anim::addnotetrack_flag( "foley", "stop level", "end_dialog_done", "panicroom_foley_outro" );
    level.scr_anim["generic"]["panicroom_viktor_turnhead"] = %h2_arcadia_panicroom_viktor_headturn;
}
#using_animtree("player");

player_anims()
{
    level.scr_animtree["worldbody"] = #animtree;
    level.scr_model["worldbody"] = "h2_gfl_ump9_viewbody";
    level.scr_anim["worldbody"]["h2_briefcase_pickup"] = %h2_arcadia_ending_player;
    level.scr_model["carry_sentry_player"] = "h2_gfl_ump9_viewhands_player";
}
#using_animtree("vehicles");

vehicles()
{
    level.scr_animtree["zpu_turret"] = #animtree;
    level.scr_model["zpu_turret"] = "vehicle_zpu4";
    level.scr_anim["zpu_turret"]["fire_a"][0] = %zpu_gun_fire_a;
    level.scr_anim["zpu_turret"]["fire_b"][0] = %zpu_gun_fire_b;
    level.scr_anim["zpu_turret"]["idle"] = %zpu_gun_stop;
    level.scr_anim["blackhawk_death_additive"]["hit_rear"] = %mi17_heli_hitreact_rear;
    maps\_anim::addnotetrack_customfunction( "zpu_turret", "fire_1", maps\arcadia_code::_id_B40A );
    maps\_anim::addnotetrack_customfunction( "zpu_turret", "fire_2", maps\arcadia_code::_id_C2F7 );
}
#using_animtree("script_model");

script_model()
{
    level.scr_animtree["distant_parachute_left"] = #animtree;
    level.scr_model["distant_parachute_left"] = "parachute_deploy";
    level.scr_anim["distant_parachute_left"]["drop1"] = %paratrooper_jump_lefta_chute;
    level.scr_anim["distant_parachute_left"]["drop2"] = %paratrooper_jump_leftb_chute;
    level.scr_animtree["distant_parachute_right"] = #animtree;
    level.scr_model["distant_parachute_right"] = "parachute_deploy";
    level.scr_anim["distant_parachute_right"]["drop1"] = %paratrooper_jump_righta_chute;
    level.scr_anim["distant_parachute_right"]["drop2"] = %paratrooper_jump_rightb_chute;
    level.scr_animtree["distant_parachute_left_guy"] = #animtree;
    level.scr_animtree["distant_parachute_right_guy"] = #animtree;
    level.scr_anim["distant_parachute_left_guy"]["drop1"] = %paratrooper_jump_lefta_guy;
    level.scr_anim["distant_parachute_left_guy"]["drop2"] = %paratrooper_jump_leftb_guy;
    level.scr_anim["distant_parachute_right_guy"]["drop1"] = %paratrooper_jump_righta_guy;
    level.scr_anim["distant_parachute_right_guy"]["drop2"] = %paratrooper_jump_rightb_guy;
    level.scr_animtree["fridge"] = #animtree;
    level.scr_anim["fridge"]["fridge_idle"][0] = %arcadia_fridge_idle_fridgerig;
    level.scr_anim["fridge"]["fridge_react"] = %arcadia_fridge_react_fridgerig;
    maps\_anim::addnotetrack_customfunction( "fridge", "refrig_idle_foley", maps\arcadia_aud::_id_CDB7, "fridge_idle" );
    maps\_anim::addnotetrack_customfunction( "fridge", "refrig_bump_into", maps\arcadia_aud::_id_D2D4, "fridge_react" );
    level.scr_animtree["briefcase"] = #animtree;
    level.scr_anim["briefcase"]["h2_briefcase_pickup"] = %h2_arcadia_briefcase;
    level.scr_animtree["crashed_plane_wires"] = #animtree;
    level.scr_anim["crashed_plane_wires"]["idle"][0] = %h2_ch_bunker_wires_02_idle;
    level.scr_animtree["horizontal_lights"] = #animtree;
    level.scr_anim["horizontal_lights"]["idle"][0] = %h2_arc_hanging_lights;
    level.scr_animtree["signs"] = #animtree;
    level.scr_anim["signs"]["office_sign_idle"][0] = %h2_arc_sign_office_idle;
    level.scr_anim["signs"]["bx_sign_idle"][0] = %h2_sign_realstate_inescrow;
    level.scr_anim["signs"]["security_sign_idle"][0] = %h2_arc_sign_security_idle;
    level.scr_animtree["chandelier"] = #animtree;
    level.scr_anim["chandelier"]["idle"][0] = %h2_arcadia_chandelier_vintage_idle;
}

dialog()
{
    level.scr_sound["foley"]["arcadia_fly_heavylosses"] = "arcadia_fly_heavylosses";
    level.scr_sound["foley"]["arcadia_fly_destroytriplea"] = "arcadia_fly_destroytriplea";
    level.scr_radio["arcadia_hqr_sitrep"] = "arcadia_hqr_sitrep";
    level.scr_sound["foley"]["arcadia_fly_intoarcadia"] = "arcadia_fly_intoarcadia";
    level.scr_radio["arcadia_hqr_neworders"] = "arcadia_hqr_neworders";
    level.scr_sound["foley"]["arcadia_fly_solidcopy"] = "arcadia_fly_solidcopy";
    level.scr_radio["arcadia_hqr_divertto4677"] = "arcadia_hqr_divertto4677";
    level.scr_sound["foley"]["arcadia_fly_divertto4677"] = "arcadia_fly_divertto4677";
    level.scr_radio["arcadia_hqr_checkback"] = "arcadia_hqr_checkback";
    level.scr_sound["generic"]["arcadia_ar1_lookac130"] = "arcadia_ar1_lookac130";
    level.scr_sound["generic"]["arcadia_ar2_dontfly"] = "arcadia_ar2_dontfly";
    level.scr_sound["generic"]["arcadia_ar1_suckstobethem"] = "arcadia_ar1_suckstobethem";
    level.scr_sound["generic"]["arcadia_ar2_huah"] = "arcadia_ar2_huah";
    level.scr_radio["arcadia_str_wehavelock"] = "arcadia_str_wehavelock";
    level.scr_radio["arcadia_str_engaging"] = "arcadia_str_engaging";
    level.scr_radio["arcadia_str_attacking"] = "arcadia_str_attacking";
    level.scr_radio["arcadia_str_solidcopyeng"] = "arcadia_str_solidcopyeng";
    level.scr_radio["arcadia_str_havealock"] = "arcadia_str_havealock";
    level.scr_radio["arcadia_str_badgeronecopies"] = "arcadia_str_badgeronecopies";
    level.scr_radio["arcadia_str_attackingvehicle"] = "arcadia_str_attackingvehicle";
    level.scr_radio["arcadia_str_engchopper"] = "arcadia_str_engchopper";
    level.scr_radio["arcadia_str_engaginginfantry"] = "arcadia_str_engaginginfantry";
    level.scr_radio["arcadia_str_engagingvehicle"] = "arcadia_str_engagingvehicle";
    level.scr_radio["arcadia_str_apartmentoffice"] = "arcadia_str_apartmentoffice";
    level.scr_radio["arcadia_str_securitystation"] = "arcadia_str_securitystation";
    level.scr_radio["arcadia_str_checkpoint"] = "arcadia_str_checkpoint";
    level.scr_radio["arcadia_str_engyellowhouse"] = "arcadia_str_engyellowhouse";
    level.scr_radio["arcadia_str_targgreyhouse"] = "arcadia_str_targgreyhouse";
    level.scr_radio["arcadia_str_engfiretruck"] = "arcadia_str_engfiretruck";
    level.scr_radio["arcadia_str_confpolicecar"] = "arcadia_str_confpolicecar";
    level.scr_radio["arcadia_str_targdestroyed"] = "arcadia_str_targdestroyed";
    level.scr_radio["arcadia_str_areasuppressed"] = "arcadia_str_areasuppressed";
    level.scr_radio["arcadia_str_tasuppressed"] = "arcadia_str_tasuppressed";
    level.scr_radio["arcadia_str_uhnegative"] = "arcadia_str_uhnegative";
    level.scr_radio["arcadia_str_invalidtarget"] = "arcadia_str_invalidtarget";
    level.scr_radio["arcadia_str_outtarange"] = "arcadia_str_outtarange";
    level.scr_radio["arcadia_str_outofrange"] = "arcadia_str_outofrange";
    level.scr_radio["arcadia_str_wererollin"] = "arcadia_str_wererollin";
    level.scr_radio["arcadia_str_standclear"] = "arcadia_str_standclear";
    level.scr_radio["arcadia_str_oscarmike"] = "arcadia_str_oscarmike";
    level.scr_radio["arcadia_str_holdingposition"] = "arcadia_str_holdingposition";
    level.scr_sound["foley"]["arcadia_fly_yellowhouse"] = "arcadia_fly_yellowhouse";
    level.scr_sound["dunn"]["arcadia_cpd_greyhouse"] = "arcadia_cpd_greyhouse";
    level.scr_sound["foley"]["arcadia_fly_greyhouse"] = "arcadia_fly_greyhouse";
    level.scr_sound["foley"]["arcadia_fly_suppressingfire"] = "arcadia_fly_suppressingfire";
    level.scr_sound["foley"]["arcadia_fly_suppressingfire"] = "arcadia_fly_suppressingfire";
    level.scr_sound["dunn"]["arcadia_cpd_apartments"] = "arcadia_cpd_apartments";
    level.scr_sound["foley"]["arcadia_fly_apartments"] = "arcadia_fly_apartments";
    level.scr_sound["foley"]["arcadia_fly_usedesignator"] = "arcadia_fly_usedesignator";
    level.scr_sound["foley"]["arcadia_fly_painttargets"] = "arcadia_fly_painttargets";
    level.scr_radio["arcadia_str_lasetarget"] = "arcadia_str_lasetarget";
    level.scr_radio["arcadia_str_standingby"] = "arcadia_str_standingby";
    level.scr_radio["arcadia_str_painttarget"] = "arcadia_str_painttarget";
    level.scr_radio["arcadia_str_thanks"] = "arcadia_str_thanks";
    level.scr_radio["arcadia_str_nicework"] = "arcadia_str_nicework";
    level.scr_sound["foley"]["arcadia_fly_everyoneup"] = "arcadia_fly_everyoneup";
    level.scr_sound["foley"]["arcadia_fly_moveup"] = "arcadia_fly_moveup";
    level.scr_sound["dunn"]["arcadia_cpd_moveup"] = "arcadia_cpd_moveup";
    level.scr_sound["dunn"]["arcadia_cpd_letsgo"] = "arcadia_cpd_letsgo";
    level.scr_sound["foley"]["arcadia_fly_lostbadgerone"] = "arcadia_fly_lostbadgerone";
    level.scr_sound["foley"]["arcadia_fly_offstreets"] = "arcadia_fly_offstreets";
    level.scr_sound["foley"]["arcadia_fly_flankthruhouses"] = "arcadia_fly_flankthruhouses";
    level.scr_sound["foley"]["arcadia_fly_movethruhouses"] = "arcadia_fly_movethruhouses";
    level.scr_sound["foley"]["arcadia_fly_getoffstreets"] = "arcadia_fly_getoffstreets";
    level.scr_sound["foley"]["arcadia_fly_outtastreets"] = "arcadia_fly_outtastreets";
    level.scr_sound["foley"]["arcadia_fly_sentryguns"] = "arcadia_fly_sentryguns";
    level.scr_sound["foley"]["arcadia_fly_takeoutsgun"] = "arcadia_fly_takeoutsgun";
    level.scr_radio["arcadia_str_rpgfire"] = "arcadia_str_rpgfire";
    level.scr_sound["foley"]["arcadia_fly_wereonit"] = "arcadia_fly_wereonit";
    level.scr_sound["foley"]["arcadia_fly_protectstryker"] = "arcadia_fly_protectstryker";
    level.scr_sound["foley"]["arcadia_fly_watchforrpgs"] = "arcadia_fly_watchforrpgs";
    level.scr_sound["foley"]["arcadia_fly_laserdes"] = "arcadia_fly_laserdes";
    level.scr_sound["foley"]["arcadia_fly_callartillery"] = "arcadia_fly_callartillery";
    level.scr_radio["arcadia_art_missionrec"] = "arcadia_art_missionrec";
    level.scr_radio["arcadia_art_confirmed"] = "arcadia_art_confirmed";
    level.scr_sound["foley"]["arcadia_fly_getrunover"] = "arcadia_fly_getrunover";
    level.scr_sound["dunn"]["arcadia_cpd_getoutta"] = "arcadia_cpd_getoutta";
    level.scr_sound["foley"]["arcadia_fly_headingto4677"] = "arcadia_fly_headingto4677";
    level.scr_sound["foley"]["arcadia_fly_lookingfor"] = "arcadia_fly_lookingfor";
    level.scr_radio["arcadia_shp_genshep"] = "arcadia_shp_genshep";
    level.scr_radio["arcadia_shp_panicroom"] = "arcadia_shp_panicroom";
    level.scr_sound["foley"]["arcadia_fly_yessir"] = "arcadia_fly_yessir";
    level.scr_radio["arcadia_shp_phoenix"] = "arcadia_shp_phoenix";
    level.scr_radio["arcadia_shp_reportback"] = "arcadia_shp_reportback";
    level.scr_sound["foley"]["arcadia_fly_heardtheman"] = "arcadia_fly_heardtheman";
    level.scr_sound["foley"]["arcadia_fly_icepick1"] = "arcadia_fly_icepick1";
    level.scr_sound["foley"]["arcadia_fly_icepick2"] = "arcadia_fly_icepick2";
    level.scr_sound["foley"]["arcadia_fly_notright"] = "arcadia_fly_notright";
    level.scr_sound["foley"]["arcadia_fly_nosign"] = "arcadia_fly_nosign";
    level.scr_sound["foley"]["arcadia_fly_getthatbriefcase"] = "arcadia_fly_getthatbriefcase";
    level.scr_sound["dunn"]["arcadia_cpd_checkouttats"] = "arcadia_cpd_checkouttats";
    level.scr_sound["foley"]["arcadia_fly_photosforg2"] = "arcadia_fly_photosforg2";
    level.scr_sound["dunn"]["arcadia_cpd_huah"] = "arcadia_cpd_huah";
    level.scr_sound["foley"]["arcadia_fly_notgoingtolike"] = "arcadia_fly_notgoingtolike";
    level.scr_sound["foley"]["arcadia_fly_overlordhvi"] = "arcadia_fly_overlordhvi";
}
