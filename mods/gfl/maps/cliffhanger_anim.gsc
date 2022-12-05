// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_A902()
{
    generic_human();
    script_models();
    _id_A930();
    player_anims();
    vehicles();
    _id_A977();
    dialog();
    _id_B86C();
    thread _id_D082();
}

_id_B86C()
{
    level._id_D115["planting_c4"]["origin"] = ( -5621.0, -28756.0, 896.0 );
    level._id_D115["planting_c4"]["angles"] = ( 0.0, 0.0, 0.0 );
    var_0 = getent( "acs_node", "targetname" );
    level._id_D115["pickup_acs"]["origin"] = var_0.origin;
    level._id_D115["pickup_acs"]["angles"] = var_0.angles;
}

_id_D082()
{
    waittillframeend;
    maps\_anim::addonstart_animsound( "worldbody", "enter_climb_from_ledge_right", "scn_cliff_plr_initial_pic" );
    maps\_anim::addnotetrack_customfunction( "worldbody", "start_scene_mix", maps\cliffhanger_aud::_id_AA40, "enter_climb_from_ledge_right" );
    maps\_anim::addnotetrack_customfunction( "worldbody", "stop_scene_mix", maps\cliffhanger_aud::_id_B768, "enter_climb_from_ledge_right" );
    maps\_anim::addnotetrack_animsound( "worldbody", "enter_climb_from_stand_start_left", "swing", "icepick_swing" );
    maps\_anim::addnotetrack_animsound( "worldbody", "enter_climb_from_stand_start_right", "swing", "icepick_swing" );

    for ( var_0 = 1; var_0 < 10; var_0++ )
    {
        maps\_anim::addonstart_animsound( "worldbody", "iceaxeclimbing_right_" + var_0, "icepick_swing" );
        maps\_anim::addonstart_animsound( "worldbody", "iceaxeclimbing_left_" + var_0, "icepick_swing" );
    }

    maps\_anim::addonstart_animsound( "worldbody", "iceaxeclimbing_right_10", "icepick_swing" );
    maps\_anim::addonstart_animsound( "worldbody", "iceaxeclimbing_left_10", "icepick_swing" );
    maps\_anim::addonstart_animsound( "price", "hangar_waiting", "scn_cliff_soap_open_door_01" );
    maps\_anim::addonstart_animsound( "price", "hunted_open_barndoor", "scn_cliff_soap_open_door_02" );
    maps\_anim::addonstart_animsound( "acs_module", "pickup_acs", "scn_disconnect_acs" );
    maps\_anim::addonstart_animsound( "price", "ledge_climb", "scn_cliff_soap_separation_climb" );
    maps\_anim::addonstart_animsound( "worldbody", "double_takedown", "scn_cliffhanger_dual_takedown" );
    maps\_anim::addonstart_animsound( "worldbody", "throatstab", "scn_relaxed_guard_chair_death" );
    maps\_anim::addonstart_animsound( "worldbody", "planting_c4", "scn_cliffhanger_plant_c4" );
    maps\_anim::addonstart_animsound( "price", "icepick_fight", "scn_cliffhanger_price_icepick_fight" );
    maps\_anim::addonstart_animsound( "worldbody", "mounting_snowmobile_left", "scn_cliff_plr_snowmobile_geton" );
    maps\_anim::addonstart_animsound( "worldbody", "mounting_snowmobile_right", "scn_cliff_plr_snowmobile_geton" );
    maps\_anim::addonstart_animsound( "snowmobile_player", "cliffhanger_ending", "scn_cliff_plr_snowmobile_ending" );
}
#using_animtree("generic_human");

_id_A977()
{
    level.scr_anim["price_a"]["climbing_test_scene"] = %cliff_hero1_pose_a;
    level.scr_anim["cake_a"]["climbing_test_scene"] = %cliff_hero2_pose_a;
    level.scr_anim["price_b"]["climbing_test_scene"] = %cliff_hero1_pose_b;
    level.scr_anim["cake_b"]["climbing_test_scene"] = %cliff_hero2_pose_b;
    level.scr_anim["price_c"]["climbing_test_scene"] = %cliff_hero1_pose_c;
    level.scr_anim["cake_c"]["climbing_test_scene"] = %cliff_hero2_pose_c;
    level.scr_anim["price_d"]["climbing_test_scene"] = %cliff_hero1_pose_d;
    level.scr_anim["cake_d"]["climbing_test_scene"] = %cliff_hero2_pose_d;
    level.scr_anim["price_jump"]["climbing_test_jump1"] = %cliff_hero1_pose_jump1;
    level.scr_anim["price_jump"]["climbing_test_jump2"] = %cliff_hero1_pose_jump2;
    level.scr_anim["price_jump"]["climbing_test_jump3"] = %cliff_hero1_pose_jump3;
    level.scr_anim["price_jump"]["climbing_test_jump4"] = %cliff_hero1_pose_jump4;
    level.scr_anim["price_jump"]["climbing_test_jump5"] = %cliff_hero1_pose_jump5;
    level.scr_anim["price_jump"]["climbing_test_jump6"] = %cliff_hero1_pose_jump6;
}

generic_human()
{
    level.scr_anim["price"]["hunted_open_barndoor_stop"] = %hunted_open_barndoor_idle;
    level.scr_anim["price"]["hunted_open_barndoor_idle"][0] = %hunted_open_barndoor_idle;
    level.scr_anim["price"]["evac"] = %blackout_bh_evac_1;
    level.scr_anim["generic"]["cliffdeath_1"] = %death_run_onfront;
    level.scr_anim["generic"]["cliffdeath_2"] = %death_run_onleft;
    level.scr_anim["generic"]["cliffdeath_3"] = %death_run_forward_crumple;
    level.scr_anim["generic"]["cliffdeath_4"] = %run_death_roll;
    level.scr_anim["price"]["casual_crouch_exit"] = %h2_casual_crouch_exit;
    level.scr_anim["price"]["casual_crouch_exit_clifftop"] = %crouchwalk_2_crouch_start_8;
    level.scr_anim["price"]["hill_slide"] = %h2_cliffhanger_price_hill_slide;
    level.scr_anim["price"]["crash_rescue"] = %cliffhanger_crash_rescue_price;
    level.scr_anim["generic"]["balcony_death"] = %death_explosion_run_f_v2;
    level.scr_anim["price"]["soap_separation"] = %h2_cliffhanger_soap_separation_crouch2ledge;
    level.scr_anim["price"]["soap_separation_run"] = %h2_cliffhanger_soap_separation_run2ledge;
    maps\_anim::addnotetrack_customfunction( "price", "price_land", ::_id_BE41 );
    maps\_anim::addnotetrack_customfunction( "price", "price_land_settle", ::_id_D4E5 );
    maps\_anim::addnotetrack_customfunction( "price", "price_slide_start", ::_id_AF5D, undefined, [ "J_Ankle_LE" ] );
    maps\_anim::addnotetrack_customfunction( "price", "price_slide_end", ::_id_C251 );
    maps\_hand_signals::inithandsignals();
    level.scr_anim["generic"]["lean_balcony"][0] = %killhouse_gaz_idleb;
    level.scr_anim["generic"]["lean_balcony"][1] = %killhouse_gaz_idleb;
    level.scr_anim["generic"]["lean_balcony"][2] = %killhouse_gaz_idleb;
    level.scr_anim["generic"]["lean_balcony"][3] = %killhouse_gaz_idleb;
    level.scr_anim["generic"]["lean_balcony"][4] = %killhouse_gaz_talk_side;
    level.scr_anim["generic"]["lean_react"] = %exposed_idle_reactb;
    level.scr_anim["generic"]["sit_idle"][0] = %breach_chair_idle_v2;
    level.scr_anim["generic"]["sit_react"] = %breach_chair_reaction_v2;
    level.scr_anim["generic"]["party1"][0] = %coup_guard1_idle;
    level.scr_anim["generic"]["party1"][1] = %coup_guard1_jeer;
    level.scr_anim["generic"]["party1_react"] = %breach_chair_reaction_v2;
    level.scr_anim["generic"]["party2"][0] = %coup_guard2_idle;
    level.scr_anim["generic"]["party2"][1] = %coup_guard2_jeera;
    level.scr_anim["generic"]["party2"][2] = %coup_guard2_jeerb;
    level.scr_anim["generic"]["party2"][3] = %coup_guard2_jeerc;
    level.scr_anim["generic"]["party2_react"] = %breach_chair_reaction_v2;
    level.scr_anim["generic"]["alert2look_cornerR"] = %corner_standr_alert_2_look;
    level.scr_anim["generic"]["look_idle_cornerR"][0] = %corner_standr_look_idle;
    level.scr_anim["generic"]["look2alert_cornerR"] = %corner_standr_look_2_alert;
    level.scr_anim["generic"]["look_up_stand"] = %coverstand_look_moveup;
    level.scr_anim["generic"]["look_idle_stand"][0] = %coverstand_look_idle;
    level.scr_anim["generic"]["look_down_stand"] = %coverstand_look_movedown;
    level.scr_anim["generic"]["alert2look_cornerL"] = %corner_standl_alert_2_look;
    level.scr_anim["generic"]["look_idle_cornerL"][0] = %corner_standl_look_idle;
    level.scr_anim["generic"]["look2alert_cornerL"] = %corner_standl_look_2_alert;
    level.scr_anim["generic"]["run_2_crouch_F"] = %run_2_crouch_f;
    level.scr_anim["generic"]["run_2_crouch_90R"] = %run_2_crouch_90r;
    level.scr_anim["generic"]["crouch_aim_arrive"] = %exposed_crouch_aim_5;
    level.scr_anim["generic"]["crouch_aim"][0] = %exposed_crouch_aim_5;
    level.scr_anim["generic"]["crouch_2run_L"] = %crouch_2run_l;
    level.scr_anim["generic"]["exposed_crouch_flinchR"] = %exposed_crouch_pain_right_arm;
    level.scr_anim["price"]["ledge_climb"] = %h2_cliffhanger_soap_separation_ledgeclimb;
    level.scr_anim["generic"]["c4plant"] = %cliffhanger_c4_setup;
    level.scr_anim["price"]["icepick_fight"] = %h2_cliffhanger_icepick_fight_price;
    maps\_anim::addnotetrack_attach( "price", "attach pick", "weapon_ice_picker", "TAG_INHAND", "icepick_fight" );
    maps\_anim::addnotetrack_detach( "price", "drop pick", "weapon_ice_picker", "TAG_INHAND", "icepick_fight" );
    level.scr_anim["driver"]["icepick_deathA"] = %cliffhanger_icepick_fight_driver_deatha;
    level.scr_anim["driver"]["icepick_deathB"] = %cliffhanger_icepick_fight_driver_deathb;
    level.scr_anim["driver"]["icepick_fight"] = %cliffhanger_icepick_fight_driver;
    maps\_anim::addnotetrack_customfunction( "driver", "deathA", ::_id_C82E, "icepick_fight" );
    maps\_anim::addnotetrack_customfunction( "driver", "deathB", ::_id_CD46, "icepick_fight" );
    level.scr_anim["passenger"]["icepick_fight"] = %h2_cliffhanger_icepick_fight_passenger;
    maps\_anim::addnotetrack_customfunction( "passenger", "dropgun", ::ai_kill, "icepick_fight" );
    level.scr_anim["generic"]["snowmobile_driver_climb_out"] = %pickup_passenger_climb_out;
    level.scr_anim["generic"]["snowmobile_passenger_climb_out"] = %pickup_driver_climb_out;
    level.scr_anim["generic"]["prone_death_quickdeath"] = %prone_death_quickdeath;
    level.scr_anim["generic"]["death_shotgun_back_v2"] = %death_shotgun_back_v1;
    level.scr_anim["price"]["hangar_waiting_loop"][0] = %h2_cliffhanger_hangar_entrance_loop;
    level.scr_anim["price"]["hangar_waiting"] = %h2_cliffhanger_hangar_entrance_soap_part01;
    maps\_anim::addnotetrack_dialogue( "price", "dialog", "hangar_waiting", "cliff_pri_scenicroute" );
    maps\_anim::addnotetrack_dialogue( "price", "dialog", "hangar_waiting", "cliff_pri_letsgo" );
    level.scr_anim["price"]["hunted_open_barndoor"] = %h2_cliffhanger_hangar_entrance_soap_part02;
    level.scr_anim["price"]["run_to_snowmobile"] = %h2_cliffhanger_snowmobile_soap;
    level.scr_anim["generic"]["throatstab"] = %h2_cliffhanger_throatstab_npc;
    level.scr_anim["leftguy"]["double_takedown"] = %h2_cliffhanger_dualtakedown_sequence_soldierleft;
    level.scr_goaltime["leftguy"]["double_takedown"] = 1;
    level.scr_anim["rightguy"]["double_takedown"] = %h2_cliffhanger_dualtakedown_sequence_soldierright;
    level.scr_anim["price"]["locker_brawl"] = %h2_cliffhanger_lockerroom_fight_price;
    maps\_anim::addnotetrack_customfunction( "price", "locker slam", ::_id_D44F, "locker_brawl" );
    maps\_anim::addnotetrack_attach( "price", "knife attach", "weapon_parabolic_knife", "TAG_INHAND", "locker_brawl" );
    maps\_anim::addnotetrack_detach( "price", "knife detach", "weapon_parabolic_knife", "TAG_INHAND", "locker_brawl" );
    level.scr_anim["defender"]["locker_brawl"] = %h2_cliffhanger_lockerroom_fight_guard;
    maps\_anim::addnotetrack_customfunction( "defender", "ignoreall", ::_id_B749, "locker_brawl" );
    maps\_anim::addnotetrack_customfunction( "defender", "dropgun", ::ai_kill, "locker_brawl" );
    level.scr_anim["generic"]["crouch_walk_start_1"] = %launchfacility_b_ventwalk_v1_start;
    level.scr_anim["generic"]["crouch_walk_stop_1"] = %launchfacility_b_ventwalk_v1_stop;
    level.scr_anim["generic"]["crouch_walk_stop_1_idle"][0] = %launchfacility_b_ventwalk_stop_idle;
    level.scr_anim["generic"]["crouch_walk_1"] = %launchfacility_b_ventwalk_v1_cycle;
    level.scr_anim["generic"]["crouch_walk_1_twitch"] = %launchfacility_b_ventwalk_v1_twitch;
    level.scr_anim["generic"]["crouch_walk_start_2"] = %launchfacility_b_ventwalk_v2_start;
    level.scr_anim["generic"]["crouch_walk_stop_2"] = %launchfacility_b_ventwalk_v2_stop;
    level.scr_anim["generic"]["crouch_walk_stop_2_idle"][0] = %launchfacility_b_ventwalk_v2_stopidle;
    level.scr_anim["generic"]["crouch_walk_2"] = %launchfacility_b_ventwalk_v2_cyclea;
    level.scr_anim["generic"]["crouch_walk_2_twitch1"] = %launchfacility_b_ventwalk_v2_twitcha;
    level.scr_anim["generic"]["crouch_walk_2_twitch2"] = %launchfacility_b_ventwalk_v2_twitchb;
    level.scr_anim["welder_wing"]["welding"][0] = %h2_cliffhanger_welder_wing_idle;
    level.scr_anim["welder_engine"]["welding"][0] = %h2_cliffhanger_welder_engine_idle;
    level.scr_anim["welder_wing"]["death_back"] = %h2_cliffhanger_welder_wing_idle_death_back;
    level.scr_anim["welder_engine"]["death_back"] = %h2_cliffhanger_welder_engine_idle_death_back;
    level.scr_anim["price"]["capture_idle"][0] = %h2_cliffhanger_capture_price_idle;
    level.scr_anim["price"]["capture_pullout"] = %h2_cliffhanger_capture_price_pullout;
    level.scr_anim["price"]["capture_death"] = %h2_cliffhanger_capture_price_death;
    level.scr_anim["price"]["capture_intro"] = %h2_cliffhanger_capture_price_start;
    level.scr_anim["guard1"]["runin_in"] = %h2_cliffhanger_capture_guard01_in;
    level.scr_anim["guard2"]["runin_in"] = %h2_cliffhanger_capture_guard02_in;
    level.scr_anim["guard3"]["runin_in"] = %h2_cliffhanger_capture_guard03_in;
    level.scr_anim["guard4"]["runin_in"] = %h2_cliffhanger_capture_guard04_in;
    level.scr_anim["guard5"]["runin_in"] = %h2_cliffhanger_capture_guard05_in;
    level.scr_anim["guard6"]["runin_in"] = %h2_cliffhanger_capture_guard06_in;
    level.scr_anim["petrov"]["runin_in"] = %h2_cliffhanger_capture_petrov_in;
    maps\_anim::addnotetrack_customfunction( "petrov", "dialog_price", maps\cliffhanger_aud::_id_CA50, "runin_in" );
    maps\_anim::addnotetrack_dialogue( "petrov", "dialog", "runin_in", "cliff_pet_thisispetrov" );
    maps\_anim::addnotetrack_attach( "petrov", "attach_megaphone", "h2_ch_megaphone_rig", "TAG_INHAND", "runin_in" );
    level.scr_anim["guard1"]["runin_optional"] = %h2_cliffhanger_capture_guard01_opt_loop;
    level.scr_anim["guard2"]["runin_optional"] = %h2_cliffhanger_capture_guard02_opt_loop;
    level.scr_anim["guard3"]["runin_optional"] = %h2_cliffhanger_capture_guard03_opt_loop;
    level.scr_anim["guard4"]["runin_optional"] = %h2_cliffhanger_capture_guard04_opt_loop;
    level.scr_anim["guard5"]["runin_optional"] = %h2_cliffhanger_capture_guard05_opt_loop;
    level.scr_anim["guard6"]["runin_optional"] = %h2_cliffhanger_capture_guard06_opt_loop;
    level.scr_anim["petrov"]["runin_optional"] = %h2_cliffhanger_capture_petrov_opt_loop;
    level.scr_anim["guard1"]["runin_comply"] = %h2_cliffhanger_capture_guard01_comply;
    level.scr_anim["guard2"]["runin_comply"] = %h2_cliffhanger_capture_guard02_comply;
    level.scr_anim["guard3"]["runin_comply"] = %h2_cliffhanger_capture_guard03_comply;
    level.scr_anim["guard4"]["runin_comply"] = %h2_cliffhanger_capture_guard04_comply;
    level.scr_anim["guard5"]["runin_comply"] = %h2_cliffhanger_capture_guard05_comply;
    level.scr_anim["guard6"]["runin_comply"] = %h2_cliffhanger_capture_guard06_comply;
    level.scr_anim["petrov"]["runin_comply"] = %h2_cliffhanger_capture_petrov_comply;
    maps\_anim::addnotetrack_dialogue( "petrov", "dialog", "runin_comply", "cliff_pet_fiveseconds" );
    level.scr_anim["guard1"]["runin_comply_wait"] = %h2_cliffhanger_capture_guard01_comply_wait;
    level.scr_anim["guard2"]["runin_comply_wait"] = %h2_cliffhanger_capture_guard02_comply_wait;
    level.scr_anim["guard3"]["runin_comply_wait"] = %h2_cliffhanger_capture_guard03_comply_wait;
    level.scr_anim["guard4"]["runin_comply_wait"] = %h2_cliffhanger_capture_guard04_comply_wait;
    level.scr_anim["guard5"]["runin_comply_wait"] = %h2_cliffhanger_capture_guard05_comply_wait;
    level.scr_anim["guard6"]["runin_comply_wait"] = %h2_cliffhanger_capture_guard06_comply_wait;
    level.scr_anim["petrov"]["runin_comply_wait"] = %h2_cliffhanger_capture_petrov_comply_wait;
    level.scr_anim["guard1"]["runin_out"] = %h2_cliffhanger_capture_guard01_countdown;
    level.scr_anim["guard2"]["runin_out"] = %h2_cliffhanger_capture_guard02_countdown;
    level.scr_anim["guard3"]["runin_out"] = %h2_cliffhanger_capture_guard03_countdown;
    level.scr_anim["guard4"]["runin_out"] = %h2_cliffhanger_capture_guard04_countdown;
    level.scr_anim["guard5"]["runin_out"] = %h2_cliffhanger_capture_guard05_countdown;
    level.scr_anim["guard6"]["runin_out"] = %h2_cliffhanger_capture_guard06_countdown;
    level.scr_anim["petrov"]["runin_out"] = %h2_cliffhanger_capture_petrov_countdown;
    maps\_anim::addnotetrack_dialogue( "petrov", "dialog", "runin_out", "cliff_pet_countfive" );
    maps\_anim::addnotetrack_dialogue( "petrov", "dialog", "runin_out", "cliff_pet_countfour" );
    maps\_anim::addnotetrack_dialogue( "petrov", "dialog", "runin_out", "cliff_pet_countthree" );
    maps\_anim::addnotetrack_dialogue( "petrov", "dialog", "runin_out", "cliff_pet_counttwo" );
    maps\_anim::addnotetrack_dialogue( "petrov", "dialog", "runin_out", "cliff_pet_countone" );
    maps\_anim::addnotetrack_flag( "petrov", "detach_megaphone", "drop_megaphone", "runin_out" );
    level.scr_anim["petrov"]["react"] = %h2_cliffhanger_capture_petrov_react;
    level.scr_anim["guard1"]["react"] = %h2_cliffhanger_capture_guard01_react;
    level.scr_anim["guard2"]["react"] = %h2_cliffhanger_capture_guard02_react;
    level.scr_anim["guard3"]["react"] = %h2_cliffhanger_capture_guard03_react;
    level.scr_anim["guard4"]["react"] = %h2_cliffhanger_capture_guard04_react;
    level.scr_anim["guard5"]["react"] = %h2_cliffhanger_capture_guard05_react;
    level.scr_anim["guard6"]["react"] = %h2_cliffhanger_capture_guard06_react;
    maps\_anim::addnotetrack_flag( "petrov", "detach_megaphone", "drop_megaphone", "react" );
    level.scr_anim["price"]["enter"] = %h2_cliffhanger_hangar_enter;
    maps\_anim::addnotetrack_dialogue( "price", "dialog", "enter", "cliff_pri_goupstairs" );
    level.scr_anim["price"]["satellite_idle"][0] = %h2_cliffhanger_hangar_cycle;
    level.scr_anim["price"]["satellite_idle_breaker"] = %h2_cliffhanger_hangar_cycle_breaker;
    maps\_anim::addnotetrack_dialogue( "price", "dialog", "satellite_idle_breaker", "cliff_pri_downloadfiles" );
    level.scr_anim["generic"]["capture_shoutingA"] = %cqb_stand_shout_a;
    level.scr_anim["generic"]["capture_shoutingB"] = %cqb_stand_shout_b;
    level.scr_anim["generic"]["explosion_reactA"] = %cqb_stand_react_a;
    level.scr_anim["generic"]["explosion_reactB"] = %cqb_stand_react_b;
    level.scr_anim["generic"]["explosion_reactC"] = %cqb_stand_react_c;
    level.scr_anim["generic"]["explosion_reactD"] = %cqb_stand_react_d;
    level.scr_anim["generic"]["explosion_reactE"] = %cqb_stand_react_e;
    level.scr_anim["generic"]["_stealth_patrol_search_a"] = %h2_coldpatrol_gunup_idle_a;
    level.scr_anim["generic"]["_stealth_patrol_search_b"] = %h2_coldpatrol_gunup_idle_b;
    level.scr_anim["generic"]["patrol_cold_huddle"][0] = %patrolwalk_cold_huddle_idle;
    level.scr_anim["generic"]["patrol_cold_huddle"][1] = %patrolwalk_cold_huddle_twitch;
    level.scr_anim["generic"]["patrol_cold_huddle_pause"][0] = %h2_coldpatrol_huddle_idle_a;
    level.scr_anim["generic"]["patrol_cold_huddle_pause"][1] = %h2_coldpatrol_huddle_idle_b;
    level.scr_anim["generic"]["patrol_cold_huddle_stop"] = %patrolwalk_cold_huddle_walk2stand;
    level.scr_anim["generic"]["patrol_cold_huddle_start"] = %patrolwalk_cold_huddle_stand2walk;
    level.scr_anim["generic"]["patrol_cold_huddle_turn180"][0] = %h2_coldpatrol_huddle_turn_180l;
    level.scr_anim["generic"]["patrol_cold_huddle_turn180"][1] = %h2_coldpatrol_huddle_turn_180r;
    level.scr_anim["generic"]["patrol_cold_crossed"][0] = %patrolwalk_cold_crossed_idle;
    level.scr_anim["generic"]["patrol_cold_crossed"][1] = %patrolwalk_cold_crossed_twitch;
    level.scr_anim["generic"]["patrol_cold_crossed_pause"][0] = %h2_coldpatrol_crossed_idle_a;
    level.scr_anim["generic"]["patrol_cold_crossed_pause"][1] = %h2_coldpatrol_crossed_idle_b;
    level.scr_anim["generic"]["patrol_cold_crossed_stop"] = %patrolwalk_cold_crossed_walk2stand;
    level.scr_anim["generic"]["patrol_cold_crossed_start"] = %patrolwalk_cold_crossed_stand2walk;
    level.scr_anim["generic"]["patrol_cold_crossed_turn180"][0] = %h2_coldpatrol_crossed_turn_180l;
    level.scr_anim["generic"]["patrol_cold_crossed_turn180"][1] = %h2_coldpatrol_crossed_turn_180r;
    var_0 = [];
    var_0[0] = 8;
    var_0[1] = 2;
    level.scr_anim["generic"]["patrol_twitch_weights"] = common_scripts\utility::get_cumulative_weights( var_0 );
    level.scr_anim["generic"]["patrol_cold_gunup_search"] = %patrolwalk_cold_gunup_idle;
    level.scr_anim["generic"]["patrol_cold_gunup"][0] = %patrolwalk_cold_gunup_idle;
    level.scr_anim["generic"]["patrol_cold_gunup"][1] = %patrolwalk_cold_gunup_twitcha;
    level.scr_anim["generic"]["patrol_cold_gunup"][2] = %patrolwalk_cold_gunup_twitchb;
    var_0 = [];
    var_0[0] = 4;
    var_0[1] = 3;
    var_0[2] = 3;
    level.scr_anim["generic"]["patrol_gunup_twitch_weights"] = common_scripts\utility::get_cumulative_weights( var_0 );
    level.scr_anim["generic"]["truckride_climbin"] = %traverse_stepup_52;
    level.scr_anim["generic"]["cliffhanger_ending_soldier_1"] = %h2_cliffhanger_ending_soldier01;
    level.scr_anim["generic"]["cliffhanger_ending_soldier_2"] = %h2_cliffhanger_ending_soldier02;
    level.scr_anim["generic"]["cliffhanger_ending_soldier_3"] = %h2_cliffhanger_ending_soldier03;
    level.scr_anim["generic"]["cliffhanger_ending_soldier_4"] = %h2_cliffhanger_ending_soldier04;
    level.scr_anim["price"]["cliffhanger_ending"] = %h2_cliffhanger_ending_soap;
    level.scr_anim["generic"]["sleep_idle"][0] = %h2_cliffhanger_guard_sleeping_idle;
    level.scr_anim["generic"]["sleep_react"] = %h2_cliffhanger_guard_sleeping_react;
    level.scr_anim["generic"]["sleep_react_back"] = %h2_cliffhanger_guard_sleeping_react_back;
    cold_patrol_turn_animations_init();
}

cold_patrol_turn_animations_init()
{
    level.scr_anim["generic"]["patrol_turn_l45_rfoot_huddle"] = %h2_coldpatrol_huddle_turn_left_45r;
    level.scr_anim["generic"]["patrol_turn_l45_lfoot_huddle"] = %h2_coldpatrol_huddle_turn_left_45l;
    level.scr_anim["generic"]["patrol_turn_l90_rfoot_huddle"] = %h2_coldpatrol_huddle_turn_left_90r;
    level.scr_anim["generic"]["patrol_turn_l90_lfoot_huddle"] = %h2_coldpatrol_huddle_turn_left_90l;
    level.scr_anim["generic"]["patrol_turn_l135_rfoot_huddle"] = %h2_coldpatrol_huddle_turn_left_135r;
    level.scr_anim["generic"]["patrol_turn_l135_lfoot_huddle"] = %h2_coldpatrol_huddle_turn_left_135l;
    level.scr_anim["generic"]["patrol_turn_r45_rfoot_huddle"] = %h2_coldpatrol_huddle_turn_right_45r;
    level.scr_anim["generic"]["patrol_turn_r45_lfoot_huddle"] = %h2_coldpatrol_huddle_turn_right_45l;
    level.scr_anim["generic"]["patrol_turn_r90_rfoot_huddle"] = %h2_coldpatrol_huddle_turn_right_90r;
    level.scr_anim["generic"]["patrol_turn_r90_lfoot_huddle"] = %h2_coldpatrol_huddle_turn_right_90l;
    level.scr_anim["generic"]["patrol_turn_r135_rfoot_huddle"] = %h2_coldpatrol_huddle_turn_right_135r;
    level.scr_anim["generic"]["patrol_turn_r135_lfoot_huddle"] = %h2_coldpatrol_huddle_turn_right_135l;
    level.scr_anim["generic"]["patrol_walk_in_lfoot_huddle"] = %h2_coldpatrol_huddle_start_left;
    level.scr_anim["generic"]["patrol_walk_out_lfoot_huddle"] = %h2_coldpatrol_huddle_stop_left;
    level.scr_anim["generic"]["patrol_walk_in_rfoot_huddle"] = %h2_coldpatrol_huddle_start_right;
    level.scr_anim["generic"]["patrol_walk_out_rfoot_huddle"] = %h2_coldpatrol_huddle_stop_right;
    level.scr_anim["generic"]["patrol_turn_l45_rfoot_crossed"] = %h2_coldpatrol_crossed_turn_left_45r;
    level.scr_anim["generic"]["patrol_turn_l45_lfoot_crossed"] = %h2_coldpatrol_crossed_turn_left_45l;
    level.scr_anim["generic"]["patrol_turn_l90_rfoot_crossed"] = %h2_coldpatrol_crossed_turn_left_90r;
    level.scr_anim["generic"]["patrol_turn_l90_lfoot_crossed"] = %h2_coldpatrol_crossed_turn_left_90l;
    level.scr_anim["generic"]["patrol_turn_l135_rfoot_crossed"] = %h2_coldpatrol_crossed_turn_left_135r;
    level.scr_anim["generic"]["patrol_turn_l135_lfoot_crossed"] = %h2_coldpatrol_crossed_turn_left_135l;
    level.scr_anim["generic"]["patrol_turn_r45_rfoot_crossed"] = %h2_coldpatrol_crossed_turn_right_45r;
    level.scr_anim["generic"]["patrol_turn_r45_lfoot_crossed"] = %h2_coldpatrol_crossed_turn_right_45l;
    level.scr_anim["generic"]["patrol_turn_r90_rfoot_crossed"] = %h2_coldpatrol_crossed_turn_right_90r;
    level.scr_anim["generic"]["patrol_turn_r90_lfoot_crossed"] = %h2_coldpatrol_crossed_turn_right_90l;
    level.scr_anim["generic"]["patrol_turn_r135_rfoot_crossed"] = %h2_coldpatrol_crossed_turn_right_135r;
    level.scr_anim["generic"]["patrol_turn_r135_lfoot_crossed"] = %h2_coldpatrol_crossed_turn_right_135l;
    level.scr_anim["generic"]["patrol_walk_in_lfoot_crossed"] = %h2_coldpatrol_crossed_start_left;
    level.scr_anim["generic"]["patrol_walk_out_lfoot_crossed"] = %h2_coldpatrol_crossed_stop_left;
    level.scr_anim["generic"]["patrol_walk_in_rfoot_crossed"] = %h2_coldpatrol_crossed_start_right;
    level.scr_anim["generic"]["patrol_walk_out_rfoot_crossed"] = %h2_coldpatrol_crossed_stop_right;
    level.scr_anim["generic"]["patrol_turn_l45_rfoot_gunup"] = %h2_coldpatrol_gunup_turn_left_45r;
    level.scr_anim["generic"]["patrol_turn_l45_lfoot_gunup"] = %h2_coldpatrol_gunup_turn_left_45l;
    level.scr_anim["generic"]["patrol_turn_l90_rfoot_gunup"] = %h2_coldpatrol_gunup_turn_left_90r;
    level.scr_anim["generic"]["patrol_turn_l90_lfoot_gunup"] = %h2_coldpatrol_gunup_turn_left_90l;
    level.scr_anim["generic"]["patrol_turn_l135_rfoot_gunup"] = %h2_coldpatrol_gunup_turn_left_135r;
    level.scr_anim["generic"]["patrol_turn_l135_lfoot_gunup"] = %h2_coldpatrol_gunup_turn_left_135l;
    level.scr_anim["generic"]["patrol_turn_r45_rfoot_gunup"] = %h2_coldpatrol_gunup_turn_right_45r;
    level.scr_anim["generic"]["patrol_turn_r45_lfoot_gunup"] = %h2_coldpatrol_gunup_turn_right_45l;
    level.scr_anim["generic"]["patrol_turn_r90_rfoot_gunup"] = %h2_coldpatrol_gunup_turn_right_90r;
    level.scr_anim["generic"]["patrol_turn_r90_lfoot_gunup"] = %h2_coldpatrol_gunup_turn_right_90l;
    level.scr_anim["generic"]["patrol_turn_r135_rfoot_gunup"] = %h2_coldpatrol_gunup_turn_right_135r;
    level.scr_anim["generic"]["patrol_turn_r135_lfoot_gunup"] = %h2_coldpatrol_gunup_turn_right_135l;
    level.scr_anim["generic"]["patrol_walk_in_lfoot_gunup"] = %h2_coldpatrol_gunup_star_tleft;
    level.scr_anim["generic"]["patrol_walk_out_lfoot_gunup"] = %h2_coldpatrol_gunup_stop_left;
    level.scr_anim["generic"]["patrol_walk_in_rfoot_gunup"] = %h2_coldpatrol_gunup_start_right;
    level.scr_anim["generic"]["patrol_walk_out_rfoot_gunup"] = %h2_coldpatrol_gunup_stop_right;
}

_id_C82E( var_0 )
{
    var_0 maps\_utility::set_deathanim( "icepick_deathA" );
}

_id_CD46( var_0 )
{
    var_0 maps\_utility::set_deathanim( "icepick_deathB" );
}

_id_BE41( var_0 )
{
    var_1 = var_0 gettagorigin( "J_Ankle_RI" );
    var_1 = physicstrace( var_1 + ( 0.0, 0.0, 64.0 ), var_1 + ( 0.0, 0.0, -64.0 ) );
    playfx( level._effect["price_landing"], var_1 );
}

_id_D4E5( var_0 )
{
    var_1 = var_0 gettagorigin( "J_Ankle_LE" );
    var_1 = physicstrace( var_1 + ( 0.0, 0.0, 64.0 ), var_1 + ( 0.0, 0.0, -64.0 ) );
    playfx( level._effect["price_landing"], var_1 );
}

_id_AF5D( var_0, var_1 )
{
    var_0 endon( "death" );
    var_2 = var_1[0];
    var_0 endon( "stop_slide_fx" );

    for (;;)
    {
        playfxontag( common_scripts\utility::getfx( "price_sliding" ), var_0, var_2 );
        wait 0.1;
    }
}

_id_C251( var_0 )
{
    var_0 notify( "stop_slide_fx" );
}
#using_animtree("script_model");

script_models()
{
    level.scr_animtree["photocopier"] = #animtree;
    level.scr_anim["photocopier"]["photocopier_copying"] = %h2_com_photocopier_animated;
    level.scr_animtree["door"] = #animtree;
    level.scr_anim["door"]["open_door_anim"] = %h2_cliffhanger_hangar_entrance_door;
    level.scr_animtree["satellite"] = #animtree;
    level.scr_anim["satellite"]["price_enter"] = %h2_cliffhanger_hangar_enter_satellite;
    level.scr_anim["satellite"]["satellite_loop"][0] = %h2_cliffhanger_hangar_satellite_loop;
    level.scr_animtree["flag_triangle"] = #animtree;
    level.scr_anim["flag_triangle"]["wind_animation"] = %cliffhanger_triangle_flag_high_wind;
    level.scr_model["flag_triangle"] = "com_triangle_flag";
    level.scr_anim["flag_triangle"]["wind_animation_fast"] = %h2_triangle_flag_heavy_wind_loop;
    level.scr_anim["flag_triangle"]["wind_animation_fast_looped"][0] = %h2_triangle_flag_heavy_wind_loop;
    level.scr_anim["flag_triangle"]["wind_animation_slow"] = %h2_triangle_flag_low_wind_loop;
    level.scr_anim["flag_triangle"]["wind_animation_slow_looped"][0] = %h2_triangle_flag_low_wind_loop;
    level.scr_anim["flag_triangle"]["wind_animation_slow_to_fast"] = %h2_triangle_flag_in;
    level.scr_anim["flag_triangle"]["wind_animation_fast_to_slow"] = %h2_triangle_flag_out;
    level.scr_animtree["locker_1"] = #animtree;
    level.scr_anim["locker_1"]["locker_brawl"] = %h2_cliffhanger_lockerroom_fight_locker_1;
    level.scr_model["locker_1"] = "com_locker_open";
    level.scr_animtree["locker_2"] = #animtree;
    level.scr_anim["locker_2"]["locker_brawl"] = %h2_cliffhanger_lockerroom_fight_locker_2;
    level.scr_model["locker_2"] = "com_locker_open";
    level.scr_animtree["fallingtree"] = #animtree;
    level.scr_anim["fallingtree"]["destroyed_fallen_tree_cliffhanger01"] = %h2_foliage_cliffhanger_snow_tall_broken_fall;
    level.scr_anim["drill"]["enter"] = %cliffhanger_hangar_drill;
    level.scr_model["drill"] = "weapon_power_drill";
    level.scr_animtree["drill"] = #animtree;
    level.scr_animtree["acs_wires"] = #animtree;
    level.scr_model["acs_wires"] = "h2_ACS_wires";
    level.scr_anim["acs_wires"]["pickup_acs"] = %h2_cliffhanger_hangar_acs_wires;
    level.scr_animtree["acs_module"] = #animtree;
    level.scr_model["acs_module"] = "h2_acs_module";
    level.scr_anim["acs_module"]["pickup_acs"] = %h2_cliffhanger_hangar_acs_module;
    level.scr_animtree["chair"] = #animtree;
    level.scr_model["chair"] = "com_folding_chair";
    level.scr_anim["chair"]["throatstab"] = %h2_cliffhanger_throatstab_chair;
    level.scr_goaltime["chair"]["throatstab"] = 0;
    level.scr_anim["chair"]["sleep_react"] = %h2_cliffhanger_guard_sleeping_chair_react;
    level.scr_anim["chair"]["sleep_react_back"] = %h2_cliffhanger_guard_sleeping_chair_react;
    level.scr_anim["chair"]["pain_or_death_react"] = %h2_cliffhanger_guard_sleeping_chair_react;
    level.scr_anim["chair_ak"]["pain_or_death_react"] = %h2_sitting_guard_loadak_death_chair;
    maps\_anim::addnotetrack_customfunction( "chair_ak", "remove_clip", maps\cliffhanger_code::_id_BF9B, "pain_or_death_react" );
    level.scr_animtree["cable"] = #animtree;
    level.scr_anim["cable"]["lab_tank_assembly_cable_slow"][0] = %h2_lab_tank_assembly_cable_slow;
    level.scr_anim["cable"]["lab_tank_assembly_cable_fast"][0] = %h2_lab_tank_assembly_cable_fast;
    level.scr_animtree["pan_metal"] = #animtree;
    level.scr_anim["pan_metal"]["idle"][0] = %h2_com_pan_metal_animated;
    level.scr_animtree["pan_copper"] = #animtree;
    level.scr_anim["pan_copper"]["idle"][0] = %h2_com_pan_copper_animated;
}

_id_D44F( var_0 )
{
    var_1 = getentarray( "locker_dyn_explosion_org", "targetname" );

    foreach ( var_3 in var_1 )
        physicsexplosionsphere( var_3.origin, 100, 80, 0.3 );
}
#using_animtree("animated_props");

_id_A930()
{
    level.scr_animtree["flag_windsock"] = #animtree;
    level.scr_model["flag_windsock"] = "accessories_windsock_animated";
    level.scr_anim["flag_windsock"]["wind_animation_fast"] = %h2_accessories_windsock_animated_fast;
    level.scr_anim["flag_windsock"]["wind_animation_fast_looped"][0] = %h2_accessories_windsock_animated_fast;
    level.scr_anim["flag_windsock"]["wind_animation_slow"] = %h2_accessories_windsock_animated_slow;
    level.scr_anim["flag_windsock"]["wind_animation_slow_looped"][0] = %h2_accessories_windsock_animated_slow;
    level.scr_anim["flag_windsock"]["wind_animation_slow_to_fast"] = %h2_accessories_windsock_animated_fast;
    level.scr_anim["flag_windsock"]["wind_animation_fast_to_slow"] = %h2_accessories_windsock_animated_slow;
    level.scr_animtree["roofvent_snow"] = #animtree;
    level.scr_model["roofvent_snow"] = "com_roofvent1_snow_animated";
    level.scr_anim["roofvent_snow"]["wind_animation_fast"] = %h2_com_roofvent1_snow_idle_spinning;
    level.scr_anim["roofvent_snow"]["wind_animation_fast_looped"][0] = %h2_com_roofvent1_snow_idle_spinning;
    level.scr_anim["roofvent_snow"]["wind_animation_slow"] = %h2_com_roofvent1_snow_stopandspin;
    level.scr_anim["roofvent_snow"]["wind_animation_slow_looped"][0] = %h2_com_roofvent1_snow_stopandspin;
    level.scr_anim["roofvent_snow"]["wind_animation_slow_to_fast"] = %h2_com_roofvent1_snow_idle_spinning;
    level.scr_anim["roofvent_snow"]["wind_animation_fast_to_slow"] = %h2_com_roofvent1_snow_stopandspin;
    level.scr_animtree["campfire_equipment"] = #animtree;
    level.scr_model["campfire_equipment"] = "ch_campfire_equipment_animated";
    level.scr_anim["campfire_equipment"]["wind_animation_fast"] = %h2_ch_campfire_equipment_intense_wind;
    level.scr_anim["campfire_equipment"]["wind_animation_fast_looped"][0] = %h2_ch_campfire_equipment_intense_wind;
    level.scr_anim["campfire_equipment"]["wind_animation_slow"] = %h2_ch_campfire_equipment_medium_wind;
    level.scr_anim["campfire_equipment"]["wind_animation_slow_looped"][0] = %h2_ch_campfire_equipment_medium_wind;
    level.scr_anim["campfire_equipment"]["wind_animation_slow_to_fast"] = %h2_ch_campfire_equipment_intense_wind;
    level.scr_anim["campfire_equipment"]["wind_animation_fast_to_slow"] = %h2_ch_campfire_equipment_medium_wind;
    level.scr_animtree["tracker_flag"] = #animtree;
    level.scr_model["tracker_flag"] = "h2_ch_tracker_flag_animated";
    level.scr_anim["tracker_flag"]["wind_animation_fast"] = %h2_ch_tracker_flag_medium_wind;
    level.scr_anim["tracker_flag"]["wind_animation_fast_looped"][0] = %h2_ch_tracker_flag_medium_wind;
    level.scr_anim["tracker_flag"]["wind_animation_slow"] = %h2_ch_tracker_flag_medium_wind;
    level.scr_anim["tracker_flag"]["wind_animation_slow_looped"][0] = %h2_ch_tracker_flag_medium_wind;
    level.scr_anim["tracker_flag"]["wind_animation_slow_to_fast"] = %h2_ch_tracker_flag_medium_wind;
    level.scr_anim["tracker_flag"]["wind_animation_fast_to_slow"] = %h2_ch_tracker_flag_medium_wind;
    level.scr_animtree["lamps_wires_01"] = #animtree;
    level.scr_model["lamps_wires_01"] = "h2_ch_lamps_wires_01_animated";
    level.scr_anim["lamps_wires_01"]["wind_animation_fast"] = %h2_ch_lamps_wires_tempest_01;
    level.scr_anim["lamps_wires_01"]["wind_animation_fast_looped"][0] = %h2_ch_lamps_wires_tempest_01;
    level.scr_anim["lamps_wires_01"]["wind_animation_slow"] = %h2_ch_lamps_wires_windy_01;
    level.scr_anim["lamps_wires_01"]["wind_animation_slow_looped"][0] = %h2_ch_lamps_wires_windy_01;
    level.scr_anim["lamps_wires_01"]["wind_animation_slow_to_fast"] = %h2_ch_lamps_wires_tempest_01;
    level.scr_anim["lamps_wires_01"]["wind_animation_fast_to_slow"] = %h2_ch_lamps_wires_windy_01;
    level.scr_animtree["lamps_wires_02"] = #animtree;
    level.scr_model["lamps_wires_02"] = "h2_ch_lamps_wires_02_animated";
    level.scr_anim["lamps_wires_02"]["wind_animation_fast"] = %h2_ch_lamps_wires_tempest_02;
    level.scr_anim["lamps_wires_02"]["wind_animation_fast_looped"][0] = %h2_ch_lamps_wires_tempest_02;
    level.scr_anim["lamps_wires_02"]["wind_animation_slow"] = %h2_ch_lamps_wires_windy_02;
    level.scr_anim["lamps_wires_02"]["wind_animation_slow_looped"][0] = %h2_ch_lamps_wires_windy_02;
    level.scr_anim["lamps_wires_02"]["wind_animation_slow_to_fast"] = %h2_ch_lamps_wires_tempest_02;
    level.scr_anim["lamps_wires_02"]["wind_animation_fast_to_slow"] = %h2_ch_lamps_wires_windy_02;
    level.scr_animtree["tent_rope_01"] = #animtree;
    level.scr_model["tent_rope_01"] = "h2_ch_military_tent_rope01_animated";
    level.scr_anim["tent_rope_01"]["wind_animation_fast"] = %h2_ch_military_tent_ropes_shake;
    level.scr_anim["tent_rope_01"]["wind_animation_fast_looped"][0] = %h2_ch_military_tent_ropes_shake;
    level.scr_anim["tent_rope_01"]["wind_animation_slow"] = %h2_ch_military_tent_ropes_shake;
    level.scr_anim["tent_rope_01"]["wind_animation_slow_looped"][0] = %h2_ch_military_tent_ropes_shake;
    level.scr_anim["tent_rope_01"]["wind_animation_slow_to_fast"] = %h2_ch_military_tent_ropes_shake;
    level.scr_anim["tent_rope_01"]["wind_animation_fast_to_slow"] = %h2_ch_military_tent_ropes_shake;
    level.scr_animtree["tent_rope_02"] = #animtree;
    level.scr_model["tent_rope_02"] = "h2_ch_military_tent_rope02_animated";
    level.scr_anim["tent_rope_02"]["wind_animation_fast"] = %h2_ch_military_tent_ropes_shake;
    level.scr_anim["tent_rope_02"]["wind_animation_fast_looped"][0] = %h2_ch_military_tent_ropes_shake;
    level.scr_anim["tent_rope_02"]["wind_animation_slow"] = %h2_ch_military_tent_ropes_shake;
    level.scr_anim["tent_rope_02"]["wind_animation_slow_looped"][0] = %h2_ch_military_tent_ropes_shake;
    level.scr_anim["tent_rope_02"]["wind_animation_slow_to_fast"] = %h2_ch_military_tent_ropes_shake;
    level.scr_anim["tent_rope_02"]["wind_animation_fast_to_slow"] = %h2_ch_military_tent_ropes_shake;
}
#using_animtree("player");

player_anims()
{
    level.scr_animtree["player_rig"] = #animtree;
    level.scr_model["player_rig"] = "h2_gfl_st_ar15_viewhands_player";
    level.scr_anim["player_rig"]["player_evac"] = %blackout_bh_evac_player;
    level.scr_anim["player_rig"]["goggles_puton"] = %h2_vm_snowgoggle_puton;
    level.scr_anim["player_rig"]["goggles_takeoff"] = %h2_vm_snowgoggle_takeoff;
    level.scr_animtree["worldbody"] = #animtree;
    level.scr_model["worldbody"] = "h2_gfl_st_ar15_viewbody";
    level.scr_anim["worldbody"]["slide_in"] = %h2_cliffhanger_slide_in;
    level.scr_anim["worldbody"]["slide_loop"][0] = %h2_cliffhanger_slide_idle;
    level.scr_anim["worldbody"]["slide_out"] = %h2_cliffhanger_slide_out;
    level.scr_anim["worldbody"]["slide_back_loop"][0] = %h2_cliffhanger_slide_back;
    level.scr_anim["worldbody"]["slide_back_in"] = %h2_cliffhanger_slide_back_in;
    level.scr_anim["worldbody"]["slide_back_out"] = %h2_cliffhanger_slide_back_out;
    level.scr_anim["worldbody"]["slide_ar"] = %h2_cliffhanger_slide_turnl;
    level.scr_anim["worldbody"]["slide_al"] = %h2_cliffhanger_slide_turnr;
    maps\_anim::addnotetrack_customfunction( "worldbody", "slide_fx_start", ::_id_AF5D, "slide_in", [ "tag_origin" ] );
    maps\_anim::addnotetrack_customfunction( "worldbody", "slide_fx_end", ::_id_C251, "slide_out" );
    maps\_anim::addnotetrack_customfunction( "worldbody", "slide_fx_end", ::_id_C251, "slide_back_out" );
    level.scr_anim["worldbody"]["bigjump_left_01"] = %h2_playerview_icepicker_bigjump_left_01;
    level.scr_anim["worldbody"]["bigjump_left_01_idle"] = %h2_playerview_icepicker_bigjump_left_01_idle;
    level.scr_anim["worldbody"]["bigjump_right_01"] = %h2_playerview_icepicker_bigjump_right_01;
    level.scr_anim["worldbody"]["bigjump_right_01_idle"] = %h2_playerview_icepicker_bigjump_right_01_idle;
    level.scr_anim["worldbody"]["bigjump_left_02"] = %h2_playerview_icepicker_bigjump_left_02;
    level.scr_anim["worldbody"]["bigjump_left_02_idle"] = %h2_playerview_icepicker_bigjump_left_02_idle;
    level.scr_anim["worldbody"]["bigjump_right_02"] = %h2_playerview_icepicker_bigjump_right_02;
    level.scr_anim["worldbody"]["bigjump_right_02_idle"] = %h2_playerview_icepicker_bigjump_right_02_idle;
    level.scr_anim["worldbody"]["bigjump_left_03"] = %h2_playerview_icepicker_bigjump_left_03;
    level.scr_anim["worldbody"]["bigjump_left_03_idle"] = %h2_playerview_icepicker_bigjump_left_03_idle;
    level.scr_anim["worldbody"]["bigjump_right_03"] = %h2_playerview_icepicker_bigjump_right_03;
    level.scr_anim["worldbody"]["bigjump_ending"] = %h2_playerview_icepicker_bigjump_ending;
    level.scr_anim["worldbody"]["enter_climb_from_ledge_right"] = %h2_cliffhanger_iceaxeclimbing_getready_2_climb_right;
    level.scr_anim["worldbody"]["enter_climb_from_ledge_left"] = %h2_cliffhanger_iceaxeclimbing_getready_2_climb_left;
    level.scr_anim["worldbody"]["enter_climb_from_ledge_right_idle"] = %h2_cliffhanger_iceaxeclimbing_getready_2_climb_idle_right;
    level.scr_anim["worldbody"]["enter_climb_from_ledge_right_idle_fall"] = %h2_cliffhanger_iceaxeclimbing_getready_2_climb_right_inv;
    level.scr_anim["worldbody"]["enter_climb_from_ledge_left_idle"] = %h2_cliffhanger_iceaxeclimbing_getready_2_climb_idle_left;
    level.scr_anim["worldbody"]["enter_climb_from_ledge_left_idle_fall"] = %h2_cliffhanger_iceaxeclimbing_alternate_right_left_r;
    level.scr_anim["worldbody"]["enter_climb_from_stand_start_left"] = %h2_cliffhanger_iceaxeclimbing_alternate_start_left;
    level.scr_anim["worldbody"]["enter_climb_from_stand_start_left_idle"] = %h2_cliffhanger_iceaxeclimbing_alternate_start_left_idle;
    level.scr_anim["worldbody"]["enter_climb_from_stand_start_left_idle_fall"] = %h2_cliffhanger_iceaxeclimbing_alternate_start_left_r;
    level.scr_anim["worldbody"]["enter_climb_from_stand_start_left_right"] = %h2_cliffhanger_iceaxeclimbing_alternate_start_left_right;
    level.scr_anim["worldbody"]["enter_climb_from_stand_start_right"] = %h2_cliffhanger_iceaxeclimbing_alternate_start_right;
    level.scr_anim["worldbody"]["iceaxeclimbing_right_1"] = %h2_cliffhanger_iceaxeclimbing_right_1;
    level.scr_anim["worldbody"]["iceaxeclimbing_right_1_idle"] = %h2_cliffhanger_iceaxeclimbing_right_1_idle;
    level.scr_anim["worldbody"]["iceaxeclimbing_right_1_idle_fall"] = %h2_cliffhanger_iceaxeclimbing_right_1_fall;
    level.scr_anim["worldbody"]["iceaxeclimbing_left_1"] = %h2_cliffhanger_iceaxeclimbing_left_1;
    level.scr_anim["worldbody"]["iceaxeclimbing_left_1_idle"] = %h2_cliffhanger_iceaxeclimbing_left_1_idle;
    level.scr_anim["worldbody"]["iceaxeclimbing_left_1_idle_fall"] = %h2_cliffhanger_iceaxeclimbing_left_1_fall;
    level.scr_anim["worldbody"]["iceaxeclimbing_right_2"] = %h2_cliffhanger_iceaxeclimbing_right_2;
    level.scr_anim["worldbody"]["iceaxeclimbing_right_2_idle"] = %h2_cliffhanger_iceaxeclimbing_right_2_idle;
    level.scr_anim["worldbody"]["iceaxeclimbing_right_2_idle_fall"] = %h2_cliffhanger_iceaxeclimbing_right_2_fall;
    level.scr_anim["worldbody"]["iceaxeclimbing_left_2"] = %h2_cliffhanger_iceaxeclimbing_left_2;
    level.scr_anim["worldbody"]["iceaxeclimbing_left_2_idle"] = %h2_cliffhanger_iceaxeclimbing_left_2_idle;
    level.scr_anim["worldbody"]["iceaxeclimbing_left_2_idle_fall"] = %h2_cliffhanger_iceaxeclimbing_left_2_fall;
    level.scr_anim["worldbody"]["iceaxeclimbing_right_3"] = %h2_cliffhanger_iceaxeclimbing_right_3;
    level.scr_anim["worldbody"]["iceaxeclimbing_right_3_idle"] = %h2_cliffhanger_iceaxeclimbing_right_3_idle;
    level.scr_anim["worldbody"]["iceaxeclimbing_left_3"] = %h2_cliffhanger_iceaxeclimbing_left_3;
    level.scr_anim["worldbody"]["iceaxeclimbing_left_3_idle"] = %h2_cliffhanger_iceaxeclimbing_left_3_idle;
    level.scr_anim["worldbody"]["iceaxeclimbing_right_4"] = %h2_cliffhanger_iceaxeclimbing_right_4;
    level.scr_anim["worldbody"]["iceaxeclimbing_right_4_idle"] = %h2_cliffhanger_iceaxeclimbing_right_4_idle;
    level.scr_anim["worldbody"]["iceaxeclimbing_left_4"] = %h2_cliffhanger_iceaxeclimbing_left_4;
    level.scr_anim["worldbody"]["iceaxeclimbing_left_4_idle"] = %h2_cliffhanger_iceaxeclimbing_left_4_idle;
    level.scr_anim["worldbody"]["iceaxeclimbing_right_5"] = %h2_cliffhanger_iceaxeclimbing_right_5;
    level.scr_anim["worldbody"]["iceaxeclimbing_right_5_idle"] = %h2_cliffhanger_iceaxeclimbing_right_5_idle;
    level.scr_anim["worldbody"]["iceaxeclimbing_left_5"] = %h2_cliffhanger_iceaxeclimbing_left_5;
    level.scr_anim["worldbody"]["iceaxeclimbing_left_5_idle"] = %h2_cliffhanger_iceaxeclimbing_left_5_idle;
    level.scr_anim["worldbody"]["iceaxeclimbing_right_6"] = %h2_cliffhanger_iceaxeclimbing_right_6;
    level.scr_anim["worldbody"]["iceaxeclimbing_right_6_idle"] = %h2_cliffhanger_iceaxeclimbing_right_6_idle;
    level.scr_anim["worldbody"]["iceaxeclimbing_left_6"] = %h2_cliffhanger_iceaxeclimbing_left_6;
    level.scr_anim["worldbody"]["iceaxeclimbing_left_6_idle"] = %h2_cliffhanger_iceaxeclimbing_left_6_idle;
    level.scr_anim["worldbody"]["iceaxeclimbing_right_7"] = %h2_cliffhanger_iceaxeclimbing_right_7;
    level.scr_anim["worldbody"]["iceaxeclimbing_right_7_idle"] = %h2_cliffhanger_iceaxeclimbing_right_7_idle;
    level.scr_anim["worldbody"]["iceaxeclimbing_left_7"] = %h2_cliffhanger_iceaxeclimbing_left_7;
    level.scr_anim["worldbody"]["iceaxeclimbing_left_7_idle"] = %h2_cliffhanger_iceaxeclimbing_left_7_idle;
    level.scr_anim["worldbody"]["iceaxeclimbing_right_8"] = %h2_cliffhanger_iceaxeclimbing_right_8;
    level.scr_anim["worldbody"]["iceaxeclimbing_right_8_idle"] = %h2_cliffhanger_iceaxeclimbing_right_8_idle;
    level.scr_anim["worldbody"]["iceaxeclimbing_left_8"] = %h2_cliffhanger_iceaxeclimbing_left_8;
    level.scr_anim["worldbody"]["iceaxeclimbing_left_8_idle"] = %h2_cliffhanger_iceaxeclimbing_left_8_idle;
    level.scr_anim["worldbody"]["iceaxeclimbing_right_9"] = %h2_cliffhanger_iceaxeclimbing_right_9;
    level.scr_anim["worldbody"]["iceaxeclimbing_right_9_idle"] = %h2_cliffhanger_iceaxeclimbing_right_9_idle;
    level.scr_anim["worldbody"]["iceaxeclimbing_left_9"] = %h2_cliffhanger_iceaxeclimbing_left_9;
    level.scr_anim["worldbody"]["iceaxeclimbing_left_9_idle"] = %h2_cliffhanger_iceaxeclimbing_left_9_idle;
    level.scr_anim["worldbody"]["iceaxeclimbing_right_10"] = %h2_cliffhanger_iceaxeclimbing_right_10;
    level.scr_anim["worldbody"]["iceaxeclimbing_right_10_idle"] = %h2_cliffhanger_iceaxeclimbing_right_10_idle;
    level.scr_anim["worldbody"]["iceaxeclimbing_snowreaction_right"] = %h2_cliffhanger_iceaxeclimbing_snowreaction_l;
    level.scr_anim["worldbody"]["iceaxeclimbing_snowreaction_left"] = %h2_cliffhanger_iceaxeclimbing_snowreaction_r;
    level.scr_goaltime["worldbody"]["bigjump_left_01"] = 0;
    level.scr_goaltime["worldbody"]["bigjump_left_01_idle"] = 0;
    level.scr_goaltime["worldbody"]["bigjump_right_01"] = 0;
    level.scr_goaltime["worldbody"]["bigjump_right_01_idle"] = 0;
    level.scr_goaltime["worldbody"]["bigjump_left_02"] = 0;
    level.scr_goaltime["worldbody"]["bigjump_left_02_idle"] = 0;
    level.scr_goaltime["worldbody"]["bigjump_right_02"] = 0;
    level.scr_goaltime["worldbody"]["bigjump_right_02_idle"] = 0;
    level.scr_goaltime["worldbody"]["bigjump_left_03"] = 0;
    level.scr_goaltime["worldbody"]["bigjump_left_03_idle"] = 0;
    level.scr_goaltime["worldbody"]["bigjump_right_03"] = 0;
    level.scr_goaltime["worldbody"]["bigjump_ending"] = 0;
    level.scr_goaltime["worldbody"]["enter_climb_from_ledge_right"] = 0;
    level.scr_goaltime["worldbody"]["enter_climb_from_ledge_left"] = 0;
    level.scr_goaltime["worldbody"]["enter_climb_from_ledge_right_idle"] = 0;
    level.scr_goaltime["worldbody"]["enter_climb_from_ledge_right_idle_fall"] = 0;
    level.scr_goaltime["worldbody"]["enter_climb_from_ledge_left_idle"] = 0;
    level.scr_goaltime["worldbody"]["enter_climb_from_ledge_left_idle_fall"] = 0;
    level.scr_goaltime["worldbody"]["enter_climb_from_stand_start_left"] = 0;
    level.scr_goaltime["worldbody"]["enter_climb_from_stand_start_left_idle"] = 0;
    level.scr_goaltime["worldbody"]["enter_climb_from_stand_start_left_idle_fall"] = 0;
    level.scr_goaltime["worldbody"]["enter_climb_from_stand_start_left_right"] = 0;
    level.scr_goaltime["worldbody"]["enter_climb_from_stand_start_right"] = 0;
    level.scr_goaltime["worldbody"]["iceaxeclimbing_right_1"] = 0;
    level.scr_goaltime["worldbody"]["iceaxeclimbing_right_1_idle"] = 0;
    level.scr_goaltime["worldbody"]["iceaxeclimbing_right_1_idle_fall"] = 0;
    level.scr_goaltime["worldbody"]["iceaxeclimbing_left_1"] = 0;
    level.scr_goaltime["worldbody"]["iceaxeclimbing_left_1_idle"] = 0;
    level.scr_goaltime["worldbody"]["iceaxeclimbing_left_1_idle_fall"] = 0;
    level.scr_goaltime["worldbody"]["iceaxeclimbing_right_2"] = 0;
    level.scr_goaltime["worldbody"]["iceaxeclimbing_right_2_idle"] = 0;
    level.scr_goaltime["worldbody"]["iceaxeclimbing_right_2_idle_fall"] = 0;
    level.scr_goaltime["worldbody"]["iceaxeclimbing_left_2"] = 0;
    level.scr_goaltime["worldbody"]["iceaxeclimbing_left_2_idle"] = 0;
    level.scr_goaltime["worldbody"]["iceaxeclimbing_left_2_idle_fall"] = 0;
    level.scr_goaltime["worldbody"]["iceaxeclimbing_right_3"] = 0;
    level.scr_goaltime["worldbody"]["iceaxeclimbing_right_3_idle"] = 0;
    level.scr_goaltime["worldbody"]["iceaxeclimbing_left_3"] = 0;
    level.scr_goaltime["worldbody"]["iceaxeclimbing_left_3_idle"] = 0;
    level.scr_goaltime["worldbody"]["iceaxeclimbing_right_4"] = 0;
    level.scr_goaltime["worldbody"]["iceaxeclimbing_right_4_idle"] = 0;
    level.scr_goaltime["worldbody"]["iceaxeclimbing_left_4"] = 0;
    level.scr_goaltime["worldbody"]["iceaxeclimbing_left_4_idle"] = 0;
    level.scr_goaltime["worldbody"]["iceaxeclimbing_right_5"] = 0;
    level.scr_goaltime["worldbody"]["iceaxeclimbing_right_5_idle"] = 0;
    level.scr_goaltime["worldbody"]["iceaxeclimbing_left_5"] = 0;
    level.scr_goaltime["worldbody"]["iceaxeclimbing_left_5_idle"] = 0;
    level.scr_goaltime["worldbody"]["iceaxeclimbing_right_6"] = 0;
    level.scr_goaltime["worldbody"]["iceaxeclimbing_right_6_idle"] = 0;
    level.scr_goaltime["worldbody"]["iceaxeclimbing_left_6"] = 0;
    level.scr_goaltime["worldbody"]["iceaxeclimbing_left_6_idle"] = 0;
    level.scr_goaltime["worldbody"]["iceaxeclimbing_right_7"] = 0;
    level.scr_goaltime["worldbody"]["iceaxeclimbing_right_7_idle"] = 0;
    level.scr_goaltime["worldbody"]["iceaxeclimbing_left_7"] = 0;
    level.scr_goaltime["worldbody"]["iceaxeclimbing_left_7_idle"] = 0;
    level.scr_goaltime["worldbody"]["iceaxeclimbing_right_8"] = 0;
    level.scr_goaltime["worldbody"]["iceaxeclimbing_right_8_idle"] = 0;
    level.scr_goaltime["worldbody"]["iceaxeclimbing_left_8"] = 0;
    level.scr_goaltime["worldbody"]["iceaxeclimbing_left_8_idle"] = 0;
    level.scr_goaltime["worldbody"]["iceaxeclimbing_right_9"] = 0;
    level.scr_goaltime["worldbody"]["iceaxeclimbing_right_9_idle"] = 0;
    level.scr_goaltime["worldbody"]["iceaxeclimbing_left_9"] = 0;
    level.scr_goaltime["worldbody"]["iceaxeclimbing_left_9_idle"] = 0;
    level.scr_goaltime["worldbody"]["iceaxeclimbing_right_10"] = 0;
    level.scr_goaltime["worldbody"]["iceaxeclimbing_right_10_idle"] = 0;
    level.scr_anim["worldbody"]["idle_additive"] = %climb_additive_idle;
    level.scr_anim["worldbody"]["climb_idle_left"] = %h2_cliffhanger_iceaxeclimbing_left_idle;
    level.scr_anim["worldbody"]["climb_idle_left_twitch"][0] = %h2_cliffhanger_iceaxeclimbing_left_idle_twitch_01;
    level.scr_anim["worldbody"]["climb_idle_left_twitch"][1] = %h2_cliffhanger_iceaxeclimbing_left_idle_twitch_02;
    level.scr_anim["worldbody"]["climb_idle_right"] = %h2_cliffhanger_iceaxeclimbing_right_idle;
    level.scr_anim["worldbody"]["climb_idle_right_twitch"][0] = %h2_cliffhanger_iceaxeclimbing_right_idle_twitch_01;
    level.scr_anim["worldbody"]["climb_idle_right_twitch"][1] = %h2_cliffhanger_iceaxeclimbing_right_idle_twitch_02;
    level.scr_anim["worldbody"]["double_takedown"] = %h2_cliffhanger_dualtakedown_sequence_player;
    level.scr_anim["worldbody"]["throatstab"] = %h2_cliffhanger_throatstab_player;
    level.scr_anim["worldbody"]["planting_c4"] = %h2_cliffhanger_base_c4_player;
    maps\_anim::addnotetrack_attach( "worldbody", "c4_attach", "weapon_c4", "tag_weapon", "planting_c4" );
    maps\_anim::addnotetrack_customfunction( "worldbody", "c4_detach", ::_id_BC3B, "planting_c4" );
    maps\_anim::addnotetrack_flag( "worldbody", "c4_detach", "c4_placed", "planting_c4" );
    level.scr_anim["worldbody"]["mounting_snowmobile_left"] = %h2_cliffhanger_snowmobile_player_in_left;
    level.scr_anim["worldbody"]["mounting_snowmobile_right"] = %h2_cliffhanger_snowmobile_player_in_right;
    maps\_anim::addnotetrack_customfunction( "worldbody", "goggles_puton", ::_id_BEC1 );
    level.scr_anim["worldbody"]["pickup_acs"] = %h2_cliffhanger_hangar_acs_player;
    maps\_anim::addnotetrack_flag( "worldbody", "acs_attach", "acs_picked_up", "pickup_acs" );
}
#using_animtree("vehicles");

vehicles()
{
    level.scr_animtree["mig"] = #animtree;
    level.scr_anim["mig"]["mig_landing1"] = %h2_cliffhanger_mig_landing;
    level.scr_anim["mig"]["mig_landing2"] = %cliffhanger_mig_landing_2;
    level.scr_model["mig"] = "vehicle_mig29";
    level.scr_animtree["snowmobile"] = #animtree;
    level.scr_anim["snowmobile"]["icepick_fight"] = %h2_cliffhanger_icepick_fight_snowmobile;
    level.scr_model["snowmobile"] = "vehicle_snowmobile_alt";
    level.scr_animtree["heli"] = #animtree;
    level.scr_anim["heli"]["avalanche_heli_wipeout"] = %cliffhanger_crash_mi28_crash;
    maps\_anim::addnotetrack_customfunction( "mig", "touchdown_fx", ::_id_D0EC );
    maps\_anim::addnotetrack_customfunction( "snowmobile", "snowmobile_skidout", ::_id_BE9A );
    maps\_anim::addnotetrack_customfunction( "snowmobile", "snowmobile_stop_skidout", ::_id_B2B7 );
    level.scr_anim["snowmobile"]["root"] = %root;
    level.scr_anim["snowmobile"]["cliffhanger_ending"] = %h2_cliffhanger_ending_snowmobile_soap;
    level.scr_model["snowmobile_player"] = "vehicle_snowmobile_player";
    level.scr_animtree["snowmobile_player"] = #animtree;
    level.scr_anim["snowmobile_player"]["cliffhanger_ending"] = %h2_cliffhanger_ending_snowmobile_player;
    level.scr_goaltime["snowmobile_player"]["cliffhanger_ending"] = 0;
}

_id_BE9A( var_0 )
{
    level endon( "stop_skidout_fx" );

    for (;;)
    {
        playfxontag( common_scripts\utility::getfx( "tread_snow_snowmobile_skidout" ), var_0, "tag_deathfx" );
        wait 0.03;
    }
}

_id_B2B7( var_0 )
{
    level notify( "stop_skidout_fx" );
}

_id_D0EC( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "mig_landing_trail_snow" ), var_0, "origin_animate_jnt" );
}

_id_A85A( var_0 )
{
    var_1 = var_0 gettagorigin( "TAG_INHAND" );
    var_2 = var_0 gettagangles( "TAG_INHAND" );
    var_3 = spawn( "script_model", var_1 );
    var_3 setmodel( "weapon_c4" );
    var_3.angles = var_2;
    var_3 thread _id_AAAB::playc4effects();
}

_id_B6E0( var_0 )
{
    common_scripts\utility::flag_set( "locker_room_noturningback" );
}

_id_B749( var_0 )
{
    var_0.allowdeath = 0;
    common_scripts\utility::flag_set( "locker_brawl_becomes_uninteruptable" );
}

ai_kill( var_0 )
{
    if ( !isalive( var_0 ) )
        return;

    var_0.allowdeath = 1;
    var_0.a.nodeath = 1;
    var_0 maps\_utility::set_battlechatter( 0 );
    _id_B190::_id_D55F( var_0 );
    var_0 kill();
}
#using_animtree("generic_human");

dialog()
{
    level.scr_sound["price"]["cliff_pri_noidea"] = "cliff_pri_noidea";
    level.scr_sound["price"]["cliff_pri_killfirm"] = "cliff_pri_killfirm";
    level.scr_sound["price"]["follow_me"] = "cliff_pri_followmeletsgo";
    level.scr_sound["price"]["cliff_pri_killfirm_plyr"] = "cliff_pri_killfirm_plyr";
    level.scr_sound["price"]["cliff_pri_melee_plyr"] = "cliff_pri_melee_plyr";
    level.scr_sound["price"]["cliff_pri_checksensor"] = "cliff_pri_checksensor";
    level.scr_face["price"]["cliff_pri_checksensor"] = %h2_cliffhanger_cliff_mound_climb_soap_sensor_facial;
    level.scr_sound["price"]["cliff_pri_seeme"] = "cliff_pri_seeme";
    level.scr_face["price"]["cliff_pri_seeme"] = %h2_cliffhanger_cliff_mound_climb_soap_youshouldbe_facial;
    level.scr_sound["price"]["cliff_pri_bluedot"] = "cliff_pri_bluedot";
    level.scr_face["price"]["cliff_pri_bluedot"] = %h2_cliffhanger_cliff_mound_climb_soap_thatbluedot_facial;
    level.scr_sound["price"]["cliff_pri_whitedots"] = "cliff_pri_whitedots";
    level.scr_face["price"]["cliff_pri_whitedots"] = %h2_cliffhanger_cliff_mound_climb_soap_unrecognized_facial;
    level.scr_sound["price"]["cliff_pri_youtakeleft"] = "cliff_pri_youtakeleft";
    level.scr_sound["price"]["cliff_pri_onthree"] = "cliff_pri_onthree";
    level.scr_sound["price"]["cliff_pri_sameplan"] = "cliff_pri_sameplan";
    level.scr_sound["price"]["cliff_pri_tappedcomms"] = "cliff_pri_tappedcomms";
    level.scr_sound["price"]["cliff_pri_pvtnatalya"] = "cliff_pri_pvtnatalya";
    level.scr_sound["price"]["cliff_pri_femcombatants"] = "cliff_pri_femcombatants";
    level.scr_sound["price"]["cliff_pri_stormsbrewing"] = "cliff_pri_stormsbrewing";
    level.scr_sound["price"]["cliff_pri_tangoleft"] = "cliff_pri_tangoleft";
    level.scr_sound["price"]["cliff_pri_targetleft"] = "cliff_pri_targetleft";
    level.scr_sound["price"]["cliff_pri_hostileright"] = "cliff_pri_hostileright";
    level.scr_sound["price"]["cliff_pri_targetright"] = "cliff_pri_targetright";
    level.scr_sound["price"]["cliff_pri_tangosix"] = "cliff_pri_tangosix";
    level.scr_sound["price"]["cliff_pri_targetbehindyou"] = "cliff_pri_targetbehindyou";
    level.scr_sound["price"]["cliff_pri_holdup"] = "cliff_pri_holdup";
    level.scr_sound["price"]["cliff_pri_activityonrunway"] = "cliff_pri_activityonrunway";
    level.scr_sound["price"]["cliff_pri_footmobiles"] = "cliff_pri_footmobiles";
    level.scr_sound["price"]["cliff_pri_avoidarea"] = "cliff_pri_avoidarea";
    level.scr_sound["price"]["cliff_pri_radiotraffic"] = "cliff_pri_radiotraffic";
    level.scr_sound["price"]["cliff_pri_infarhangar"] = "cliff_pri_infarhangar";
    level.scr_sound["price"]["cliff_pri_oscarmike"] = "cliff_pri_oscarmike";
    level.scr_sound["price"]["cliff_pri_foundabody"] = "cliff_pri_foundabody";
    level.scr_sound["price"]["cliff_pri_keepquiet"] = "cliff_pri_keepquiet";
    level.scr_sound["price"]["cliff_pri_staycalm"] = "cliff_pri_staycalm";
    level.scr_sound["price"]["cliff_pri_nicelydone"] = "cliff_pri_nicelydone";
    level.scr_sound["price"]["tango_down"] = "cliff_pri_killfirm";
    level.scr_sound["price"]["cliff_pri_splitup"] = "cliff_pri_splitup";
    level.scr_sound["price"]["cliff_pri_likeaghost"] = "cliff_pri_likeaghost";
    level.scr_sound["price"]["cliff_pri_yourein"] = "cliff_pri_yourein";
    level.scr_sound["price"]["cliff_pri_truckcoming"] = "cliff_pri_truckcoming";
    level.scr_sound["price"]["cliff_pri_flamingwreck"] = "cliff_pri_flamingwreck";
    level.scr_sound["price"]["cliff_pri_outofsight"] = "cliff_pri_outofsight";
    level.scr_sound["price"]["cliff_pri_attractattn"] = "cliff_pri_attractattn";
    level.scr_sound["price"]["cliff_pri_prettysneaky"] = "cliff_pri_prettysneaky";
    level.scr_sound["price"]["cliff_pri_2tangosfront"] = "cliff_pri_2tangosfront";
    level.scr_sound["price"]["cliff_pri_getoutofthere"] = "cliff_pri_getoutofthere";
    level.scr_sound["price"]["cliff_pri_nicework"] = "cliff_pri_nicework";
    level.scr_sound["price"]["cliff_pri_takethisone"] = "cliff_pri_takethisone";
    level.scr_sound["price"]["cliff_pri_hesmine"] = "cliff_pri_hesmine";
    level.scr_sound["price"]["cliff_pri_ivegothim"] = "cliff_pri_ivegothim";
    level.scr_sound["price"]["cliff_pri_onesmine"] = "cliff_pri_onesmine";
    level.scr_sound["price"]["cliff_pri_illtakehim"] = "cliff_pri_illtakehim";
    level.scr_sound["price"]["cliff_pri_scenicroute"] = "cliff_pri_scenicroute";
    level.scr_face["price"]["cliff_pri_scenicroute"] = %cliff_pri_scenicroute;
    level.scr_sound["price"]["cliff_pri_headsup"] = "cliff_pri_headsup";
    level.scr_sound["price"]["cliff_pri_lookingaround"] = "cliff_pri_lookingaround";
    level.scr_sound["price"]["cliff_pri_takecover"] = "cliff_pri_takecover";
    level.scr_sound["price"]["cliff_pri_beenspotted"] = "cliff_pri_beenspotted";
    level.scr_sound["price"]["cliff_pri_foundyou"] = "cliff_pri_foundyou";
    level.scr_sound["price"]["cliff_pri_multipledirections"] = "cliff_pri_multipledirections";
    level.scr_sound["price"]["cliff_pri_notsneaky"] = "cliff_pri_notsneaky";
    level.scr_sound["price"]["cliff_pri_dontalertthem"] = "cliff_pri_dontalertthem";
    level.scr_sound["price"]["cliff_pri_sloppy"] = "cliff_pri_sloppy";
    level.scr_sound["price"]["cliff_pri_silencers"] = "cliff_pri_silencers";
    level.scr_sound["price"]["letsgo"] = "cliff_pri_letsgo";
    level.scr_face["price"]["letsgo"] = %cliff_pri_letsgo;
    level.scr_sound["price"]["thefarside"] = "cliff_pri_thefarside";
    level.scr_radio["outrunthem"] = "cliff_pri_outrunthem";
    level.scr_radio["keepmoving"] = "cliff_pri_keepmoving";
    level.scr_radio["gogogo"] = "cliff_pri_gogogo";
    level.scr_radio["avalanche"] = "cliff_pri_avalanche";
    level.scr_radio["moretangos"] = "cliff_pri_moretangos";
    level.scr_radio["gonnamakeit"] = "cliff_pri_gonnamakeit";
    level.scr_radio["comeoncomeon"] = "cliff_pri_comeoncomeon";
    level.scr_radio["hangon2"] = "cliff_pri_hangon2";
    level.scr_sound["price"]["hugthewall"] = "cliff_pri_hugthewall";
    level.scr_sound["price"]["allright"] = "cliff_pri_allright";
    level.scr_sound["price"]["headformig"] = "cliff_pri_headformig";
    level.scr_sound["price"]["headingforjeeps"] = "cliff_pri_headingforjeeps";
    level.scr_sound["price"]["runtonextmig"] = "cliff_pri_runtonextmig";
    level.scr_sound["price"]["makingabreak"] = "cliff_pri_makingabreak";
    level.scr_sound["price"]["moveup"] = "cliff_pri_moveup";
    level.scr_sound["price"]["cometome"] = "cliff_pri_cometome";
    level.scr_sound["price"]["snowmoibles"] = "cliff_pri_snowmoibles";
    level.scr_sound["price"]["compromised"] = "cliff_pri_compromised";
    level.scr_sound["price"]["plan_b"] = "cliff_pri_goplanb";
    level.scr_sound["petrov"]["cliff_pet_capturedcomrade"] = "cliff_pet_capturedcomrade";
    level.scr_sound["petrov"]["cliff_pet_surrender"] = "cliff_pet_surrender";
    level.scr_sound["petrov"]["cliff_pet_willdie"] = "cliff_pet_willdie";
    level.scr_sound["petrov"]["cliff_pet_handsup"] = "cliff_pet_handsup";
    level.scr_sound["petrov"]["cliff_pet_verywell"] = "cliff_pet_verywell";
    level.scr_sound["price"]["downloadfiles"] = "cliff_pri_downloadfiles";
    level.scr_face["price"]["downloadfiles"] = %cliff_pri_downloadfiles;
    level.scr_sound["price"]["eastgo"] = "cliff_pri_eastgo";
    level.scr_sound["price"]["runformigeast"] = "cliff_pri_runformigeast";
    level.scr_face["price"]["runformigeast"] = %cliff_pri_runformigeast;
    level.scr_radio["cliff_pri_killfirm_plyr"] = "cliff_pri_killfirm_plyr";
    level.scr_radio["cliff_pri_melee_plyr"] = "cliff_pri_melee_plyr";
    level.scr_radio["cliff_pri_checksensor"] = "cliff_pri_checksensor";
    level.scr_radio["cliff_pri_seeme"] = "cliff_pri_seeme";
    level.scr_radio["cliff_pri_bluedot"] = "cliff_pri_bluedot";
    level.scr_radio["cliff_pri_whitedots"] = "cliff_pri_whitedots";
    level.scr_radio["cliff_pri_youtakeleft"] = "cliff_pri_youtakeleft";
    level.scr_radio["cliff_pri_onthree"] = "cliff_pri_onthree";
    level.scr_radio["cliff_pri_sameplan"] = "cliff_pri_sameplan";
    level.scr_radio["cliff_pri_tappedcomms"] = "cliff_pri_tappedcomms";
    level.scr_radio["cliff_pri_pvtnatalya"] = "cliff_pri_pvtnatalya";
    level.scr_radio["cliff_pri_femcombatants"] = "cliff_pri_femcombatants";
    level.scr_radio["cliff_pri_stormsbrewing"] = "cliff_pri_stormsbrewing";
    level.scr_radio["cliff_pri_tangoleft"] = "cliff_pri_tangoleft";
    level.scr_radio["cliff_pri_targetleft"] = "cliff_pri_targetleft";
    level.scr_radio["cliff_pri_hostileright"] = "cliff_pri_hostileright";
    level.scr_radio["cliff_pri_targetright"] = "cliff_pri_targetright";
    level.scr_radio["cliff_pri_tangosix"] = "cliff_pri_tangosix";
    level.scr_radio["cliff_pri_targetbehindyou"] = "cliff_pri_targetbehindyou";
    level.scr_radio["cliff_pri_holdup"] = "cliff_pri_holdup";
    level.scr_radio["cliff_pri_activityonrunway"] = "cliff_pri_activityonrunway";
    level.scr_radio["cliff_pri_footmobiles"] = "cliff_pri_footmobiles";
    level.scr_radio["cliff_pri_avoidarea"] = "cliff_pri_avoidarea";
    level.scr_radio["cliff_pri_radiotraffic"] = "cliff_pri_radiotraffic";
    level.scr_radio["cliff_pri_infarhangar"] = "cliff_pri_infarhangar";
    level.scr_radio["cliff_pri_oscarmike"] = "cliff_pri_oscarmike";
    level.scr_radio["cliff_pri_foundabody"] = "cliff_pri_foundabody";
    level.scr_radio["cliff_pri_keepquiet"] = "cliff_pri_keepquiet";
    level.scr_radio["cliff_pri_staycalm"] = "cliff_pri_staycalm";
    level.scr_radio["cliff_pri_nicelydone"] = "cliff_pri_nicelydone";
    level.scr_radio["tango_down"] = "UK_pri_inform_killfirm_generic_s";
    level.scr_radio["cliff_pri_splitup"] = "cliff_pri_splitup";
    level.scr_radio["cliff_pri_likeaghost"] = "cliff_pri_likeaghost";
    level.scr_radio["cliff_pri_yourein"] = "cliff_pri_yourein";
    level.scr_radio["cliff_pri_truckcoming"] = "cliff_pri_truckcoming";
    level.scr_radio["cliff_pri_flamingwreck"] = "cliff_pri_flamingwreck";
    level.scr_radio["cliff_pri_outofsight"] = "cliff_pri_outofsight";
    level.scr_radio["cliff_pri_attractattn"] = "cliff_pri_attractattn";
    level.scr_radio["cliff_pri_prettysneaky"] = "cliff_pri_prettysneaky";
    level.scr_radio["cliff_pri_2tangosfront"] = "cliff_pri_2tangosfront";
    level.scr_radio["cliff_pri_getoverhere"] = "cliff_pri_getoverhere";
    level.scr_sound["price"]["cliff_pri_getoverhere"] = "cliff_pri_getoverhere";
    level.scr_radio["cliff_pri_getoutofthere"] = "cliff_pri_getoutofthere";
    level.scr_radio["cliff_pri_nicework"] = "cliff_pri_nicework";
    level.scr_radio["cliff_pri_takethisone"] = "cliff_pri_takethisone";
    level.scr_radio["cliff_pri_hesmine"] = "cliff_pri_hesmine";
    level.scr_radio["cliff_pri_ivegothim"] = "cliff_pri_ivegothim";
    level.scr_radio["cliff_pri_onesmine"] = "cliff_pri_onesmine";
    level.scr_radio["cliff_pri_illtakehim"] = "cliff_pri_illtakehim";
    level.scr_radio["cliff_pri_scenicroute"] = "cliff_pri_scenicroute";
    level.scr_radio["cliff_pri_headsup"] = "cliff_pri_headsup";
    level.scr_radio["cliff_pri_lookingaround"] = "cliff_pri_lookingaround";
    level.scr_radio["cliff_pri_takecover"] = "cliff_pri_takecover";
    level.scr_radio["cliff_pri_beenspotted"] = "cliff_pri_beenspotted";
    level.scr_radio["cliff_pri_foundyou"] = "cliff_pri_foundyou";
    level.scr_radio["cliff_pri_multipledirections"] = "cliff_pri_multipledirections";
    level.scr_radio["cliff_pri_notsneaky"] = "cliff_pri_notsneaky";
    level.scr_radio["cliff_pri_dontalertthem"] = "cliff_pri_dontalertthem";
    level.scr_radio["cliff_pri_sloppy"] = "cliff_pri_sloppy";
    level.scr_radio["cliff_pri_alertedthem"] = "cliff_pri_alertedthem";
    level.scr_radio["cliff_pri_silencers"] = "cliff_pri_silencers";
    level.scr_radio["cliff_pri_truckcomingback"] = "cliff_pri_truckcomingback";
    level.scr_radio["cliff_pri_truckiscoming"] = "cliff_pri_truckiscoming";
    level.scr_radio["cliff_pri_theygoingback"] = "cliff_pri_theygoingback";
    level.scr_radio["cliff_pri_youreclear"] = "cliff_pri_youreclear";
    level.scr_radio["cliff_pri_resthavegivenup"] = "cliff_pri_resthavegivenup";
    level.scr_radio["cliff_pri_hidealerted"] = "cliff_pri_hidealerted";
    level.scr_radio["cliff_pri_sightalertedone"] = "cliff_pri_sightalertedone";
    level.scr_radio["cliff_pri_keepeyeonheart"] = "cliff_pri_keepeyeonheart";
    level.scr_sound["price"]["cliff_pri_somework"] = "cliff_pri_somework";
    level.scr_sound["price"]["cliff_pri_doeverything"] = "cliff_pri_doeverything";
    level.scr_radio["cliff_pri_nevermind"] = "cliff_pri_nevermind";
    level.scr_radio["cliff_pri_maybenot"] = "cliff_pri_maybenot";
    level.scr_radio["cliff_pri_coverofstorm"] = "cliff_pri_coverofstorm";
    level.scr_radio["cliff_pri_yourein_2"] = "cliff_pri_yourein_2";
    level.scr_radio["cliff_pri_yourein_3"] = "cliff_pri_yourein_3";
    level.scr_radio["cliff_pri_necorner"] = "cliff_pri_necorner";
    level.scr_radio["cliff_pri_searchntheast"] = "cliff_pri_searchntheast";
    level.scr_radio["cliff_pri_fuelingstation"] = "cliff_pri_fuelingstation";
    level.scr_radio["cliff_pri_foundit"] = "cliff_pri_foundit";
    level.scr_radio["cliff_pri_getthereasap"] = "cliff_pri_getthereasap";
    level.scr_radio["cliff_pri_behindhangars"] = "cliff_pri_behindhangars";
    level.scr_radio["cliff_pri_meetme"] = "cliff_pri_meetme";
    level.scr_sound["price"]["cliff_pri_broughtfriends"] = "cliff_pri_broughtfriends";
    level.scr_radio["cliff_pri_goback"] = "cliff_pri_goback";
    level.scr_sound["price"]["Cliff_pri_onthree"] = "Cliff_pri_onthree";
    level.scr_sound["price"]["Cliff_pri_one"] = "Cliff_pri_one";
    level.scr_sound["price"]["Cliff_pri_two"] = "Cliff_pri_two";
    level.scr_sound["price"]["Cliff_pri_three"] = "Cliff_pri_three";
    level.scr_radio["UK_pri_inform_killfirm_generic_s"] = "cliff_pri_killfirm";
    level.scr_radio["cliff_pri_enroute"] = "cliff_pri_enroute";
    level.scr_radio["cliff_hp1_seeyouatbravo"] = "cliff_hp1_seeyouatbravo";
    level.scr_radio["cliff_hp1_status"] = "cliff_hp1_status";
    level.scr_radio["cliff_pri_almostthere"] = "cliff_pri_almostthere";
    level.scr_radio["cliff_hp1_fumes"] = "cliff_hp1_fumes";
    level.scr_radio["cliff_crc_gotacs"] = "cliff_crc_gotacs";
    level.scr_radio["cliff_pri_pinthrottle"] = "cliff_pri_pinthrottle";
    level.scr_radio["cliff_pri_thechopper"] = "cliff_pri_thechopper";
    level.scr_sound["price"]["cliff_pri_watchmyback"] = "cliff_pri_watchmyback";
    level.scr_sound["price"]["cliff_pri_goupstairs"] = "cliff_pri_goupstairs";
    level.scr_sound["price"]["cliff_pri_takesnowmobile"] = "cliff_pri_takesnowmobile";
    level.scr_sound["price"]["cliff_pri_snowmobileletsgo"] = "cliff_pri_snowmobileletsgo";
}

_id_BE61( var_0 )
{
    var_0 endon( "death" );
    var_1 = common_scripts\utility::getfx( "cold_breath_talking" );
    var_0._id_C440 = 1;

    while ( var_0._id_C440 == 1 )
    {
        playfxontag( var_1, var_0, "TAG_EYE" );
        wait 1.0;
    }
}

_id_D1DB( var_0 )
{
    var_0 thread maps\_anim::talk_for_time( 3.5 );
    _id_BE61( var_0 );
}

_id_C6E7( var_0 )
{
    var_1 = common_scripts\utility::getfx( "cold_breath_talking" );
    var_0._id_C440 = 0;
    stopfxontag( var_1, var_0, "TAG_EYE" );
}

_id_BEC1( var_0 )
{
    var_1 = getdvar( "r_znear" );
    setsaveddvar( "r_znear", 1 );
    _id_C0CF::_id_BAB9( level.player, 0.25, 1 );
    setsaveddvar( "r_znear", var_1 );
}

_id_BC3B( var_0 )
{
    var_1 = getentarray( "possible_c4_models", "targetname" );
    var_2 = common_scripts\utility::getclosest( level.player.origin, var_1 );
    var_2.origin = var_0 gettagorigin( "tag_weapon" );
    var_2.angles = var_0 gettagangles( "tag_weapon" );
    waitframe();
    var_0 detach( "weapon_c4", "tag_weapon" );
    var_2 show();
}
