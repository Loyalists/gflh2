// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    _id_CE53();
    _id_C544();
    anims();
    dialogue();
    _id_BEA9();
    player_anims();
    _id_A850();
    _id_B5B5();
    _id_BB5C();
    _id_C902();
    _id_D2C8();
    _id_C3F3();
    _id_9D7F();
    weapon_anims();
    script_model();
    animated_palette();
    _id_C8F4();
    thread audio_anim();
}

_id_CE53()
{

}

audio_anim()
{
    wait 0.1;
    maps\_anim::addonstart_animsound( "player_rig", "underwater_player_start", "scn_oilrig_underwater_plr_start" );
    maps\_anim::addonstart_animsound( "worldbody", "c4bodywall", "scn_oilrig_c4_bodywall_plr" );
    maps\_anim::addonstart_animsound( "worldbody", "c4bodyground", "scn_oilrig_c4_bodyground_plr" );
    maps\_anim::addonstart_animsound( "worldbody", "c4bodyground2", "scn_oilrig_c4_bodyground2_plr" );
    maps\_anim::addonstart_animsound( "generic", "oilrig_seal_surface_rebreather_off_guy1", "scn_oilrig_seal_surface_rebreather_off_guy1" );
    maps\_anim::addonstart_animsound( "generic", "oilrig_seal_surface_rebreather_off_guy2", "scn_oilrig_seal_surface_rebreather_off_guy2" );
    maps\_anim::addonstart_animsound( "worldbody", "smoker_takedown", "scn_oilrig_smoker_kill" );
    maps\_anim::addonstart_animsound( "generic", "C4_plant", "scn_oilrig_npc_c4_knee_plant" );
    maps\_anim::addonstart_animsound( "generic", "soap_go_up_scaffolding", "scn_oilrig_soap_go_up_scaffolding" );
    maps\_anim::addonstart_animsound( "generic", "oilrig_rappel_2_crouch", "scn_oilrig_npc_rappel_deck2" );
    maps\_anim::addonstart_animsound( "soap", "escape_departure", "scn_oilrig_plr_grabbing_wpn" );
}
#using_animtree("generic_human");

_id_C544()
{
    level.scr_anim["sdv01_pilot"]["sdv_ride_in"] = %oilrig_sub_a_disembark_1;
    level.scr_anim["sdv01_copilot"]["sdv_ride_in"] = %oilrig_sub_a_disembark_2;
    level.scr_anim["sdv01_swimmer1"]["sdv_ride_in"] = %oilrig_sub_a_disembark_4;
    level.scr_anim["sdv02_pilot"]["sdv_ride_in"] = %oilrig_sub_b_disembark_1;
    level.scr_anim["sdv02_copilot"]["sdv_ride_in"] = %oilrig_sub_b_disembark_2;
    level.scr_anim["sdv02_swimmer1"]["sdv_ride_in"] = %oilrig_sub_b_disembark_3;
    level.scr_anim["sdv02_swimmer2"]["sdv_ride_in"] = %oilrig_sub_b_disembark_4;
    maps\_anim::addnotetrack_animsound( "sdv01_pilot", "sdv_ride_in", "pilot_leaving_diveboat", "foley_npc_leave_diveboat" );
    maps\_anim::addnotetrack_animsound( "sdv01_copilot", "sdv_ride_in", "copilot_leaving_diveboat", "foley_npc_leave_diveboat" );
    level.scr_anim["sdv01_pilot"]["surface_idle"][0] = %oilrig_sub_a_idle_1;
    level.scr_anim["sdv01_copilot"]["surface_idle"][0] = %oilrig_sub_a_idle_2;
    level.scr_anim["sdv01_swimmer1"]["surface_idle"][0] = %oilrig_sub_a_idle_4;
    level.scr_anim["sdv02_pilot"]["surface_idle"][0] = %oilrig_sub_b_idle_1;
    level.scr_anim["sdv02_copilot"]["surface_idle"][0] = %oilrig_sub_b_idle_2;
    level.scr_anim["sdv02_swimmer1"]["surface_idle"][0] = %oilrig_sub_b_idle_3;
    level.scr_anim["sdv02_swimmer2"]["surface_idle"][0] = %oilrig_sub_b_idle_4;
    level.scr_anim["hostile_stealthkill_player"]["grate_idle"][0] = %oilrig_underwater_guard_2_idle;
    level.scr_anim["hostile_stealthkill_friendly"]["grate_idle"][0] = %oilrig_underwater_guard_1_idle;
    level.scr_anim["hostile_stealthkill_player"]["stealth_kill"] = %oilrig_underwater_guard_2_death;
    level.scr_anim["hostile_stealthkill_friendly"]["stealth_kill"] = %oilrig_underwater_guard_1_death;
    level.scr_anim["sdv02_pilot"]["stealth_kill"] = %oilrig_underwater_kill_1;
    maps\_anim::addnotetrack_customfunction( "hostile_stealthkill_player", "blood", _id_AA61::_id_C3C1 );
    maps\_anim::addnotetrack_customfunction( "hostile_stealthkill_player", "splash", _id_AA61::_id_D35A );
    maps\_anim::addnotetrack_customfunction( "hostile_stealthkill_friendly", "blood", _id_AA61::_id_C3C1 );
    level.scr_anim["water_helper_01"]["surface_helpout"] = %oilrig_helpout_1;
    level.scr_anim["water_helper_02"]["surface_helpout"] = %oilrig_helpout_2;
    level.scr_anim["manhandle_soldier_walk"]["prisoner_manhandle_walk"] = %prisoner_pickup2walk_soldier;
    level.scr_anim["manhandle_prisoner_walk"]["prisoner_manhandle_walk"] = %prisoner_pickup2walk_prisoner;
    level.scr_anim["manhandle_soldier_run"]["prisoner_manhandle_run"] = %prisoner_pickup2run_soldier;
    level.scr_anim["manhandle_prisoner_run"]["prisoner_manhandle_run"] = %prisoner_pickup2run_prisoner;
    level.scr_anim["generic"]["stand_exposed_wave_move_up"] = %stand_exposed_wave_move_up;
    level.scr_anim["generic"]["execution_slamwall_hostage_death"] = %execution_slamwall_hostage_death;
    level.scr_anim["generic"]["run_death_roll"] = %run_death_roll;
    level.scr_anim["generic"]["guy_blown_out_door_death"] = %s1_exposed_death_blowback;
    level.scr_anim["generic"]["C4_plant_start"] = %explosive_plant_knee;
    level.scr_anim["generic"]["C4_plant"] = %explosive_plant_knee;
    level.scr_anim["generic"]["soap_go_up_scaffolding"] = %h2_oilrig_scaffold_soap;
    level.scr_anim["generic"]["railing_execute_reach"] = %h2_cqb_7_covercrouch_aim;
    level.scr_anim["generic"]["railing_execute_idle"][0] = %covercrouch_idle_aim5;
    level.scr_anim["generic"]["railing_execute_shoot"] = %covercrouch_aim5;
    level.scr_anim["soap"]["railing_execute_idle"][0] = %covercrouch_idle_aim5;
    level.scr_anim["soap"]["breach_react"] = %h2_cornerstndl_breach_ally_react;
    level.scr_anim["soap"]["escape_in"] = %h2_oilrig_helipad_escape_soap_in;
    level.scr_anim["soap"]["escape_idle"][0] = %h2_oilrig_helipad_escape_soap_idle;
    level.scr_anim["soap"]["escape_departure"] = %h2_oilrig_helipad_escape_soap_departure;
    level.scr_anim["generic"]["h2_oilrig_helipad_escape_frontsoldier_getin"] = %h2_oilrig_helipad_escape_frontsoldier_getin;
    level.scr_anim["generic"]["h2_oilrig_helipad_escape_midsoldier_getin"] = %h2_oilrig_helipad_escape_midsoldier_getin;
    level.scr_anim["generic"]["h2_oilrig_helipad_escape_rearsoldier_getin"] = %h2_oilrig_helipad_escape_rearsoldier_getin;
    level.scr_anim["generic"]["h2_oilrig_helipad_escape_frontsoldier_getin_idle"][0] = %h2_oilrig_helipad_escape_frontsoldier_sitting_idle;
    level.scr_anim["generic"]["h2_oilrig_helipad_escape_midsoldier_getin_idle"][0] = %h2_oilrig_helipad_escape_midsoldier_sitting_idle;
    level.scr_anim["generic"]["h2_oilrig_helipad_escape_rearsoldier_getin_idle"][0] = %h2_oilrig_helipad_escape_rearsoldier_sitting_idle;
    level.scr_anim["generic"]["escape_in"] = %h2_oilrig_helipad_stairs_soldier;
}

anims()
{
    maps\_props::add_smoking_notetracks( "generic" );
    maps\_props::add_smoking_notetracks( "hostile_stealthkill_player" );
    level.scr_anim["generic"]["smoking_reach"] = %parabolic_leaning_guy_smoking_idle;
    level.scr_anim["generic"]["smoking"][0] = %parabolic_leaning_guy_smoking_idle;
    level.scr_anim["generic"]["smoking"][1] = %parabolic_leaning_guy_smoking_twitch;
    level.scr_anim["generic"]["smoking_react"] = %parabolic_leaning_guy_react;
    level.scr_anim["generic"]["bored_idle_reach"] = %patrol_bored_idle;
    level.scr_anim["generic"]["bored_idle"][0] = %patrol_bored_idle;
    level.scr_anim["generic"]["bored_idle"][1] = %patrol_bored_twitch_bug;
    level.scr_anim["generic"]["bored_idle"][2] = %patrol_bored_twitch_stretch;
    level.scr_anim["generic"]["bored_alert"] = %exposed_idle_twitch_v4;
    level.scr_anim["generic"]["bored_cell_loop"][0] = %patrol_bored_idle_cellphone;
    level.scr_anim["generic"]["oilrig_balcony_smoke_idle"][0] = %h2_oilrig_smoker_idle;
    level.scr_anim["generic"]["railing_death"] = %h2_oilrig_smoker_death;
    maps\_anim::addnotetrack_customfunction( "generic", "detach_hat", ::helmetpop_wrapper, "railing_death", ( 0.0, 0.0, 0.0 ) );
    maps\_anim::addnotetrack_customfunction( "generic", "detach cig", maps\_props::detach_cig );
    level.scr_anim["generic"]["pronehide_dive"] = %hunted_dive_2_pronehide_v1;
    level.scr_anim["generic"]["pronehide_idle"][0] = %hunted_pronehide_idle_v1;
    level.scr_anim["generic"]["pronehide_idle_frame"] = %hunted_pronehide_idle_v1;
    level.scr_anim["generic"]["prone_2_run_roll"] = %hunted_pronehide_2_stand_v1;
    level.scr_anim["generic"]["fastrope_fall"] = %fastrope_fall;
    level.scr_anim["generic"]["oilrig_rappel_over_rail_R"] = %oilrig_rappel_over_rail_r;
    level.scr_anim["generic"]["oilrig_rappel_2_crouch"] = %oilrig_rappel_2_crouch;
    maps\_anim::addnotetrack_customfunction( "generic", "over_solid", maps\oilrig::_id_B0CB, "oilrig_rappel_over_rail_R" );
    maps\_anim::addnotetrack_customfunction( "generic", "over_solid", maps\oilrig::_id_B0CB, "oilrig_rappel_2_crouch" );
    maps\_anim::addnotetrack_customfunction( "generic", "feet_on_ground", maps\oilrig::_id_A88B, "oilrig_rappel_over_rail_R" );
    maps\_anim::addnotetrack_customfunction( "generic", "feet_on_ground", maps\oilrig::_id_A88B, "oilrig_rappel_2_crouch" );
    level.scr_anim["generic"]["patrol_walk"] = %patrol_bored_patrolwalk;
    level.scr_anim["generic"]["patrol_walk_twitch"] = %patrol_bored_patrolwalk_twitch;
    level.scr_anim["generic"]["patrol_stop"] = %patrol_bored_walk_2_bored;
    level.scr_anim["generic"]["patrol_start"] = %patrol_bored_2_walk;
    level.scr_anim["generic"]["patrol_turn180"] = %patrol_bored_2_walk_180turn;
    level.scr_anim["generic"]["patrol_idle_1"] = %patrol_bored_idle;
    level.scr_anim["generic"]["patrol_idle_2"] = %patrol_bored_idle_smoke;
    level.scr_anim["generic"]["patrol_idle_3"] = %patrol_bored_idle_cellphone;
    level.scr_anim["generic"]["patrol_idle_4"] = %patrol_bored_twitch_bug;
    level.scr_anim["generic"]["patrol_idle_5"] = %patrol_bored_twitch_checkphone;
    level.scr_anim["generic"]["patrol_idle_6"] = %patrol_bored_twitch_stretch;
    level.scr_anim["generic"]["patrol_idle_smoke"] = %patrol_bored_idle_smoke;
    level.scr_anim["generic"]["patrol_idle_checkphone"] = %patrol_bored_twitch_checkphone;
    level.scr_anim["generic"]["patrol_idle_stretch"] = %patrol_bored_twitch_stretch;
    level.scr_anim["generic"]["patrol_idle_phone"] = %patrol_bored_idle_cellphone;
    level.scr_anim["generic"]["patrol_jog"] = %patrol_jog;
    level.scr_anim["generic"]["combat_jog"] = %combat_jog;
    level.scr_anim["generic"]["patrol_jog_turn180"] = %patrol_jog_360;
    level.scr_anim["generic"]["stealth_jog"] = %patrol_jog;
    level.scr_anim["generic"]["stealth_walk"] = %patrol_bored_patrolwalk;
    level.scr_anim["generic"]["breach_react_desk_v1"] = %breach_react_desk_v1;
    level.scr_anim["generic"]["breach_chair_reaction_v1"] = %breach_chair_reaction_v1;
    level.scr_anim["generic"]["execution_shield_soldier"] = %execution_shield_soldier;
    level.scr_anim["generic"]["execution_onknees_soldier"] = %execution_onknees_soldier;
    level.scr_anim["generic"]["patrol_bored_react_walkstop"] = %patrol_bored_react_walkstop;
    level.scr_anim["generic"]["breach_react_blowback_v1"] = %breach_react_blowback_v1;
    level.scr_anim["generic"]["breach_react_push_guy1"] = %breach_react_push_guy1;
    level.scr_anim["generic"]["breach_react_push_guy2"] = %breach_react_push_guy2;
    level.scr_anim["generic"]["breach_react_desk_v4"] = %breach_react_desk_v4;
    level.scr_anim["generic"]["execution_onknees2_soldier"] = %execution_onknees2_soldier;
    level.scr_anim["generic"]["execution_slamwall_soldier"] = %execution_slamwall_soldier;
    level.scr_anim["generic"]["execution_knife_soldier"] = %execution_knife_soldier;
    level.scr_anim["generic"]["breach_react_guntoss_v2_guy2"] = %breach_react_guntoss_v2_guy2;
    level.scr_anim["generic"]["breach_react_knife_charge"] = %breach_react_knife_charge;
    level.scr_anim["generic"]["breach_react_knife_charge_death"] = %death_shotgun_back_v1;
    level.scr_anim["generic"]["breach_react_guntoss_v2_guy1"] = %breach_react_guntoss_v2_guy1;
    level.scr_anim["generic"]["breach_react_desk_v7"] = %breach_react_desk_v7;
    level.scr_anim["generic"]["hostage_stand_fall"] = %hostage_stand_fall;
    level.scr_anim["generic"]["hostage_stand_fall_idle"][0] = %hostage_knees_idle;
    level.scr_anim["generic"]["hostage_stand_fall_idle"][1] = %hostage_knees_twitch;
    level.scr_anim["generic"]["friendly_manhandle_h2"][0] = %cqb_stand_idle;
    level.scr_anim["generic"]["hostage_stand_fall_manhandled"] = %h2_room1a_takedown_hostagea;
    level.scr_anim["generic"]["hostage_stand_fall_manhandled_idle"][0] = %h2_room1a_takedown_hostagea_idle;
    level.scr_anim["generic"]["hostage_stand_fall_manhandledV2"] = %h2_room1b_takedown_hostage;
    level.scr_anim["generic"]["hostage_stand_fall_manhandled_idleV2"][0] = %h2_room1b_takedown_hostage_idle;
    level.scr_anim["generic"]["execution_shield_hostage"] = %execution_shield_hostage;
    level.scr_anim["generic"]["execution_shield_hostage_death"] = %execution_shield_hostage_death;
    level.scr_anim["generic"]["execution_shield_hostage_survives"] = %execution_shield_hostage_survives;
    level.scr_anim["generic"]["execution_shield_hostage_idle"][0] = %hostage_knees_idle;
    level.scr_anim["generic"]["execution_onknees_hostage"] = %execution_onknees_hostage;
    level.scr_anim["generic"]["execution_onknees_hostage_death"] = %execution_onknees_hostage_death;
    level.scr_anim["generic"]["execution_onknees_hostage_idle"][0] = %execution_onknees_hostage_survives;
    level.scr_anim["generic"]["execution_onknees_hostage_manhandled_guarded"] = %h2_room1a_takedown_hostageb;
    level.scr_anim["generic"]["execution_onknees_hostage_manhandled_guarded_idle"][0] = %h2_room1a_takedown_hostageb_idle;
    level.scr_anim["generic"]["execution_onknees2_hostage"] = %execution_onknees2_hostage;
    level.scr_anim["generic"]["execution_onknees2_hostage_survives"] = %execution_onknees2_hostage_survives;
    level.scr_anim["generic"]["execution_onknees2_hostage_death"] = %execution_onknees2_hostage_death;
    level.scr_anim["generic"]["execution_onknees2_hostage_manhandled"] = %h2_room2b_takedown_hostage1;
    level.scr_anim["generic"]["execution_onknees2_hostage_manhandled_part2B"] = %h2_room2b_takedown_hostage1_part2;
    level.scr_anim["generic"]["execution_onknees2_hostage_manhandled_idle"][0] = %h2_room2b_takedown_hostage1_idle;
    level.scr_anim["generic"]["execution_onknees2_hostage_manhandledV2"] = %h2_room2a_takedown_hostage1;
    level.scr_anim["generic"]["execution_onknees2_hostage_manhandled_part2AV2"] = %h2_room2a_takedown_hostage1_part2;
    level.scr_anim["generic"]["execution_onknees2_hostage_manhandled_idleV2"][0] = %h2_room2a_takedown_hostage1_idle;
    level.scr_anim["generic"]["execution_slamwall_hostage"] = %execution_slamwall_hostage;
    level.scr_anim["generic"]["execution_slamwall_hostage_death"] = %execution_slamwall_hostage_death;
    level.scr_anim["generic"]["execution_slamwall_hostage_idle"][0] = %hostage_stand_idle;
    level.scr_anim["generic"]["execution_slamwall_hostage_manhandled"] = %h2_room2a_takedown_hostage2;
    level.scr_anim["generic"]["execution_slamwall_hostage_manhandled_part2A"] = %h2_room2a_takedown_hostage2_part2;
    level.scr_anim["generic"]["execution_slamwall_hostage_manhandled_idle"][0] = %h2_room2a_takedown_hostage2_idle;
    level.scr_anim["generic"]["execution_slamwall_hostage_manhandled_prepare"] = %takedown_room2a_hostagea_flee;
    level.scr_anim["generic"]["execution_knife_hostage"] = %execution_knife_hostage;
    level.scr_anim["generic"]["execution_knife_hostage_death"] = %execution_knife_hostage_death;
    level.scr_anim["generic"]["execution_knife_hostage_idle"][0] = %hostage_knees_idle;
    level.scr_anim["generic"]["execution_knife_hostage_manhandled"] = %h2_room2b_takedown_hostage2;
    level.scr_anim["generic"]["execution_knife_hostage_manhandled_part2B"] = %h2_room2b_takedown_hostage2_part2;
    level.scr_anim["generic"]["execution_knife_hostage_manhandled_idle"][0] = %h2_room2b_takedown_hostage2_idle;
    level.scr_anim["generic"]["hostage_chair_twitch1"] = %h2_hostage_chair_breachreact1;
    level.scr_anim["generic"]["hostage_chair_twitch1_idle"][0] = %h2_hostage_chair_idle1;
    level.scr_anim["generic"]["hostage_chair_twitch1_idle"][1] = %h2_hostage_chair_twitch;
    level.scr_anim["generic"]["hostage_chair_twitch2"] = %h2_hostage_chair_breachreact2;
    level.scr_anim["generic"]["hostage_chair_twitch2_idle"][0] = %h2_hostage_chair_idle2;
    level.scr_anim["generic"]["hostage_chair_twitch2_idle"][1] = %h2_hostage_chair_twitch2;
    level.scr_anim["generic"]["hostage_chair_twitch3"] = %h2_hostage_chair_breachreact3;
    level.scr_anim["generic"]["hostage_chair_twitch3_idle"][0] = %h2_hostage_chair_idle3;
    level.scr_anim["generic"]["hostage_chair_twitch3_idle"][1] = %h2_hostage_chair_listen3;
    level.scr_anim["generic"]["hostage_chair_twitch4"] = %h2_hostage_chair_breachreact4;
    level.scr_anim["generic"]["hostage_chair_twitch4_idle"][0] = %h2_hostage_chair_idle4;
    level.scr_anim["generic"]["hostage_chair_twitch4_idle"][1] = %h2_hostage_chair_twitch4;
    level.scr_anim["generic"]["h2_hostage_chair_breachdeath"] = %h2_hostage_chair_breachdeath;
    level.scr_anim["generic"]["h2_hostage_chair_breachdeath_02"] = %h2_hostage_chair_breachdeath_02;
    level.scr_anim["generic"]["exposed_idle_reactA"] = %exposed_idle_reacta;
    level.scr_anim["generic"]["hostage_stand_react_front"] = %hostage_stand_react_front;
    level.scr_anim["generic"]["hostage_stand_react_front_idle"][0] = %hostage_stand_idle;
    level.scr_anim["generic"]["hostage_stand_react_front_manhandled"] = %h2_room1alt_takedown_hostage;
    level.scr_anim["generic"]["hostage_stand_react_front_manhandled_prepare_idle"][0] = %h2_room1alt_takedown_hostage_pre_idle;
    level.scr_anim["generic"]["hostage_stand_react_front_manhandled_idle"][0] = %h2_room1alt_takedown_hostage_idle;
    level.scr_anim["generic"]["takedown_room1B_soldier"] = %h2_room1b_takedown_soldier;
    level.scr_anim["generic"]["takedown_room1B_soldier_idle"][0] = %h2_room1b_takedown_soldier_idle;
    level.scr_anim["generic"]["takedown_room1A_soldier"] = %h2_room1a_takedown_soldier;
    level.scr_anim["generic"]["takedown_room1A_soldier_idle"][0] = %h2_room1a_takedown_soldier_idle;
    level.scr_anim["generic"]["takedown_room2A_soldier1"] = %h2_room2a_takedown_soldier1;
    level.scr_anim["generic"]["takedown_room2A_soldier1_part2A"] = %h2_room2a_takedown_soldier1_part2;
    level.scr_anim["generic"]["takedown_room2A_soldier2"] = %h2_room2a_takedown_soldier2;
    level.scr_anim["generic"]["takedown_room2A_soldier2_part2A"] = %h2_room2a_takedown_soldier2_part2;
    level.scr_anim["generic"]["takedown_room2B_soldier1"] = %h2_room2b_takedown_soldier2;
    level.scr_anim["generic"]["takedown_room2B_soldier1_part2B"] = %h2_room2b_takedown_soldier2_part2;
    level.scr_anim["generic"]["takedown_room2B_soldier2"] = %h2_room2b_takedown_soldier1;
    level.scr_anim["generic"]["takedown_room2B_soldier2_part2B"] = %h2_room2b_takedown_soldier1_part2;
    level.scr_anim["generic"]["takedown_room1Alt_soldier"] = %h2_room1alt_takedown_soldier;
    level.scr_anim["generic"]["takedown_room1Alt_soldier_idle"][0] = %h2_room1alt_takedown_soldier_idle;
    maps\_anim::addnotetrack_customfunction( "generic", "takedown", maps\oilrig_aud::_id_BCE6, "takedown_room2A_soldier1" );
    maps\_anim::addnotetrack_customfunction( "generic", "open_door", ::opendoor, "takedown_room2A_soldier1_part2A", "doorOpen1" );
    maps\_anim::addnotetrack_customfunction( "generic", "open_door", ::opendoor, "takedown_room2B_soldier2_part2B", "doorOpen2" );
    level.scr_anim["generic"]["c4bodywall"] = %h2_oilrig_hidingthec4_c4bodywall_deadbody;
    level.scr_anim["generic"]["c4bodyground"] = %h2_oilrig_hidingthec4_c4bodyground_deadbody;
    level.scr_anim["generic"]["c4bodyground2"] = %h2_oilrig_hidingthec4_c4bodyground2_deadbody;
    level.scr_anim["generic"]["execution_hostile2_death"] = %h2_oilrig_hidingthec4_c4bodyground2_deadbody_fall;
    level.scr_anim["soap"]["stairs_turn"] = %h2_oilrig_quickturn_stairs_soap;
}

dialogue()
{
    level.scr_radio["oilrig_sbc_drydock"] = "oilrig_sbc_drydock";
    level.scr_radio["oilrig_sbo_fullpressure"] = "oilrig_sbo_fullpressure";
    level.scr_radio["oilrig_sbc_deployment"] = "oilrig_sbc_deployment";
    level.scr_radio["oilrig_sbo_tm1away"] = "oilrig_sbo_tm1away";
    level.scr_radio["oilrig_sbc_ussdallas"] = "oilrig_sbc_ussdallas";
    level.scr_radio["oilrig_sbc_tm2objective"] = "oilrig_sbc_tm2objective";
    level.scr_radio["oilrig_sbo_zerooneniner"] = "oilrig_sbo_zerooneniner";
    level.scr_radio["oilrig_sbo_depth26"] = "oilrig_sbo_depth26";
    level.scr_radio["oilrig_sbo_depth20"] = "oilrig_sbo_depth20";
    level.scr_sound["hostile_stealthkill_friendly"]["oilrig_mrc1_killyou"] = "oilrig_mrc1_killyou";
    level.scr_sound["hostile_stealthkill_friendly"]["oilrig_mrc1_givemeone"] = "oilrig_mrc1_givemeone";
    level.scr_sound["hostile_stealthkill_player"]["oilrig_mrc2_foff"] = "oilrig_mrc2_foff";
    level.scr_sound["hostile_stealthkill_friendly"]["oilrig_mrc1_limoallday"] = "oilrig_mrc1_limoallday";
    level.scr_sound["hostile_stealthkill_player"]["oilrig_mrc2_complain"] = "oilrig_mrc2_complain";
    level.scr_sound["hostile_stealthkill_friendly"]["oilrig_mrc1_theitalians"] = "oilrig_mrc1_theitalians";
    level.scr_sound["hostile_stealthkill_player"]["oilrig_mrc2_noclue"] = "oilrig_mrc2_noclue";
    level.scr_sound["hostile_stealthkill_friendly"]["oilrig_mrc1_cheeseburger"] = "oilrig_mrc1_cheeseburger";
    level.scr_sound["hostile_stealthkill_player"]["oilrig_mrc2_tarantino"] = "oilrig_mrc2_tarantino";
    level.scr_sound["hostile_stealthkill_friendly"]["oilrig_mrc1_paywell"] = "oilrig_mrc1_paywell";
    level.scr_sound["hostile_stealthkill_player"]["oilrig_mrc2_careless"] = "oilrig_mrc2_careless";
    level.scr_sound["hostile_stealthkill_friendly"]["oilrig_mrc1_patrolchange"] = "oilrig_mrc1_patrolchange";
    level.scr_radio["oilrig_mrc3_cheeseburger"] = "oilrig_mrc3_cheeseburger";
    level.scr_radio["oilrig_mrc2_tarantino"] = "oilrig_mrc2_tarantino";
    level.scr_radio["oilrig_mrc1_paywell"] = "oilrig_mrc1_paywell";
    level.scr_radio["oilrig_mrc2_careless"] = "oilrig_mrc2_careless";
    level.scr_radio["oilrig_mrc1_patrolchange"] = "oilrig_mrc1_patrolchange";
    level.scr_radio["oilrig_nsl_outtogether_00"] = "oilrig_nsl_outtogether";
    level.scr_radio["oilrig_nsl_outtogether_01"] = "oilrig_nsl_sametime";
    level.scr_radio["oilrig_nsl_outtogether_02"] = "oilrig_nsl_bothout";
    level.scr_radio["oilrig_nsl_outtogether_03"] = "oilrig_nsl_inposition";
    level.scr_radio["oilrig_nsl_sect1alpha"] = "oilrig_nsl_sect1alpha";
    level.scr_radio["oilrig_sbc_rogerhtlsix"] = "oilrig_sbc_rogerhtlsix";
    level.scr_radio["oilrig_ns1_visbyrailing"] = "oilrig_ns1_visbyrailing";
    level.scr_radio["oilrig_nsl_suppweapons"] = "oilrig_nsl_suppweapons";
    level.scr_radio["oilrig_nsl_readyweapons"] = "oilrig_nsl_readyweapons";
    level.scr_radio["oilrig_nsl_moveup2"] = "oilrig_nsl_moveup2";
    level.scr_radio["oilrig_nsl_keepittight"] = "oilrig_nsl_keepittight";
    level.scr_radio["oilrig_nsl_eyesopen"] = "oilrig_nsl_eyesopen";
    level.scr_radio["oilrig_nsl_getready"] = "oilrig_nsl_getready";
    level.scr_radio["oilrig_sbc_civilhostages"] = "oilrig_sbc_civilhostages";
    level.scr_radio["oilrig_nsl_tm1tobreach"] = "oilrig_nsl_tm1tobreach";
    level.scr_radio["oilrig_nsl_framecharge"] = "oilrig_nsl_framecharge";
    level.scr_radio["oilrig_nsl_chargeondoor"] = "oilrig_nsl_chargeondoor";
    level.scr_radio["oilrig_nsl_blowdoors"] = "oilrig_nsl_blowdoors";
    level.scr_radio["oilrig_nsl_intopostion"] = "oilrig_nsl_intopostion";
    level.scr_radio["breach_nag_00"] = "oilrig_nsl_framecharge";
    level.scr_radio["breach_nag_01"] = "oilrig_nsl_chargeondoor";
    level.scr_radio["breach_nag_02"] = "oilrig_nsl_blowdoors";
    level.scr_radio["breach_nag_03"] = "oilrig_nsl_intopostion";
    level.scr_radio["oilrig_ns1_inposition"] = "oilrig_ns1_inposition";
    level.scr_radio["oilrig_ns2_inposition"] = "oilrig_ns2_inposition";
    level.scr_radio["oilrig_ns1_readybreach"] = "oilrig_ns1_readybreach";
    level.scr_radio["oilrig_ns2_readybreach"] = "oilrig_ns2_readybreach";
    level.scr_radio["oilrig_ns1_inposbreach"] = "oilrig_ns1_inposbreach";
    level.scr_radio["oilrig_ns2_inposbreach"] = "oilrig_ns2_inposbreach";
    level.scr_radio["oilrig_ns1_breaching"] = "oilrig_ns1_breaching";
    level.scr_radio["oilrig_ns2_breaching"] = "oilrig_ns2_breaching";
    level.scr_radio["oilrig_ns1_plantingcharge"] = "oilrig_ns1_plantingcharge";
    level.scr_radio["oilrig_ns2_plantingcharge"] = "oilrig_ns2_plantingcharge";
    level.scr_radio["oilrig_ns1_plantfrmcharge"] = "oilrig_ns1_plantfrmcharge";
    level.scr_radio["oilrig_ns2_plantfrmcharge"] = "oilrig_ns2_plantfrmcharge";
    level.scr_radio["oilrig_ns1_watchfieldfire"] = "oilrig_ns1_watchfieldfire";
    level.scr_radio["oilrig_ns2_checktargets"] = "oilrig_ns2_checktargets";
    level.scr_radio["oilrig_ns1_onmarkgo"] = "oilrig_ns1_onmarkgo";
    level.scr_radio["oilrig_ns1_onmymark"] = "oilrig_ns1_onmymark";
    level.scr_radio["oilrig_ns1_go"] = "oilrig_ns1_go";
    level.scr_radio["oilrig_ns2_onmarkgo"] = "oilrig_ns2_onmarkgo";
    level.scr_radio["oilrig_ns2_onmymark"] = "oilrig_ns2_onmymark";
    level.scr_radio["oilrig_ns2_go"] = "oilrig_ns2_go";
    level.scr_radio["oilrig_ns1_breachwatchfire"] = "oilrig_ns1_breachwatchfire";
    level.scr_radio["oilrig_ns2_breachchecktarg"] = "oilrig_ns2_breachchecktarg";
    level.scr_radio["oilrig_roomclear_ghost_00"] = "oilrig_ns1_wereclear";
    level.scr_radio["oilrig_roomclear_ghost_01"] = "oilrig_ns1_roomclear";
    level.scr_radio["oilrig_roomclear_ghost_02"] = "oilrig_ns1_clear";
    level.scr_radio["oilrig_roomclear_ghost_03"] = "oilrig_ns2_wereclear";
    level.scr_radio["oilrig_roomclear_ghost_04"] = "oilrig_ns2_roomclear";
    level.scr_radio["oilrig_roomclear_ghost_05"] = "oilrig_ns2_clear";
    level.scr_radio["oilrig_nsl_wereclear"] = "oilrig_nsl_wereclear";
    level.scr_radio["oilrig_nsl_roomclear"] = "oilrig_nsl_roomclear";
    level.scr_radio["oilrig_nsl_clear"] = "oilrig_nsl_clear";
    level.scr_radio["oilrig_hostsec_00"] = "oilrig_nsl_preciouscargo";
    level.scr_radio["oilrig_hostsec_01"] = "oilrig_nsl_hostsec";
    level.scr_radio["oilrig_sbc_secandevac"] = "oilrig_sbc_secandevac";
    level.scr_sound["generic"]["oilrig_hst1_5lang"] = "oilrig_hst1_5lang";
    level.scr_sound["generic"]["oilrig_hst1_5lang2"] = "oilrig_hst1_5lang2";
    level.scr_radio["oilrig_deck2_movenag_start"] = "oilrig_nsl_moveupstairs";
    level.scr_radio["oilrig_deck2_movenag_00"] = "oilrig_nsl_watchsectors";
    level.scr_radio["oilrig_deck2_movenag_01"] = "oilrig_nsl_deck2";
    level.scr_radio["oilrig_deck2_movenag_02"] = "oilrig_nsl_letsmove";
    level.scr_radio["room1_manhandler_nag_00"] = "oilrig_ns2_gettopside";
    level.scr_radio["room1_manhandler_nag_01"] = "oilrig_ns2_regrouptopside";
    level.scr_radio["room1_manhandler_nag_03"] = "oilrig_ns2_moveup";
    level.scr_radio["room1_manhandler_nag_02"] = "oilrig_ns2_getmoving";
    level.scr_radio["oilrig_sbc_lowprofile"] = "oilrig_sbc_lowprofile";
    level.scr_radio["oilrig_nsl_rogerthat"] = "oilrig_nsl_rogerthat";
    level.scr_radio["oilrig_heloapproach_00"] = "oilrig_ns1_heloapproach";
    level.scr_radio["oilrig_heloapproach_01"] = "oilrig_ns2_helogetdown";
    level.scr_radio["oilrig_heloapproach_02"] = "oilrig_ns1_chopperinbound";
    level.scr_radio["oilrig_heloapproach_03"] = "oilrig_nsl_getouttasight";
    level.scr_radio["dialogue_heli_all_clear_00"] = "oilrig_nsl_okmove";
    level.scr_radio["dialogue_heli_all_clear_01"] = "oilrig_nsl_move";
    level.scr_radio["dialogue_heli_all_clear_02"] = "oilrig_nsl_allclearmove";
    level.scr_radio["dialogue_heli_spotted_00"] = "oilrig_nsl_beenspotted";
    level.scr_radio["dialogue_heli_spotted_01"] = "oilrig_nsl_compsomised";
    level.scr_radio["dialogue_heli_spotted_03"] = "oilrig_nsl_detected";
    level.scr_radio["oilrig_sbc_hostatposition"] = "oilrig_sbc_hostatposition";
    level.scr_sound["soap"]["oilrig_nsl_copythat"] = "oilrig_nsl_copythat";
    level.scr_face["soap"]["oilrig_nsl_copythat"] = %oilrig_nsl_copythat;
    level.scr_sound["soap"]["oilrig_nsl_strongholdsec"] = "oilrig_nsl_strongholdsec";
    level.scr_face["soap"]["oilrig_nsl_strongholdsec"] = %oilrig_nsl_strongholdsec;
    level.scr_radio["oilrig_ns1_havecompany"] = "oilrig_ns1_havecompany";
    level.scr_radio["oilrig_enc_maerhoffer"] = "oilrig_enc_maerhoffer";
    level.scr_radio["oilrig_enc_team5"] = "oilrig_enc_team5";
    level.scr_sound["soap"]["oilrig_nsl_goingloud"] = "oilrig_nsl_goingloud";
    level.scr_face["soap"]["oilrig_nsl_goingloud"] = %oilrig_nsl_goingloud;
    level.scr_radio["oilrig_nsl_plantc4"] = "oilrig_nsl_plantc4";
    level.scr_radio["oilrig_nsl_donthavetime"] = "oilrig_nsl_donthavetime";
    level.scr_radio["oilrig_ns1_forasurprise"] = "oilrig_ns1_forasurprise";
    level.scr_radio["oilrig_ns2_c4placed"] = "oilrig_ns2_c4placed";
    level.scr_radio["oilrig_nsl_ambushthem"] = "oilrig_nsl_ambushthem";
    level.scr_radio["oilrig_nsl_elevatedposwait"] = "oilrig_nsl_elevatedposwait";
    level.scr_radio["oilrig_nsl_holdfire"] = "oilrig_nsl_holdfire";
    maps\_anim::addnotetrack_customfunction( "generic", "soap_scaffold_vo_01", ::soap_scaffold_vo, "soap_go_up_scaffolding", "oilrig_nsl_holdfire" );
    level.scr_radio["oilrig_nsl_standby1"] = "oilrig_nsl_standby1";
    maps\_anim::addnotetrack_customfunction( "generic", "soap_scaffold_vo_02", ::soap_scaffold_vo, "soap_go_up_scaffolding", "oilrig_nsl_standby1" );
    level.scr_radio["oilrig_nsl_standby2"] = "oilrig_nsl_standby2";
    level.scr_anim["soap"]["oilrig_nsl_standby2"] = %h2_oilrig_soap_standbyvo;
    level.scr_radio["oilrig_mrc3_alarm"] = "oilrig_mrc3_alarm";
    level.scr_radio["oilrig_nsl_doit"] = "oilrig_nsl_doit";
    level.scr_anim["soap"]["oilrig_nsl_doit"] = %h2_oilrig_soap_planbvo;
    level.scr_radio["oilrig_nsl_coverblown"] = "oilrig_nsl_coverblown";
    level.scr_radio["oilrig_sbc_possibleexpl"] = "oilrig_sbc_possibleexpl";
    level.scr_radio["oilrig_sbc_secthatloc"] = "oilrig_sbc_secthatloc";
    level.scr_radio["oilrig_nsl_callforexfil"] = "oilrig_nsl_callforexfil";
    level.scr_radio["oilrig_nsl_moveup"] = "oilrig_nsl_moveup";
    level.scr_radio["oilrig_nsl_move2"] = "oilrig_nsl_move2";
    level.scr_radio["oilrig_nsl_centcom"] = "oilrig_nsl_centcom";
    level.scr_radio["oilrig_sbc_gettolz"] = "oilrig_sbc_gettolz";
    level.scr_radio["oilrig_nsl_copythat2"] = "oilrig_nsl_copythat2";
    level.scr_radio["oilrig_ambush_helo_alert_00"] = "oilrig_ns1_getdown";
    level.scr_radio["oilrig_ambush_helo_alert_01"] = "oilrig_ns2_enemyhelo";
    level.scr_radio["oilrig_ambush_helo_alert_02"] = "oilrig_ns1_attackheli";
    level.scr_radio["oilrig_nsl_splitup"] = "oilrig_nsl_splitup";
    level.scr_radio["oilrig_nsl_outflank"] = "oilrig_nsl_outflank";
    level.scr_radio["oilrig_nsl_clocksticking"] = "oilrig_nsl_clocksticking";
    level.scr_radio["oilrig_nsl_rescuethemselves"] = "oilrig_nsl_rescuethemselves";
    level.scr_radio["oilrig_nsl_takeoutbird_00"] = "oilrig_nsl_takeoutbird1";
    level.scr_radio["oilrig_nsl_takeoutbird_01"] = "oilrig_nsl_takeoutbird2";
    level.scr_radio["oilrig_nsl_takeoutbird_02"] = "oilrig_nsl_takeoutbird3";
    level.scr_radio["oilrig_nsl_takeoutbird_03"] = "oilrig_nsl_takeoutbird4";
    level.scr_radio["oilrig_nsl_takeoutbird_04"] = "oilrig_nsl_takeoutbird5";
    level.scr_radio["oilrig_nsl_takeoutbird_withrocket_00"] = "oilrig_nsl_takeoutbird6";
    level.scr_radio["oilrig_nsl_takeoutbird_withrocket_01"] = "oilrig_nsl_takeoutbird7";
    level.scr_radio["oilrig_nsl_takeoutbird_withrocket_02"] = "oilrig_nsl_takeoutbird8";
    level.scr_radio["oilrig_nsl_takeoutbird_withrocket_03"] = "oilrig_nsl_takeoutbird9";
    level.scr_radio["oilrig_ns2_fireat4_00"] = "oilrig_ns2_fireat4";
    level.scr_radio["oilrig_ns2_fireat4_01"] = "oilrig_ns3_firemissile";
    level.scr_radio["oilrig_ns2_fireat4_02"] = "oilrig_ns2_clearshot";
    level.scr_radio["oilrig_use_thermal_00"] = "oilrig_nsl_seethrusmoke";
    level.scr_radio["oilrig_use_thermal_01"] = "oilrig_nsl_gettarget";
    level.scr_radio["oilrig_find_thermal_00"] = "oilrig_nsl_pickoff";
    level.scr_radio["oilrig_find_thermal_01"] = "oilrig_ns3_switching";
    level.scr_radio["oilrig_sbc_hostconfirmed"] = "oilrig_sbc_hostconfirmed";
    level.scr_radio["oilrig_nsl_behinddoors"] = "oilrig_nsl_behinddoors";
    level.scr_radio["oilrig_heli_grats_00"] = "oilrig_ns2_tacoman";
    level.scr_radio["oilrig_heli_grats_01"] = "oilrig_ns3_tacoman";
    level.scr_radio["oilrig_heli_grats_02"] = "oilrig_ns2_goodshot";
    level.scr_radio["oilrig_heli_grats_03"] = "oilrig_ns3_lbneutralized";
    level.scr_radio["oilrig_heli_grats_04"] = "oilrig_ns2_nicework";
    level.scr_radio["oilrig_heli_grats_05"] = "oilrig_ns3_niceshot";
    level.scr_radio["oilrig_fueltanks_00"] = "oilrig_ns3_aimfueltanks";
    level.scr_radio["oilrig_fueltanks_01"] = "oilrig_ns2_shoottanks";
    level.scr_radio["oilrig_fueltanks_02"] = "oilrig_ns3_aimfuelstorage";
    level.scr_radio["oilrig_fueltanks_03"] = "oilrig_nsl_firefuelstorage";
    level.scr_radio["oilrig_enemy_smoke_00"] = "oilrig_ns2_popsmoke";
    level.scr_radio["oilrig_enemy_smoke_01"] = "oilrig_ns2_smokescreen";
    level.scr_radio["oilrig_enemy_smoke_02"] = "oilrig_ns3_enempop";
    level.scr_radio["oilrig_enemy_smoke_03"] = "oilrig_ns3_smokescreen";
    level.scr_radio["oilrig_enemy_smoke_04"] = "oilrig_ns2_hostpopsmoke";
    level.scr_radio["oilrig_nsl_allhostsec"] = "oilrig_nsl_allhostsec";
    level.scr_radio["oilrig_sbc_phase2"] = "oilrig_sbc_phase2";
    level.scr_radio["oilrig_rmv_goplat"] = "oilrig_rmv_goplat";
    level.scr_radio["oilrig_gm1_copies"] = "oilrig_gm1_copies";
    level.scr_radio["oilrig_f15_twof15s"] = "oilrig_f15_twof15s";
    level.scr_radio["oilrig_rmv_bluesky"] = "oilrig_rmv_bluesky";
    level.scr_radio["oilrig_f15_copies"] = "oilrig_f15_copies";
    level.scr_radio["oilrig_rmv_localairspace"] = "oilrig_rmv_localairspace";
    level.scr_radio["oilrig_gm1_hunteractual"] = "oilrig_gm1_hunteractual";
    level.scr_radio["oilrig_rmv_standby"] = "oilrig_rmv_standby";
    level.scr_radio["oilrig_rmv_samsitesneut"] = "oilrig_rmv_samsitesneut";
    level.scr_sound["oilrig_gm1_samssecure"] = "oilrig_gm1_samssecure";
    level.scr_sound["oilrig_mrc_killhostages_room_100_00"] = "oilrig_mrc3_killhostages2";
    level.scr_sound["oilrig_mrc_killhostages_room_100_01"] = "oilrig_mrc2_intruders";
    level.scr_sound["oilrig_mrc_killhostages_room_200_00"] = "oilrig_mrc4_executethem";
    level.scr_sound["oilrig_mrc_killhostages_room_200_01"] = "oilrig_mrc1_killthem";
    level.scr_sound["oilrig_merc_chatter_00"] = "oilrig_mrc1_movingin";
    level.scr_sound["oilrig_merc_chatter_01"] = "oilrig_mrc1_watchmyback";
    level.scr_sound["oilrig_merc_chatter_02"] = "oilrig_mrc1_teammoving";
    level.scr_sound["oilrig_merc_chatter_03"] = "oilrig_mrc1_standby";
    level.scr_sound["oilrig_merc_chatter_04"] = "oilrig_mrc1_onme";
    level.scr_sound["oilrig_merc_chatter_05"] = "oilrig_mrc1_takepoint";
    level.scr_sound["oilrig_merc_chatter_06"] = "oilrig_mrc1_watchcorners";
    level.scr_sound["oilrig_merc_chatter_07"] = "oilrig_mrc2_movingin";
    level.scr_sound["oilrig_merc_chatter_08"] = "oilrig_mrc2_watchmyback";
    level.scr_sound["oilrig_merc_chatter_09"] = "oilrig_mrc2_teammoving";
    level.scr_sound["oilrig_merc_chatter_10"] = "oilrig_mrc2_standby";
    level.scr_sound["oilrig_merc_chatter_11"] = "oilrig_mrc2_onme";
    level.scr_sound["oilrig_merc_chatter_12"] = "oilrig_mrc2_takepoint";
    level.scr_sound["oilrig_merc_chatter_13"] = "oilrig_mrc2_watchcorners";
    level.scr_sound["oilrig_merc_chatter_14"] = "oilrig_mrc3_movingin";
    level.scr_sound["oilrig_merc_chatter_15"] = "oilrig_mrc3_watchmyback";
    level.scr_sound["oilrig_merc_chatter_16"] = "oilrig_mrc3_teammoving";
    level.scr_sound["oilrig_merc_chatter_17"] = "oilrig_mrc3_standby";
    level.scr_sound["oilrig_merc_chatter_18"] = "oilrig_mrc3_onme";
    level.scr_sound["oilrig_merc_chatter_19"] = "oilrig_mrc3_takepoint";
    level.scr_sound["oilrig_merc_chatter_20"] = "oilrig_mrc3_watchcorners";
}
#using_animtree("player");

player_anims()
{
    level.scr_animtree["worldbody"] = #animtree;
    level.scr_model["worldbody"] = "h2_gfl_st_ar15_viewbody";
    level.scr_anim["worldbody"]["smoker_takedown"] = %h2_oilrig_smoker_takedown_player;
    level.scr_animtree["player_rig"] = #animtree;
    level.scr_model["player_rig"] = "h2_gfl_st_ar15_viewhands_player";
    level.scr_anim["player_rig"]["underwater_player_start"] = %oilrig_sub_a_disembark_player;
    level.scr_anim["player_rig"]["player_stealth_kill"] = %h2_oilrig_underwater_kill_player;
    maps\_anim::addnotetrack_attach( "player_rig", "knife", "weapon_parabolic_knife", "tag_weapon_right", "player_stealth_kill" );
    maps\_anim::addnotetrack_detach( "player_rig", "putback", "weapon_parabolic_knife", "tag_weapon_right", "player_stealth_kill" );
    maps\_anim::addnotetrack_customfunction( "player_rig", "throat", _id_AA61::_id_D413 );
    maps\_anim::addnotetrack_customfunction( "player_rig", "", _id_AA61::_id_B9EA );
    maps\_anim::addnotetrack_customfunction( "player_rig", "drips_right", _id_AA61::_id_C9C1 );
    maps\_anim::addnotetrack_customfunction( "player_rig", "exit_sub_tube", maps\oilrig_aud::_id_B117 );
    level.scr_anim["player_rig"]["player_evac"] = %blackout_bh_evac_player;
    level.scr_anim["worldbody"]["c4bodywall"] = %h2_oilrig_hidingthec4_c4bodywall_player;
    level.scr_anim["worldbody"]["c4bodyground"] = %h2_oilrig_hidingthec4_c4bodyground_player;
    level.scr_anim["worldbody"]["c4bodyground2"] = %h2_oilrig_hidingthec4_c4bodyground2_player;
    maps\_anim::addnotetrack_customfunction( "worldbody", "c4_detach", ::_id_BC3B );
    level.scr_anim["worldbody"]["escape_in"] = %h2_oilrig_helipad_escape_player_in_alt;
    level.scr_anim["worldbody"]["escape_idle"][0] = %h2_oilrig_helipad_escape_player_idle;
    level.scr_anim["worldbody"]["escape_departure"] = %h2_oilrig_helipad_escape_player_departure;
    maps\_anim::addnotetrack_flag( "worldbody", "gun_outofview", "player_switches_weapon_on_littlebird", "escape_departure" );
}

_id_BC3B( var_0 )
{
    level.player._id_C147.origin = var_0 gettagorigin( "tag_weapon_left" );
    level.player._id_C147.angles = var_0 gettagangles( "tag_weapon_left" );
    level.player._id_C147.oldorigin = level.player._id_C147.origin;
    waitframe();
    var_0 detach( "weapon_c4", "tag_weapon_left" );
    level.player._id_C147 show();
}
#using_animtree("vehicles");

_id_A850()
{
    level.scr_anim["sdv_01"]["intro_sequence"] = %oilrig_sdv_1;
    level.scr_anim["sdv_02"]["intro_sequence"] = %oilrig_sdv_2;
    level.scr_animtree["submarine_01"] = #animtree;
    level.scr_animtree["sdv_01"] = #animtree;
    level.scr_animtree["sdv_02"] = #animtree;
}

_id_B5B5()
{
    level.scr_anim["blackhawk"]["idle"][0] = %blackout_bh_evac_heli_idle;
    level.scr_anim["blackhawk"]["landing"] = %blackout_bh_evac_heli_land;
    level.scr_anim["blackhawk"]["take_off"] = %blackout_bh_evac_heli_takeoff;
    level.scr_anim["blackhawk"]["rotors"] = %bh_rotors;
    level.scr_animtree["blackhawk"] = #animtree;
}

_id_9D7F()
{
    level.scr_animtree["attack_littlebird"] = #animtree;
    level.scr_anim["attack_littlebird"]["front_react"] = %h2_littlebird_hit_front_react;
}
#using_animtree("generic_human");

_id_BB5C()
{
    level.scr_anim["generic"]["oilrig_seal_surface_fins_off"] = %oilrig_seal_surface_fins_off;
    level.scr_anim["generic"]["oilrig_seal_surface_mask_off"] = %oilrig_seal_surface_mask_off;
    level.scr_anim["generic"]["oilrig_seal_surface_rebreather_off_guy1"] = %h2_oilrig_seal_surface_rebreather_off_guy1;
    level.scr_anim["generic"]["oilrig_seal_surface_rebreather_off_guy2"] = %h2_oilrig_seal_surface_rebreather_off_guy2;
}

_id_D2C8()
{
    level.scr_anim["generic"]["smoker_takedown"] = %h2_oilrig_smoker_takedown_npc;
    maps\_anim::addnotetrack_customfunction( "generic", "detach_hat", ::helmetpop_wrapper, "smoker_takedown", ( 0.0, 0.0, 0.0 ) );
}

helmetpop_wrapper( var_0, var_1 )
{
    var_0 animscripts\death::helmetpop( var_1 );
}
#using_animtree("script_model");

_id_C902()
{
    level.scr_animtree["fins_off_oilrig_seal_surface_fins_off"] = #animtree;
    level.scr_anim["fins_off_oilrig_seal_surface_fins_off"]["oilrig_seal_surface_fins_off_prop"] = %oilrig_seal_surface_fins_off_prop;
    level.scr_model["fins_off_oilrig_seal_surface_fins_off"] = "prop_seal_udt_flippers";
    level.scr_animtree["mask_off_oilrig_seal_surface_mask_off"] = #animtree;
    level.scr_anim["mask_off_oilrig_seal_surface_mask_off"]["oilrig_seal_surface_mask_off_prop"] = %oilrig_seal_surface_mask_off_prop;
    level.scr_model["mask_off_oilrig_seal_surface_mask_off"] = "prop_seal_udt_goggles";
    level.scr_animtree["rebreather_off_oilrig_seal_surface_rebreather_off_guy1"] = #animtree;
    level.scr_anim["rebreather_off_oilrig_seal_surface_rebreather_off_guy1"]["oilrig_seal_surface_rebreather_off_guy1_prop"] = %oilrig_seal_surface_rebreather_off_guy1_prop;
    level.scr_model["rebreather_off_oilrig_seal_surface_rebreather_off_guy1"] = "prop_seal_udt_draeger";
    level.scr_animtree["rebreather_off_oilrig_seal_surface_rebreather_off_guy2"] = #animtree;
    level.scr_anim["rebreather_off_oilrig_seal_surface_rebreather_off_guy2"]["oilrig_seal_surface_rebreather_off_guy2_prop"] = %oilrig_seal_surface_rebreather_off_guy2_prop;
    level.scr_model["rebreather_off_oilrig_seal_surface_rebreather_off_guy2"] = "prop_seal_udt_draeger";
    level.scr_animtree["submarine_02"] = #animtree;
    level.scr_anim["submarine_02"]["intro_sequence"] = %oilrig_sub_2;
    level.scr_model["submarine_02"] = "vehicle_submarine_nuclear";
    level.scr_animtree["animated_crane_hook"] = #animtree;
    level.scr_anim["animated_crane_hook"]["idle"][0] = %h2_rec_exolab_crane_hook_idle;
    level.scr_model["animated_crane_hook"] = "h2_rec_exolab_crane_hook_animated";
}

_id_AD4E( var_0, var_1, var_2, var_3 )
{
    var_4 = maps\_utility::spawn_anim_model( var_0 );
    var_4 hide();
    var_2 maps\_anim::anim_first_frame_solo( var_4, var_1 );
    common_scripts\utility::flag_wait( var_3 );
    var_4 show();
    var_2 maps\_anim::anim_single_solo( var_4, var_1 );
    var_4 hide();
}

_id_BEA9()
{
    level.scr_animtree["rope"] = #animtree;
    level.scr_anim["rope"]["oilrig_rappelrope_2_crouch"] = %oilrig_rappelrope_2_crouch;
    level.scr_anim["rope"]["oilrig_rappelrope_over_rail_R"] = %oilrig_rappelrope_over_rail_r;
}

_id_C8F4()
{
    level._id_A98C = [];
    level._id_A98C = common_scripts\utility::array_add( level._id_A98C, "exploder_script_model" );
    _id_BAF7();
}

_id_BAF7()
{
    level.scr_animtree["exploder_script_model"] = #animtree;
    level.scr_anim["exploder_script_model"]["h2_oilrig_c4room_wires_anim"] = %h2_oilrig_c4room_wires_anim;
}

_id_C3F3()
{
    level.scr_animtree["h2_chains_02_without_attach_animated"] = #animtree;
    level.scr_model["h2_chains_02_without_attach_animated"] = "h2_chains_02_without_attach_animated";
    level.scr_anim["h2_chains_02_without_attach_animated"]["idle"][0] = %h2_gulag_hanging_chains_03;
    level.scr_animtree["h2_cs_chain_accessories_hanging_loop_long"] = #animtree;
    level.scr_model["h2_cs_chain_accessories_hanging_loop_long"] = "h2_cs_chain_accessories_hanging_loop_long";
    level.scr_anim["h2_cs_chain_accessories_hanging_loop_long"]["idle"][0] = %h2_gulag_hanging_chains_01;
}

weapon_anims()
{
    level.scr_animtree["weapon_m14"] = #animtree;
    level.scr_model["weapon_m14"] = "h2_weapon_m14ebr_scoped_arctic";
    level.scr_anim["weapon_m14"]["escape_departure"] = %h2_oilrig_helipad_escape_weapon_departure;
}

script_model()
{
    level.scr_animtree["door"] = #animtree;
    level.scr_anim["door"]["doorOpen1"] = %h2_room2a_takedown_door;
    level.scr_anim["door"]["doorOpen2"] = %h2_room2b_takedown_door;
}

opendoor( var_0, var_1 )
{
    var_2 = getent( "door_deck1_animated", "targetname" );
    var_2 thread maps\_utility::play_sound_on_entity( "scn_oilrig_open_deck1_door" );
    var_2 maps\_anim::anim_single_solo( var_2, var_1 );
}

animated_palette()
{
    level.scr_animtree["h2_suspended_palette"] = #animtree;
    level.scr_model["h2_suspended_palette"] = "oilrig_suspended_palette_animated";
    level.scr_anim["h2_suspended_palette"]["idle"][0] = %h2_suspended_palette_idle;
}

soap_scaffold_vo( var_0, var_1 )
{
    if ( !common_scripts\utility::flag( "ambush_c4_triggered" ) && !common_scripts\utility::flag( "ambush_enemies_alerted_prematurely" ) )
        var_0 thread maps\_utility::radio_dialogue( var_1 );
}
