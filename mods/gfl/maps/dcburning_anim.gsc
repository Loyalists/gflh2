// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    anims();
    player_anims();
    vehicle_anims();
    dialogue();
    script_model_anims();
    common_scripts\utility::flag_init( "roof_door_kicked" );
    maps\_anim::addnotetrack_customfunction( "generic", "kick", ::_id_CEF9, "shotgunhinges_breach_left_stack_breach_01" );
    maps\_anim::addnotetrack_customfunction( "generic", "fire", ::_id_BC50, "shotgunhinges_breach_left_stack_breach_01" );
    _id_B782();
    animated_fence_setup();
}
#using_animtree("generic_human");

anims()
{
    level.scr_anim["generic"]["airport_civ_dying_groupB_pull"] = %airport_civ_dying_groupb_pull;
    level.scr_anim["generic"]["airport_civ_dying_groupB_pull_death"] = %airport_civ_dying_groupb_pull_death;
    level.scr_anim["generic"]["airport_civ_dying_groupB_wounded"] = %airport_civ_dying_groupb_wounded;
    level.scr_anim["generic"]["airport_civ_dying_groupB_wounded_death"] = %airport_civ_dying_groupb_wounded_death;
    level.scr_anim["generic"]["favela_run_and_wave"] = %favela_run_and_wave;
    level.scr_anim["generic"]["civilian_run_2_crawldeath"] = %civilian_run_2_crawldeath;
    level.scr_anim["generic"]["death_explosion_run_F_v1"] = %death_explosion_run_f_v1;
    level.scr_anim["generic"]["roadkill_cover_spotter"][0] = %roadkill_cover_spotter;
    level.scr_anim["generic"]["roadkill_cover_radio_soldier3"][0] = %roadkill_cover_radio_soldier3;
    level.scr_anim["generic"]["roadkill_cover_radio_soldier2"][0] = %roadkill_cover_radio_soldier2;
    level.scr_anim["generic"]["ch46_load_1"] = %ch46_load_1;
    level.scr_anim["generic"]["ch46_load_2"] = %ch46_load_2;
    level.scr_anim["generic"]["ch46_load_3"] = %ch46_load_3;
    level.scr_anim["generic"]["ch46_load_4"] = %ch46_load_4;
    level.scr_anim["generic"]["ch46_unload_idle"][0] = %exposed_crouch_idle_alert_v1;
    level.scr_anim["generic"]["leader_blackhawk_getin"] = %blackout_bh_evac_2;
    level.scr_anim["generic"]["leader_blackhawk_idle"][0] = %blackout_bh_evac_2_idle;
    level.scr_anim["generic"]["redshirt_blackhawk_getin"] = %blackout_bh_evac_2;
    level.scr_anim["generic"]["redshirt_blackhawk_idle"][0] = %blackout_bh_evac_2_idle;
    level.scr_anim["generic"]["dcburning_elevator_corpse_trans_A_2_B"] = %dcburning_elevator_corpse_trans_a_2_b;
    level.scr_anim["generic"]["dcburning_elevator_corpse_idle_A"][0] = %dcburning_elevator_corpse_idle_a;
    level.scr_anim["generic"]["dcburning_elevator_corpse_idle_B"][0] = %dcburning_elevator_corpse_idle_b;
    level.scr_anim["generic"]["dcburning_elevator_corpse_bump_A"] = %dcburning_elevator_corpse_bump_a;
    level.scr_anim["generic"]["dcburning_elevator_corpse_bump_B"] = %dcburning_elevator_corpse_bump_b;
    level.scr_anim["operator"]["pulldown"] = %h2_gulag_slamraam_tarp_pull_guy2;
    level.scr_anim["operator"]["idle"][0] = %h2_gulag_slamraam_tarp_idle_guy2;
    level.scr_anim["puller"]["pulldown"] = %h2_gulag_slamraam_tarp_pull_guy1;
    level.scr_anim["generic"]["littlebird_rider_death"] = %fastrope_fall;
    level.scr_anim["generic"]["little_bird_death_guy1"] = %little_bird_death_guy1;
    level.scr_anim["generic"]["little_bird_death_guy2"] = %little_bird_death_guy2;
    level.scr_anim["generic"]["little_bird_death_guy3"] = %little_bird_death_guy3;
    level.scr_anim["generic"]["deathanim_mortar_00"] = %exposed_death_falltoknees;
    level.scr_anim["generic"]["deathanim_mortar_01"] = %exposed_death_blowback;
    level.scr_anim["generic"]["AT4_idle"][0] = %corner_standr_alert_idle;
    level.scr_anim["generic"]["launchfacility_a_at4_fire"] = %launchfacility_a_at4_fire;
    level.scr_anim["generic"]["patrol_walk"] = %patrol_bored_patrolwalk;
    level.scr_anim["generic"]["patrol_walk_twitch"] = %patrol_bored_patrolwalk_twitch;
    level.scr_anim["generic"]["patrol_stop"] = %patrol_bored_walk_2_bored;
    level.scr_anim["generic"]["patrol_start"] = %patrol_bored_2_walk;
    level.scr_anim["generic"]["patrol_turn180"] = %patrol_bored_2_walk_180turn;
    level.scr_anim["generic"]["javelin_arrival"] = %covercrouch_run_in_m;
    level.scr_anim["generic"]["javelin_idle_start"] = %javelin_idle_a;
    level.scr_anim["generic"]["javelin_idle"][0] = %javelin_idle_a;
    level.scr_anim["generic"]["javelin_fire"] = %javelin_fire_a;
    level.scr_anim["generic"]["javelin_fire_short"] = %javelin_fire_short_a;
    level.scr_anim["generic"]["javelin_react"] = %javelin_react_a;
    maps\_anim::addnotetrack_customfunction( "generic", "reload_begin", ::_id_C717, "javelin_fire" );
    maps\_anim::addnotetrack_customfunction( "generic", "reload_end", ::_id_B55C, "javelin_fire" );
    level.scr_anim["generic"]["javelin_death_barrett"] = %exposed_death_blowback;
    level.scr_anim["generic"]["javelin_idle_start2"] = %javelin_idle_b;
    level.scr_anim["generic"]["javelin_idle2"][0] = %javelin_idle_b;
    level.scr_anim["generic"]["javelin_fire2"] = %javelin_fire_b;
    level.scr_anim["generic"]["javelin_react2"] = %javelin_react_b;
    maps\_anim::addnotetrack_customfunction( "generic", "reload_begin", ::_id_C717, "javelin_fire2" );
    maps\_anim::addnotetrack_customfunction( "generic", "reload_end", ::_id_B55C, "javelin_fire2" );
    level.scr_anim["generic"]["javelin_death2"] = %javelin_death_1;
    level.scr_anim["generic"]["javelin_death_reloading2"] = %javelin_death_2;
    level.scr_anim["generic"]["javelin_death"] = %javelin_death_3;
    level.scr_anim["generic"]["javelin_death_reloading"] = %javelin_death_5;
    level.scr_anim["generic"]["stinger_idle_start"] = %stinger_idle;
    level.scr_anim["generic"]["stinger_idle"][0] = %stinger_idle;
    level.scr_anim["generic"]["stinger_fire"] = %stinger_fire;
    level.scr_anim["generic"]["stinger_react_stand"] = %stinger_react_stand;
    level.scr_anim["generic"]["stinger_react_crouch"] = %stinger_react_crouch;
    level.scr_anim["generic"]["enemy_spotter_crouched_idle"][0] = %hunted_spotter_idle;
    level.scr_anim["generic"]["enemy_spotter_crouched_idle"][1] = %hunted_spotter_twitch;
    level.scr_anim["generic"]["enemy_spotter_crouched_react"] = %crouch2stand;
    level.scr_anim["generic"]["enemy_spotter_crouched_death"] = %exposed_crouch_death_fetal;
    level.scr_anim["generic"]["enemy_spotter_prone_idle"][0] = %sniper_escape_spotter_idle;
    level.scr_anim["generic"]["enemy_spotter_prone_idle"][1] = %sniper_escape_spotter_wave;
    level.scr_anim["generic"]["enemy_spotter_prone_react"] = %prone_2_stand;
    level.scr_anim["generic"]["enemy_spotter_prone_death"] = %exposed_crouch_death_fetal;
    level.scr_anim["generic"]["h2_dc_burning_crowsnest_foley_enter"] = %h2_dc_burning_crowsnest_foley;
    maps\_anim::addnotetrack_dialogue( "generic", "dialog", "h2_dc_burning_crowsnest_foley_enter", "dcburn_mcy_seccrowsnest" );
    maps\_anim::addnotetrack_dialogue( "generic", "dialog", "h2_dc_burning_crowsnest_foley_enter", "dcburn_hqr_stillvuln" );
    maps\_anim::addnotetrack_dialogue( "generic", "dialog", "h2_dc_burning_crowsnest_foley_enter", "dcburn_mcy_stockpile" );
    level.scr_anim["generic"]["h2_dc_burning_crowsnest_foley_enter_instr"] = %h2_dc_burning_crowsnest_foley_take_sniper;
    maps\_anim::addnotetrack_dialogue( "generic", "dialog", "h2_dc_burning_crowsnest_foley_enter_instr", "dcburn_mcy_sniperrifle" );
    level.scr_anim["generic"]["node_elevator_cover_right"][0] = %corner_standr_alert_idle;
    level.scr_anim["generic"]["node_elevator_cover_right"][1] = %corner_standr_alert_twitch01;
    level.scr_anim["generic"]["node_elevator_cover_right"][2] = %corner_standr_alert_twitch02;
    level.scr_anim["generic"]["node_elevator_cover_right"][3] = %corner_standr_alert_twitch04;
    level.scr_anim["generic"]["node_elevator_cover_right"][4] = %corner_standr_alert_twitch05;
    level.scr_anim["generic"]["node_elevator_cover_right"][5] = %corner_standr_alert_twitch06;
    level.scr_anim["generic"]["traverse_wallhop"] = %traverse_wallhop;
    level.scr_anim["generic"]["oilrig_rappel_2_crouch"] = %oilrig_rappel_2_crouch;
    maps\_anim::addnotetrack_customfunction( "generic", "over_solid", maps\dcburning::_id_C580, "oilrig_rappel_2_crouch" );
    level.scr_anim["generic"]["h2_dc_burning_bunker_sit_idle"][0] = %h2_dc_burning_bunker_sit_idle;
    level.scr_anim["generic"]["h2_dcburning_medicalbay_soldier_B"] = %h2_dcburning_medicalbay_soldier_b_start;
    level.scr_anim["generic"]["h2_dcburning_medicalbay_soldier_B_idle"][0] = %h2_dcburning_medicalbay_soldier_b_idle;
    level.scr_anim["generic"]["h2_bunker_toss_guy1_idle_go"] = %h2_bunker_toss_guy1;
    level.scr_anim["generic"]["h2_bunker_toss_guy1_idle"][0] = %h2_bunker_toss_guy1_idle;
    level.scr_anim["generic"]["h2_bunker_toss_guy2"] = %h2_bunker_toss_guy2;
    level.scr_anim["generic"]["DC_Burning_artillery_reaction_v1_idle_start"] = %dc_burning_artillery_reaction_v1_idle;
    level.scr_anim["generic"]["DC_Burning_artillery_reaction_v1_idle"][0] = %dc_burning_artillery_reaction_v1_idle;
    level.scr_anim["generic"]["DC_Burning_artillery_reaction_v1_idle_react"] = %dc_burning_artillery_reaction_v1_react_a;
    level.scr_anim["generic"]["DC_Burning_artillery_reaction_v1_idle_react2"] = %dc_burning_artillery_reaction_v1_react_b;
    level.scr_anim["generic"]["DC_Burning_artillery_reaction_v2_idle_start"] = %dc_burning_artillery_reaction_v2_idle;
    level.scr_anim["generic"]["DC_Burning_artillery_reaction_v2_idle"][0] = %dc_burning_artillery_reaction_v2_idle;
    level.scr_anim["generic"]["DC_Burning_artillery_reaction_v2_idle_react"] = %dc_burning_artillery_reaction_v2_react_a;
    level.scr_anim["generic"]["DC_Burning_artillery_reaction_v2_idle_react2"] = %dc_burning_artillery_reaction_v2_react_b;
    level.scr_anim["generic"]["DC_Burning_artillery_reaction_v3_idle_start"] = %dc_burning_artillery_reaction_v3_idle;
    level.scr_anim["generic"]["DC_Burning_artillery_reaction_v3_idle"][0] = %dc_burning_artillery_reaction_v3_idle;
    level.scr_anim["generic"]["DC_Burning_artillery_reaction_v3_idle_react"] = %dc_burning_artillery_reaction_v3_react_a;
    level.scr_anim["generic"]["DC_Burning_artillery_reaction_v3_idle_react2"] = %dc_burning_artillery_reaction_v3_react_b;
    level.scr_anim["generic"]["unarmed_panickedrun_loop_V2"] = %unarmed_panickedrun_loop_v2;
    level.scr_anim["generic"]["h2_dc_burning_CPR_medic"] = %h2_dc_burning_cpr_medic;
    maps\_anim::addnotetrack_attach( "generic", "attach syringe", "adrenaline_syringe_animated", "TAG_INHAND", "h2_dc_burning_CPR_medic" );
    maps\_anim::addnotetrack_detach( "generic", "dettach syringe", "adrenaline_syringe_animated", "TAG_INHAND", "h2_dc_burning_CPR_medic" );
    maps\_anim::addnotetrack_customfunction( "generic", "attach_clipboard", maps\dcburning::attach_clipboard, "h2_dc_burning_CPR_medic", "TAG_WEAPON_LEFT" );
    maps\_anim::addnotetrack_customfunction( "generic", "attach_clipboard", maps\dcburning::attach_pen, "h2_dc_burning_CPR_medic", "TAG_WEAPON_RIGHT" );
    maps\_anim::addnotetrack_customfunction( "generic", "dettach syringe", maps\dcburning::detach_syringe, "h2_dc_burning_CPR_medic", "TAG_INHAND" );
    level.scr_anim["generic"]["h2_dc_burning_CPR_wounded"] = %h2_dc_burning_cpr_wounded;
    level.scr_anim["generic"]["h2_dc_burning_CPR_medic_idle"][0] = %h2_dc_burning_cpr_medic_endidle;
    level.scr_anim["generic"]["h2_dc_burning_CPR_wounded_idle"][0] = %h2_dc_burning_cpr_wounded_endidle;
    level.scr_anim["generic"]["h2_dc_burning_stop_bleeding_medic"] = %h2_dc_burning_stop_bleeding_medic;
    maps\_anim::addnotetrack_attach( "generic", "attach prop", "clotting_powder_animated", "TAG_INHAND", "h2_dc_burning_stop_bleeding_medic" );
    maps\_anim::addnotetrack_detach( "generic", "dettach prop", "clotting_powder_animated", "TAG_INHAND", "h2_dc_burning_stop_bleeding_medic" );
    level.scr_anim["generic"]["h2_dcburning_medicalbay_soldier1_C"] = %h2_dcburning_medicalbay_soldier1_c_start;
    level.scr_anim["generic"]["h2_dcburning_medicalbay_soldier1_C_idle"][0] = %h2_dcburning_medicalbay_soldier1_c_idle;
    level.scr_anim["generic"]["h2_dcburning_medicalbay_soldier2_C"] = %h2_dcburning_medicalbay_soldier2_c_start;
    level.scr_anim["generic"]["h2_dcburning_medicalbay_soldier2_C_idle"][0] = %h2_dcburning_medicalbay_soldier2_c_idle;
    level.scr_anim["generic"]["cargoship_sleeping_guy_idle_2_start"] = %cargoship_sleeping_guy_idle_2;
    level.scr_anim["generic"]["cargoship_sleeping_guy_idle_1_start"] = %cargoship_sleeping_guy_idle_1;
    level.scr_anim["generic"]["cargoship_sleeping_guy_idle_2"][0] = %cargoship_sleeping_guy_idle_2;
    level.scr_anim["generic"]["cargoship_sleeping_guy_idle_1"][0] = %cargoship_sleeping_guy_idle_1;
    level.scr_anim["generic"]["afgan_caves_sleeping_guard_idle_start"] = %afgan_caves_sleeping_guard_idle;
    level.scr_anim["generic"]["afgan_caves_sleeping_guard_idle"][0] = %afgan_caves_sleeping_guard_idle;
    level.scr_anim["generic"]["h2_dcburning_controlroom_ranger01"] = %h2_dcburning_controlroom_ranger01_start;
    level.scr_anim["generic"]["h2_dcburning_controlroom_ranger01_idle"][0] = %h2_dcburning_controlroom_ranger01_idle;
    level.scr_anim["generic"]["h2_dcburning_controlroom_ranger02"] = %h2_dcburning_controlroom_ranger02_start;
    level.scr_anim["generic"]["h2_dcburning_controlroom_ranger02_idle"][0] = %h2_dcburning_controlroom_ranger02_idle;
    level.scr_anim["generic"]["h2_dcburning_controlroom_ranger03"] = %h2_dcburning_controlroom_ranger03_start;
    level.scr_anim["generic"]["h2_dcburning_controlroom_ranger03_idle"][0] = %h2_dcburning_controlroom_ranger03_idle;
    level.scr_anim["generic"]["h2_dcburning_controlroom_ranger04"] = %h2_dcburning_controlroom_ranger04_start;
    level.scr_anim["generic"]["h2_dcburning_controlroom_ranger04_idle"][0] = %h2_dcburning_controlroom_ranger04_idle;
    maps\_anim::addnotetrack_customfunction( "generic", "dcburning_explosionbunker", ::dcburning_mortar_notify, "h2_dcburning_controlroom_ranger04_idle" );
    level.scr_anim["generic"]["h2_dcburning_controlroom_ranger05"] = %h2_dcburning_controlroom_ranger05_start;
    level.scr_anim["generic"]["h2_dcburning_controlroom_ranger05_idle"][0] = %h2_dcburning_controlroom_ranger05_idle;
    maps\_anim::addnotetrack_customfunction( "generic", "dcburning_explosionbunker", ::dcburning_mortar_notify, "h2_dcburning_controlroom_ranger05_idle" );
    level.scr_anim["generic"]["h2_dcburning_controlroom_ranger06"] = %h2_dcburning_controlroom_ranger06_start;
    level.scr_anim["generic"]["h2_dcburning_controlroom_ranger06_idle"][0] = %h2_dcburning_controlroom_ranger06_idle;
    maps\_anim::addnotetrack_customfunction( "generic", "dcburning_explosionbunker", ::dcburning_mortar_notify, "h2_dcburning_controlroom_ranger06_idle" );
    level.scr_anim["generic"]["h2_dcburning_controlroom_ranger08_idle"][0] = %h2_dcburning_controlroom_ranger08_idle;
    maps\_anim::addnotetrack_customfunction( "generic", "dcburning_explosionbunker", ::dcburning_mortar_notify, "h2_dcburning_controlroom_ranger08_idle" );
    level.scr_anim["generic"]["wounded_carry_fastwalk_carrier"] = %wounded_carry_fastwalk_carrier;
    level.scr_anim["generic"]["wounded_carry_fastwalk_wounded"] = %wounded_carry_fastwalk_wounded;
    level.scr_anim["generic"]["h2_dcburning_medicalbay_soldier1_E"] = %h2_dcburning_medicalbay_soldier1_e_start;
    level.scr_anim["generic"]["h2_dcburning_medicalbay_soldier1_E_idle"][0] = %h2_dcburning_medicalbay_soldier1_e_idle;
    level.scr_anim["generic"]["h2_dcburning_medicalbay_soldier2_E"] = %h2_dcburning_medicalbay_soldier2_e_start;
    level.scr_anim["generic"]["h2_dcburning_medicalbay_soldier2_E_idle"][0] = %h2_dcburning_medicalbay_soldier2_e_idle;
    level.scr_anim["generic"]["h2_bunker_Foley_radio_dialogue"] = %h2_bunker_foley_radio_dialogue;
    level.scr_anim["generic"]["h2_dc_burning_carrying_Injured_soldier"] = %h2_dc_burning_carrying_injured_soldier;
    level.scr_anim["generic"]["h2_dc_burning_carrying_Injured_soldier_idle"][0] = %h2_dc_burning_carrying_injured_soldier_endidle;
    level.scr_anim["generic"]["h2_dc_burning_carrying_Injured_wounded"] = %h2_dc_burning_carrying_injured_wounded;
    level.scr_anim["generic"]["h2_dc_burning_carrying_Injured_wounded_idle"][0] = %h2_dc_burning_carrying_injured_wounded_endidle;
    level.scr_anim["generic"]["h2_dc_burning_WoundedCheck01"][0] = %h2_dc_burning_woundedcheck01;
    level.scr_anim["generic"]["h2_dc_burning_WoundedCheck02"][0] = %h2_dc_burning_woundedcheck02;
    level.scr_anim["generic"]["h2_dc_burning_WoundedCheck03"][0] = %h2_dc_burning_woundedcheck03;
    level.scr_anim["generic"]["h2_dcburning_medicalbay_soldier_A"][0] = %h2_dcburning_medicalbay_soldier_a;
    level.scr_anim["generic"]["h2_dcburning_medicalbay_soldier_D"][0] = %h2_dcburning_medicalbay_soldier_d;
    level.scr_anim["generic"]["h2_dcburning_medicalbay_soldier_G_idle"][0] = %h2_dcburning_medicalbay_soldier_g_idle;
    level.scr_anim["generic"]["h2_dcburning_medicalbay_soldier1_H_idle"][0] = %h2_dcburning_medicalbay_soldier1_h_idle;
    level.scr_anim["generic"]["h2_dcburning_medicalbay_soldier2_H_idle"][0] = %h2_dcburning_medicalbay_soldier2_h_idle;
    level.scr_anim["generic"]["h2_dcburning_medicalbay_soldier_I_idle"][0] = %h2_dcburning_medicalbay_soldier_i_idle;
    level.scr_anim["generic"]["h2_dcburning_medicalbay_soldier_J_idle"][0] = %h2_dcburning_medicalbay_soldier_j_idle;
    level.scr_anim["generic"]["h2_dcburning_medicalbay_soldier_K_idle"][0] = %h2_dcburning_medicalbay_soldier_k_idle;
    level.scr_anim["generic"]["h2_dcburning_medicalbay_soldier_L_idle"][0] = %h2_dcburning_medicalbay_soldier_l_idle;
    level.scr_anim["generic"]["h2_dcburning_medicalbay_soldier_M_idle"][0] = %h2_dcburning_medicalbay_soldier_m_idle;
    level.scr_anim["generic"]["h2_dcburning_medicalbay_soldier_N_idle"][0] = %h2_dcburning_medicalbay_soldier_n_idle;
}

dialogue()
{
    level.scr_sound["dcburn_gm1_keepstill"] = "dcburn_gm1_keepstill";
    level.scr_sound["dcburn_gm1_wherescanteen"] = "dcburn_gm1_wherescanteen";
    level.scr_sound["dcburn_gm2_righthere"] = "dcburn_gm2_righthere";
    level.scr_sound["dcburn_gm3_allyoursdoc"] = "dcburn_gm3_allyoursdoc";
    level.scr_sound["dcburn_gm4_2stretchers"] = "dcburn_gm4_2stretchers";
    level.scr_sound["dcburn_gm5_gotwounded"] = "dcburn_gm5_gotwounded";
    level.scr_sound["dcburn_gm6_stablefornow"] = "dcburn_gm6_stablefornow";
    level.scr_radio["dcburn_hqr_ensureweapons"] = "dcburn_hqr_ensureweapons";
    level.scr_sound["generic"]["dcburn_gr1_onyourfeet"] = "dcburn_gr1_onyourfeet";
    maps\_anim::addnotetrack_dialogue( "generic", "dialog", "h2_bunker_toss_guy2", "dcburn_gr1_onyourfeet" );
    level.scr_sound["generic"]["dcburn_mcy_rogerout"] = "dcburn_mcy_twooneout";
    maps\_anim::addnotetrack_dialogue( "generic", "dialog", "h2_bunker_Foley_radio_dialogue", "dcburn_mcy_twooneout" );
    level.scr_sound["generic"]["dcburn_mcy_evachithard"] = "dcburn_mcy_buytime2";
    maps\_anim::addnotetrack_dialogue( "generic", "dialog", "h2_bunker_Foley_radio_dialogue", "dcburn_mcy_buytime2" );
    level.scr_sound["dcburn_hoh_1"] = "dcburn_hoh_1";
    level.scr_sound["dcburn_hoh_2"] = "dcburn_hoh_2";
    maps\_anim::addnotetrack_dialogue( "generic", "dialog", "h2_bunker_toss_guy1", "dcburn_hoh_1" );
    maps\_anim::addnotetrack_dialogue( "generic", "dialog", "h2_bunker_toss_guy2", "dcburn_hoh_2" );
    level.scr_sound["generic"]["dcburn_cpd_stayintrench"] = "dcburn_cpd_stayintrench";
    level.scr_sound["generic"]["dcburn_cpd_staylow"] = "dcburn_cpd_staylow";
    level.scr_sound["generic"]["dcburn_cpd_backintrench"] = "dcburn_cpd_backintrench";
    level.scr_sound["generic"]["dcburn_cpd_wheregoing"] = "dcburn_cpd_wheregoing";
    level.scr_sound["dcburn_javelins_incoming_00"] = "dcburn_gm2_incoming";
    level.scr_sound["dcburn_javelins_incoming_01"] = "dcburn_gm1_takecover";
    level.scr_radio["dcburn_hqr_commerceconfirms"] = "dcburn_hqr_commerceconfirms";
    level.scr_radio["dcburn_hqr_uncoverengage"] = "dcburn_hqr_uncoverengage";
    level.scr_radio["dcburn_cpd_opticsonus"] = "dcburn_cpd_opticsonus";
    level.scr_sound["generic"]["dcburn_mcy_reqairstrike"] = "dcburn_mcy_reqairstrike";
    level.scr_radio["dcburn_hqr_alongpotomac"] = "dcburn_hqr_alongpotomac";
    level.scr_sound["generic"]["dcburn_mcy_buytime"] = "dcburn_mcy_buytime";
    level.scr_radio["dcburn_cpd_wrongway"] = "dcburn_cpd_wrongway";
    level.scr_sound["generic"]["dcburn_mcy_haulingpastus"] = "dcburn_mcy_haulingpastus";
    level.scr_radio["dcburn_hqr_latvee"] = "dcburn_hqr_latvee";
    level.scr_radio["dcburn_mcy_copythat"] = "dcburn_mcy_copythat";
    level.scr_radio["dcburn_hqr_linkup"] = "dcburn_hqr_linkup";
    level.scr_radio["dcburn_mcy_solidcopyonall"] = "dcburn_mcy_solidcopyonall";
    level.scr_sound["generic"]["dcburn_mcy_firelow"] = "dcburn_mcy_firelow";
    level.scr_radio["dcburn_cpd_footmobiles"] = "dcburn_cpd_footmobiles";
    level.scr_sound["generic"]["dcburn_mcy_latveesupp"] = "dcburn_mcy_latveesupp";
    level.scr_sound["generic"]["dcburn_mcy_ready"] = "dcburn_mcy_ready";
    level.scr_sound["generic"]["dcburn_mcy_gomoveup"] = "dcburn_mcy_gomoveup";
    level.scr_radio["dcburn_mcy_lineoffire"] = "dcburn_mcy_lineoffire";
    level.scr_radio["dcburn_mcy_movemove"] = "dcburn_mcy_movemove";
    level.scr_radio["dcburn_mcy_50calsupp"] = "dcburn_mcy_50calsupp";
    level.scr_radio["dcburn_mcy_sittingducks"] = "dcburn_mcy_sittingducks";
    level.scr_radio["dcburn_mcy_blownoff"] = "dcburn_mcy_blownoff";
    level.scr_radio["dcburn_mcy_moveup"] = "dcburn_mcy_moveup";
    level.scr_radio["dcburn_mcy_intotargbuilding"] = "dcburn_mcy_intotargbuilding";
    level.scr_sound["generic"]["dcburn_mcy_grenadelaunch"] = "dcburn_mcy_grenadelaunch";
    level.scr_sound["generic"]["dcburn_mcy_lobby_move_nag_00"] = "dcburn_mcy_moveupgogo";
    level.scr_sound["generic"]["dcburn_mcy_lobby_move_nag_01"] = "dcburn_mcy_movein";
    level.scr_sound["generic"]["dcburn_mcy_lobby_move_nag_02"] = "dcburn_mcy_pushforward";
    level.scr_sound["generic"]["dcburn_mcy_lobby_move_nag_03"] = "dcburn_mcy_moveforward";
    level.scr_sound["generic"]["dcburn_mcy_lobby_move_nag_04"] = "dcburn_mcy_moveup2";
    level.scr_radio["dcburn_mcy_upperfloors"] = "dcburn_mcy_upperfloors";
    level.scr_radio["dcburn_hqr_copiesall"] = "dcburn_hqr_copiesall";
    level.scr_radio["dcburn_mcy_alldeadcourtyard"] = "dcburn_mcy_fireteamsupp";
    level.scr_radio["dcburn_hqr_solidcopy"] = "dcburn_hqr_solidcopy";
    level.scr_radio["dcburn_mcy_tomezzanine"] = "dcburn_mcy_mezzanine";
    level.scr_radio["dcburn_hqr_goodhunt"] = "dcburn_hqr_goodhunting";
    level.scr_radio["dcburn_mcy_alldeadmezzanine"] = "dcburn_mcy_hostsupp";
    level.scr_radio["dcburn_hqr_rogerthat"] = "dcburn_hqr_rogerthat";
    level.scr_radio["dcburn_ar1_lincolnmemorial"] = "dcburn_ar1_lincolnmemorial";
    level.scr_sound["generic"]["dcburn_cpd_capitolbuild"] = "dcburn_cpd_capitolbuild";
    level.scr_radio["dcburn_mcy_droponthem"] = "dcburn_mcy_droponthem";
    level.scr_radio["dcburn_mcy_hitemfast"] = "dcburn_mcy_hitemfast";
    level.scr_radio["dcburn_mcy_whatseeing_r"] = "dcburn_mcy_whatseeing_r";
    level.scr_radio["dcburn_gm5_lzheavyfire"] = "dcburn_gm5_lzheavyfire";
    level.scr_radio["dcburn_mcy_solidcopy_r"] = "dcburn_mcy_solidcopy_r";
    level.scr_radio["dcburn_hqr_crownag"] = "dcburn_hqr_swcorn5th";
    level.scr_radio["dcburn_mcy_omwtofifth"] = "dcburn_mcy_omto5th";
    level.scr_radio["dcburn_mcy_alldeadfourth"] = "dcburn_mcy_fireteamelim";
    level.scr_radio["dcburn_hqr_copythat"] = "dcburn_hqr_copythat";
    level.scr_radio["dcburn_mcy_onfifth"] = "dcburn_mcy_swcorner";
    level.scr_radio["dcburn_hqr_copy21"] = "dcburn_hqr_copy21";
    level.scr_radio["dcburn_cdn_movement"] = "dcburn_cpd_gotmvmnt";
    level.scr_radio["dcburn_mcy_sby2engage"] = "dcburn_mcy_standbyeng";
    level.scr_radio["dcburn_mcy_watchsectors"] = "dcburn_mcy_watchsectors";
    level.scr_radio["dcburn_mcy_checkcorners"] = "dcburn_mcy_checkcorners";
    level.scr_radio["dcburn_mcy_visoncrow"] = "dcburn_mcy_viscrowsnest";
    level.scr_sound["generic"]["dcburn_mcy_seccrowsnest"] = "dcburn_mcy_seccrowsnest";
    level.scr_radio["dcburn_hqr_canyousupport"] = "dcburn_hqr_stillvuln";
    level.scr_sound["generic"]["dcburn_mcy_stockpile"] = "dcburn_mcy_stockpile";
    level.scr_radio["dcburn_evc_glassedenemieswest"] = "dcburn_evc_glassedenemieswest";
    level.scr_sound["generic"]["dcburn_mcy_sniperrifle"] = "dcburn_mcy_sniperrifle";
    level.scr_sound["generic"]["dcburn_mcy_scanfortargets"] = "dcburn_mcy_scanfortargets";
    level.scr_radio["dcburn_evc_damage_00"] = "dcburn_evc_80percenteffective";
    level.scr_radio["dcburn_evc_damage_01"] = "dcburn_evc_forceindetail";
    level.scr_radio["dcburn_evc_damage_02"] = "dcburn_evc_canttakemuchmore";
    level.scr_radio["dcburn_evc_damage_03"] = "dcburn_evc_50percenteffective";
    level.scr_radio["dcburn_evc_damage_fail"] = "dcburn_evc_civviesouttahere";
    level.scr_sound["generic"]["barret_nag_0"] = "dcburn_mcy_ww2mem";
    level.scr_sound["generic"]["barret_nag_1"] = "dcburn_mcy_getonbarrett";
    level.scr_sound["generic"]["barret_nag_2"] = "dcburn_mcy_getonrifle";
    level.scr_sound["generic"]["barret_shoot_nag_0"] = "dcburn_mcy_targetenemy";
    level.scr_sound["generic"]["barret_shoot_nag_1"] = "dcburn_mcy_targetinfantry";
    level.scr_sound["generic"]["stay_in_nest_nag_0"] = "dcburn_mcy_beforeoverrun";
    level.scr_sound["generic"]["stay_in_nest_nag_1"] = "dcburn_mcy_coverevacsite";
    level.scr_sound["generic"]["stay_in_nest_nag_2"] = "dcburn_mcy_returntopost";
    level.scr_radio["dcburn_hqr_stayfrosty"] = "dcburn_hqr_stayfrosty";
    level.scr_sound["generic"]["dcburn_cpd_inperimeter"] = "dcburn_cpd_inperimeter";
    level.scr_sound["generic"]["dcburn_cpd_hostatsix"] = "dcburn_cpd_hostatsix";
    level.scr_sound["generic"]["dcburn_cpd_takingfire"] = "dcburn_cpd_takingfire";
    level.scr_radio["dcburn_hqr_clearout"] = "dcburn_hqr_clearout";
    level.scr_sound["generic"]["dcburn_mcy_negative"] = "dcburn_mcy_negative";
    level.scr_sound["generic"]["dcburn_mcy_whatwecan"] = "dcburn_mcy_whatwecan";
    level.scr_sound["generic"]["dcburn_mcy_useordnance"] = "dcburn_mcy_useordnance";
    level.scr_sound["generic"]["rocket_nag_0"] = "dcburn_mcy_grabajavelin";
    level.scr_sound["generic"]["rocket_nag_1"] = "dcburn_mcy_heavyord";
    level.scr_sound["generic"]["rocket_nag_2"] = "dcburn_mcy_heavyweap";
    level.scr_sound["generic"]["rocket_nag_3"] = "dcburn_mcy_whateveryoufind";
    level.scr_sound["generic"]["rocket_shoot_nag_0"] = "dcburn_mcy_heavyfire";
    level.scr_sound["generic"]["rocket_shoot_nag_1"] = "dcburn_mcy_closingin";
    level.scr_sound["generic"]["rocket_shoot_nag_2"] = "dcburn_mcy_takeoutveh";
    level.scr_radio["dcburn_hqr_urgentsurgicals"] = "dcburn_hqr_urgentsurgicals";
    level.scr_radio["dcburn_ar5_triplea"] = "dcburn_ar5_triplea";
    level.scr_radio["dcburn_ar2_backinseats"] = "dcburn_ar2_backinseats";
    level.scr_radio["dcburn_ar3_gottatouchdown"] = "dcburn_ar3_gottatouchdown";
    level.scr_radio["dcburn_hqr_roofasap"] = "dcburn_hqr_roofasap";
    level.scr_sound["generic"]["dcburn_mcy_rooftop"] = "dcburn_mcy_rooftop";
    level.scr_sound["generic"]["dcburn_cpd_closingin"] = "dcburn_cpd_closingin";
    level.scr_radio["dcburn_bhp_whatsyourstatus"] = "dcburn_bhp_whatsyourstatus";
    level.scr_sound["generic"]["dcburn_mcy_hostilesclose"] = "dcburn_mcy_hostilesclose";
    level.scr_sound["generic"]["dcburn_mcy_notime"] = "dcburn_mcy_notime";
    level.scr_sound["generic"]["dcburn_mcy_keepmoving"] = "dcburn_mcy_keepmoving";
    level.scr_sound["generic"]["dcburn_mcy_overrun"] = "dcburn_mcy_overrun";
    level.scr_sound["generic"]["dcburn_mcy_outoftimego"] = "dcburn_mcy_outoftimego";
    level.scr_sound["generic"]["dcburn_mcy_rvwithseals"] = "dcburn_mcy_rvwithseals";
    level.scr_sound["generic"]["dcburn_mcy_crawlin"] = "dcburn_mcy_crawlin";
    level.scr_sound["generic"]["dcburn_mcy_letsmoveout"] = "dcburn_mcy_letsmoveout";
    level.scr_sound["generic"]["dcburn_mcy_gettoroofnow"] = "dcburn_mcy_gettoroofnow";
    level.scr_sound["generic"]["dcburn_mcy_overrunningpos"] = "dcburn_mcy_overrunningpos";
    level.scr_sound["generic"]["dcburn_mcy_outnumbered"] = "dcburn_mcy_outnumbered";
    level.scr_sound["generic"]["dcburn_mcy_upthestairsgo"] = "dcburn_mcy_upthestairsgo";
    level.scr_sound["generic"]["dcburn_mcy_waitallday"] = "dcburn_mcy_waitallday";
    level.scr_sound["generic"]["dcburn_mcy_gettingoverrun"] = "dcburn_mcy_gettingoverrun";
    level.scr_sound["generic"]["dcburn_mcy_getonminigun"] = "dcburn_mcy_getonminigun";
    level.scr_sound["generic"]["dcburn_mcy_moveminigun"] = "dcburn_mcy_moveminigun";
    level.scr_sound["generic"]["dcburn_mcy_getinchopper"] = "dcburn_mcy_getinchopper";
    level.scr_sound["generic"]["dcburn_mcy_wayoutnumbered"] = "dcburn_mcy_wayoutnumbered";
    level.scr_sound["generic"]["dcburn_mcy_forgetaboutit"] = "dcburn_mcy_forgetaboutit";
    level.scr_sound["generic"]["dcburn_mcy_brassontitanic"] = "dcburn_mcy_brassontitanic";
    level.scr_radio["dcburn_hqr_firstwave"] = "dcburn_hqr_firstwave";
    level.scr_radio["dcburn_hqr_fallbacknow"] = "dcburn_hqr_fallbacknow";
    level.scr_radio["dcburn_ar2_leavebehind"] = "dcburn_ar2_leavebehind";
    level.scr_radio["dcburn_ar2_hydraulicfluid"] = "dcburn_ar2_hydraulicfluid";
    level.scr_radio["dcburn_ar4_wearegoingdown"] = "dcburn_ar4_wearegoingdown";
    level.scr_radio["dcburn_hqr_orderirene"] = "dcburn_hqr_orderirene";
    level.scr_radio["dcburn_ar1_weareleaving"] = "dcburn_ar1_weareleaving";
    level.scr_radio["dcburn_mcy_hitgoingdown"] = "dcburn_mcy_hitgoingdown";
    level.scr_radio["dcburn_bhp_incoming"] = "dcburn_bhp_incoming";
    level.scr_radio["dcburn_mcy_stillintheair"] = "dcburn_mcy_stillintheair";
    level.scr_radio["dcburn_bhp_rpgteams"] = "dcburn_bhp_rpgteams";
    level.scr_radio["dcburn_bhp_attitudecontrol"] = "dcburn_bhp_attitudecontrol";
    level.scr_radio["dcburn_mcy_takeusup"] = "dcburn_mcy_takeusup";
    level.scr_radio["dcburn_bhp_fireteams"] = "dcburn_bhp_fireteams";
    level.scr_radio["dcburn_mcy_bunkerevac"] = "dcburn_mcy_bunkerevac";
    level.scr_radio["dcburn_hqr_stillpinned"] = "dcburn_hqr_stillpinned";
    level.scr_radio["dcburn_mcy_fromtheair"] = "dcburn_mcy_fromtheair";
    level.scr_radio["dcburn_mcy_permission"] = "dcburn_mcy_permission";
    level.scr_radio["dcburn_hqr_clearedhot"] = "dcburn_hqr_clearedhot";
    level.scr_radio["dcburn_mcy_onewaytrip"] = "dcburn_mcy_onewaytrip";
    level.scr_radio["dcburn_sll_withyou"] = "dcburn_sll_withyou";
    level.scr_radio["dcburn_cpd_leadtheway"] = "dcburn_cpd_leadtheway";
    level.scr_radio["dcburn_mcy_alltheway"] = "dcburn_mcy_alltheway";
    level.scr_radio["dcburn_lbp1_breakleftbreakleft"] = "dcburn_lbp1_breakleftbreakleft";
    level.scr_radio["dcburn_lbp1_clearedhot"] = "dcburn_lbp1_clearedhot";
    level.scr_radio["dcburn_mcy_spinherup"] = "dcburn_mcy_spinherup";
    level.scr_radio["dcburn_lbp1_gunshipliftingoff"] = "dcburn_lbp1_gunshipliftingoff";
    level.scr_radio["dcburn_lbp1_armorrollingin"] = "dcburn_lbp1_armorrollingin";
    level.scr_radio["dcburn_lbp1_footmobiles"] = "dcburn_lbp1_footmobiles";
    level.scr_radio["dcburn_evc_mainroad"] = "dcburn_evc_mainroad";
    level.scr_radio["dcburn_lbp1_wereonit"] = "dcburn_lbp1_wereonit";
    level.scr_radio["dcburn_lbp1_takenheatoff"] = "dcburn_lbp1_takenheatoff";
    level.scr_radio["dcburn_lbp1_22and23aredown"] = "dcburn_lbp1_22and23aredown";
    level.scr_radio["dcburn_bhp_dontgetup"] = "dcburn_bhp_dontgetup";
    level.scr_radio["dcburn_lbp1_samlaunch"] = "dcburn_lbp1_samlaunch";
    level.scr_sound["dcburn_lbp1_maydaymayday"] = "dcburn_lbp1_maydaymayday";
    level.scr_radio["dcburn_lbp1_braceforimpact"] = "dcburn_lbp1_braceforimpact";
}
#using_animtree("script_model");

script_model_anims()
{
    level.scr_animtree["plank"] = #animtree;
    level.scr_model["plank"] = "h2_dcb_blackhawk_bars";
    level.scr_anim["plank"]["dcemp_BHrescue"] = %h2_dcemp_bhrescue_plank_1;
    level.scr_animtree["tarp"] = #animtree;
    level.scr_anim["tarp"]["pulldown"] = %h2_gulag_slamraam_tarp_simulation_dcburning;
    level.scr_model["tarp"] = "slamraam_tarp";
    level.scr_animtree["barrett"] = #animtree;
    level.scr_anim["barrett"]["barrett_in"] = %h2_dc_burning_barret_m82_grab_in;
    level.scr_anim["barrett"]["barrett_out"] = %h2_dc_burning_barret_m82_grab_out;
    level.scr_animtree["obelisk"] = #animtree;
    level.scr_anim["obelisk"]["h2_dcburning_obelisk_break_a_anim"] = %h2_dcburning_obelisk_break_a_anim;
    level.scr_anim["obelisk"]["h2_dcburning_obelisk_break_b_anim"] = %h2_dcburning_obelisk_break_b_anim;
    level.scr_animtree["chair"] = #animtree;
    level.scr_anim["chair"]["rotating_chair"] = %h2_dcburning_teachers_chair1_animated;
    level.scr_animtree["wire"] = #animtree;
    level.scr_anim["wire"]["ch_bunker_wires_02_anim"][0] = %h2_ch_bunker_wires_02_idle;
    level.scr_anim["wire"]["dcburning_commerce_wires1_pho_anim"][0] = %h2_dcburning_commerce_wires1_idle;
    level.scr_anim["wire"]["hanging_wires_01_multicolored_anim"][0] = %h2_hanging_wires_01_multicolored;
    level.scr_animtree["wired_light"] = #animtree;
    level.scr_anim["wired_light"]["light_idle"][0] = %h2_est_light_idle;
    level.scr_anim["wired_light"]["light_idle_broken"][0] = %h2_est_broken_light_idle;
    level.scr_animtree["suspended_light"] = #animtree;
    level.scr_anim["suspended_light"]["light_idle1"][0] = %h2_dcb_suspended_lights_01;
    level.scr_anim["suspended_light"]["light_idle2"][0] = %h2_dcb_suspended_lights_02;
    level.scr_anim["suspended_light"]["light_idle3"][0] = %h2_dcb_suspended_lights_03;
    level.scr_anim["suspended_light"]["light_idle4"][0] = %h2_dcb_suspended_lights_04;
    level.scr_anim["suspended_light"]["light_idle5"][0] = %h2_dcb_suspended_lights_05;
    level.scr_animtree["curtains"] = #animtree;
    level.scr_anim["curtains"]["curtains_wind_calm"][0] = %h2_dcb_window_curtain_idle;
    level.scr_anim["curtains"]["curtains_closed_wind_calm"][0] = %h2_dcb_window_curtain_closed_idle;
    level.scr_anim["curtains"]["curtains_wind"][0] = %h2_dcb_window_curtain_windyidle;
    level.scr_animtree["breakable_door"] = #animtree;
    level.scr_anim["breakable_door"]["door_breaking"] = %h2_dcb_door_laminate_wood_blastopen;
}
#using_animtree("vehicles");

vehicle_anims()
{
    level.scr_anim["seaknight"]["h2_sniper_escape_ch46_takeoff"] = %h2_sniper_escape_ch46_takeoff;
    level.scr_anim["seaknight"]["sniper_escape_ch46_take_off_idle"][0] = %sniper_escape_ch46_idle;
    level.scr_anim["seaknight"]["rotors"] = %sniper_escape_ch46_rotors;
    level.scr_animtree["seaknight"] = #animtree;
    level.scr_anim["minigun"]["minigun_in_fast"] = %h2_dc_burning_blackhawk_minigun_vehicle_in_fast;
    level.scr_model["minigun_dummy"] = "h2_vehicle_blackhawk_minigun_viewhands";
    level.scr_animtree["minigun_dummy"] = #animtree;
    level.scr_anim["minigun_dummy"]["minigun_first_impact"] = %h2_dcburning_blackhawk_minigun_vm_first_impact;
    level.scr_anim["minigun_dummy"]["minigun_second_impact"] = %h2_dcburning_blackhawk_minigun_vm_second_impact;
    level.scr_anim["minigun"]["minigun_idle"] = %h2_dc_burning_blackhawk_minigun_idle;
    level.scr_anim["minigun"]["turret_player_fire_left_node"] = %h2_dc_burning_blackhawk_minigun_fire_left_node;
    level.scr_anim["minigun"]["turret_player_fire_left"] = %h2_dc_burning_blackhawk_minigun_fire_left;
    level.scr_anim["minigun"]["turret_player_fire_right_node"] = %h2_dc_burning_blackhawk_minigun_fire_right_node;
    level.scr_anim["minigun"]["turret_player_fire_right"] = %h2_dc_burning_blackhawk_minigun_fire_right;
}

_id_CEF9( var_0 )
{
    common_scripts\utility::flag_set( "roof_door_kicked" );
    var_0 maps\_utility::play_sound_on_tag_endon_death( "scn_shotgun_breach_door_kick_sweetener" );
}

_id_BC50( var_0 )
{
    var_0 maps\_utility::play_sound_on_tag( "scn_shotgun_breach_sweetener", undefined, 1 );
}

_id_C717( var_0 )
{
    var_0.deathanim = var_0._id_BFBA;
    var_0 notify( "reload_begin" );
}

_id_B55C( var_0 )
{
    var_0.deathanim = var_0._id_CE31;
}
#using_animtree("player");

player_anims()
{
    level.scr_animtree["worldhands"] = #animtree;
    level.scr_model["worldhands"] = "h2_gfl_ump9_viewhands_player";
    level.scr_anim["worldhands"]["h2_dcburning_c4_bl"] = %h2_dcburning_c4_bl;
    level.scr_anim["worldhands"]["h2_dcburning_c4_br"] = %h2_dcburning_c4_br;
    level.scr_anim["worldhands"]["h2_dcburning_c4_lf"] = %h2_dcburning_c4_lf;
    level.scr_anim["worldhands"]["h2_dcburning_c4_rf"] = %h2_dcburning_c4_rf;
    maps\_anim::addnotetrack_customfunction( "worldhands", "c4_detach", ::_id_BC3B );
    level.scr_anim["worldhands"]["barrett_in"] = %h2_dc_burning_barret_player_grab_in;
    level.scr_anim["worldhands"]["barrett_out"] = %h2_dc_burning_barret_player_grab_out;
    level.scr_anim["worldhands"]["minigun_in_fast"] = %h2_dc_burning_blackhawk_minigun_in_fast;
    level.scr_model["viewhands"] = "h2_gfl_ump9_viewhands_player";
    level.scr_animtree["viewhands"] = #animtree;
    level.scr_model["viewbody"] = "h2_gfl_ump9_viewbody";
    level.scr_animtree["viewbody"] = #animtree;
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
#using_animtree("generic_human");

_id_B782()
{
    level.scr_anim["enemy_death"]["h2_favela_backalleys_death_rooftop_A"] = %h2_favela_backalleys_death_rooftop_a;
    level.scr_anim["enemy_death"]["h2_favela_backalleys_death_rooftop_B"] = %h2_favela_backalleys_death_rooftop_b;
    level.scr_anim["enemy_death"]["h2_favela_backalleys_death_rooftop_C"] = %h2_favela_backalleys_death_rooftop_c;
    level.scr_anim["enemy_death"]["h2_favela_backalleys_death_rooftop_D"] = %h2_favela_backalleys_death_rooftop_d;
    level.scr_anim["enemy_death"]["h2_favela_backalleys_death_window_A"] = %h2_favela_backalleys_death_window_a;
    level.scr_anim["enemy_death"]["h2_favela_backalleys_death_window_A_idle"] = %h2_favela_backalleys_death_window_a_idle;
    level.scr_anim["enemy_death"]["h2_favela_backalleys_death_window_B"] = %h2_favela_backalleys_death_window_b;
    level.scr_anim["enemy_death"]["h2_favela_backalleys_death_window_B_idle"] = %h2_favela_backalleys_death_window_b_idle;
}
#using_animtree("animated_props");

animated_fence_setup()
{
    level.anim_prop_models["h2_dcb_dpt_commerce_rooftop_fence_01"]["still"] = %h2_dcb_dpt_commerce_rooftop_fence_01_idle;
    level.anim_prop_models["h2_dcb_dpt_commerce_rooftop_fence_01"]["strong"] = %h2_dcb_dpt_commerce_rooftop_fence_01_idle;
    level.anim_prop_models["h2_dcb_dpt_commerce_rooftop_fence_01"]["heli"] = %h2_dcb_dpt_commerce_rooftop_fence_01_windyidle;
    level.anim_prop_models["h2_dcb_dpt_commerce_rooftop_fence_02"]["still"] = %h2_dcb_dpt_commerce_rooftop_fence_02_idle;
    level.anim_prop_models["h2_dcb_dpt_commerce_rooftop_fence_02"]["strong"] = %h2_dcb_dpt_commerce_rooftop_fence_02_idle;
    level.anim_prop_models["h2_dcb_dpt_commerce_rooftop_fence_02"]["heli"] = %h2_dcb_dpt_commerce_rooftop_fence_02_windyidle;
    level.anim_prop_models["h2_dcb_dpt_commerce_rooftop_fence_03"]["still"] = %h2_dcb_dpt_commerce_rooftop_fence_03_idle;
    level.anim_prop_models["h2_dcb_dpt_commerce_rooftop_fence_03"]["strong"] = %h2_dcb_dpt_commerce_rooftop_fence_03_idle;
    level.anim_prop_models["h2_dcb_dpt_commerce_rooftop_fence_03"]["heli"] = %h2_dcb_dpt_commerce_rooftop_fence_03_windyidle;
    level.anim_prop_models["h2_dcb_dpt_commerce_rooftop_fence_04"]["still"] = %h2_dcb_dpt_commerce_rooftop_fence_04_idle;
    level.anim_prop_models["h2_dcb_dpt_commerce_rooftop_fence_04"]["strong"] = %h2_dcb_dpt_commerce_rooftop_fence_04_idle;
    level.anim_prop_models["h2_dcb_dpt_commerce_rooftop_fence_04"]["heli"] = %h2_dcb_dpt_commerce_rooftop_fence_04_windyidle;
}

dcburning_mortar_notify( var_0 )
{
    var_1 = 262144;

    if ( maps\_utility::player_looking_at( var_0 gettagorigin( "tag_eye" ), 0.8, 1 ) )
    {
        var_2 = distancesquared( var_0.origin, level.player.origin );

        if ( var_2 < var_1 )
            level notify( "explosion_mortar", var_2 );
    }
}
