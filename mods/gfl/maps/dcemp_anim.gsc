// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    thread setup_exploder_anim();
    script_model_anim();
    generic_human();
    _id_D23E();
    _id_B3FD();
    _id_AEB8();
    _id_BDBA();
    _id_CC1A();
    player_animations();
    _id_CF4F();
    _id_D14F();
    _id_D449();
}
#using_animtree("generic_human");

generic_human()
{
    level.scr_anim["generic"]["stand_exposed_wave_halt"] = %stand_exposed_wave_halt;
    level.scr_anim["generic"]["stand_exposed_wave_halt_v2"] = %stand_exposed_wave_halt_v2;
    level.scr_anim["generic"]["stand_exposed_wave_on_me"] = %stand_exposed_wave_on_me;
    level.scr_anim["generic"]["stand_exposed_wave_on_me_v2"] = %stand_exposed_wave_on_me_v2;
    level.scr_anim["generic"]["stand_exposed_wave_move_up"] = %stand_exposed_wave_move_up;
    level.scr_anim["generic"]["stand_exposed_wave_move_out"] = %stand_exposed_wave_move_out;
    level.scr_anim["generic"]["stand_exposed_wave_target_spotted"] = %stand_exposed_wave_target_spotted;
    level.scr_anim["generic"]["stand_exposed_wave_down"] = %stand_exposed_wave_down;
    level.scr_anim["generic"]["stand_exposed_wave_go"] = %stand_exposed_wave_go;
    level.scr_anim["generic"]["CornerStndR_alert_signal_enemy_spotted"] = %cornerstndr_alert_signal_enemy_spotted;
    level.scr_anim["generic"]["CornerStndR_alert_signal_move_out"] = %cornerstndr_alert_signal_move_out;
    level.scr_anim["generic"]["CornerStndR_alert_signal_on_me"] = %cornerstndr_alert_signal_on_me;
    level.scr_anim["generic"]["CornerStndR_alert_signal_stopStay_down"] = %cornerstndr_alert_signal_stopstay_down;
    level.scr_anim["generic"]["oilrig_sub_A_idle_1"] = %oilrig_sub_a_idle_1;
    level.scr_anim["generic"]["bulletshield_pain_short"] = %stand_exposed_extendedpain_chest;
    level.scr_anim["generic"]["CornerCrR_trans_IN_L"] = %cornercrr_trans_in_l;
    level.scr_anim["generic"]["corner_standR_trans_CQB_IN_2"] = %corner_standr_trans_cqb_in_2;
    level.scr_anim["generic"]["CornerCrL_alert_2_stand"] = %cornercrl_alert_2_stand;
    level.scr_anim["generic"]["exposed_tracking_turn135R"] = %exposed_tracking_turn135r;
    level.scr_anim["generic"]["dcemp_BHrescue_soldier"] = %h2_dcemp_bhrescue_soldier;
    level.scr_anim["generic"]["corner_standR_trans_IN_3"] = %corner_standr_trans_in_3;
    level.scr_anim["generic"]["corner_standR_trans_CQB_IN_3"] = %corner_standr_trans_cqb_in_3;
    level.scr_anim["generic"]["DCemp_react_guyB_react"] = %h2_emp_react_guyb_react;
    level.scr_anim["generic"]["DCemp_react_guyA_react"] = %h2_emp_react_guya_react;
    level.scr_anim["generic"]["corner_standR_painC"] = %corner_standr_painc;
    level.scr_anim["generic"]["corner_standR_look_idle"][0] = %corner_standr_look_idle;
    level.scr_anim["generic"]["corner_standR_alert_2_look"] = %corner_standr_alert_2_look;
    level.scr_anim["generic"]["corner_standR_look_2_alert_fast"] = %corner_standr_look_2_alert_fast;
    level.scr_anim["generic"]["corner_standR_look_2_alert"] = %corner_standr_look_2_alert;
    level.scr_anim["generic"]["CornerCrR_alert_painA"] = %cornercrr_alert_paina;
    level.scr_anim["generic"]["CornerCrR_look_idle"][0] = %cornercrr_look_idle;
    level.scr_anim["generic"]["CornerCrR_alert_2_look"] = %cornercrr_alert_2_look;
    level.scr_anim["generic"]["CornerCrR_look_2_alert_fast"] = %cornercrr_look_2_alert_fast;
    level.scr_anim["generic"]["CornerCrR_look_2_alert"] = %cornercrr_look_2_alert;
    level.scr_anim["marine1"]["dcemp_BHrescue"] = %h2_dcemp_bhrescue_soldier;
    level.scr_anim["foley"]["safe_zone_in"] = %h2_dcemp_fallingdebris_foley;
    maps\_anim::addnotetrack_dialogue( "foley", "dialog", "safe_zone_in", "dcemp_fly_gogo" );
    level.scr_anim["foley"]["safe_zone_idle"][0] = %h2_dcemp_fallingdebris_foley_idle;
    level.scr_anim["foley"]["safe_zone_out"] = %h2_dcemp_fallingdebris_foley_out;
    maps\_anim::addnotetrack_dialogue( "foley", "dialog", "safe_zone_out", "dcemp_fly_getagrip" );
    maps\_anim::addnotetrack_dialogue( "foley", "dialog", "safe_zone_out", "dcemp_fly_stayhere" );
    maps\_anim::addnotetrack_dialogue( "foley", "dialog", "safe_zone_out", "dcemp_fly_wartofight" );
    maps\_anim::addnotetrack_flag( "foley", "Heli_explosion", "street_crash_heli_hide", "safe_zone_out" );
    maps\_anim::addnotetrack_flag( "foley", "Engine_explo", "corner_engine_crash", "safe_zone_out" );
    maps\_anim::addnotetrack_customfunction( "foley", "Engine_explo_VFX", maps\dcemp_code::h2_corner_plane_crash_fx, "safe_zone_out" );
    maps\_anim::addnotetrack_customfunction( "foley", "Engine_explo_sound", maps\dcemp_code::h2_corner_plane_crash_sound, "safe_zone_out" );
    maps\_anim::addnotetrack_customfunction( "foley", "Engine_explo_rumble", maps\dcemp_code::h2_corner_plane_crash_rumble, "safe_zone_out" );
    maps\_anim::addnotetrack_customfunction( "foley", "open_door_start", maps\dcemp_code::_id_B5C1, "safe_zone_out", "scn_corner_foley_door_slow_open" );
    level.scr_anim["dunn"]["safe_zone_in"] = %h2_dcemp_fallingdebris_dunn;
    level.scr_anim["dunn"]["safe_zone_idle"][0] = %h2_dcemp_fallingdebris_dunn_idle;
    level.scr_anim["dunn"]["safe_zone_out"] = %h2_dcemp_fallingdebris_dunn_out;
    maps\_anim::addnotetrack_dialogue( "dunn", "dialog", "safe_zone_out", "dcemp_cpd_wearetotally" );
    maps\_anim::addnotetrack_dialogue( "dunn", "dialog", "safe_zone_out", "dcemp_cpd_younuts" );
    level.scr_anim["marine1"]["safe_zone_in"] = %h2_dcemp_fallingdebris_sandler;
    level.scr_anim["marine1"]["safe_zone_idle"][0] = %h2_dcemp_fallingdebris_sandler_idle;
    level.scr_anim["marine1"]["safe_zone_out"] = %h2_dcemp_fallingdebris_sandler_out;
    level.scr_anim["marine2"]["safe_zone_in"] = %h2_dcemp_fallingdebris_mccord;
    level.scr_anim["marine2"]["safe_zone_idle"][0] = %h2_dcemp_fallingdebris_mccord_idle;
    level.scr_anim["marine2"]["safe_zone_out"] = %h2_dcemp_fallingdebris_mccord_out;
    level.scr_anim["marine3"]["safe_zone_in"] = %h2_dcemp_fallingdebris_soldier;
    level.scr_anim["marine3"]["safe_zone_idle"][0] = %h2_dcemp_fallingdebris_soldier_idle;
    level.scr_anim["marine3"]["safe_zone_out"] = %h2_dcemp_fallingdebris_soldier_out;
    level.scr_anim["generic"]["CornerCrR_trans_OUT_F"] = %cornercrr_trans_out_f;
    level.scr_anim["generic"]["corner_standR_trans_OUT_6"] = %corner_standr_trans_out_6;
    level.scr_anim["generic"]["traverse_jumpdown_96"] = %traverse_jumpdown_96;
    level.scr_anim["generic"]["cornerCrR_alert_2_stand"] = %cornercrr_alert_2_stand;
    level.scr_anim["generic"]["street_flare_throw"] = %grenade_return_standing_throw_overhand_forward;
    maps\_anim::addnotetrack_customfunction( "generic", "grenade_right", ::_id_C9BF, "street_flare_throw" );
    maps\_anim::addnotetrack_customfunction( "generic", "grenade_throw", ::_id_CB6A, "street_flare_throw" );
    thread sound_street_flare_throw();
    level.scr_anim["generic"]["exposed_idle_reactB"] = %exposed_idle_reactb;
    level.scr_anim["generic"]["exposed_flashbang_v1"] = %exposed_flashbang_v1;
    level.scr_anim["generic"]["exposed_flashbang_v4"] = %exposed_flashbang_v4;
    level.scr_anim["generic"]["run_reaction_R_quick"] = %run_reaction_r_quick;
    level.scr_anim["generic"]["run_reaction_L_quick"] = %run_reaction_l_quick;
    level.scr_anim["generic"]["run_turn_R45"] = %run_turn_r45;
    level.scr_anim["generic"]["run_turn_L45"] = %run_turn_l45;
    level.scr_anim["generic"]["run_turn_R90"] = %run_turn_r90;
    level.scr_anim["generic"]["run_turn_L90"] = %run_turn_l90;
    level.scr_anim["generic"]["crouch_2run_F"] = %crouch_2run_f;
    level.scr_anim["generic"]["crouch_2run_R"] = %crouch_2run_r;
    level.scr_anim["generic"]["crouch_2run_L"] = %crouch_2run_l;
    level.scr_anim["generic"]["stand_2_run_F_2"] = %stand_2_run_f_2;
    level.scr_anim["generic"]["stand_2_run_R"] = %stand_2_run_r;
    level.scr_anim["generic"]["stand_2_run_L"] = %stand_2_run_l;
    level.scr_anim["generic"]["jump_across_100_lunge"] = %jump_across_100_lunge;
    level.scr_anim["generic"]["jump_across_100_spring"] = %jump_across_100_spring;
    level.scr_anim["generic"]["jump_across_100_stumble"] = %jump_across_100_stumble;
    level.scr_anim["generic"]["run_react_stumble_non_loop"] = %run_react_stumble_non_loop;
    level.scr_anim["generic"]["run_react_flinch_non_loop"] = %run_react_flinch_non_loop;
    level.scr_anim["generic"]["run_react_duck_non_loop"] = %run_react_duck_non_loop;
    level.scr_anim["generic"]["run_pain_fallonknee"] = %run_pain_fallonknee;
    level.scr_anim["generic"]["run_pain_fallonknee_02"] = %run_pain_fallonknee_02;
    level.scr_anim["generic"]["run_pain_fallonknee_03"] = %run_pain_fallonknee_03;
    level.scr_anim["generic"]["slide_across_car"] = %slide_across_car;
    level.scr_anim["generic"]["gulag_sewer_slide"] = %gulag_sewer_slide;
    level.scr_anim["generic"]["fastrope_fall"] = %fastrope_fall;
    level.scr_anim["generic"]["traverse_window_M_2_dive"] = %traverse_window_m_2_dive;
    level.scr_anim["generic"]["exposed_flashbang_v1"] = %exposed_flashbang_v1;
    level.scr_anim["generic"]["exposed_flashbang_v2"] = %exposed_flashbang_v2;
    level.scr_anim["generic"]["exposed_flashbang_v3"] = %exposed_flashbang_v3;
    level.scr_anim["generic"]["exposed_flashbang_v4"] = %exposed_flashbang_v4;
    level.scr_anim["generic"]["exposed_flashbang_v5"] = %exposed_flashbang_v5;
    level.scr_anim["generic"]["cqb_stand_signal_move_out"] = %cqb_stand_signal_move_out;
    level.scr_anim["generic"]["cqb_stop_8_signal"] = %cqb_stop_2_signal;
    level.scr_anim["generic"]["bog_b_spotter_react"] = %bog_b_spotter_react;
    level.scr_anim["generic"]["favela_run_and_wave"] = %favela_run_and_wave;
    level.scr_anim["generic"]["corner_standR_explosion_divedown"] = %corner_standr_explosion_divedown;
    level.scr_anim["generic"]["corner_standR_explosion_standup"] = %corner_standr_explosion_standup;
    level.scr_anim["generic"]["hunted_open_barndoor_flathand"] = %hunted_open_barndoor_flathand;
    level.scr_anim["generic"]["run_reaction_180"] = %run_reaction_180;
    level.scr_anim["generic"]["combatwalk_F_spin"] = %combatwalk_f_spin;
    level.scr_anim["generic"]["patrol_jog_look_up_once"] = %patrol_jog_look_up_once;
    level.scr_anim["generic"]["patrol_jog_360_once"] = %patrol_jog_360_once;
    level.scr_anim["generic"]["patrol_jog_orders_once"] = %patrol_jog_orders_once;
    level.scr_anim["generic"]["CQB_walk_turn_6"] = %cqb_walk_turn_6;
    level.scr_anim["generic"]["CQB_walk_turn_7"] = %cqb_walk_turn_7;
    level.scr_anim["generic"]["CQB_walk_turn_9"] = %cqb_walk_turn_9;
    level.scr_anim["generic"]["casual_killer_jog_stop"] = %casual_killer_jog_stop;
    level.scr_anim["generic"]["casual_killer_jog_start"] = %casual_killer_jog_start;
    level.scr_anim["generic"]["casual_killer_jog"][0] = %casual_killer_jog_a;
    level.scr_anim["generic"]["casual_killer_jog"][1] = %casual_killer_jog_b;
    level.scr_anim["generic"]["combat_jog"] = %combat_jog;
    level.scr_anim["generic"]["scout_sniper_price_wave"] = %scout_sniper_price_wave;
    level.scr_anim["foley"]["hunted_woundedhostage_check"] = %hunted_woundedhostage_check_soldier;
    level.scr_sound["foley"]["hunted_woundedhostage_check"] = "scn_dcemp_check_dead_sgtfoley";
    level.scr_anim["generic"]["casual_killer_jog_A"] = %casual_killer_jog_a;
    level.scr_anim["generic"]["casual_killer_jog_B"] = %casual_killer_jog_b;
    level.scr_anim["generic"]["casual_killer_jog"][0] = %casual_killer_jog_a;
    level.scr_anim["generic"]["casual_killer_jog"][1] = %casual_killer_jog_b;
    level.scr_anim["generic"]["patrol_bored_2_walk"] = %patrol_bored_2_walk;
    level.scr_anim["generic"]["patrol_bored_walk_2_bored"] = %patrol_bored_walk_2_bored;
    level.scr_anim["generic"]["patrol_bored_patrolwalk"] = %patrol_bored_patrolwalk;
    level.scr_anim["generic"]["covercrouch_hide_idle"][0] = %covercrouch_hide_idle;
    level.scr_anim["generic"]["covercrouch_hide_2_stand"] = %covercrouch_hide_2_stand;
    level.scr_anim["generic"]["traverse_window_M_2_stop"] = %traverse_window_m_2_stop;
    level.scr_anim["generic"]["traverse_window_M_2_run"] = %traverse_window_m_2_run;
    level.scr_anim["generic"]["exposed_idle_reactA"] = %exposed_idle_reacta;
    level.scr_anim["generic"]["cqb_stand_react_A"] = %cqb_stand_react_a;
    level.scr_anim["generic"]["cqb_stand_react_B"] = %cqb_stand_react_b;
    level.scr_anim["generic"]["cqb_stand_react_C"] = %cqb_stand_react_c;
    level.scr_anim["generic"]["cqb_stand_react_D"] = %cqb_stand_react_d;
    level.scr_anim["generic"]["cqb_stand_react_E"] = %cqb_stand_react_e;
    level.scr_anim["generic"]["cargoship_open_cargo_guyL"] = %cargoship_open_cargo_guyl;
    level.scr_anim["generic"]["run_2_stand_90R"] = %run_2_stand_90r;
    level.scr_anim["generic"]["run_2_crouch_F"] = %run_2_crouch_f;
    level.scr_anim["generic"]["run_2_crouch_90L"] = %run_2_crouch_90l;
    level.scr_anim["generic"]["run_2_crouch_90R"] = %run_2_crouch_90r;
    level.scr_anim["generic"]["casual_stand_idle_trans_in"] = %casual_stand_idle_trans_in;
    level.scr_anim["generic"]["favela_escape_bigjump_faust"] = %favela_escape_bigjump_faust;
    level.scr_anim["generic"]["freerunnerA_loop"] = %freerunnera_loop;
    level.scr_anim["generic"]["freerunnerB_loop"] = %freerunnerb_loop;
    level.scr_anim["generic"]["unarmed_climb_wall"] = %unarmed_climb_wall;
    level.scr_anim["generic"]["exposed_crouch_2_stand"] = %exposed_crouch_2_stand;
    level.scr_anim["generic"]["coverstand_hide_2_aim"] = %coverstand_hide_2_aim;
    level.scr_anim["generic"]["corner_standR_trans_alert_2_A_v2"] = %corner_standr_trans_alert_2_a_v2;
    level.scr_anim["generic"]["DCemp_run_sequence_runner"] = %dcemp_run_sequence_runner;
    maps\_anim::addnotetrack_customfunction( "generic", "dcemp_ar3_whiskeyhotel_ps", ::_id_ADF4, "DCemp_run_sequence_runner" );
    level.scr_anim["generic"]["DCemp_run_sequence_guy1"] = %dcemp_run_sequence_guy1;
    maps\_anim::addnotetrack_customfunction( "generic", "dcemp_cpd_wheregoin_ps", ::_id_B97A, "DCemp_run_sequence_meetup_dunn" );
    level.scr_anim["runner"]["DCemp_run_sequence"] = %dcemp_run_sequence_runner;
    level.scr_anim["dunn"]["DCemp_run_sequence"] = %dcemp_run_sequence_guy1;
    level.scr_anim["generic"]["DCemp_run_sequence_meetup_dunn"] = %h2_dcemp_run_sequence_dunn;
    level.scr_anim["marine2"]["DCemp_run_sequence_meetup_mccord"] = %h2_dcemp_run_sequence_mccord;
    level.scr_anim["runner"]["h2_DCemp_run_sequence_runner"] = %h2_dcemp_run_sequence_runner_stairs;
    maps\_anim::addnotetrack_customfunction( "runner", "dcemp_ar3_whiskeyhotel_ps", ::_id_ADF4, "DCemp_run_sequence" );
    maps\_anim::addnotetrack_customfunction( "dunn", "dcemp_cpd_wheregoin_ps", ::_id_B97A, "DCemp_run_sequence" );
    level.scr_anim["generic"]["corner_standR_trans_CQB_OUT_8"] = %corner_standr_trans_cqb_out_8;
    level.scr_anim["generic"]["hunted_open_barndoor"] = %hunted_open_barndoor;
    level.scr_anim["generic"]["airport_security_guard_pillar_death_R"] = %airport_security_guard_pillar_death_r;
    level.scr_anim["generic"]["airport_security_guard_pillar_death_L"] = %airport_security_guard_pillar_death_l;
    level.scr_anim["generic"]["breach_kick_kickerR1_enter"] = %breach_kick_kickerr1_enter;
    maps\_anim::addnotetrack_customfunction( "generic", "kick", ::_id_C09B, "breach_kick_kickerR1_enter" );
    level.scr_anim["generic"]["corner_standR_flinchB"] = %corner_standr_flinchb;
    level.scr_anim["generic"]["CQB_stand_grenade_throw"] = %cqb_stand_grenade_throw;
    maps\_anim::addnotetrack_attach( "generic", "grenade_right", "weapon_m84_flashbang_grenade", "TAG_INHAND", "CQB_stand_grenade_throw" );
    maps\_anim::addnotetrack_detach( "generic", "grenade_throw", "weapon_m84_flashbang_grenade", "TAG_INHAND", "CQB_stand_grenade_throw" );
    maps\_anim::addnotetrack_customfunction( "generic", "grenade_throw", ::_id_D4DA, "CQB_stand_grenade_throw" );
    level.scr_anim["generic"]["exposed_tracking_turn180L"] = %exposed_tracking_turn180l;
    level.scr_anim["generic"]["coverstand_hide_idle"][0] = %coverstand_hide_idle;
    level.scr_anim["generic"]["traverse_jumpdown_96"] = %traverse_jumpdown_96;
    level.scr_anim["generic"]["h2_traverse_jumpdown_96_dcemp"] = %h2_traverse_jumpdown_96_dcemp;
    level.scr_anim["generic"]["traverse40"] = %traverse40;
    level.scr_anim["generic"]["death_pose_on_desk"] = %death_pose_on_desk;
    level.scr_anim["generic"]["hunted_woundedhostage_check_soldier_end"] = %hunted_woundedhostage_check_soldier_end;
    level.scr_anim["generic"]["DCemp_wounded_check_end"] = %dcemp_wounded_check_end;
    level.scr_anim["generic"]["DCemp_BTR_moment_climb_guy1"] = %dcemp_btr_moment_climb_guy1;
    level.scr_anim["generic"]["DCemp_BTR_moment_climb_guy2"] = %dcemp_btr_moment_climb_guy2;
    level.scr_anim["generic"]["DCemp_BTR_moment_climb_guy3"] = %dcemp_btr_moment_climb_guy3;
    level.scr_anim["generic"]["DCemp_BTR_moment_idle_guy1"][0] = %dcemp_btr_moment_idle_guy1;
    level.scr_anim["generic"]["DCemp_BTR_moment_idle_guy2"][0] = %dcemp_btr_moment_idle_guy2;
    level.scr_anim["generic"]["DCemp_BTR_moment_idle_guy3"][0] = %dcemp_btr_moment_idle_guy3;
    level.scr_anim["generic"]["DCemp_BTR_moment_guy1"] = %dcemp_btr_moment_guy1;
    level.scr_anim["generic"]["DCemp_BTR_moment_guy2"] = %dcemp_btr_moment_guy2;
    level.scr_anim["generic"]["DCemp_BTR_moment_guy3"] = %dcemp_btr_moment_guy3;
    level.scr_anim["generic"]["CornerStndR_alert_2_lean"] = %cornerstndr_alert_2_lean;
    level.scr_anim["generic"]["CornerCrR_alert_2_lean"] = %cornercrr_alert_2_lean;
    level.scr_anim["generic"]["favela_civ_warning_landing"] = %favela_civ_warning_landing;
    level.scr_anim["generic"]["corner_standR_trans_CQB_OUT_9"] = %corner_standr_trans_cqb_out_9;
    level.scr_anim["generic"]["coverstand_look_moveup"] = %coverstand_look_moveup;
    level.scr_anim["generic"]["coverstand_look_idle"][0] = %coverstand_look_idle;
    level.scr_anim["generic"]["coverstand_look_movedown"] = %coverstand_look_movedown;
    level.scr_anim["generic"]["coverstand_trans_OUT_R"] = %coverstand_trans_out_r;
    level.scr_anim["generic"]["corner_standR_alert_2_look"] = %corner_standr_alert_2_look;
    level.scr_anim["generic"]["corner_standR_look_2_alert"] = %corner_standr_look_2_alert;
    level.scr_anim["generic"]["corner_standR_look_idle"][0] = %corner_standr_look_idle;
    level.scr_anim["generic"]["patrol_bored_react_look_retreat"] = %patrol_bored_react_look_retreat;
    level.scr_anim["generic"]["corner_standR_trans_OUT_9"] = %corner_standr_trans_out_9;
}

_id_AEB8()
{
    level.scr_anim["dunn"]["hunted_woundedhostage_check"] = %hunted_woundedhostage_check_soldier;
    level.scr_sound["dunn"]["hunted_woundedhostage_check"] = "scn_dcemp_check_dead_sgtfoley";
    level.scr_anim["dunn"]["hunted_woundedhostage_check_soldier_end"] = %hunted_woundedhostage_check_soldier_end;
    level.scr_sound["dunn"]["dcemp_cpd_huah3"] = "dcemp_cpd_huah3";
    level.scr_sound["foley"]["dcemp_fly_cutchatter"] = "dcemp_fly_cutchatter";
    level.scr_sound["foley"]["dcemp_fly_fortourists"] = "dcemp_fly_fortourists";
    level.scr_face["foley"]["dcemp_fly_fortourists"] = %dcemp_fly_fortourists;
    level.scr_sound["marine1"]["dcemp_ar1_feetdry"] = "dcemp_ar1_feetdry";
    level.scr_sound["generic"]["dcemp_ar2_letsgo"] = "dcemp_ar2_letsgo";
    level.scr_sound["generic"]["dcemp_ar3_hustleup"] = "dcemp_ar3_hustleup";
    level.scr_sound["generic"]["dcemp_ar3_thisway"] = "dcemp_ar3_thisway";
    level.scr_sound["generic"]["dcemp_ar3_movemove"] = "dcemp_ar3_movemove";
    level.scr_anim["dead_guy"]["hunted_woundedhostage_check"] = %hunted_woundedhostage_check_hostage;
    level.scr_sound["dead_guy"]["hunted_woundedhostage_check"] = "scn_dcemp_check_dead_soldier";
    level.scr_anim["dead_guy"]["hunted_woundedhostage_idle_start"][0] = %hunted_woundedhostage_idle_start;
    level.scr_anim["dead_guy"]["hunted_woundedhostage_idle_end"] = %hunted_woundedhostage_idle_end;
    level.scr_anim["generic"]["death_sitting_pose_v1"] = %death_sitting_pose_v1;
    level.scr_anim["generic"]["tunnel_door_open_guy"] = %cargoship_open_cargo_guyl;
    level.scr_anim["dunn"]["DCemp_door_sequence"] = %h2_dcemp_door_sequence_dunn;
    level.scr_anim["foley"]["DCemp_door_sequence"] = %h2_dcemp_door_sequence_foley;
    maps\_anim::addnotetrack_dialogue( "dunn", "dialog", "DCemp_door_sequence", "dcemp_cpd_westwing" );
    maps\_anim::addnotetrack_dialogue( "foley", "dialog", "DCemp_door_sequence", "dcemp_fly_fortourists" );
    maps\_anim::addnotetrack_dialogue( "dunn", "dialog", "DCemp_door_sequence", "dcemp_cpd_placeishistory" );
    level.scr_anim["generic"]["wave_on"][0] = %coup_civilians_interrogated_guard_wave;
    level.scr_sound["generic"]["gogogo"] = "dcemp_fly_gogogo";
    level.scr_sound["generic"]["keep_moving"] = "dcemp_fly_dontstop";
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
    level.scr_anim["rappel_guy"]["rappel_stand_idle_1"][0] = %launchfacility_a_rappel_idle_1;
    level.scr_anim["rappel_guy"]["rappel_stand_idle_2"][0] = %launchfacility_a_rappel_idle_2;
    level.scr_anim["rappel_guy"]["rappel_stand_idle_3"][0] = %launchfacility_a_rappel_idle_3;
    level.scr_anim["rappel_guy"]["rappel_drop"] = %launchfacility_a_rappel_1;
    level.scr_anim["generic"]["doorburst_wave"] = %doorburst_wave;
    level.scr_anim["generic"]["doorburst_fall"] = %doorburst_fall;
    level.scr_anim["foley"]["flare_moment_stand"] = %flare_moment_stand;
    maps\_anim::addnotetrack_attach( "foley", "attach flare", "mil_emergency_flare", "tag_inhand", "flare_moment_stand" );
    maps\_anim::addnotetrack_customfunction( "foley", "start flare", maps\dcemp_endpart_code::_id_B470, "flare_moment_stand" );
    level.scr_anim["marshall"]["DCemp_whitehouse_briefing"] = %dcemp_whitehouse_briefing_marshall;
    level.scr_anim["foley"]["DCemp_whitehouse_briefing"] = %dcemp_whitehouse_briefing_foley;
    maps\_anim::addnotetrack_dialogue( "foley", "dcemp_fly_situationhere_ps", "DCemp_whitehouse_briefing", "dcemp_fly_situationhere" );
    maps\_anim::addnotetrack_dialogue( "marshall", "dcemp_cml_highground_ps", "DCemp_whitehouse_briefing", "dcemp_cml_highground" );
    maps\_anim::addnotetrack_dialogue( "marshall", "dcemp_cml_retakeit_ps", "DCemp_whitehouse_briefing", "dcemp_cml_retakeit" );
    maps\_anim::addnotetrack_dialogue( "marshall", "dcemp_cml_getyoursquad_ps", "DCemp_whitehouse_briefing", "dcemp_cml_getyoursquad" );
    maps\_anim::addnotetrack_dialogue( "foley", "dcemp_fly_squadoscarmike_ps", "DCemp_whitehouse_briefing", "dcemp_fly_squadoscarmike" );
    maps\_anim::addnotetrack_flag( "marshall", "dcemp_cml_getyoursquad_ps", "whitehouse_moveout", "DCemp_whitehouse_briefing" );
    var_0 = [];
    var_0["death_explosion_up10"] = %death_explosion_up10;
    var_0["death_explosion_left11"] = %death_explosion_left11;
    var_0["death_explosion_stand_B_v2"] = %death_explosion_stand_b_v2;
    level._id_A81B = var_0;
}

_id_D23E()
{
    level.scr_radio["dcemp_iss_requestfeed"] = "dcemp_iss_requestfeed";
    level.scr_radio["dcemp_iss_theywantyou"] = "dcemp_iss_theywantyou";
    level.scr_radio["dcemp_iss_rotateview"] = "dcemp_iss_rotateview";
    level.scr_radio["dcemp_iss_thereitis"] = "dcemp_iss_thereitis";
    level.scr_radio["dcemp_hsc_copythat"] = "dcemp_hsc_copythat";
    level.scr_radio["dcemp_hsc_keeptracking"] = "dcemp_hsc_keeptracking";
    level.scr_radio["dcemp_iss_notscheduled"] = "dcemp_iss_notscheduled";
    level.scr_radio["dcemp_hsc_standby"] = "dcemp_hsc_standby";
    level.scr_radio["dcemp_iss_anyword"] = "dcemp_iss_anyword";
    level.scr_radio["scn_dcemp_iss_helmet_breathe_slow"] = "scn_dcemp_iss_helmet_breathe_slow";
    level.scr_radio["scn_dcemp_iss_helmet_breathe_fast"] = "scn_dcemp_iss_helmet_breathe_fast";
    level.scr_sound["dunn"]["dcemp_cpd_EMP"] = "dcemp_cpd_EMP";
    level.scr_sound["dunn"]["dcemp_cpd_whatsgoinon"] = "dcemp_cpd_whatsgoinon";
    level.scr_sound["foley"]["dcemp_fly_seekshelter"] = "dcemp_fly_seekshelter";
    level.scr_face["foley"]["dcemp_fly_seekshelter"] = %dcemp_fly_seekshelter;
    level.scr_sound["dunn"]["dcemp_cpd_notgood"] = "dcemp_cpd_notgood";
    level.scr_sound["foley"]["dcemp_fly_gogogo"] = "dcemp_fly_gogogo";
    level.scr_sound["foley"]["dcemp_fly_dontstop"] = "dcemp_fly_dontstop";
    level.scr_sound["dunn"]["dcemp_cpd_whoa"] = "dcemp_cpd_whoa";
    level.scr_sound["dunn"]["dcemp_cpd_holy"] = "dcemp_cpd_holy";
    level.scr_sound["foley"]["dcemp_fly_gogo"] = "dcemp_fly_gogo";
    level.scr_sound["marine1"]["dcemp_ar1_whatsgoinon"] = "dcemp_ar1_whatsgoinon";
    level.scr_sound["foley"]["dcemp_fly_justkeepmovin"] = "dcemp_fly_justkeepmovin";
    level.scr_sound["dunn"]["dcemp_cpd_lookout"] = "dcemp_cpd_lookout";
    level.scr_sound["dunn"]["dcemp_cpd_wearetotally"] = "dcemp_cpd_wearetotally";
    level.scr_sound["foley"]["dcemp_fly_getagrip"] = "dcemp_fly_getagrip";
    level.scr_face["foley"]["dcemp_fly_getagrip"] = %dcemp_fly_getagrip;
    level.scr_sound["dunn"]["dcemp_cpd_huah"] = "dcemp_cpd_huah";
    level.scr_sound["marine1"]["dcemp_ar1_huah"] = "dcemp_ar1_huah";
    level.scr_sound["marine1"]["dcemp_ar1_whatwasthat"] = "dcemp_ar1_whatwasthat";
    level.scr_sound["foley"]["dcemp_fly_stayhere"] = "dcemp_fly_stayhere";
    level.scr_face["foley"]["dcemp_fly_stayhere"] = %dcemp_fly_stayhere;
    level.scr_sound["dunn"]["dcemp_cpd_younuts"] = "dcemp_cpd_younuts";
    level.scr_sound["foley"]["dcemp_fly_wartofight"] = "dcemp_fly_wartofight";
    level.scr_sound["marine1"]["dcemp_ar1_thisisweird"] = "dcemp_ar1_thisisweird";
    level.scr_sound["dunn"]["dcemp_cpd_soquiet"] = "dcemp_cpd_soquiet";
    level.scr_sound["dunn"]["dcemp_cpd_heywhatthe"] = "dcemp_cpd_heywhatthe";
    level.scr_sound["marine1"]["dcemp_ar1_minedowntoo"] = "dcemp_ar1_minedowntoo";
    level.scr_sound["foley"]["dcemp_fly_empblast"] = "dcemp_fly_empblast";
    level.scr_sound["marine1"]["dcemp_ar1_findironsite"] = "dcemp_ar1_findironsite";
    level.scr_sound["marine2"]["dcemp_ar1_huah"] = "dcemp_ar1_huah";
    level.scr_sound["dunn"]["dcemp_cpd_checkitout"] = "dcemp_cpd_checkitout";
    level.scr_sound["foley"]["dcemp_fly_dammit"] = "dcemp_fly_dammit";
    level.scr_sound["foley"]["dcemp_fly_regroup"] = "dcemp_fly_regroup";
    level.scr_sound["dunn"]["dcemp_cpd_huah2"] = "dcemp_cpd_huah2";
    level.scr_sound["dunn"]["dcemp_cpd_star"] = "dcemp_cpd_star";
    level.scr_face["dunn"]["dcemp_cpd_star"] = %h2_dcemp_run_sequence_dunn_star;
    level.scr_sound["dunn"]["dcemp_cpd_willfire"] = "dcemp_cpd_willfire";
    level.scr_face["dunn"]["dcemp_cpd_willfire"] = %h2_dcemp_run_sequence_dunn_staror;
    level.scr_sound["runner"]["dcemp_ar3_dontshoot"] = "dcemp_ar3_dontshoot";
    level.scr_face["runner"]["dcemp_ar3_dontshoot"] = %h2_dcemp_run_sequence_runner_idont;
    level.scr_sound["foley"]["dcemp_fly_properresponse"] = "dcemp_fly_properresponse";
    level.scr_face["foley"]["dcemp_fly_properresponse"] = %h2_dcemp_run_sequence_foley_proper;
    level.scr_sound["runner"]["dcemp_ar3_whiskeyhotel"] = "dcemp_ar3_whiskeyhotel";
    level.scr_face["runner"]["dcemp_ar3_whiskeyhotel"] = %h2_dcemp_run_sequence_runner_colonel;
    level.scr_sound["dunn"]["dcemp_cpd_wheregoin"] = "dcemp_cpd_wheregoin";
    level.scr_face["dunn"]["dcemp_cpd_wheregoin"] = %h2_dcemp_run_sequence_dunn_sowhere;
    level.scr_sound["runner"]["dcemp_ar3_everyoneelse"] = "dcemp_ar3_everyoneelse";
    level.scr_face["runner"]["dcemp_ar3_everyoneelse"] = %h2_dcemp_run_sequence_runner_totell;
    level.scr_sound["foley"]["dcemp_fly_heardtheman"] = "dcemp_fly_heardtheman";
    level.scr_face["foley"]["dcemp_fly_heardtheman"] = %h2_dcemp_run_sequence_foley_youheard;
    level.scr_sound["foley"]["dcemp_fly_dunnyoureup"] = "dcemp_fly_dunnyoureup";
    level.scr_sound["dunn"]["dcemp_cpd_clear"] = "dcemp_cpd_clear";
    level.scr_sound["marine2"]["dcemp_ar2_gotoursix"] = "dcemp_ar2_gotoursix";
    level.scr_sound["foley"]["dcemp_fly_copythat"] = "dcemp_fly_copythat";
    level.scr_sound["marine3"]["dcemp_ar3_star"] = "dcemp_ar3_star";
    level.scr_sound["dunn"]["dcemp_cpd_sonofa"] = "dcemp_cpd_sonofa";
    level.scr_sound["foley"]["dcemp_fly_contact"] = "dcemp_fly_contact";
    level.scr_sound["dunn"]["dcemp_cpd_conact"] = "dcemp_cpd_conact";
    level.scr_sound["dunn"]["dcemp_cpd_huaah"] = "dcemp_cpd_huaah";
    level.scr_sound["marine1"]["dcemp_ar2_clear"] = "dcemp_ar2_clear";
    level.scr_sound["foley"]["dcemp_fly_roomclear"] = "dcemp_fly_roomclear";
    level.scr_sound["foley"]["dcemp_fly_oldexecbuilding"] = "dcemp_fly_oldexecbuilding";
    level.scr_sound["dunn"]["dcemp_cpd_gottagoout"] = "dcemp_cpd_gottagoout";
    level.scr_sound["foley"]["dcemp_fly_checkvitals"] = "dcemp_fly_checkvitals";
    level.scr_sound["dunn"]["dcemp_cpd_gonner"] = "dcemp_cpd_gonner";
    level.scr_sound["foley"]["dcemp_fly_keepquiet"] = "dcemp_fly_keepquiet";
    level.scr_sound["marine1"]["dcemp_ar2_gotavisual"] = "dcemp_ar2_gotavisual";
    level.scr_sound["foley"]["dcemp_fly_moveintopos"] = "dcemp_fly_moveintopos";
    level.scr_sound["marine1"]["dcemp_ar2_clearshot"] = "dcemp_ar2_clearshot";
    level.scr_sound["foley"]["dcemp_fly_smokeem"] = "dcemp_fly_smokeem";
    level.scr_sound["foley"]["dcemp_fly_moveup"] = "dcemp_fly_moveup";
    level.scr_sound["dunn"]["dcemp_cpd_whatabout"] = "dcemp_cpd_whatabout";
    level.scr_sound["foley"]["dcemp_fly_whataboutem"] = "dcemp_fly_whataboutem";
    level.scr_sound["marine1"]["dcemp_ar2_gotoursixgo"] = "dcemp_ar2_gotoursixgo";
    level.scr_sound["dunn"]["dcemp_cpd_itsclear"] = "dcemp_cpd_itsclear";
    level.scr_sound["dunn"]["dcemp_cpd_freezingmonsoon"] = "dcemp_cpd_freezingmonsoon";
    level.scr_sound["marine1"]["dcemp_ar2_huah"] = "dcemp_ar2_huah";
    level.scr_sound["foley"]["dcemp_fly_quietseesomething"] = "dcemp_fly_quietseesomething";
    level.scr_sound["foley"]["dcemp_fly_holdyourfire"] = "dcemp_fly_holdyourfire";
    level.scr_sound["dunn"]["dcemp_cpd_aretheyfriendly"] = "dcemp_cpd_aretheyfriendly";
    level.scr_sound["foley"]["dcemp_fly_dontknowstar"] = "dcemp_fly_dontknowstar";
    level.scr_sound["foley"]["dcemp_fly_coverme"] = "dcemp_fly_coverme";
    level.scr_sound["foley"]["dcemp_fly_staaar"] = "dcemp_fly_staaar";
    level.scr_sound["dunn"]["dcemp_cpd_saytexas"] = "dcemp_cpd_saytexas";
    level.scr_sound["marine1"]["dcemp_ar2_streetclear"] = "dcemp_ar2_streetclear";
    level.scr_sound["foley"]["dcemp_fly_oscarmike"] = "dcemp_fly_oscarmike";
    level.scr_sound["foley"]["dcemp_fly_watchmovement"] = "dcemp_fly_watchmovement";
}
#using_animtree("vehicles");

_id_B3FD()
{
    level.scr_anim["emp_heli_spotlight"]["crash"] = %dcemp_emp_heli_crash;
    level.scr_anim["emp_heli_rappel"]["crash"] = %cobra_crash;
    level.scr_anim["emp_heli_distant"]["crash"] = %cobra_crash;
    level.scr_anim["emp_heli_last"]["crash"] = %sniper_escape_crash_mi28_crash;
    level.scr_anim["generic"]["cobra_crash"] = %cobra_crash;
    level.scr_anim["street_car"]["crash"] = %dcemp_car_hit;
    level.scr_anim["emp_mi28"]["crash"] = %dcemp_emp_heli_crash;
    level.scr_animtree["emp_mi28"] = #animtree;
    level.scr_model["emp_mi28"] = "vehicle_mi-28_flying_low";
    level.scr_anim["street_mi28a"]["crash"] = %dcemp_heli_crash_1;
    level.scr_animtree["street_mi28a"] = #animtree;
    level.scr_model["street_mi28a"] = "vehicle_mi-28_flying_low";
    level.scr_anim["street_mi28b"]["crash"] = %dcemp_heli_crash_2;
    level.scr_animtree["street_mi28b"] = #animtree;
    level.scr_model["street_mi28b"] = "vehicle_mi-28_flying_low";
    level.scr_anim["street_bh"]["crash"] = %dcemp_heli_crash_3;
    level.scr_animtree["street_bh"] = #animtree;
    level.scr_model["street_bh"] = "vehicle_blackhawk_low";
}

_id_C09B( var_0 )
{
    var_1 = getent( "lobby_door_right", "targetname" );
    var_2 = getentarray( var_1.target, "targetname" );
    var_3 = undefined;

    foreach ( var_5 in var_2 )
    {
        if ( isdefined( var_5.script_parameters ) && var_5.script_parameters == "door_coll" )
            var_3 = var_5;
    }

    common_scripts\utility::array_call( var_2, ::linkto, var_1 );
    var_3 connectpaths();
    common_scripts\utility::flag_set( "lobby_door_kick" );
    var_7 = 0.4;
    var_1 rotateroll( 90, var_7 );
    var_1 playsound( "wood_door_kick" );
    var_1 waittill( "rotatedone" );
    var_1 vibrate( ( 0.0, 0.0, 1.0 ), 1, 0.4, 0.5 );
}

_id_D4DA( var_0 )
{
    var_0._id_AE88 = var_0.grenadeweapon;
    var_0.grenadeweapon = "flash_grenade";
    var_0.grenadeammo++;
    var_1 = common_scripts\utility::getstruct( "office_magic_bullet_target", "targetname" );
    var_2 = vectornormalize( var_1.origin - var_0 gettagorigin( "TAG_INHAND" ) + ( 0.0, 0.0, 40.0 ) );
    var_2 *= 800;
    var_3 = 1;
    var_0 magicgrenademanual( var_0 gettagorigin( "TAG_INHAND" ), var_2, var_3 );
}

_id_C9BF( var_0 )
{
    var_1 = getent( "street_flare", "targetname" );
    var_2 = spawn( "script_model", var_1._id_B399.origin );
    var_2.angles = var_1._id_B399.angles;
    var_2 setmodel( var_1._id_B399.model );
    var_2 linkto( var_1 );
    var_1._id_B399 delete();
    var_1._id_B399 = var_2;
    var_1._id_B399 linkto( var_1 );
    var_3 = getentarray( "parking_pickup_flare", "script_noteworthy" );

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
    {
        var_5 = var_3[var_4];
        var_5 maps\_utility::delaythread( 0, maps\dcemp_code::_id_B345, 0, 1 );
    }

    playfxontag( level._effect["handflare_red_dcemp"], var_1._id_B399, "TAG_ORIGIN" );
    var_1.origin = var_0 gettagorigin( "TAG_INHAND" );
    var_6 = anglestoup( var_0 gettagangles( "TAG_INHAND" ) );
    var_7 = vectortoangles( var_6 * -1 );
    var_1.angles = var_7;
    var_1 linkto( var_0, "TAG_INHAND" );
}

_id_CB6A( var_0 )
{
    var_1 = getent( "street_flare", "targetname" );
    var_1 unlink();
    var_2 = anglestoforward( var_0.angles );
    var_3 = var_0.origin + var_2 * 50;
    var_3 += ( 0.0, 0.0, 18.0 );
    var_2 = vectornormalize( var_3 - var_0.origin );
    var_4 = var_2 * 704;
    var_5 = 0.85;
    var_1 movegravity( var_4, var_5 );
    var_1 rotatevelocity( ( 400.0, 0.0, 50.0 ), var_5 );
    wait(var_5);
    common_scripts\utility::flag_set( "plaza_throw_react" );
    var_6 = var_1;
    var_1 = spawn( "script_model", var_6.origin );
    var_1.angles = var_6.angles;
    var_1 setmodel( var_6.model );
    var_1._id_B399 = var_6._id_B399;
    var_1.targetname = "street_flare";
    var_6._id_B399 linkto( var_1 );
    var_6 delete();
    var_1 thread maps\_utility::play_sound_on_entity( "scn_dcemp_street_flare_bounce" );
    var_5 = 0.4;
    var_4 = var_2 * 415;
    var_1 movegravity( var_4, var_5 );
    var_1 rotatevelocity( ( 550.0, 0.0, 50.0 ), var_5 );
    var_7 = getent( "parking_throw_flare", "script_noteworthy" );
    var_7 maps\_utility::delaythread( 0, maps\dcemp_code::_id_B345, 50000, 1, 0.027 );
    var_7 _meth_84A7( "force_on" );
    var_7 = getent( "parking_throw_flare_omni", "script_noteworthy" );
    var_7 maps\_utility::delaythread( 0, maps\dcemp_code::_id_B345, 9000, 1, 0.15 );
    thread maps\_utility::battlechatter_on( "axis" );
    wait(var_5);
    var_6 = var_1;
    var_1 = spawn( "script_model", var_6.origin );
    var_1.angles = var_6.angles;
    var_1 setmodel( var_6.model );
    var_1._id_B399 = var_6._id_B399;
    var_1.targetname = "street_flare";
    var_6._id_B399 linkto( var_1 );
    var_6 delete();
    var_5 = 1;
    var_8 = var_2 * 95;
    var_9 = var_1.origin + ( var_8[0], var_8[1], 0 );
    var_1 moveto( var_9, var_5, 0, var_5 );
    var_1 waittill( "movedone" );
    var_1 = getent( "street_flare", "targetname" );
    var_10 = spawn( "script_model", var_1._id_B399.origin );
    var_10.angles = var_1._id_B399.angles;
    var_10 setmodel( var_1._id_B399.model );
    var_10 linkto( var_1 );
    var_1._id_B399 delete();
    var_1._id_B399 = var_10;
    var_1._id_B399 linkto( var_1 );
    playfxontag( level._effect["groundflare_red_dcemp"], var_1._id_B399, "TAG_ORIGIN" );
}

_id_ADF4( var_0 )
{
    thread maps\dcemp_aud::runner_meetup_dialog();
    wait 0.5;
    common_scripts\utility::flag_set( "meetup_runner_leave" );
}

_id_B97A( var_0 )
{
    level._id_ACC0 maps\_utility::dialogue_queue( "dcemp_cpd_wheregoin" );
    level._id_B624 maps\_utility::dialogue_queue( "dcemp_ar3_everyoneelse" );
    common_scripts\utility::flag_set( "meetup_runner_sprint" );
    common_scripts\utility::flag_set( "lobby_main" );
}

_id_BC5A( var_0 )
{
    var_0 setlookatentity();
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
}

_id_D14F()
{
    level.scr_animtree["tunnel_door"] = #animtree;
    level.scr_model["tunnel_door"] = "tag_origin";
    level.scr_anim["tunnel_door"]["DCemp_door_sequence"] = %dcemp_door_sequence_door;
    level.scr_animtree["tunnel_lamp"] = #animtree;
    level.scr_anim["tunnel_lamp"]["dcemp_tunnel_lamp"][0] = %h2_wh_tunnel_hanging_lamp_idle;
}

_id_D449()
{
    level.scr_animtree["plank"] = #animtree;
    level.scr_model["plank"] = "h2_dcb_blackhawk_bars";
    level.scr_anim["plank"]["dcemp_BHrescue"] = %h2_dcemp_bhrescue_plank_1;
    level.scr_animtree["plank1"] = #animtree;
    level.scr_model["plank1"] = "tag_origin";
    level.scr_anim["plank1"]["dcemp_BHrescue"] = %dcemp_bhrescue_plank_1;
    level.scr_animtree["plank2"] = #animtree;
    level.scr_model["plank2"] = "tag_origin";
    level.scr_anim["plank2"]["dcemp_BHrescue"] = %dcemp_bhrescue_plank_2;
    level.scr_animtree["iss_satellite"] = #animtree;
    level.scr_model["iss_satellite"] = "tag_origin";
    level.scr_anim["iss_satellite"]["ISS_animation"] = %iss_sat;
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
    level.scr_model["iss_rig"] = "viewbody_iss";
    level.scr_anim["iss_rig"]["ISS_animation"] = %h2_iss_player_rotate;
    level.scr_anim["iss_rig"]["ISS_idle"][0] = %h2_iss_player_idle;
    level.scr_anim["iss_rig"]["ISS_float_away"] = %h2_iss_player_float_away;
    level.scr_anim["player_rig"]["dcemp_BHrescue"] = %h2_dcemp_bhrescue_player;
}
#using_animtree("door");

_id_CF4F()
{
    level.scr_animtree["door"] = #animtree;
    level.scr_model["door"] = "com_door_01_handleleft2";
    level.scr_anim["door"]["shotgunbreach_door_immediate"] = %shotgunbreach_door_immediate;
}

setup_exploder_anim()
{
    level._id_A98C = [];
    level._id_A98C[0] = "exploder_script_model";
}
#using_animtree("script_model");

script_model_anim()
{
    level.scr_animtree["exploder_script_model"] = #animtree;
    level.scr_anim["exploder_script_model"]["h2_iss_destruction_a_anim"] = %h2_iss_destruction_a_anim;
    level.scr_anim["exploder_script_model"]["h2_iss_destruction_b_anim"] = %h2_iss_destruction_b_anim;
    level.scr_anim["exploder_script_model"]["h2_iss_destruction_c_anim"] = %h2_iss_destruction_c_anim;
    level.scr_anim["exploder_script_model"]["h2_iss_destruction_d_anim"] = %h2_iss_destruction_d_anim;
    level.scr_anim["exploder_script_model"]["h2_iss_destruction_e_anim"] = %h2_iss_destruction_e_anim;
    level.scr_anim["exploder_script_model"]["h2_iss_destruction_e_2_anim"] = %h2_iss_destruction_e_2_anim;
    level.scr_anim["exploder_script_model"]["h2_iss_destruction_f_anim"] = %h2_iss_destruction_f_anim;
    level.scr_anim["exploder_script_model"]["h2_iss_destruction_g_anim"] = %h2_iss_destruction_g_anim;
    level.scr_anim["exploder_script_model"]["h2_iss_destruction_h_anim"] = %h2_iss_destruction_h_anim;
    level.scr_animtree["moto"] = #animtree;
    level.scr_anim["moto"]["safe_zone_in"] = %h2_dcemp_fallingdebris_motorcycle;
    level.scr_animtree["door2"] = #animtree;
    level.scr_anim["door2"]["safe_zone_out"] = %h2_dcemp_fallingdebris_door;
}

sound_street_flare_throw()
{
    waittillframeend;
    maps\_anim::addonstart_animsound( "generic", "street_flare_throw", "scn_dcemp_street_flare_throw" );
}
