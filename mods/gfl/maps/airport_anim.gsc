// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    generic_human();
    _id_D23E();
    player();
    _id_C2FF();
    _id_C8F4();
    _id_BAF7();
    _id_9D7F();
    thread init_animsound();
}
#using_animtree("generic_human");

generic_human()
{
    level.scr_anim["shotgun"]["stand_reload"] = %shotgun_stand_reload_c;
    level.scr_anim["m4"]["stand_reload"] = %exposed_reload;
    level.scr_anim["makarov"]["stand_reload"] = %exposed_reload;
    level.scr_anim["saw"]["stand_reload"] = %exposed_reload;
    level.scr_anim["generic"]["casual_killer_walk_wave"] = %casual_killer_walk_wave_makarov;
    level.scr_anim["generic"]["casual_killer_walk_point"] = %casual_killer_walk_point_makarov;
    level.scr_anim["makarov"]["casual_killer_walk_stop"] = %casual_killer_walk_stop_makarov;
    level.scr_anim["shotgun"]["casual_killer_walk_stop"] = %casual_killer_walk_stop_shotgun;
    level.scr_anim["generic"]["casual_killer_walk_start"] = %casual_killer_walk_start;
    level.scr_anim["generic"]["casual_killer_jog_stop"] = %casual_killer_jog_stop;
    level.scr_anim["generic"]["casual_killer_jog_start"] = %casual_killer_jog_start;
    level.scr_anim["generic"]["casual_killer_stand_aim5"][0] = %h2_casual_killer_stand_idle;
    level.scr_anim["generic"]["casual_killer_flinch"] = %casual_killer_flinch;
    level.scr_anim["generic"]["casual_killer_flinch2"] = %casual_killer_flinch2;
    level.scr_anim["generic"]["casual_killer_weapon_swap"] = %casual_killer_walk_f_weapon_swap;
    level.scr_anim["generic"]["grenadier_fire_and_reload"] = %h2_casual_killer_stand_reload_grenadier;
    level.scr_anim["generic"]["stand_exposed_wave_move_out"] = %stand_exposed_wave_move_out;
    level.scr_anim["generic"]["stand_exposed_wave_halt_v2"] = %stand_exposed_wave_halt_v2;
    level.scr_anim["generic"]["CornerStndR_alert_signal_move_out"] = %cornerstndr_alert_signal_move_out;
    level.scr_anim["generic"]["CornerStndR_alert_signal_stopstay_down"] = %cornerstndr_alert_signal_stopstay_down;
    level.scr_anim["generic"]["CornerStndR_alert_signal_enemy_spotted"] = %cornerstndr_alert_signal_enemy_spotted;
    level.scr_anim["shotgun"]["elevator_scene"] = %h2_airport_elevator_kiril;
    level.scr_anim["makarov"]["elevator_scene"] = %h2_airport_elevator_makarov;
    maps\_anim::addnotetrack_dialogue( "makarov", "dialog", "elevator_scene", "airport_mkv_noruss" );
    maps\_anim::addnotetrack_flag( "makarov", "start_civilians", "start_civilians", "elevator_scene" );
    maps\_anim::addnotetrack_flag( "makarov", "makarov_open_fire", "lobby_open_fire", "elevator_scene" );
    level.scr_anim["saw"]["elevator_scene"] = %h2_airport_elevator_lev;
    level.scr_anim["m4"]["elevator_scene"] = %h2_airport_elevator_viktor;
    level.scr_anim["shotgun"]["walking_toward_stairs"] = %h2_airport_elevator_leave_kiril;
    level.scr_goaltime["shotgun"]["walking_toward_stairs"] = 0.5;
    level.scr_anim["makarov"]["walking_toward_stairs"] = %h2_airport_elevator_leave_makarov;
    level.scr_goaltime["makarov"]["walking_toward_stairs"] = 0.5;
    level.scr_anim["saw"]["walking_toward_stairs"] = %h2_airport_elevator_leave_lev;
    level.scr_goaltime["saw"]["walking_toward_stairs"] = 0.5;
    level.scr_anim["m4"]["walking_toward_stairs"] = %h2_airport_elevator_leave_viktor;
    level.scr_goaltime["m4"]["walking_toward_stairs"] = 0.5;
    level.scr_anim["generic"]["h2_airport_intro_civilian1"] = %h2_airport_intro_civilian1;
    level.scr_anim["generic"]["h2_airport_intro_civilian2"] = %h2_airport_intro_civilian2;
    level.scr_anim["generic"]["h2_airport_intro_civilian3"] = %h2_airport_intro_civilian3;
    level.scr_anim["generic"]["h2_airport_intro_civilian4"] = %h2_airport_intro_civilian4;
    level.scr_anim["generic"]["h2_airport_intro_civilian5"] = %h2_airport_intro_civilian5;
    level.scr_anim["generic"]["h2_airport_intro_civilian6"] = %h2_airport_intro_civilian6;
    level.scr_anim["generic"]["h2_airport_intro_civilian7"] = %h2_airport_intro_civilian7;
    level.scr_anim["generic"]["h2_airport_intro_civilian8"] = %h2_airport_intro_civilian8;
    level.scr_anim["generic"]["h2_airport_intro_civilian9"] = %h2_airport_intro_civilian9;
    level.scr_anim["generic"]["h2_airport_intro_civilian10"] = %h2_airport_intro_civilian10;
    level.scr_anim["generic"]["h2_airport_intro_civilian11"] = %h2_airport_intro_civilian11;
    level.scr_anim["generic"]["h2_airport_intro_civilian12"] = %h2_airport_intro_civilian12;
    level.scr_anim["generic"]["h2_airport_intro_civilian13"] = %h2_airport_intro_civilian13;
    level.scr_anim["generic"]["h2_airport_intro_civilian14"] = %h2_airport_intro_civilian14;
    level.scr_anim["generic"]["h2_airport_intro_civilian15"] = %h2_airport_intro_civilian15;
    level.scr_anim["generic"]["h2_airport_intro_civilian16"] = %h2_airport_intro_civilian16;
    level.scr_anim["generic"]["h2_airport_intro_civilian17"] = %h2_airport_intro_civilian17;
    level.scr_anim["generic"]["h2_airport_intro_civilian18"] = %h2_airport_intro_civilian18;
    level.scr_anim["generic"]["h2_airport_intro_civilian19"] = %h2_airport_intro_civilian19;
    level.scr_anim["generic"]["h2_airport_intro_civilian20"] = %h2_airport_intro_civilian20;
    level.scr_anim["generic"]["h2_airport_intro_civilian21"] = %h2_airport_intro_civilian21;
    level.scr_anim["generic"]["h2_airport_intro_civilian22"] = %h2_airport_intro_civilian22;
    level.scr_anim["generic"]["h2_airport_intro_civilian23"] = %h2_airport_intro_civilian23;
    level.scr_anim["generic"]["h2_airport_intro_civilian24"] = %h2_airport_intro_civilian24;
    level.scr_anim["generic"]["h2_airport_intro_civilian25"] = %h2_airport_intro_civilian25;
    level.scr_anim["generic"]["h2_airport_intro_civilian26"] = %h2_airport_intro_civilian26;
    level.scr_anim["generic"]["h2_airport_intro_civilian27"] = %h2_airport_intro_civilian27;
    level.scr_anim["generic"]["h2_airport_intro_civilian28"] = %h2_airport_intro_civilian28;
    level.scr_anim["generic"]["h2_airport_intro_civilian29"] = %h2_airport_intro_civilian29;
    level.scr_anim["generic"]["h2_airport_intro_civilian30"] = %h2_airport_intro_civilian30;
    level.scr_anim["generic"]["h2_airport_intro_civilian31"] = %h2_airport_intro_civilian31;
    level.scr_anim["generic"]["h2_airport_intro_policeman1"] = %h2_airport_intro_policeman1;
    maps\_anim::addnotetrack_attach( "generic", "pistol_pickup", getweaponmodel( "beretta" ), "TAG_WEAPON_RIGHT", "h2_airport_intro_policeman1" );
    level.scr_anim["generic"]["h2_airport_intro_policeman2"] = %h2_airport_intro_policeman2;
    maps\_anim::addnotetrack_attach( "generic", "pistol_pickup", getweaponmodel( "beretta" ), "TAG_WEAPON_RIGHT", "h2_airport_intro_policeman2" );
    level.scr_anim["generic"]["makarov_elevator_reload"] = %stand_2_melee_1;
    level.scr_anim["generic"]["m4_elevator_reload"] = %exposed_reloadb;
    level.scr_anim["generic"]["shotgun_elevator_reload"] = %exposed_pain_face;
    level.scr_anim["generic"]["saw_elevator_reload"] = %exposed_reload;
    level.scr_anim["generic"]["m4_elevator_idle"][0] = %corner_standl_alert_idle;
    level.scr_anim["generic"]["shotgun_elevator_idle"][0] = %corner_standr_alert_idle;
    level.scr_anim["generic"]["civilian_texting_standing"][0] = %civilian_texting_standing;
    level.scr_anim["generic"]["civilian_atm"][0] = %civilian_atm;
    level.scr_anim["generic"]["civilian_stand_idle"][0] = %civilian_stand_idle;
    level.scr_anim["generic"]["unarmed_cowerstand_idle"][0] = %unarmed_cowerstand_idle;
    level.scr_anim["generic"]["airport_civ_in_line_6_A_reaction"] = %airport_civ_in_line_6_a_reaction;
    level.scr_anim["generic"]["airport_civ_in_line_6_B_reaction"] = %airport_civ_in_line_6_b_reaction;
    level.scr_anim["generic"]["airport_civ_in_line_6_C_reaction"] = %airport_civ_in_line_6_c_reaction;
    level.scr_anim["generic"]["airport_civ_in_line_9_A_reaction"] = %airport_civ_in_line_9_a_reaction;
    level.scr_anim["generic"]["airport_civ_in_line_9_B_reaction"] = %airport_civ_in_line_9_b_reaction;
    level.scr_anim["generic"]["airport_civ_in_line_9_C_reaction"] = %airport_civ_in_line_9_c_reaction;
    level.scr_anim["generic"]["airport_civ_in_line_10_A_reaction"] = %airport_civ_in_line_10_a_reaction;
    level.scr_anim["generic"]["airport_civ_in_line_10_B_reaction"] = %airport_civ_in_line_10_b_reaction;
    level.scr_anim["generic"]["airport_civ_in_line_10_C_reaction"] = %airport_civ_in_line_10_c_reaction;
    level.scr_anim["generic"]["airport_civ_in_line_12_A_reaction"] = %airport_civ_in_line_12_a_reaction;
    level.scr_anim["generic"]["airport_civ_in_line_12_B_reaction"] = %airport_civ_in_line_12_b_reaction;
    level.scr_anim["generic"]["airport_civ_in_line_12_C_reaction"] = %airport_civ_in_line_12_c_reaction;
    level.scr_anim["generic"]["airport_civ_in_line_15_A_reaction"] = %airport_civ_in_line_15_a_reaction;
    level.scr_anim["generic"]["airport_civ_in_line_15_B_reaction"] = %airport_civ_in_line_15_b_reaction;
    level.scr_anim["generic"]["airport_civ_in_line_15_C_reaction"] = %airport_civ_in_line_15_c_reaction;
    level.scr_anim["generic"]["airport_civ_in_line_13_A_reaction"] = %airport_civ_in_line_13_a_reaction;
    level.scr_anim["generic"]["airport_civ_in_line_13_C_reaction"] = %airport_civ_in_line_13_c_reaction;
    level.scr_anim["generic"]["exposed_crouch_death_flip"] = %exposed_crouch_death_flip;
    level.scr_anim["generic"]["stairs_up"][0] = %traverse_stair_run_01;
    level.scr_anim["generic"]["stairs_up"][1] = %run_react_stumble;
    level.scr_anim["generic"]["stairs_up_weights"][0] = 3;
    level.scr_anim["generic"]["stairs_up_weights"][1] = 1;
    level.scr_anim["generic"]["riotshield_run"] = %riotshield_run_f;
    level.scr_anim["generic"]["riotshield_sprint"] = %riotshield_sprint;
    level.scr_anim["shotgun"]["casual_killer_jog_A"] = %casual_killer_jog_a_shotgun;
    level.scr_anim["m4"]["casual_killer_jog_A"] = %casual_killer_jog_a;
    level.scr_anim["makarov"]["casual_killer_jog_A"] = %casual_killer_jog_a_makarov;
    level.scr_anim["saw"]["casual_killer_jog_A"] = %casual_killer_jog_a_m240;
    level.scr_anim["generic"]["casual_killer_jog_B"] = %casual_killer_jog_b;
    level.scr_anim["generic"]["casual_killer_jog"][0] = %casual_killer_jog_b;
    level.scr_anim["generic"]["casual_killer_jog"][1] = %casual_killer_jog_a;
    level.scr_anim["generic"]["casual_killer_walk_F"] = %casual_killer_walk_f;
    level.scr_anim["generic"]["casual_killer_walk_R"] = %casual_killer_walk_r;
    level.scr_anim["generic"]["casual_killer_walk_L"] = %casual_killer_walk_l;
    level.scr_anim["generic"]["DRS_sprint"] = undefined;
    level.scr_anim["generic"]["DRS_sprint"][0] = %casual_killer_jog_b;
    level.scr_anim["generic"]["DRS_sprint"][1] = %casual_killer_jog_a;
    level.scr_anim["generic"]["DRS_run"] = undefined;
    level.scr_anim["generic"]["DRS_combat_jog"] = undefined;
    level.scr_anim["generic"]["DRS_run_2_stop"] = %patrol_bored_walk_2_bored;
    level.scr_anim["generic"]["DRS_stop_idle"][0] = %patrol_bored_idle;
    level.scr_anim["generic"]["signal_go"] = undefined;
    level.scr_anim["generic"]["airport_security_guard_2"] = %airport_security_guard_2;
    maps\_anim::addnotetrack_customfunction( "generic", "bodyshot", ::_id_AF98, "airport_security_guard_2" );
    level.scr_anim["generic"]["airport_security_guard_3"] = %airport_security_guard_3;
    maps\_anim::addnotetrack_customfunction( "generic", "headshot", ::_id_AF98, "airport_security_guard_3" );
    level.scr_anim["generic"]["airport_security_guard_4"] = %airport_security_guard_4;
    maps\_anim::addnotetrack_customfunction( "generic", "headshot", ::_id_AF98, "airport_security_guard_4" );
    level.scr_anim["generic"]["corner_standR_death_grenade_explode"] = %corner_standr_death_grenade_explode;
    level.scr_anim["generic"]["dying_crawl_death_v3"] = %dying_crawl_death_v3;
    level.scr_anim["generic"]["run_death_facedown"] = %run_death_facedown;
    level.scr_anim["generic"]["dying_back_death_v2"] = %dying_back_death_v2;
    level.scr_anim["generic"]["coverstand_death_right"] = %coverstand_death_right;
    level.scr_anim["generic"]["covercrouch_death_3"] = %covercrouch_death_3;
    level.scr_anim["generic"]["civ_run_array"][0] = %civilian_run_hunched_a;
    level.scr_anim["generic"]["civ_run_array"][1] = %civilian_run_hunched_c;
    level.scr_anim["generic"]["civ_run_array"][2] = %civilian_run_hunched_flinch;
    level.scr_anim["generic"]["civilian_run_hunched_flinch"] = %civilian_run_hunched_flinch;
    level.scr_anim["generic"]["unarmed_cowercrouch_idle"][0] = %unarmed_cowercrouch_idle;
    level.scr_anim["generic"]["unarmed_cowercrouch_idle_reach"] = %unarmed_cowercrouch_idle;
    level.scr_anim["generic"]["unarmed_cowercrouch_idle_duck"][0] = %unarmed_cowercrouch_idle_duck;
    level.scr_anim["generic"]["unarmed_cowercrouch_duck"] = %unarmed_cowercrouch_idle_duck;
    level.scr_anim["generic"]["unarmed_cowercrouch_react_A"] = %unarmed_cowercrouch_react_a;
    level.scr_anim["generic"]["unarmed_cowercrouch_react_B"] = %unarmed_cowercrouch_react_b;
    level.scr_anim["generic"]["unarmed_cowerstand_pointidle"][0] = %unarmed_cowerstand_pointidle;
    level.scr_anim["generic"]["h2_airport_civ_dying_groupa_kneel_idle"][0] = %h2_airport_civ_dying_groupa_kneel_idle;
    level.scr_anim["generic"]["h2_airport_civ_pillar_exit_idle"][0] = %h2_airport_civ_pillar_exit_idle;
    level.scr_anim["generic"]["h2_dcburning_bunker_stumble_idle"][0] = %h2_dcburning_bunker_stumble_idle;
    level.scr_anim["generic"]["cliffhanger_capture_Price_idle"][0] = %cliffhanger_capture_price_idle;
    level.scr_anim["generic"]["cliffhanger_capture_Price_idle_reach"] = %cliffhanger_capture_price_idle;
    level.scr_anim["generic"]["exposed_squat_idle_grenade_F"][0] = %exposed_squat_idle_grenade_f;
    level.scr_anim["generic"]["exposed_squat_idle_grenade_F_reach"] = %exposed_squat_idle_grenade_f;
    level.scr_anim["generic"]["coup_civilians_interrogated_civilian_v1"][0] = %coup_civilians_interrogated_civilian_v1;
    level.scr_anim["generic"]["coup_civilians_interrogated_civilian_v1_reach"] = %coup_civilians_interrogated_civilian_v1;
    level.scr_anim["generic"]["coup_civilians_interrogated_civilian_v3"][0] = %coup_civilians_interrogated_civilian_v3;
    level.scr_anim["generic"]["run_pain_fallonknee"] = %run_pain_fallonknee;
    level.scr_anim["generic"]["breach_react_desk_v5"] = %breach_react_desk_v5;
    level.scr_anim["generic"]["breach_react_desk_v6"] = %breach_react_desk_v6;
    level.scr_anim["generic"]["crouch_2run_L"] = %crouch_2run_l;
    level.scr_anim["generic"]["stand_2_run_L"] = %stand_2_run_l;
    level.scr_anim["generic"]["stand_2_run_F_2"] = %stand_2_run_f_2;
    level.scr_anim["generic"]["slide_across_car"] = %h2_airport_slide_across;
    level.scr_anim["generic"]["slide_across_car_death"] = %h2_airport_slide_across_death;
    maps\_anim::addnotetrack_customfunction( "generic", "traverse_death", ::_id_C6FA, "slide_across_car" );
    level.scr_anim["generic"]["melee_f_awin_attack"] = %melee_f_awin_attack;
    level.scr_anim["generic"]["melee_f_awin_defend"] = %melee_f_awin_defend;
    maps\_anim::addnotetrack_customfunction( "generic", "sync", ::_id_AAD9, "melee_f_awin_defend" );
    maps\_anim::addnotetrack_customfunction( "generic", "bodyfall large", ::_id_AE67, "melee_f_awin_defend" );
    level.scr_anim["generic"]["cliffhanger_Price_intro_idle"][0] = %cliffhanger_price_intro_idle;
    level.scr_anim["generic"]["crawl_death_front"] = %crawl_death_front;
    level.scr_anim["generic"]["run_react_180"] = %run_reaction_180;
    level.scr_anim["generic"]["run_turn_180"] = %run_turn_180;
    level.scr_anim["generic"]["airport_civ_fear_drop_5"] = %airport_civ_fear_drop_5;
    level.scr_anim["generic"]["airport_civ_fear_drop_6"] = %airport_civ_fear_drop_6;
    level.scr_anim["generic"]["run_stumble0"] = %run_pain_fallonknee;
    level.scr_anim["generic"]["run_stumble1"] = %run_pain_fallonknee;
    level.scr_anim["generic"]["run_stumble2"] = %run_pain_fallonknee;
    level.scr_anim["generic"]["run_death0"] = %run_death_facedown;
    level.scr_anim["generic"]["run_death1"] = %run_death_roll;
    level.scr_anim["generic"]["run_death2"] = %airport_security_guard_3_reaction;
    level.scr_anim["generic"]["run_death3"] = %airport_security_guard_4_reaction;
    level.scr_anim["generic"]["unarmed_cowerstand_react"] = %unarmed_cowerstand_react;
    level.scr_anim["generic"]["unarmed_cowerstand_react_2_crouch"] = %unarmed_cowerstand_react_2_crouch;
    level.scr_anim["generic"]["airport_civ_cower_piller_idle"][0] = %airport_civ_cower_piller_idle;
    level.scr_anim["generic"]["DC_Burning_bunker_stumble"] = %dc_burning_bunker_stumble;
    level.scr_anim["generic"]["DC_Burning_bunker_sit_idle"][0] = %dc_burning_bunker_sit_idle;
    level.scr_anim["generic"]["DC_Burning_bunker_react"] = %dc_burning_bunker_react;
    level.scr_anim["generic"]["airport_civ_pillar_exit"] = %airport_civ_pillar_exit;
    level.scr_anim["generic"]["airport_civ_pillar_exit_death"] = %airport_civ_pillar_exit_death;
    level.scr_anim["generic"]["airport_civ_cellphone_hide"] = %airport_civ_cellphone_hide;
    level.scr_anim["generic"]["airport_civ_cellphone_death"] = %airport_civ_cellphone_death;
    level.scr_anim["generic"]["airport_civ_dying_groupA_kneel"] = %airport_civ_dying_groupa_kneel;
    level.scr_anim["generic"]["airport_civ_dying_groupA_kneel_death"] = %airport_civ_dying_groupa_kneel_death;
    level.scr_anim["generic"]["airport_civ_dying_groupA_lean"] = %airport_civ_dying_groupa_lean;
    level.scr_anim["generic"]["airport_civ_dying_groupB_pull"] = %airport_civ_dying_groupb_pull;
    level.scr_anim["generic"]["airport_civ_dying_groupB_pull_death"] = %airport_civ_dying_groupb_pull_death;
    level.scr_anim["generic"]["airport_civ_dying_groupB_wounded"] = %airport_civ_dying_groupb_wounded;
    level.scr_anim["generic"]["airport_civ_dying_groupB_wounded_death"] = %airport_civ_dying_groupb_wounded_death;
    level.scr_anim["generic"]["dying_crawl_back"] = %bleedout_crawlb;
    level.scr_anim["generic"]["bleedout_crawlB"] = %bleedout_crawlb;
    level.scr_anim["generic"]["dying_back_death_v1"] = %dying_back_death_v1;
    level.scr_anim["generic"]["civilian_leaning_death"] = %civilian_leaning_death;
    level.scr_anim["generic"]["civilian_leaning_death_shot"] = %civilian_leaning_death_shot;
    level.scr_anim["generic"]["civilian_crawl_1"] = %civilian_crawl_1;
    level.scr_anim["generic"]["civilian_crawl_2"] = %civilian_crawl_2;
    level.scr_anim["generic"]["dying_crawl"] = %dying_crawl;
    level.scr_anim["crawl_death_1"]["crawl"] = %civilian_crawl_1;
    level.scr_anim["crawl_death_1"]["death"][0] = %civilian_crawl_1_death_a;
    level.scr_anim["crawl_death_1"]["death"][1] = %civilian_crawl_1_death_b;
    level.scr_anim["crawl_death_1"]["blood_fx_rate"] = 0.5;
    level.scr_anim["crawl_death_1"]["blood_fx"] = "blood_drip";
    level.scr_anim["crawl_death_2"]["crawl"] = %civilian_crawl_2;
    level.scr_anim["crawl_death_2"]["death"][0] = %civilian_crawl_2_death_a;
    level.scr_anim["crawl_death_2"]["death"][1] = %civilian_crawl_2_death_b;
    level.scr_anim["crawl_death_2"]["blood_fx_rate"] = 0.25;
    level.scr_anim["generic"]["corner_standR_alert_idle"][0] = %corner_standr_alert_idle;
    level.scr_anim["generic"]["corner_standR_trans_IN_2"] = %corner_standr_trans_in_2;
    level.scr_anim["generic"]["corner_standR_trans_IN_1"] = %corner_standr_trans_in_1;
    level.scr_anim["generic"]["walk_left"] = %walk_left;
    level.scr_anim["generic"]["stand_2_run_L"] = %stand_2_run_l;
    level.scr_anim["generic"]["run_2_stand_F_6"] = %run_2_stand_f_6;
    level.scr_anim["generic"]["exposed_fast_grenade_F2"] = %exposed_fast_grenade_f2;
    maps\_anim::addnotetrack_attach( "generic", "grenade_right", "projectile_m67fraggrenade", "TAG_INHAND", "exposed_fast_grenade_F2" );
    maps\_anim::addnotetrack_detach( "generic", "fire", "projectile_m67fraggrenade", "TAG_INHAND", "exposed_fast_grenade_F2" );
    maps\_anim::addnotetrack_customfunction( "generic", "fire", ::_id_BB3F, "exposed_fast_grenade_F2" );
    level.scr_anim["generic"]["airport_security_guard_pillar_react_L"] = %airport_security_guard_pillar_react_l;
    maps\_anim::addnotetrack_customfunction( "generic", "fire", ::_id_BF9E, "airport_security_guard_pillar_react_L" );
    level.scr_anim["generic"]["airport_security_guard_pillar_death_L"] = %airport_security_guard_pillar_death_l;
    level.scr_anim["generic"]["airport_security_guard_pillar_react_R"] = %airport_security_guard_pillar_react_r;
    maps\_anim::addnotetrack_customfunction( "generic", "fire", ::_id_BF9E, "airport_security_guard_pillar_react_R" );
    level.scr_anim["generic"]["airport_security_guard_pillar_death_R"] = %airport_security_guard_pillar_death_r;
    level.scr_anim["generic"]["airport_security_civ_rush_guard"] = %airport_security_civ_rush_guard;
    maps\_anim::addnotetrack_customfunction( "generic", "shout", ::_id_C67C, "airport_security_civ_rush_guard" );
    level.scr_anim["generic"]["airport_security_civ_rush_guard"] = %airport_security_civ_rush_guard;
    maps\_anim::addnotetrack_customfunction( "generic", "fire", ::_id_AAA0, "airport_security_civ_rush_guard" );
    level.scr_anim["generic"]["airport_security_civ_rush_civA"] = %airport_security_civ_rush_civa;
    level.scr_anim["generic"]["airport_security_civ_rush_civB"] = %airport_security_civ_rush_civb;
    level.scr_anim["generic"]["airport_security_civ_rush_civC"] = %airport_security_civ_rush_civc;
    level.scr_anim["generic"]["corner_standL_rambo_jam"] = %corner_standl_rambo_jam;
    level.scr_anim["generic"]["corner_standL_rambo_set"] = %corner_standl_rambo_set;
    level.scr_anim["generic"]["death_shotgun_legs"] = %death_shotgun_legs;
    level.scr_anim["generic"]["exposed_death_falltoknees"] = %exposed_death_falltoknees;
    level.scr_anim["generic"]["exposed_death_falltoknees_02"] = %exposed_death_falltoknees_02;
    level.scr_anim["generic"]["exposed_death_blowback"] = %exposed_death_blowback;
    level.scr_anim["generic"]["covercrouch_blindfire_1"] = %covercrouch_blindfire_1;
    level.scr_anim["generic"]["covercrouch_blindfire_2"] = %covercrouch_blindfire_2;
    level.scr_anim["generic"]["covercrouch_hide_idle"][0] = %covercrouch_hide_idle;
    level.scr_anim["generic"]["walk_backward"] = %walk_backward;
    level.scr_anim["generic"]["exposed_backpedal"] = %exposed_backpedal;
    level.scr_anim["generic"]["react_stand_2_run_180"] = %react_stand_2_run_180;
    level.scr_anim["generic"]["exposed_crouch_2_stand"] = %exposed_crouch_2_stand;
    level.scr_anim["generic"]["death_explosion_stand_L_v3"] = %death_explosion_stand_l_v3;
    level.scr_anim["generic"]["death_explosion_stand_R_v1"] = %death_explosion_stand_r_v1;
    level.scr_anim["generic"]["death_explosion_stand_B_v1"] = %death_explosion_stand_b_v1;
    level.scr_anim["generic"]["death_explosion_stand_B_v2"] = %death_explosion_stand_b_v2;
    level.scr_anim["generic"]["death_explosion_stand_B_v3"] = %death_explosion_stand_b_v3;
    level.scr_anim["generic"]["death_explosion_stand_B_v4"] = %death_explosion_stand_b_v4;
    level.scr_anim["generic"]["death_explosion_run_R_v1"] = %death_explosion_run_r_v1;
    level.scr_anim["generic"]["death_explosion_run_R_v2"] = %death_explosion_run_r_v2;
    level.scr_anim["generic"]["death_explosion_run_L_v1"] = %death_explosion_run_l_v1;
    level.scr_anim["generic"]["death_explosion_run_L_v2"] = %death_explosion_run_l_v2;
    level.scr_anim["generic"]["death_explosion_run_B_v1"] = %death_explosion_run_b_v1;
    level.scr_anim["generic"]["death_explosion_run_B_v2"] = %death_explosion_run_b_v2;
    level.scr_anim["generic"]["death_explosion_run_F_v1"] = %death_explosion_run_f_v1;
    level.scr_anim["generic"]["death_explosion_run_F_v2"] = %death_explosion_run_f_v2;
    level.scr_anim["generic"]["corner_standL_alert_idle_reach"] = %corner_standl_alert_idle;
    level.scr_anim["generic"]["corner_standL_alert_idle"][0] = %corner_standl_alert_idle;
    level.scr_anim["generic"]["corner_standR_alert_idle"][0] = %corner_standr_alert_idle;
    level.scr_anim["generic"]["exposed_grenadeThrowB"] = %exposed_grenadethrowb;
    maps\_anim::addnotetrack_attach( "generic", "grenade_right", "projectile_m67fraggrenade", "TAG_INHAND", "exposed_grenadeThrowB" );
    maps\_anim::addnotetrack_detach( "generic", "grenade_throw", "projectile_m67fraggrenade", "TAG_INHAND", "exposed_grenadeThrowB" );
    maps\_anim::addnotetrack_customfunction( "generic", "grenade_throw", ::_id_C1EA, "exposed_grenadeThrowB" );
    level.scr_anim["generic"]["corner_standL_explosion_B"] = %corner_standl_explosion_b;
    level.scr_anim["generic"]["corner_standR_trans_OUT_6"] = %corner_standr_trans_out_6;
    level.scr_anim["generic"]["run_turn_R90"] = %run_turn_r90;
    level.scr_anim["generic"]["CornerCrL_alert_idle"][0] = %cornercrl_alert_idle;
    level.scr_anim["generic"]["CornerCrL_look_fast"] = %cornercrl_look_fast;
    level.scr_anim["generic"]["CornerCrR_alert_idle"][0] = %cornercrr_alert_idle;
    level.scr_anim["generic"]["CornerCrR_alert_first_frame"] = %cornercrr_alert_idle;
    level.scr_anim["shotgun"]["walk_start_after_elevator_massacre"] = %h2_casual_killer_walk_start_28l;
    level.scr_anim["generic"]["civilian_run_hunched_turnR90_slide"] = %civilian_run_hunched_turnr90_slide;
    level.scr_anim["generic"]["airport_civilian_run_turnR_90"] = %airport_civilian_run_turnr_90;
    level.scr_anim["generic"]["civilian_run_hunched_A"] = %civilian_run_hunched_a;
    level.scr_anim["generic"]["civilian_run_hunched_C"] = %civilian_run_hunched_c;
    level.scr_anim["makarov"]["going_down_stairs"] = %h2_airport_stairs_down_makarov;
    level.scr_anim["saw"]["going_down_stairs"] = %h2_airport_stairs_down_lev;
    level.scr_anim["shotgun"]["going_down_stairs"] = %h2_airport_stairs_down_kiril;
    level.scr_anim["m4"]["going_down_stairs"] = %h2_airport_stairs_down_viktor;
    maps\_anim::addnotetrack_dialogue( "makarov", "dialog", "going_down_stairs", "airport_mkv_letsgo2" );
    level.scr_anim["generic"]["doorkick_basement"] = %doorkick_2_cqbwalk;
    maps\_anim::addnotetrack_customfunction( "generic", "kick", ::_id_C801, "doorkick_basement" );
    level.scr_anim["makarov"]["get_ready"] = %h2_airport_door_opening_makarov_in;
    level.scr_anim["makarov"]["ready_idle"][0] = %h2_airport_door_opening_makarov_loop_short;
    level.scr_anim["makarov"]["ready_idle"][1] = %h2_airport_door_opening_makarov_loop_long;
    level.scr_anim["makarov"]["opening_door"] = %h2_airport_door_opening_makarov_out;
    level.scr_anim["comrad"]["get_ready"] = %h2_airport_door_opening_viktor_in;
    level.scr_anim["comrad"]["ready_idle"][0] = %h2_airport_door_opening_viktor_loop;
    level.scr_anim["comrad"]["ready_idle"][1] = %h2_airport_door_opening_viktor_loop_breaker;
    level.scr_anim["comrad"]["follow_makarov"] = %h2_airport_door_opening_viktor_out;
    level.scr_anim["generic"]["doorkick_escape"] = %doorkick_2_cqbwalk;
    maps\_anim::addnotetrack_customfunction( "generic", "kick", ::_id_BDFB, "doorkick_escape" );
    level.scr_anim["generic"]["bog_a_start_briefing"] = %bog_a_start_briefing;
    level.scr_anim["generic"]["bog_b_guard_react"] = %bog_b_guard_react;
    level.scr_anim["makarov"]["makarov_first_breach"] = %h2_airport_first_breach_makarov;
    level.scr_anim["saw"]["lev_first_breach"] = %h2_airport_first_breach_lev;
    level.scr_anim["shotgun"]["kiril_first_breach"] = %h2_airport_first_breach_kiril;
    level.scr_anim["m4"]["viktor_first_breach"] = %h2_airport_first_breach_viktor;
    level.scr_anim["makarov"]["first_breach_arrival"] = %h2_airport_first_breach_makarov_arrival;
    level.scr_anim["saw"]["first_breach_arrival"] = %h2_airport_first_breach_lev_arrival;
    level.scr_anim["shotgun"]["first_breach_arrival"] = %h2_airport_first_breach_kiril_arrival;
    level.scr_anim["m4"]["first_breach_arrival"] = %h2_airport_first_breach_viktor_arrival;
    level.scr_anim["makarov"]["first_breach_loop"] = [ %h2_airport_first_breach_makarov_loop ];
    level.scr_anim["saw"]["first_breach_loop"] = [ %h2_airport_first_breach_lev_loop ];
    level.scr_anim["shotgun"]["first_breach_loop"] = [ %h2_airport_first_breach_kiril_loop ];
    level.scr_anim["m4"]["first_breach_loop"] = [ %h2_airport_first_breach_viktor_loop ];
    level.scr_anim["makarov"]["first_breach_idle"] = %h2_airport_first_breach_makarov_idle;
    level.scr_anim["saw"]["first_breach_idle"] = %h2_airport_first_breach_lev_idle;
    level.scr_anim["shotgun"]["first_breach_idle"] = %h2_airport_first_breach_kiril_idle;
    level.scr_anim["m4"]["first_breach_idle"] = %h2_airport_first_breach_viktor_idle;
    maps\_anim::addnotetrack_dialogue( "makarov", "dialog", "first_breach_idle", "airport_mkv_ontime" );
    maps\_anim::addnotetrack_dialogue( "makarov", "dialog2", "first_breach_idle", "airport_mkv_checkammo" );
    maps\_anim::addnotetrack_dialogue( "m4", "dialog", "first_breach_idle", "airport_vkt_beenwaiting2" );
    maps\_anim::addnotetrack_dialogue( "makarov", "dialog3", "first_breach_idle", "airport_mkv_haventweall" );
    level.scr_anim["generic"]["pistol_sprint"] = %pistol_sprint;
    level.scr_anim["generic"]["pistol_walk_left"] = %pistol_walk_left;
    level.scr_anim["generic"]["pistol_walk_right"] = %pistol_walk_right;
    level.scr_anim["generic"]["pistol_walk"] = %pistol_walk;
    level.scr_anim["generic"]["pistol_walk_back"] = %pistol_walk_back;
    level.scr_anim["generic"]["sprint_loop_distant"] = %sprint_loop_distant;
    level.scr_anim["generic"]["coverstand_grenadeA"] = %coverstand_grenadea;
    maps\_anim::addnotetrack_customfunction( "generic", "grenade_throw", ::_id_B22C, "coverstand_grenadeA" );
    level.scr_anim["generic"]["coverstand_grenadeB"] = %coverstand_grenadeb;
    maps\_anim::addnotetrack_customfunction( "generic", "grenade_throw", ::_id_B22C, "coverstand_grenadeB" );
    level.scr_anim["generic"]["pistol_stand_pullout"] = %pistol_stand_pullout;
    level.scr_anim["generic"]["pistol_stand_aim_5"][0] = %pistol_stand_aim_5;
    level.scr_anim["generic"]["pistol_crouchaimstraight2stand"] = %pistol_crouchaimstraight2stand;
    level.scr_anim["generic"]["riotshield_idle"][0] = %riotshield_idle;
    level.scr_anim["generic"]["traverse_jumpdown_40"] = %traverse_jumpdown_40;
    level.scr_anim["generic"]["bm21_driver_idle"][0] = %bm21_driver_idle;
    level.scr_anim["generic"]["bm21_driver_climbout"] = %bm21_driver_climbout;
    level.scr_anim["generic"]["exposed_crouch_2_stand"] = %exposed_crouch_2_stand;
    level.scr_anim["generic"]["casual_stand_idle_trans_in"] = %casual_stand_idle_trans_in;
    level.scr_anim["generic"]["casual_stand_idle"][0] = %casual_stand_idle;
    level.scr_anim["generic"]["casual_stand_idle"][1] = %casual_stand_idle_twitch;
    level.scr_anim["generic"]["casual_stand_idle"][2] = %casual_stand_idle_twitchb;
    level.scr_anim["generic"]["traverse_stepup_52"] = %traverse_stepup_52;
    level.scr_anim["generic"]["patrol_bored_walk_2_bored"] = %patrol_bored_walk_2_bored;
    level.scr_anim["generic"]["patrol_bored_2_walk"] = %patrol_bored_2_walk;
    level.scr_anim["generic"]["patrol_bored_idle"][0] = %patrol_bored_idle;
    level.scr_anim["generic"]["patrol_bored_patrolwalk"] = %patrol_bored_patrolwalk;
    level.scr_anim["van_mate"]["end_open_door"] = %h2_airport_ending_opendoors_quick_anatoly;
    maps\_anim::addnotetrack_dialogue( "van_mate", "dialog", "end_open_door", "airport_vt_madeit" );
    maps\_anim::addnotetrack_dialogue( "van_mate", "dialog", "end_open_door", "airport_vt_beenough" );
    maps\_anim::addnotetrack_flag( "van_mate", "start_soldiers", "start_ending_sequence", "end_open_door" );
    level.scr_anim["comrad"]["end_get_in"] = %h2_airport_ending_climb_viktor;
    level.scr_anim["makarov"]["end_get_in"] = %h2_airport_ending_climb_quick_makarov;
    maps\_anim::addnotetrack_sound( "makarov", "player_ready", "end_get_in", "scn_airport_weapon_toss" );
    maps\_anim::addnotetrack_flag( "makarov", "player_ready", "end_player_ready", "end_get_in" );
    maps\_anim::addnotetrack_flag( "makarov", "start_player", "end_makarov_in_place", "end_get_in" );
    maps\_anim::addnotetrack_dialogue( "makarov", "dialog", "end_get_in", "airport_mkv_nomessage" );
    maps\_anim::addnotetrack_dialogue( "makarov", "dialog", "end_get_in", "airport_mkv_thiswill" );
    maps\_anim::addnotetrack_dialogue( "makarov", "dialog", "end_get_in", "airport_mkv_allofrussia" );
    maps\_anim::addnotetrack_attach( "makarov", "pistol_pickup", getweaponmodel( "beretta" ), "TAG_INHAND", "end_get_in" );
    maps\_anim::addnotetrack_customfunction( "makarov", "gun_2_chest", ::_id_C9BC, "end_get_in" );
    maps\_anim::addnotetrack_customfunction( "makarov", "fire", ::_id_CF5C, "end_get_in" );
    maps\_anim::addnotetrack_customfunction( "makarov", "fire", maps\airport::_id_B70F, "end_get_in" );
    maps\_anim::addnotetrack_customfunction( "makarov", "fire", ::_id_ABF5, "end_get_in" );
    maps\_anim::addnotetrack_flag( "makarov", "close_door", "ambulance_close_door", "end_get_in" );
    maps\_anim::addnotetrack_flag( "makarov", "ambulance_leave", "ambulance_ready_to_leave", "end_get_in" );
    level.scr_anim["makarov"]["end_get_in_idle_in"] = %h2_airport_ending_climb_idle_in_makarov;
    level.scr_anim["makarov"]["end_get_in_idle"][0] = %h2_airport_ending_idle_makarov;
    level.scr_anim["comrad"]["end_get_in_idle"][0] = %h2_airport_ending_climb_idle_viktor;
    level.scr_anim["van_mate"]["end_get_in_idle_in"] = %h2_airport_ending_idle_in_anatoly;
    level.scr_anim["van_mate"]["end_get_in_idle"][0] = %h2_airport_ending_idle_anatoly;
    level.scr_anim["van_mate"]["end_player_shot"] = %h2_airport_ending_shoot_anatoly;
    level.scr_anim["makarov"]["end_player_shot"] = %h2_airport_ending_shoot_makarov;
    maps\_anim::addnotetrack_dialogue( "makarov", "dialog", "end_player_shot", "airport_mkv_nomessage" );
    maps\_anim::addnotetrack_dialogue( "makarov", "dialog", "end_player_shot", "airport_mkv_thiswill" );
    maps\_anim::addnotetrack_dialogue( "makarov", "dialog", "end_player_shot", "airport_mkv_allofrussia" );
    maps\_anim::addnotetrack_attach( "makarov", "pistol_pickup", getweaponmodel( "beretta" ), "TAG_INHAND", "end_player_shot" );
    maps\_anim::addnotetrack_customfunction( "makarov", "gun_2_chest", ::_id_C9BC, "end_player_shot" );
    maps\_anim::addnotetrack_customfunction( "makarov", "fire", ::_id_CF5C, "end_player_shot" );
    maps\_anim::addnotetrack_customfunction( "makarov", "fire", maps\airport::_id_B70F, "end_player_shot" );
    maps\_anim::addnotetrack_customfunction( "makarov", "fire", ::_id_ABF5, "end_player_shot" );
    maps\_anim::addnotetrack_flag( "makarov", "close_door", "ambulance_close_door", "end_player_shot" );
    maps\_anim::addnotetrack_flag( "makarov", "ambulance_leave", "ambulance_ready_to_leave", "end_player_shot" );
    level.scr_anim["generic"]["arriving_cops_1"] = %h2_airport_ending_fbs1;
    level.scr_anim["generic"]["arriving_cops_2"] = %h2_airport_ending_fbs2;
    level.scr_anim["generic"]["arriving_cops_3"] = %h2_airport_ending_fbs3;
    level.scr_anim["generic"]["patrol_jog_orders_once"] = %patrol_jog_orders_once;
    level.scr_anim["generic"]["patrol_boredjog_find"] = %patrol_boredjog_find;
    level.scr_anim["generic"]["patrol_boredrun_find"] = %patrol_boredrun_find;
    level.scr_anim["generic"]["patrol_jog_look_up_once"] = %patrol_jog_look_up_once;
    level.scr_anim["generic"]["patrol_jog_360_once"] = %patrol_jog_360_once;
    level.scr_anim["generic"]["patrol_jog"] = %patrol_jog;
    level.scr_anim["generic"]["afgan_chase_ending_search_spin"] = %afgan_chase_ending_search_spin;
    level.scr_anim["generic"]["pistol_stand_pullout"] = %pistol_stand_pullout;
    level.scr_anim["generic"]["pistol_stand_switch"] = %pistol_stand_switch;
    level.scr_anim["generic"]["civ_stand_2_run_l"] = %h2_airport_stand_2_run_l;
    level.scr_anim["generic"]["civ_fallon_knee"] = %h2_airport_run_pain_fallonknee;
    level.scr_anim["generic"]["yuri_elevator_ee"] = %h2_airport_elevator_yuri_stumble;
    level.scr_anim["makarov"]["climb_stairs"] = %h2_airport_climb_stairs_makarov;
    maps\_anim::addnotetrack_dialogue( "makarov", "dialog", "climb_stairs", "airport_mkv_upstairs" );
    level.scr_anim["m4"]["climb_stairs"] = %h2_airport_climb_stairs_viktor;
    level.scr_anim["saw"]["climb_stairs"] = %h2_airport_climb_stairs_lev;
    level.scr_anim["shotgun"]["climb_stairs"] = %h2_airport_climb_stairs_kiril;
    level.scr_anim["m4"]["recoil"] = %heat_stand_fire_auto;
}
#using_animtree("player");

player()
{
    level.scr_anim["player_ending"]["end_player_shot"] = %h2_airport_ending_player;
    maps\_anim::addnotetrack_flag( "player_ending", "start_fbs", "cops_arrive", "end_player_shot" );
    level.scr_animtree["player_ending"] = #animtree;
    level.scr_model["player_ending"] = "h2_gfl_ump45_viewbody";
}
#using_animtree("animated_props");

_id_C2FF()
{
    level.scr_anim["ending_weap"]["end_get_in"] = %h2_airport_ending_climbin_makarov_weapon;
    level.scr_anim["ending_weap"]["end_get_in_idle"][0] = %h2_airport_ending_climbin_makarov_weapon_idle;
    level.scr_anim["player_weapon"]["end_player_shot"] = %h2_airport_ending_player_weapon;
    level.scr_animtree["player_weapon"] = #animtree;
    level.scr_animtree["ending_weap"] = #animtree;
    level.scr_model["ending_weap"] = "weapon_m4";
    level.scr_animtree["sign"] = #animtree;
    level.scr_anim["sign"]["security_sign_anim_01"] = %h2_airport_sign_security_hit_01;
    level.scr_anim["sign"]["security_sign_anim_02"] = %h2_airport_sign_security_hit_02;
    level.scr_animtree["luggage"] = #animtree;
    level.scr_anim["luggage"]["h2_airport_xray_hugebag"] = %h2_airport_xray_hugebag;
    level.scr_anim["luggage"]["h2_airport_xray_dufflebag"] = %h2_airport_xray_dufflebag;
    level.scr_anim["luggage"]["h2_airport_xray_luggage"] = %h2_airport_xray_luggage;
    level.scr_anim["luggage"]["h2_airport_xray_schoolbag"] = %h2_airport_xray_schoolbag;
    level.scr_anim["luggage"]["h2_airport_xray_flaps"] = %h2_airport_xray_flaps;
}
#using_animtree("generic_human");

_id_D23E()
{
    level.scr_sound["makarov"]["airport_mkv_snamibog"] = "airport_mkv_snamibog";
    level.scr_sound["makarov"]["airport_mkv_noruss"] = "airport_mkv_noruss";
    level.scr_radio["airport_mkv_30secs"] = "airport_mkv_30secs";
    level.scr_radio["airport_mkv_go"] = "airport_mkv_go";
    level.scr_radio["airport_mkv_upstairs"] = "airport_mkv_upstairs";
    level.scr_radio["airport_mkv_clearedeng"] = "airport_mkv_clearedeng";
    level.scr_radio["airport_mkv_nosurvivors"] = "airport_mkv_nosurvivors";
    level.scr_radio["airport_mkv_noexceptions"] = "airport_mkv_noexceptions";
    level.scr_radio["airport_mkv_letsmoveup"] = "airport_mkv_letsmoveup";
    level.scr_radio["airport_mkv_letsgo2"] = "airport_mkv_letsgo2";
    level.scr_radio["airport_mkv_keepmoving"] = "airport_mkv_keepmoving";
    level.scr_radio["airport_mkv_thesesheep"] = "airport_mkv_thesesheep";
    level.scr_radio["airport_mkv_doubtyou"] = "airport_mkv_doubtyou";
    level.scr_radio["airport_mkv_openfire"] = "airport_mkv_openfire";
    level.scr_radio["airport_mkv_nice"] = "airport_mkv_nice";
    level.scr_radio["airport_mkv_welldone"] = "airport_mkv_welldone";
    level.scr_radio["airport_mkv_youtraitor"] = "airport_mkv_youtraitor";
    level.scr_radio["airport_mkv_cowards"] = "airport_mkv_cowards";
    level.scr_radio["airport_mkv_checkfire"] = "airport_mkv_checkfire";
    level.scr_sound["male_civ_1"]["stairs_line"] = "airport_rmc2_getdown";
    level.scr_sound["male_civ_2"]["stairs_line"] = "airport_rmc2_theyhaveguns";
    level.scr_sound["male_civ_3"]["stairs_line"] = "airport_rmc1_takeyoursister";
    level.scr_sound["male_civ_4"]["stairs_line"] = "airport_rmc2_dontwait";
    level.scr_sound["male_civ_5"]["stairs_line"] = "airport_rmc1_runaway";
    level.scr_sound["male_civ_6"]["stairs_line"] = "airport_rmc2_getoutofhere";
    level.scr_sound["female_civ_1"]["stairs_line"] = "airport_rfc1_hurryup";
    level.scr_sound["female_civ_2"]["stairs_line"] = "airport_rfc2_takethestairs";
    level.scr_sound["male_civ_1"]["scream1"] = "airport_rmc1_scream1";
    level.scr_sound["male_civ_1"]["scream2"] = "airport_rmc1_scream2";
    level.scr_sound["male_civ_1"]["scream3"] = "airport_rmc1_scream3";
    level.scr_sound["male_civ_1"]["scream4"] = "airport_rmc1_scream4";
    level.scr_sound["male_civ_2"]["scream1"] = "airport_rmc2_scream1";
    level.scr_sound["male_civ_2"]["scream2"] = "airport_rmc2_scream2";
    level.scr_sound["male_civ_2"]["scream3"] = "airport_rmc2_scream3";
    level.scr_sound["male_civ_2"]["scream4"] = "airport_rmc2_scream4";
    level.scr_sound["female_civ_1"]["scream1"] = "airport_rfc1_scream1";
    level.scr_sound["female_civ_1"]["scream2"] = "airport_rfc1_scream2";
    level.scr_sound["female_civ_1"]["scream3"] = "airport_rfc1_scream3";
    level.scr_sound["female_civ_1"]["scream4"] = "airport_rfc1_scream4";
    level.scr_sound["female_civ_2"]["scream1"] = "airport_rfc2_scream1";
    level.scr_sound["female_civ_2"]["scream2"] = "airport_rfc2_scream2";
    level.scr_sound["female_civ_2"]["scream3"] = "airport_rfc2_scream3";
    level.scr_sound["female_civ_2"]["scream4"] = "airport_rfc2_scream4";
    level.scr_sound["generic"]["airport_rmc2_myleg"] = "airport_rmc2_myleg";
    level.scr_sound["generic"]["airport_rmc2_scream2"] = "airport_rmc2_scream2";
    level.scr_sound["generic"]["airport_rmc1_mykatia"] = "airport_rmc1_mykatia";
    level.scr_sound["generic"]["airport_rmc1_runaway"] = "airport_rmc1_runaway";
    level.scr_sound["generic"]["airport_rmc1_scream2"] = "airport_rmc1_scream2";
    level.scr_sound["generic"]["airport_rmc2_scream3"] = "airport_rmc2_scream3";
    level.scr_sound["makarov"]["airport_mkv_takebookstore"] = "airport_mkv_takebookstore";
    level.scr_sound["generic"]["airport_rac_freeze"] = "airport_rac_freeze";
    level.scr_sound["generic"]["airport_rac_movemove"] = "airport_rac_movemove";
    level.scr_sound["generic"]["airport_rac_handsup"] = "airport_rac_handsup";
    level.scr_radio["airport_mkv_careofit"] = "airport_mkv_careofit";
    level.scr_radio["airport_mkv_elevators"] = "airport_mkv_elevators";
    level.scr_radio["airport_mkv_fireinhole"] = "airport_mkv_fireinhole";
    level.scr_radio["airport_mkv_runner"] = "airport_mkv_runner";
    level.scr_radio["airport_mkv_fragout"] = "airport_mkv_fragout";
    level.scr_radio["airport_at1_security"] = "airport_at1_security";
    level.scr_radio["airport_at1_fragout"] = "airport_at1_fragout";
    level.scr_sound["makarov"]["airport_mkv_forzakhaev"] = "airport_mkv_forzakhaev";
    level.scr_sound["makarov"]["airport_mkv_ontime"] = "airport_mkv_ontime";
    level.scr_sound["makarov"]["airport_mkv_rightontime"] = "airport_mkv_rightontime";
    level.scr_sound["makarov"]["airport_mkv_checkammo"] = "airport_mkv_checkammo";
    level.scr_sound["m4"]["airport_vkt_beenwaiting"] = "airport_vkt_beenwaiting";
    level.scr_sound["m4"]["airport_vkt_beenwaiting2"] = "airport_vkt_beenwaiting2";
    level.scr_sound["makarov"]["airport_mkv_haventweall"] = "airport_mkv_haventweall";
    level.scr_sound["makarov"]["airport_mkv_haventweall2"] = "airport_mkv_haventweall2";
    level.scr_sound["makarov"]["airport_mkv_gogogo"] = "airport_mkv_gogogo";
    level.scr_radio["airport_mkv_2ndfloor"] = "airport_mkv_2ndfloor";
    level.scr_radio["airport_at1_isee"] = "airport_at1_isee";
    level.scr_radio["airport_mkv_fsb"] = "airport_mkv_fsb";
    level.scr_radio["airport_at1_gotmorefsb"] = "airport_at1_gotmorefsb";
    level.scr_radio["airport_mkv_takecare"] = "airport_mkv_takecare";
    level.scr_radio["airport_at1_roger"] = "airport_at1_roger";
    level.scr_sound["generic"]["airport_fsb1_fsbfsb"] = "airport_fsb1_fsbfsb";
    level.scr_sound["generic"]["airport_fsb1_moveingo"] = "airport_fsb1_moveingo";
    level.scr_sound["generic"]["airport_fsb2_fsb"] = "airport_fsb2_fsb";
    level.scr_sound["generic"]["airport_fsb2_aimforhead"] = "airport_fsb2_aimforhead";
    level.scr_sound["generic"]["airport_fsb2_fsbfsb"] = "airport_fsb2_fsbfsb";
    level.scr_sound["generic"]["airport_fsb3_openfire"] = "airport_fsb3_openfire";
    level.scr_sound["generic"]["airport_fsb3_aimforheads"] = "airport_fsb3_aimforheads";
    level.scr_sound["generic"]["airport_fsbr_sendingtruck"] = "airport_fsbr_sendingtruck";
    level.scr_sound["generic"]["airport_fsbr_servicetunnels"] = "airport_fsbr_servicetunnels";
    level.scr_sound["m4"]["man_down"] = "airport_vkt_mandown";
    level.scr_sound["comrad"]["man_down"] = "airport_vkt_mandown";
    level.scr_sound["makarov"]["man_down"] = "airport_mkv_hesdead";
    level.scr_sound["makarov"]["check_fire1"] = "airport_mkv_checkyourfire";
    level.scr_sound["makarov"]["check_fire2"] = "airport_mkv_watchyourfire";
    level.scr_sound["m4"]["check_fire1"] = "airport_vkt_checkfire";
    level.scr_sound["m4"]["check_fire2"] = "airport_vkt_watchfire";
    level.scr_sound["makarov"]["grenade1"] = "airport_mkv_grenade";
    level.scr_sound["m4"]["grenade1"] = "airport_vkt_grenade";
    level.scr_sound["makarov"]["grenade2"] = "airport_mkv_incoming";
    level.scr_sound["m4"]["grenade2"] = "airport_vkt_lookout";
    level.scr_sound["makarov"]["engine_warn"] = "airport_mkv_clearofjetengine";
    level.scr_sound["m4"]["engine_warn"] = "airport_vkt_gonnablow";
    level.scr_sound["m4"]["ready1"] = "airport_vkt_ready";
    level.scr_sound["m4"]["ready2"] = "airport_vkt_ready2";
    level.scr_sound["makarov"]["ready1"] = "airport_mkv_ready1";
    level.scr_sound["makarov"]["ready2"] = "airport_mkv_ready2";
    level.scr_sound["m4"]["go1"] = "airport_vkt_go";
    level.scr_sound["m4"]["go2"] = "airport_vkt_move";
    level.scr_sound["m4"]["go3"] = "airport_vkt_gogogo";
    level.scr_sound["makarov"]["go1"] = "airport_mkv_gogo";
    level.scr_sound["makarov"]["go2"] = "airport_mkv_go1";
    level.scr_sound["makarov"]["go3"] = "airport_mkv_move";
    level.scr_sound["makarov"]["go4"] = "airport_mkv_go2";
    level.scr_sound["m4"]["moving1"] = "airport_vkt_moving";
    level.scr_sound["m4"]["moving2"] = "airport_vkt_movingcover";
    level.scr_sound["m4"]["moving3"] = "airport_vkt_movingup";
    level.scr_sound["makarov"]["moving1"] = "airport_mkv_moving1";
    level.scr_sound["makarov"]["moving2"] = "airport_mkv_moving2";
    level.scr_sound["makarov"]["moving3"] = "airport_mkv_cominthru";
    level.scr_sound["makarov"]["enemy_luggage"] = "airport_mkv_luggagecart";
    level.scr_sound["m4"]["enemy_luggage"] = "airport_vkt_luggagecart";
    level.scr_sound["makarov"]["enemy_landinggear"] = "airport_mkv_landinggear";
    level.scr_sound["m4"]["enemy_landinggear"] = "airport_vkt_landinggear";
    level.scr_sound["makarov"]["enemy_underplane"] = "airport_mkv_underplane";
    level.scr_sound["m4"]["enemy_bus"] = "airport_vkt_behindbus";
    level.scr_sound["makarov"]["contact_2nd_floor"] = "airport_mkv_2ndflrwndws";
    level.scr_sound["m4"]["contact_2nd_floor"] = "airport_vkt_copy2ndflr";
    level.scr_sound["makarov"]["van_left"] = "airport_mkv_fsbvan";
    level.scr_sound["makarov"]["airport_mkv_behindus"] = "airport_mkv_behindus";
    level.scr_radio["airport_at1_scream"] = "airport_at1_scream";
    level.scr_radio["airport_mkv_thisway"] = "airport_mkv_thisway";
    level.scr_radio["airport_mkv_hallway"] = "airport_mkv_hallway";
    level.scr_sound["makarov"]["airport_mkv_hallway"] = "airport_mkv_hallway";
    level.scr_radio["airport_mkv_holdfire"] = "airport_mkv_holdfire";
    level.scr_sound["makarov"]["airport_mkv_holdfire"] = "airport_mkv_holdfire";
    level.scr_face["makarov"]["airport_mkv_holdfire"] = %airport_mkv_holdfire;
    level.scr_anim["makarov"]["stand_exposed_wave_halt_v2"] = %stand_exposed_wave_halt_v2;
    level.scr_sound["van_mate"]["airport_vt_madeit"] = "airport_vt_madeit";
    level.scr_sound["van_mate"]["airport_vt_comeon"] = "airport_vt_comeon";
    level.scr_sound["van_mate"]["airport_vt_waitingfor"] = "airport_vt_waitingfor";
    level.scr_sound["van_mate"]["airport_vt_beenough"] = "airport_vt_beenough";
    level.scr_sound["makarov"]["airport_mkv_nomessage"] = "airport_mkv_nomessage";
    level.scr_sound["makarov"]["airport_mkv_thiswill"] = "airport_mkv_thiswill";
    level.scr_radio["airport_mkv_allofrussia"] = "airport_mkv_allofrussia";
}

_id_C062( var_0 )
{
    self endon( "death" );
    self endon( "done_shoot_player" );
    self setanimlimited( %h2_airport_ending_aim4_makarov, 1, 0 );
    self setanimlimited( %h2_airport_ending_aim6_makarov, 1, 0 );

    for (;;)
    {
        var_1 = vectortoangles( level.player.origin - self.origin )[1];
        var_1 = angleclamp180( self.angles[1] - var_1 );
        var_1 = clamp( var_1, -60, 60 );
        var_2 = 0;
        var_3 = 0;

        if ( var_1 < 0 )
            var_2 = var_1 / -60;
        else if ( var_1 > 0 )
            var_3 = var_1 / 60;

        self setanimlimited( %airport_ending_aim_left, var_2, 0.2 );
        self setanimlimited( %airport_ending_aim_right, var_3, 0.2 );
        wait 0.05;
    }
}

_id_CF5C( var_0 )
{
    var_0.ignoreme = 1;
    var_0.ignoreall = 1;
    wait 1;
    var_0.team = "axis";
}

_id_ABF5( var_0 )
{
    thread common_scripts\utility::play_sound_in_space( "weap_makarov_fire_npc", var_0 gettagorigin( "TAG_FLASH" ) );
}

_id_C9BC( var_0 )
{
    var_1 = maps\_utility::spawn_anim_model( "ending_weap" );
    var_2 = level._id_C0BA;
    var_2 thread maps\_anim::anim_single_solo( var_1, "end_get_in" );
    var_1 maps\_utility::add_wait( maps\_utility::_waittillmatch, "single anim", "end" );
    var_2 maps\_utility::add_func( maps\_anim::anim_loop_solo, var_1, "end_get_in_idle", "stop_loop" );
    thread maps\_utility::do_wait();
    waittillframeend;
    var_0 maps\_utility::gun_remove();
    wait 0.25;
    var_0 playsound( "scn_airport_weapon_catch" );
    common_scripts\utility::flag_wait( "ambulance_ready_to_leave" );
    var_2 notify( "stop_loop" );
    var_1 delete();
}

_id_B7C4( var_0 )
{
    var_0 setlookatentity( level.player );
}

_id_BC5A( var_0 )
{
    var_0 setlookatentity();
}

_id_C801( var_0 )
{
    var_1 = getent( "basement_door", "targetname" );
    var_2 = getent( "basement_door_model", "targetname" );
    var_2 linkto( var_1 );
    var_1 connectpaths();
    var_1 playsound( "scn_airport_metal_door_kick" );
    var_1 rotateyaw( 95, 0.25, 0, 0.25 );
    var_1 waittill( "rotatedone" );
    var_1 rotateyaw( -5, 2, 0, 2 );
}

_id_BDFB( var_0 )
{
    var_1 = getent( "escape_door", "targetname" );
    var_2 = getent( "escape_door_model", "targetname" );
    var_2 linkto( var_1 );
    var_1 connectpaths();
    var_1 playsound( "scn_airport_metal_door_kick" );
    var_1 rotateyaw( -95, 0.25, 0, 0.25 );
    var_1 waittill( "rotatedone" );
    var_1 rotateyaw( 20, 2, 0, 2 );
}

_id_C67C( var_0 )
{
    var_0 thread maps\_utility::play_sound_on_tag_endon_death( "airport_rac_movemove" );
}

_id_AAA0( var_0 )
{
    common_scripts\utility::flag_set( "massacre_kill_rush" );
}

_id_BF9E( var_0 )
{
    var_0.ignoreme = 0;
    var_0 notify( "shoot_me" );
}

_id_C1EA( var_0 )
{
    var_0.grenadeammo++;
    var_1 = anglestoforward( var_0.angles );
    var_2 = anglestoright( var_0.angles );
    var_2 *= -0.25;
    var_3 = var_0.origin + var_1 * 50;
    var_3 = var_3 + ( 0.0, 0.0, 14.0 ) + var_2;
    var_1 = vectornormalize( var_3 - var_0.origin );
    var_1 *= 800;
    var_4 = 2.5;
    var_0 magicgrenademanual( var_0 gettagorigin( "TAG_INHAND" ), var_1, var_4 );
    maps\_utility::delaythread( var_4 - 0.05, common_scripts\utility::flag_set, "massacre_elevator_grenade_exp" );
    wait 0.75;
    common_scripts\utility::flag_set( "massacre_elevator_grenade_throw" );
}

_id_BB3F( var_0 )
{
    var_0.grenadeammo++;
    var_1 = anglestoforward( var_0.angles );
    var_2 = anglestoright( var_0.angles );
    var_2 *= 4;
    var_3 = var_0.origin + var_1 * 50;
    var_3 = var_3 + ( 0.0, 0.0, 6.0 ) + var_2;
    var_1 = vectornormalize( var_3 - var_0.origin );
    var_1 *= 1300;
    common_scripts\utility::flag_set( "massacre_nadethrow" );
    var_0 magicgrenademanual( var_0 gettagorigin( "j_wrist_ri" ), var_1, level._id_CA5B );
}

_id_B22C( var_0 )
{
    var_1 = var_0.grenadeweapon;
    var_0.grenadeweapon = "flash_grenade";
    var_0.grenadeammo++;
    var_2 = anglestoforward( var_0.angles );
    var_3 = var_0.origin + var_2 * 50;
    var_3 += ( 0.0, 0.0, 5.0 );
    var_4 = var_3 + ( 0.0, 0.0, 30.0 );
    var_2 = vectornormalize( var_3 - var_0.origin );
    var_2 *= 512;
    var_0 magicgrenademanual( var_0 gettagorigin( "TAG_INHAND" ), var_2, 1.5 );
    var_0.grenadeweapon = var_1;
    wait 0.1;
    radiusdamage( var_4, 64, 5000, 5000 );
}

_id_AAD9( var_0 )
{
    var_0.a.nodeath = 1;
    var_0.allowdeath = 0;
    var_0._id_BC99 = 1;
}

_id_AE67( var_0 )
{
    wait 1;
    var_0.a.nodeath = 1;
    var_0.allowdeath = 1;
    var_0._id_BC99 = 1;
}

_id_BE8F( var_0 )
{
    var_0.a.nodeath = 0;
    var_0.allowdeath = 1;
}

_id_AF98( var_0 )
{
    var_0.allowdeath = 1;
    var_0 kill();
}

_id_C6FA( var_0 )
{
    var_0.allowdeath = 0;
    var_0.a.nodeath = 1;
    var_1 = var_0 gettagorigin( "J_SpineUpper" );
    var_2 = common_scripts\utility::getclosest( var_0.origin, level.team );
    var_3 = vectornormalize( var_2.origin - var_1 );
    var_4 = var_3 * 10;

    if ( getdvarint( "cg_blood" ) == 1 )
        playfx( common_scripts\utility::getfx( "killshot" ), var_1 + var_4, var_3 );

    var_0 thread maps\_anim::anim_generic( var_0, "slide_across_car_death" );
    wait 1;
    var_0.allowdeath = 1;
    var_0 kill();
}

_id_C291( var_0 )
{
    var_1 = var_0.grenadeweapon;
    var_0.grenadeweapon = "smoke_grenade_american";
    var_0.grenadeammo++;
    var_2 = var_0._id_B15A - var_0.origin + ( 0.0, 0.0, 500.0 );
    var_3 = 6;
    var_0 magicgrenademanual( var_0 gettagorigin( "TAG_INHAND" ), var_2, var_3 );
    var_0.grenadeweapon = var_1;
    wait 0.5;
    var_0 stopanimscripted();
    var_0 notify( "grenade_throw_done" );
}

_id_C909()
{
    var_0 = [];
    var_0["intro_lobby_anim_group_1"][0]["model"] = "civilian_male_suit";
    var_0["intro_lobby_anim_group_1"][0]["anime"] = "h2_airport_intro_civilian8";
    var_0["intro_lobby_anim_group_1"][0]["delay"] = 0;
    var_0["intro_lobby_anim_group_1"][0]["deathanim"] = undefined;
    var_0["intro_lobby_anim_group_1"][0]["deathtime"] = 0;
    var_0["intro_lobby_anim_group_1"][0]["body"] = "body_urban_civ_male_aa_a";
    var_0["intro_lobby_anim_group_1"][1]["model"] = "civilian_male_suit";
    var_0["intro_lobby_anim_group_1"][1]["anime"] = "h2_airport_intro_civilian9";
    var_0["intro_lobby_anim_group_1"][1]["delay"] = 0;
    var_0["intro_lobby_anim_group_1"][1]["deathanim"] = undefined;
    var_0["intro_lobby_anim_group_1"][1]["deathtime"] = 0;
    var_0["intro_lobby_anim_group_1"][1]["body"] = "body_urban_civ_male_ac_b";
    var_0["intro_lobby_anim_group_1"][2]["model"] = "civilian_female_suit";
    var_0["intro_lobby_anim_group_1"][2]["anime"] = "h2_airport_intro_civilian10";
    var_0["intro_lobby_anim_group_1"][2]["delay"] = 0;
    var_0["intro_lobby_anim_group_1"][2]["deathanim"] = undefined;
    var_0["intro_lobby_anim_group_1"][2]["deathtime"] = 0;
    var_0["intro_lobby_anim_group_1"][2]["body"] = "body_urban_civ_female_b_a";
    var_0["intro_lobby_anim_group_2"][0]["model"] = "civilian_female_suit";
    var_0["intro_lobby_anim_group_2"][0]["anime"] = "h2_airport_intro_civilian11";
    var_0["intro_lobby_anim_group_2"][0]["delay"] = 0;
    var_0["intro_lobby_anim_group_2"][0]["deathanim"] = undefined;
    var_0["intro_lobby_anim_group_2"][0]["deathtime"] = 0;
    var_0["intro_lobby_anim_group_2"][0]["deleteme"] = 1;
    var_0["intro_lobby_anim_group_2"][0]["body"] = "body_urban_civ_female_b_b";
    var_0["intro_lobby_anim_group_2"][1]["model"] = "civilian_male_suit";
    var_0["intro_lobby_anim_group_2"][1]["anime"] = "h2_airport_intro_civilian12";
    var_0["intro_lobby_anim_group_2"][1]["delay"] = 0;
    var_0["intro_lobby_anim_group_2"][1]["deathanim"] = undefined;
    var_0["intro_lobby_anim_group_2"][1]["deathtime"] = 0;
    var_0["intro_lobby_anim_group_2"][1]["deleteme"] = 1;
    var_0["intro_lobby_anim_group_2"][1]["body"] = "body_urban_civ_male_aa_c";
    var_0["intro_lobby_anim_group_2"][2]["model"] = "civilian_male_suit";
    var_0["intro_lobby_anim_group_2"][2]["anime"] = "h2_airport_intro_civilian13";
    var_0["intro_lobby_anim_group_2"][2]["delay"] = 0;
    var_0["intro_lobby_anim_group_2"][2]["deathanim"] = undefined;
    var_0["intro_lobby_anim_group_2"][2]["deathtime"] = 0;
    var_0["intro_lobby_anim_group_2"][2]["body"] = "body_urban_civ_male_ab_a";
    var_0["intro_lobby_anim_group_3"][0]["model"] = "civilian_female_suit";
    var_0["intro_lobby_anim_group_3"][0]["anime"] = "h2_airport_intro_civilian14";
    var_0["intro_lobby_anim_group_3"][0]["delay"] = 1;
    var_0["intro_lobby_anim_group_3"][0]["deathanim"] = undefined;
    var_0["intro_lobby_anim_group_3"][0]["deathtime"] = 0;
    var_0["intro_lobby_anim_group_3"][0]["deleteme"] = 1;
    var_0["intro_lobby_anim_group_3"][0]["body"] = "body_urban_civ_female_a_b";
    var_0["intro_lobby_anim_group_3"][1]["model"] = "civilian_male_suit";
    var_0["intro_lobby_anim_group_3"][1]["anime"] = "h2_airport_intro_civilian15";
    var_0["intro_lobby_anim_group_3"][1]["delay"] = 1;
    var_0["intro_lobby_anim_group_3"][1]["deathanim"] = undefined;
    var_0["intro_lobby_anim_group_3"][1]["deathtime"] = 0;
    var_0["intro_lobby_anim_group_3"][1]["body"] = "body_urban_civ_male_ab_b";
    var_0["intro_lobby_anim_group_3"][2]["model"] = "civilian_male_suit";
    var_0["intro_lobby_anim_group_3"][2]["anime"] = "h2_airport_intro_civilian16";
    var_0["intro_lobby_anim_group_3"][2]["delay"] = 1;
    var_0["intro_lobby_anim_group_3"][2]["deathanim"] = undefined;
    var_0["intro_lobby_anim_group_3"][2]["deathtime"] = 0;
    var_0["intro_lobby_anim_group_3"][2]["body"] = "body_urban_civ_male_ab_c";
    var_0["intro_lobby_anim_group_4"][0]["model"] = "civilian_male_suit";
    var_0["intro_lobby_anim_group_4"][0]["anime"] = "h2_airport_intro_civilian17";
    var_0["intro_lobby_anim_group_4"][0]["delay"] = 1;
    var_0["intro_lobby_anim_group_4"][0]["deathanim"] = undefined;
    var_0["intro_lobby_anim_group_4"][0]["deathtime"] = 0;
    var_0["intro_lobby_anim_group_4"][0]["deleteme"] = 1;
    var_0["intro_lobby_anim_group_4"][0]["body"] = "body_urban_civ_male_ac_a";
    var_0["intro_lobby_anim_group_4"][1]["model"] = "civilian_female_suit";
    var_0["intro_lobby_anim_group_4"][1]["anime"] = "h2_airport_intro_civilian18";
    var_0["intro_lobby_anim_group_4"][1]["delay"] = 1;
    var_0["intro_lobby_anim_group_4"][1]["deathanim"] = undefined;
    var_0["intro_lobby_anim_group_4"][1]["deathtime"] = 0;
    var_0["intro_lobby_anim_group_4"][1]["body"] = "body_urban_civ_female_a_p";
    var_0["intro_lobby_anim_group_4"][2]["model"] = "civilian_male_suit";
    var_0["intro_lobby_anim_group_4"][2]["anime"] = "h2_airport_intro_civilian19";
    var_0["intro_lobby_anim_group_4"][2]["delay"] = 1;
    var_0["intro_lobby_anim_group_4"][2]["deathanim"] = undefined;
    var_0["intro_lobby_anim_group_4"][2]["deathtime"] = 0;
    var_0["intro_lobby_anim_group_4"][2]["body"] = "body_urban_civ_male_ac_c";
    var_0["intro_lobby_anim_group_5"][0]["model"] = "civilian_male_suit";
    var_0["intro_lobby_anim_group_5"][0]["anime"] = "h2_airport_intro_civilian20";
    var_0["intro_lobby_anim_group_5"][0]["delay"] = 0;
    var_0["intro_lobby_anim_group_5"][0]["deathanim"] = undefined;
    var_0["intro_lobby_anim_group_5"][0]["deathtime"] = 0;
    var_0["intro_lobby_anim_group_5"][0]["body"] = "body_urban_civ_male_ac_c";
    var_0["intro_lobby_anim_group_5"][1]["model"] = "civilian_male_suit";
    var_0["intro_lobby_anim_group_5"][1]["anime"] = "h2_airport_intro_civilian21";
    var_0["intro_lobby_anim_group_5"][1]["delay"] = 0;
    var_0["intro_lobby_anim_group_5"][1]["deathanim"] = undefined;
    var_0["intro_lobby_anim_group_5"][1]["deathtime"] = 0;
    var_0["intro_lobby_anim_group_5"][1]["body"] = "body_urban_civ_male_ba_b";
    var_0["intro_lobby_anim_group_6"][0]["model"] = "civilian_female_suit_low_LOD";
    var_0["intro_lobby_anim_group_6"][0]["anime"] = "h2_airport_intro_civilian22";
    var_0["intro_lobby_anim_group_6"][0]["delay"] = 2;
    var_0["intro_lobby_anim_group_6"][0]["deathanim"] = undefined;
    var_0["intro_lobby_anim_group_6"][0]["deathtime"] = 0;
    var_0["intro_lobby_anim_group_6"][0]["body"] = "body_urban_civ_female_a_y";
    var_0["intro_lobby_anim_group_6"][1]["model"] = "civilian_male_suit_low_LOD";
    var_0["intro_lobby_anim_group_6"][1]["anime"] = "h2_airport_intro_civilian23";
    var_0["intro_lobby_anim_group_6"][1]["delay"] = 2;
    var_0["intro_lobby_anim_group_6"][1]["deathanim"] = undefined;
    var_0["intro_lobby_anim_group_6"][1]["deathtime"] = 0;
    var_0["intro_lobby_anim_group_6"][1]["body"] = "body_urban_civ_male_bb_a";
    var_0["intro_lobby_anim_group_6"][2]["model"] = "civilian_male_suit_low_LOD";
    var_0["intro_lobby_anim_group_6"][2]["anime"] = "h2_airport_intro_civilian24";
    var_0["intro_lobby_anim_group_6"][2]["delay"] = 2;
    var_0["intro_lobby_anim_group_6"][2]["deathanim"] = undefined;
    var_0["intro_lobby_anim_group_6"][2]["deathtime"] = 0;
    var_0["intro_lobby_anim_group_6"][2]["body"] = "body_urban_civ_male_bb_b";
    var_0["intro_lobby_anim_group_7"][0]["model"] = "civilian_male_suit_low_LOD";
    var_0["intro_lobby_anim_group_7"][0]["anime"] = "h2_airport_intro_civilian25";
    var_0["intro_lobby_anim_group_7"][0]["delay"] = 2;
    var_0["intro_lobby_anim_group_7"][0]["deathanim"] = undefined;
    var_0["intro_lobby_anim_group_7"][0]["deathtime"] = 0;
    var_0["intro_lobby_anim_group_7"][0]["deleteme"] = 1;
    var_0["intro_lobby_anim_group_7"][0]["body"] = "body_urban_civ_male_bc_blue";
    var_0["intro_lobby_anim_group_7"][1]["model"] = "civilian_male_suit_low_LOD";
    var_0["intro_lobby_anim_group_7"][1]["anime"] = "h2_airport_intro_civilian26";
    var_0["intro_lobby_anim_group_7"][1]["delay"] = 2;
    var_0["intro_lobby_anim_group_7"][1]["deathanim"] = undefined;
    var_0["intro_lobby_anim_group_7"][1]["deathtime"] = 0;
    var_0["intro_lobby_anim_group_7"][1]["deleteme"] = 1;
    var_0["intro_lobby_anim_group_7"][1]["body"] = "body_urban_civ_male_bc_gray";
    var_0["intro_lobby_anim_group_8"][0]["model"] = "civilian_male_suit_low_LOD";
    var_0["intro_lobby_anim_group_8"][0]["anime"] = "h2_airport_intro_civilian27";
    var_0["intro_lobby_anim_group_8"][0]["delay"] = 2;
    var_0["intro_lobby_anim_group_8"][0]["deathanim"] = undefined;
    var_0["intro_lobby_anim_group_8"][0]["deathtime"] = 9.5;
    var_0["intro_lobby_anim_group_8"][0]["deleteme"] = 1;
    var_0["intro_lobby_anim_group_8"][0]["body"] = "body_urban_civ_male_bb_b";
    var_0["intro_lobby_anim_group_8"][1]["model"] = "civilian_male_suit_low_LOD";
    var_0["intro_lobby_anim_group_8"][1]["anime"] = "h2_airport_intro_civilian28";
    var_0["intro_lobby_anim_group_8"][1]["delay"] = 2;
    var_0["intro_lobby_anim_group_8"][1]["deathanim"] = undefined;
    var_0["intro_lobby_anim_group_8"][1]["deathtime"] = 0;
    var_0["intro_lobby_anim_group_8"][1]["body"] = "body_urban_civ_male_bc_red";
    var_0["intro_lobby_anim_group_9"][0]["model"] = "civilian_female_suit";
    var_0["intro_lobby_anim_group_9"][0]["anime"] = "h2_airport_intro_civilian4";
    var_0["intro_lobby_anim_group_9"][0]["delay"] = 0;
    var_0["intro_lobby_anim_group_9"][0]["deathanim"] = undefined;
    var_0["intro_lobby_anim_group_9"][0]["deathtime"] = 0;
    var_0["intro_lobby_anim_group_9"][0]["body"] = "body_urban_civ_female_a_y";
    var_0["intro_lobby_anim_group_9"][1]["model"] = "civilian_male_suit";
    var_0["intro_lobby_anim_group_9"][1]["anime"] = "h2_airport_intro_civilian5";
    var_0["intro_lobby_anim_group_9"][1]["delay"] = 0;
    var_0["intro_lobby_anim_group_9"][1]["deathanim"] = undefined;
    var_0["intro_lobby_anim_group_9"][1]["deathtime"] = 0;
    var_0["intro_lobby_anim_group_9"][1]["body"] = "body_urban_civ_male_bc_red";
    var_0["intro_lobby_anim_group_10"][0]["model"] = "civilian_male_suit";
    var_0["intro_lobby_anim_group_10"][0]["anime"] = "h2_airport_intro_civilian29";
    var_0["intro_lobby_anim_group_10"][0]["delay"] = 1;
    var_0["intro_lobby_anim_group_10"][0]["deathanim"] = undefined;
    var_0["intro_lobby_anim_group_10"][0]["deathtime"] = 0;
    var_0["intro_lobby_anim_group_10"][0]["deleteme"] = 1;
    var_0["intro_lobby_anim_group_10"][0]["body"] = "body_urban_civ_male_ab_a";
    var_0["intro_lobby_anim_group_10"][1]["model"] = "civilian_male_suit";
    var_0["intro_lobby_anim_group_10"][1]["anime"] = "h2_airport_intro_civilian30";
    var_0["intro_lobby_anim_group_10"][1]["delay"] = 1;
    var_0["intro_lobby_anim_group_10"][1]["deathanim"] = undefined;
    var_0["intro_lobby_anim_group_10"][1]["deathtime"] = 0;
    var_0["intro_lobby_anim_group_10"][1]["body"] = "body_urban_civ_male_bc_white";
    var_0["intro_lobby_anim_group_11"][0]["model"] = "civilian_male_suit";
    var_0["intro_lobby_anim_group_11"][0]["anime"] = "h2_airport_intro_civilian31";
    var_0["intro_lobby_anim_group_11"][0]["delay"] = 0;
    var_0["intro_lobby_anim_group_11"][0]["deathanim"] = undefined;
    var_0["intro_lobby_anim_group_11"][0]["deathtime"] = 0;
    var_0["intro_lobby_anim_group_11"][0]["body"] = "body_urban_civ_male_bc_red";
    var_0["intro_lobby_anim_group_12"][0]["model"] = "civilian_female_suit";
    var_0["intro_lobby_anim_group_12"][0]["anime"] = "h2_airport_intro_civilian3";
    var_0["intro_lobby_anim_group_12"][0]["delay"] = 0;
    var_0["intro_lobby_anim_group_12"][0]["deathanim"] = undefined;
    var_0["intro_lobby_anim_group_12"][0]["deathtime"] = 0;
    var_0["intro_lobby_anim_group_12"][0]["body"] = "body_urban_civ_female_a_g";
    var_0["intro_lobby_anim_group_12"][1]["model"] = "civilian_male_suit";
    var_0["intro_lobby_anim_group_12"][1]["anime"] = "h2_airport_intro_civilian2";
    var_0["intro_lobby_anim_group_12"][1]["delay"] = 0;
    var_0["intro_lobby_anim_group_12"][1]["deathanim"] = undefined;
    var_0["intro_lobby_anim_group_12"][1]["deathtime"] = 0;
    var_0["intro_lobby_anim_group_12"][1]["body"] = "body_urban_civ_male_aa_b";
    var_0["intro_lobby_anim_group_12"][2]["model"] = "civilian_male_suit";
    var_0["intro_lobby_anim_group_12"][2]["anime"] = "h2_airport_intro_civilian1";
    var_0["intro_lobby_anim_group_12"][2]["delay"] = 0;
    var_0["intro_lobby_anim_group_12"][2]["deathanim"] = undefined;
    var_0["intro_lobby_anim_group_12"][2]["deathtime"] = 0;
    var_0["intro_lobby_anim_group_12"][2]["body"] = "body_urban_civ_male_ac_b";
    var_0["intro_lobby_anim_group_13"][0]["model"] = "civilian_female_suit";
    var_0["intro_lobby_anim_group_13"][0]["anime"] = "h2_airport_intro_civilian7";
    var_0["intro_lobby_anim_group_13"][0]["delay"] = 0;
    var_0["intro_lobby_anim_group_13"][0]["deathanim"] = undefined;
    var_0["intro_lobby_anim_group_13"][0]["deathtime"] = 0;
    var_0["intro_lobby_anim_group_13"][0]["body"] = "body_urban_civ_female_b_b";
    var_0["intro_lobby_anim_group_14"][0]["model"] = "civilian_male_suit";
    var_0["intro_lobby_anim_group_14"][0]["anime"] = "h2_airport_intro_civilian6";
    var_0["intro_lobby_anim_group_14"][0]["delay"] = 0;
    var_0["intro_lobby_anim_group_14"][0]["deathanim"] = undefined;
    var_0["intro_lobby_anim_group_14"][0]["deathtime"] = 0;
    var_0["intro_lobby_anim_group_14"][0]["body"] = "body_urban_civ_male_bb_b";
    var_0["intro_lobby_anim_group_15"][0]["model"] = "male_security_guard";
    var_0["intro_lobby_anim_group_15"][0]["anime"] = "h2_airport_intro_policeman1";
    var_0["intro_lobby_anim_group_15"][0]["delay"] = 0;
    var_0["intro_lobby_anim_group_15"][0]["deathanim"] = undefined;
    var_0["intro_lobby_anim_group_15"][0]["deathtime"] = 0;
    // var_0["intro_lobby_anim_group_15"][0]["body"] = "body_secret_service_smg";
    var_0["intro_lobby_anim_group_15"][1]["model"] = "male_security_guard";
    var_0["intro_lobby_anim_group_15"][1]["anime"] = "h2_airport_intro_policeman2";
    var_0["intro_lobby_anim_group_15"][1]["delay"] = 0;
    var_0["intro_lobby_anim_group_15"][1]["deathanim"] = undefined;
    var_0["intro_lobby_anim_group_15"][1]["deathtime"] = 0;
    // var_0["intro_lobby_anim_group_15"][1]["body"] = "body_secret_service_smg";
    return var_0;
}

_id_C8F4()
{
    level._id_A98C = [];
    level._id_A98C[0] = "exploder_script_model";
}
#using_animtree("script_model");

_id_BAF7()
{
    level.scr_animtree["exploder_script_model"] = #animtree;
    level.scr_anim["exploder_script_model"]["h2_airport_restaurant_destruction_break_a_anim"] = %h2_airport_restaurant_destruction_break_a_anim;
    level.scr_animtree["door"] = #animtree;
    level.scr_anim["door"]["opening_door"] = %h2_airport_door_opening_door_anim;
}
#using_animtree("vehicles");

_id_9D7F()
{
    level.scr_animtree["ambulance"] = #animtree;
    level.scr_anim["ambulance"]["end_open_door"] = %h2_airport_ending_open_doors;
    level.scr_anim["ambulance"]["end_close_door"] = %h2_airport_ending_close_doors;
}

init_animsound()
{
    waittillframeend;
    maps\_anim::addonstart_animsound( "comrad", "end_get_in", "scn_viktor_climb_in_ambulance" );
    maps\_anim::addonstart_animsound( "makarov", "end_get_in", "scn_makarov_climb_in_ambulance" );
    maps\_anim::addonstart_animsound( "generic", "arriving_cops_1", "scn_end_arriving_cops_01" );
}
