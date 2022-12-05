// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("generic_human");

main()
{
    _id_ADA7();
    _id_BA03();
    _id_B845();
    _id_C892();
    _id_BAF7();
    thread roadkill_init_animsounds();
    turret_animations();
    _id_CB27::_id_C7F5();
    level.scr_anim["shepherd"]["player_shep_intro"] = %h2_roadkill_intro_pickup_shepherd;
    maps\_anim::addnotetrack_dialogue( "shepherd", "dialog", "player_shep_intro", "roadkill_shp_ontheline" );
    maps\_anim::addnotetrack_dialogue( "shepherd", "dialog", "player_shep_intro", "roadkill_shp_ontheline2" );
    maps\_anim::addnotetrack_attach( "shepherd", "pullout_radio", "h2_rkl_handheld_gps", "tag_inhand", "player_shep_intro" );
    level.scr_anim["shepherd"]["player_shep_intro_gun"] = %h2_roadkill_intro_pickup_gun;
    level.scr_anim["hargrove"]["roadkill_intro_orders"] = %roadkill_orders_officer;
    level.scr_anim["foley"]["roadkill_intro_orders"] = %roadkill_orders_soldier;
    level.scr_anim["hargrove"]["walk"] = %civilian_walk_hurried_1;
    level.scr_anim["foley"]["walk"] = %civilian_walk_hurried_1;
    maps\_anim::addnotetrack_flag( "foley", "slam", "slam_hood" );
    level.scr_anim["shepherd"]["roadkill_cover_active_leader"] = %roadkill_cover_active_leader;
    level.scr_anim["shepherd"]["shepherd_cover"][0] = %roadkill_cover_active_leader_idle;
    maps\_anim::addnotetrack_customfunction( "shepherd", "lookat on", ::_id_C279 );
    maps\_anim::addnotetrack_customfunction( "shepherd", "lookat off", ::_id_B0CC );
    maps\_anim::addnotetrack_dialogue( "shepherd", "dialog", "roadkill_cover_active_leader", "roadkill_shp_ontheline" );
    level.scr_anim["shepherd"]["roadkill_riverbank_intro"] = %roadkill_opening_shepherd;
    level.scr_anim["shepherd"]["intro_idle"][0] = %roadkill_opening_shepherd_idle;
    maps\_anim::addnotetrack_dialogue( "shepherd", "roadkill_shp_dontcare_ps", "roadkill_riverbank_intro", "roadkill_shp_dontcare" );

    if ( getdvarint( "use_old_foley_intro" ) )
    {
        level.scr_anim["foley"]["roadkill_riverbank_intro"] = %roadkill_opening_foley;
        level.scr_anim["foley"]["intro_idle"][0] = %roadkill_opening_foley_idle;
    }
    else
        level.scr_anim["foley"]["roadkill_riverbank_intro"] = %h2_roadkill_opening_foley;

    maps\_anim::addnotetrack_customfunction( "foley", "m203", ::_id_C404, "roadkill_riverbank_intro" );
    level.scr_anim["shepherd"]["walk"] = %roadkill_opening_shepherd_walk;
    level.scr_anim["shepherd"]["ending"] = %h2_roadkill_ending_pt1_shepherd;
    level.scr_anim["shepherd"]["ending_idle"][0] = %h2_roadkill_ending_shepherd_idle;
    level.scr_anim["shepherd"]["ending_end"] = %h2_roadkill_ending_shepherd;
    level.scr_anim["generic"]["ending1"] = %h2_roadkill_ending_pt1_soldier1;
    level.scr_anim["generic"]["ending1_idle"][0] = %h2_roadkill_ending_soldier1_idle;
    level.scr_anim["generic"]["ending1_end"] = %h2_roadkill_ending_soldier1;
    level.scr_anim["generic"]["ending2"] = %h2_roadkill_ending_pt1_soldier2;
    level.scr_anim["generic"]["ending2_idle"][0] = %h2_roadkill_ending_soldier2_idle;
    level.scr_anim["generic"]["ending2_end"] = %h2_roadkill_ending_soldier2;
    level.scr_anim["generic"]["ending3"] = %h2_roadkill_ending_pt1_soldier3;
    level.scr_anim["generic"]["ending3_idle"][0] = %h2_roadkill_ending_soldier3_idle;
    level.scr_anim["generic"]["ending3_end"] = %h2_roadkill_ending_soldier3;
    level.scr_anim["shepherd"]["idle_reach"] = %laptop_officer_idle;
    level.scr_anim["shepherd"]["idle"][0] = %laptop_officer_idle;
    level.scr_anim["shepherd"]["stair_approach"] = %roadkill_shepherd_stair_approach;
    level.scr_anim["shepherd"]["stair_idle"][0] = %roadkill_shepherd_stair_idle;
    level.scr_anim["shepherd"]["stair_wave"] = %roadkill_shepherd_stair_wave;
    level.scr_anim["generic"]["wounded_1"][0] = %h2_roadkill_injured_soldier1_idle;
    level.scr_anim["generic"]["wounded_2"][0] = %h2_roadkill_injured_soldier2_idle;
    level.scr_anim["generic"]["wounded_3"][0] = %h2_roadkill_ending_medic_loop;
    level.scr_anim["generic"]["stair_ranger_idle_start"] = %h2_roadkill_onerangernearstairs_ranger_idlein;
    level.scr_anim["generic"]["stair_ranger_idle_loop"] = %h2_roadkill_onerangernearstairs_ranger_idle;
    level.scr_anim["generic"]["stair_ranger_idle_to_wave"] = %h2_roadkill_onerangernearstairs_ranger_idleout;
    level.scr_anim["generic"]["stair_wave"][0] = %h2_roadkill_onerangernearstairs_ranger_waves;
    maps\_anim::addnotetrack_customfunction( "generic", "moveup_vo", ::stairs_ranger_moveup_vo, "stair_wave" );
    level.scr_anim["generic"]["end_ranger_pointing1"] = %h2_roadkill_endingranger_pointing_ranger01;
    level.scr_anim["generic"]["end_ranger_pointing2"] = %h2_roadkill_endingranger_pointing_ranger02;
    level.scr_anim["generic"]["end_ranger_idle1"][0] = %h2_roadkill_endingranger_idle_ranger01;
    level.scr_anim["generic"]["end_ranger_idle2"][0] = %h2_roadkill_endingranger_idle_ranger02;
    level.scr_anim["generic"]["ranger_on_the_bridge_idle1"][0] = %h2_roadkill_rangeronbridge_idle;
    level.scr_anim["generic"]["ranger_on_the_bridge_idle2"][0] = %h2_roadkill_rangeronbridge2_idle;
    level.scr_anim["generic"]["ranger_on_the_bridge_idle3"][0] = %h2_roadkill_rangeronbridge3_idle;
    level.scr_anim["generic"]["ranger_on_the_bridge_idle4"][0] = %h2_roadkill_rangeronbridge_idle;
    level.scr_anim["shepherd"]["angry_walk"] = %roadkill_shepherd_walk;
    level.scr_anim["shepherd"]["angry_wander"] = %roadkill_shepherd_shout_sequence;
    maps\_anim::addnotetrack_dialogue( "shepherd", "dialog", "ending", "roadkill_shp_shocktrauma" );
    maps\_anim::addnotetrack_dialogue( "shepherd", "dialog", "ending_end", "roadkill_shp_goodwork" );
    maps\_anim::addnotetrack_dialogue( "shepherd", "dialog", "ending_end", "roadkill_shp_specialop" );
    maps\_anim::addnotetrack_dialogue( "generic", "dialog", "ending1_end", "roadkill_ar4_oscarmike" );
    level.scr_anim["spotter"]["idle"][0] = %h2_roadkill_cover_spotter_idle;
    level.scr_anim["soldier"]["idle"][0] = %h2_roadkill_cover_soldier_idle;
    level.scr_anim["spotter"]["out"] = %h2_roadkill_cover_spotter_out;
    level.scr_anim["soldier"]["out"] = %h2_roadkill_cover_soldier_out;
    level.scr_anim["spotter"]["binoc_scene"] = %h2_roadkill_cover_spotter_shooting;
    level.scr_anim["soldier"]["binoc_scene"] = %h2_roadkill_cover_soldier_shooting;
    maps\_anim::addnotetrack_customfunction( "spotter", "detach binoc", ::_id_CA17, "binoc_scene" );
    maps\_anim::addnotetrack_customfunction( "spotter", "attach binoc", ::_id_B1CB, "binoc_scene" );
    level.scr_anim["cover_attack1"]["idle"][0] = %h2_roadkill_behindrock_ranger01_idle;
    level.scr_anim["cover_attack2"]["idle"][0] = %h2_roadkill_behindrock_ranger02_idle;
    level.scr_anim["cover_attack3"]["idle"][0] = %h2_roadkill_behindrock_ranger01_idle;
    level.scr_anim["cover_attack1"]["out"] = %h2_roadkill_behindrock_ranger01_out;
    level.scr_anim["cover_attack2"]["out"] = %h2_roadkill_behindrock_ranger02_out;
    level.scr_anim["cover_attack3"]["out"] = %h2_roadkill_behindrock_ranger01_out;

    if ( getdvarint( "use_old_radio_scene" ) )
    {
        level.scr_anim["cover_radio1"]["idle"][0] = %roadkill_cover_radio_soldier1;
        level.scr_anim["cover_radio2"]["idle"][0] = %roadkill_cover_radio_soldier2;
        level.scr_anim["cover_radio3"]["idle"][0] = %roadkill_cover_radio_soldier3;
    }
    else
    {
        level.scr_anim["cover_radio1"]["idle"][0] = %h2_roadkill_cover_radio_soldier1_idle;
        level.scr_anim["cover_radio2"]["idle"][0] = %h2_roadkill_cover_radio_soldier2_idle;
        level.scr_anim["cover_radio3"]["idle"][0] = %h2_roadkill_cover_radio_soldier3_idle;
        level.scr_anim["cover_radio1"]["out"] = %h2_roadkill_cover_radio_soldier1_out;
        level.scr_anim["cover_radio2"]["out"] = %h2_roadkill_cover_radio_soldier2_out;
        level.scr_anim["cover_radio3"]["out"] = %h2_roadkill_cover_radio_soldier3_out;
    }

    level.scr_anim["cover_radio1"]["idle_noshoot"][0] = %roadkill_cover_radio_soldier1_idle;
    level.scr_anim["candy_bar"]["idle"][0] = %h2_roadkill_cover_radio_soldier3;
    level.scr_anim["film1"]["video_film_complete"] = %h2_roadkill_videotaper1_explosion;
    maps\_anim::addnotetrack_dialogue( "film1", "dialog", "video_film_complete", "roadkill_ar1_whichbuilding" );
    maps\_anim::addnotetrack_attach( "film1", "attach_camera", "electronics_camera_pointandshoot_low", "TAG_INHAND", "video_film_complete" );
    maps\_anim::addnotetrack_detach( "film1", "detach_obj", "electronics_camera_pointandshoot_low", "TAG_INHAND", "video_film_complete" );
    level.scr_anim["film2"]["video_film_complete"] = %h2_roadkill_videotaper2_explosion;
    maps\_anim::addnotetrack_dialogue( "film2", "dialog", "video_film_complete", "roadkill_ar2_tallone" );
    maps\_anim::addnotetrack_dialogue( "film2", "dialog", "video_film_complete", "roadkill_ar4_whichone" );
    level.scr_anim["film3"]["video_film_complete"] = %h2_roadkill_videotaper3_explosion;
    maps\_anim::addnotetrack_dialogue( "film3", "dialog", "video_film_complete", "roadkill_ar3_heydawg" );
    maps\_anim::addnotetrack_attach( "film3", "attach_camera", "h2_rkl_cellphone_camera", "TAG_INHAND", "video_film_complete" );
    maps\_anim::addnotetrack_detach( "film3", "detach_obj", "h2_rkl_cellphone_camera", "TAG_INHAND", "video_film_complete" );
    level.scr_anim["film4"]["video_film_complete"] = %h2_roadkill_videotaper4_explosion;
    maps\_anim::addnotetrack_dialogue( "film4", "dialog", "video_film_complete", "roadkill_ar5_oneonleft" );
    maps\_anim::addnotetrack_attach( "film4", "attach_camera", "h2_rkl_cellphone_camera", "TAG_INHAND", "video_film_complete" );
    maps\_anim::addnotetrack_detach( "film4", "detach_obj", "h2_rkl_cellphone_camera", "TAG_INHAND", "video_film_complete" );
    level.scr_anim["film5"]["video_film_complete"] = %h2_roadkill_videotaper5_explosion;
    maps\_anim::addnotetrack_attach( "film5", "attach_camera", "h2_rkl_cellphone_camera", "TAG_INHAND", "video_film_complete" );
    maps\_anim::addnotetrack_detach( "film5", "detach_obj", "h2_rkl_cellphone_camera", "TAG_INHAND", "video_film_complete" );
    level.scr_anim["generic"]["balcony_death"] = [];
    level.scr_anim["generic"]["balcony_death"][0] = %bog_b_rpg_fall_death;
    level.scr_anim["generic"]["balcony_death"][1] = %death_rooftop_a;
    level.scr_anim["generic"]["balcony_death"][2] = %death_rooftop_b;
    level.scr_anim["generic"]["balcony_death"][3] = %death_rooftop_d;
    level.scr_anim["shepherd"]["ending_additive_right"] = %roadkill_ending_point_left45;
    level.scr_anim["shepherd"]["ending_additive_left"] = %roadkill_ending_point_right45;
    level.scr_anim["shepherd"]["ending_additive_controller"] = %roadkill_ending_additive;
    level.scr_anim["exposed_flashbang_v1"]["flashed"] = %exposed_flashbang_v1;
    level.scr_anim["exposed_flashbang_v2"]["flashed"] = %exposed_flashbang_v2;
    level.scr_anim["exposed_flashbang_v3"]["flashed"] = %exposed_flashbang_v3;
    level.scr_anim["exposed_flashbang_v4"]["flashed"] = %exposed_flashbang_v4;
    level.scr_anim["exposed_flashbang_v5"]["flashed"] = %exposed_flashbang_v5;
    level.scr_anim["exposed_flashbang_v5"]["exit_latvee"] = %h2_roadkill_thrownoutlatvee_dunn;
    level.scr_anim["exposed_flashbang_v2"]["exit_latvee"] = %h2_roadkill_thrownoutlatvee_foley;
    level.scr_anim["exposed_flashbang_v3"]["exit_latvee"] = %h2_roadkill_thrownoutlatvee_ranger01;
    level.scr_anim["exposed_flashbang_v4"]["exit_latvee"] = %h2_roadkill_thrownoutlatvee_ranger02;
    level.scr_anim["generic"]["exit_latvee"][0] = %h2_roadkill_throwoutlatvee_afghanbody;
    maps\_anim::addnotetrack_dialogue( "exposed_flashbang_v5", "dialog", "exit_latvee", "roadkill_cpd_ambush_sonofa" );
    maps\_anim::addnotetrack_dialogue( "exposed_flashbang_v5", "dialog", "exit_latvee", "roadkill_cpd_ambush_letsgo" );
    level.scr_anim["exposed_flashbang_v5"]["enter_house"] = %h2_roadkill_enteringhouse_dunn;
    maps\_anim::addnotetrack_dialogue( "exposed_flashbang_v5", "dialog", "enter_house", "roadkill_cpd_huah" );
    maps\_anim::addnotetrack_dialogue( "exposed_flashbang_v5", "dialog", "enter_house", "roadkill_cpd_movinaroundup" );
    level.scr_anim["exposed_flashbang_v2"]["enter_house"] = %h2_roadkill_enteringhouse_foley;
    maps\_anim::addnotetrack_dialogue( "exposed_flashbang_v2", "dialog", "enter_house", "roadkill_fly_everybodyok" );
    maps\_anim::addnotetrack_dialogue( "exposed_flashbang_v2", "dialog", "enter_house", "roadkill_fly_securetopfloor" );
    level.scr_anim["exposed_flashbang_v3"]["enter_house"] = %h2_roadkill_enteringhouse_soldier1;
    level.scr_anim["exposed_flashbang_v4"]["enter_house"] = %h2_roadkill_enteringhouse_soldier2;
    level.scr_anim["generic"]["pistol_walk_back"] = %pistol_walk_back;
    level.scr_anim["generic"]["pistol_death"] = %airport_security_guard_pillar_death_r;
    level.scr_anim["generic"]["exposed_reload"] = %exposed_reloadb;
    level.scr_anim["generic"]["cqb_wave"] = %cqb_stand_signal_move_out;

    if ( getdvarint( "use_old_stairblock_anims" ) )
    {
        level.scr_anim["sit_1"]["sit_around"][0] = %sitting_guard_loadak_idle;
        level.scr_anim["sit_2"]["sit_around"][0] = %civilian_texting_sitting;
        level.scr_anim["sit_3"]["sit_around"][0] = %civilian_sitting_talking_a_1;
        level.scr_model["sit_2"] = "electronics_pda";
    }
    else
    {
        level.scr_anim["sit_1"]["sit_around"][0] = %h2_roadkill_threerangersblockingstairs_ranger01_idle;
        level.scr_anim["sit_2"]["sit_around"][0] = %h2_roadkill_threerangersblockingstairs_ranger02_idle;
        level.scr_anim["sit_3"]["sit_around"][0] = %h2_roadkill_threerangersblockingstairs_ranger03_idle;
        level.scr_anim["sit_1"]["time_to_go"] = %h2_roadkill_threerangersblockingstairs_ranger01_out;
        maps\_anim::addnotetrack_detach( "sit_1", "detach_obj", "h2_rkl_handheld_gps", "tag_weapon_left", "time_to_go" );
        level.scr_anim["sit_2"]["time_to_go"] = %h2_roadkill_threerangersblockingstairs_ranger02_out;
        level.scr_anim["sit_3"]["time_to_go"] = %h2_roadkill_threerangersblockingstairs_ranger03_out;
        maps\_anim::addnotetrack_detach( "sit_3", "detach_obj", "h2_rkl_folded_paper_map", "tag_inhand", "time_to_go" );
        level.scr_model["sit_1"] = "h2_rkl_handheld_gps";
        level.scr_model["sit_3"] = "h2_rkl_folded_paper_map";
    }

    level.scr_anim["driver"]["idle"][0] = %h2_roadkill_rangerinlatvee_idle_driver;
    level.scr_anim["backl"]["idle"][0] = %h2_roadkill_rangerinlatvee_idle_backl;
    level.scr_anim["backr"]["idle"][0] = %h2_roadkill_rangerinlatvee_idle_backr;
    level.scr_anim["pass"]["idle"][0] = %h2_roadkill_rangerinlatvee_idle_pass;
    level.scr_anim["driver"]["getin"] = %h2_roadkill_rangerinlatvee_getin_driver;
    level.scr_anim["backl"]["getin"] = %h2_roadkill_rangerinlatvee_getin_backl;
    level.scr_anim["backr"]["getin"] = %h2_roadkill_rangerinlatvee_getin_backr;
    level.scr_anim["pass"]["getin"] = %h2_roadkill_rangerinlatvee_getin_pass;
    level.scr_anim["driver"]["wait4demo"] = %h2_roadkill_rangerinlatvee_waiting4demolition_driver;
    level.scr_anim["backl"]["wait4demo"] = %h2_roadkill_rangerinlatvee_waiting4demolition_backl;
    level.scr_anim["backr"]["wait4demo"] = %h2_roadkill_rangerinlatvee_waiting4demolition_backr;
    level.scr_anim["pass"]["wait4demo"] = %h2_roadkill_rangerinlatvee_waiting4demolition_pass;
    level.scr_anim["generic"]["rooftop_turn"] = %stand_2_run_180l;
    level.scr_anim["generic"]["walk"] = %patrol_bored_patrolwalk;
    level.scr_anim["street_runner"]["scene"] = %airport_civ_pillar_exit;
    level.scr_anim["roof_backup"]["scene"] = %airport_civ_fear_drop_6;
    level.scr_anim["generic"]["idle_patrol1"][0] = %h2_roadkill_rangersblockingroad_soldier01_idle;
    level.scr_anim["generic"]["idle_patrol2"][0] = %h2_roadkill_rangersblockingroad_soldier02_idle;
    level.scr_anim["generic"]["idle_patrol3"][0] = %h2_roadkill_rangersblockingroad_soldier03_idle;
    level.scr_anim["generic"]["idle_patrol1_out"] = %h2_roadkill_rangersblockingroad_soldier01_react;
    level.scr_anim["generic"]["idle_patrol2_out"] = %h2_roadkill_rangersblockingroad_soldier02_react;
    level.scr_anim["generic"]["idle_patrol3_out"] = %h2_roadkill_rangersblockingroad_soldier03_react;

    if ( getdvarint( "use_old_getinlaatpv_anims" ) )
        level.scr_anim["generic"]["help_player_getin"] = %roadkill_laatpv_soldier_getin;
    else
        level.scr_anim["generic"]["help_player_getin"] = %h2_roadkill_laatpv_soldier_opendoor;

    level.scr_anim["generic"]["combat_walk"] = %combatwalk_f_spin;
    level.scr_anim["generic"]["garage_spawner"] = %unarmed_close_garage;
    level.scr_anim["generic"]["garage_spawner_right"] = %unarmed_runinto_garage_right;
    level.scr_anim["generic"]["garage_spawner_left"] = %unarmed_runinto_garage_left;
    level.scr_anim["generic"]["garage_spawner_left_run"] = %unarmed_scared_run_delta;
    level.scr_anim["generic"]["garage_window_shouter_spawner"][0] = %unarmed_shout_window;
    level.scr_anim["generic"]["garage_spawner_right"] = %unarmed_runinto_garage_right;
    level.scr_anim["civ_garage_runner1"]["run_garage"] = %h2_roadkill_civiliangarage_civilian01;
    maps\_anim::addnotetrack_flag( "civ_garage_runner1", "pull_garage", "pull_garage", "run_garage" );
    level.scr_anim["civ_garage_runner2"]["run_garage"] = %h2_roadkill_civiliangarage_civilian02;
    level.scr_anim["flee_alley"]["round_corner"] = %flee_alley_civilain;
    level.scr_anim["flee_alley"]["idle"][0] = %flee_alley_civilain_idle;
    level.scr_anim["flee_alley"]["idle_location"] = %flee_alley_civilain_idle;
    level.scr_anim["flee_alley"]["hands_up"] = %h2_roadkilll_scaredcivilians_civ1_backoff;
    level.scr_anim["generic"]["unarmed_climb_wall"] = %unarmed_climb_wall;
    level.scr_anim["generic"]["unarmed_climb_wall_v2"] = %unarmed_climb_wall_v2;
    level.scr_anim["generic"]["facedown_death"] = %run_death_facedown;
    level.scr_anim["flee_alley"]["flee_shooting"] = %flee_stand_2_run_med;
    level.scr_anim["civ_run_1"]["civilians_run"] = %h2_roadkill_runningcivilians_civilian01;
    level.scr_anim["civ_run_2"]["civilians_run"] = %h2_roadkill_runningcivilians_civilian02;
    level.scr_anim["civ_run_3"]["civilians_run"] = %h2_roadkill_runningcivilians_civilian03;
    level.scr_anim["civ_run_4"]["civilians_run"] = %h2_roadkill_runningcivilians_civilian04;
    level.scr_anim["generic"]["killhouse_gaz_idleA"][0] = %killhouse_gaz_idlea;
    level.scr_anim["generic"]["killhouse_gaz_talk_side"][0] = %killhouse_gaz_talk_side;
    level.scr_anim["generic"]["killhouse_gaz_idleB"][0] = %killhouse_gaz_idleb;
    level.scr_anim["generic"]["killhouse_sas_price_idle"][0] = %killhouse_sas_price_idle;
    level.scr_anim["generic"]["killhouse_gaz_idleA_solo"] = %killhouse_gaz_idlea;
    level.scr_anim["generic"]["killhouse_gaz_talk_side_solo"] = %killhouse_gaz_talk_side;
    level.scr_anim["generic"]["killhouse_gaz_idleB_solo"] = %killhouse_gaz_idleb;
    level.scr_anim["generic"]["killhouse_sas_price_idle_solo"] = %killhouse_sas_price_idle;
    level.scr_anim["generic"]["balconymilitia_civilian_idle"][0] = %h2_roadkill_balconymilitia_civilian_idle;
    level.scr_anim["generic"]["balconymilitia_civilian1_idle"][0] = %h2_roadkill_balconymilitia_civilian1_idle;
    level.scr_anim["generic"]["balconymilitia_civilian2_idle"][0] = %h2_roadkill_balconymilitia_civilian2_idle;
    level.scr_anim["generic"]["balconymilitia_civilian_out"] = %h2_roadkill_balconymilitia_civilian_out;
    level.scr_anim["generic"]["balconymilitia_civilian1_out"] = %h2_roadkill_balconymilitia_civilian1_out;
    level.scr_anim["generic"]["balconymilitia_civilian2_out"] = %h2_roadkill_balconymilitia_civilian2_out;
    level.scr_anim["generic"]["balconymilitia_civilian_intro"] = %h2_roadkill_balconymilitia_civilian_intro;
    level.scr_anim["generic"]["balconymilitia_civilian1_intro"] = %h2_roadkill_balconymilitia_civilian1_intro;
    level.scr_anim["generic"]["balconymilitia_civilian2_intro"] = %h2_roadkill_balconymilitia_civilian2_intro;
    level.scr_anim["generic"]["latvee_turret_bounce"] = %latvee_turret_bounce;
    level.scr_anim["generic"]["latvee_turret_idle_lookback"] = %latvee_turret_idle_lookback;
    level.scr_anim["generic"]["latvee_turret_idle_lookbackB"] = %latvee_turret_idle_lookbackb;
    level.scr_anim["generic"]["latvee_turret_idle_signal_forward"] = %latvee_turret_idle_signal_forward;
    level.scr_anim["generic"]["latvee_turret_idle_signal_side"] = %latvee_turret_idle_signal_side;
    level.scr_anim["generic"]["latvee_turret_radio"] = %latvee_turret_radio;
    level.scr_anim["generic"]["latvee_turret_flinchA"] = %latvee_turret_flincha;
    level.scr_anim["generic"]["latvee_turret_flinchB"] = %latvee_turret_flinchb;
    level.scr_anim["generic"]["latvee_turret_rechamber"] = %latvee_turret_rechamber;
    level.scr_anim["shepherd"]["shepherd_drone_killed_by_player"] = %stand_death_tumbleforward;
    level.scr_animtree["driver_intro"] = #animtree;
    level.scr_anim["driver_intro"]["h2_intro"] = %h2_roadkill_missiontruckintro_driver;
    maps\_anim::addnotetrack_dialogue( "driver_intro", "dialog", "h2_intro", "roadkill_custom_threat_rpg" );
    level.scr_anim["technical_driver"]["technical_pushed"] = %h2_roadkill_technical_driver;
    level.scr_anim["technical_gunner"]["technical_pushed"] = %h2_technical_turret_roadkill_bump;
}

_id_C279( var_0 )
{

}

_id_B0CC( var_0 )
{

}

_id_CA17( var_0 )
{
    if ( !isdefined( var_0._id_D0CB ) )
        return;

    var_0 detach( "weapon_binocular", "tag_inhand" );
    var_0._id_D0CB = undefined;
}

_id_B1CB( var_0 )
{
    if ( isdefined( var_0._id_D0CB ) )
        return;

    var_0 attach( "weapon_binocular", "tag_inhand" );
    var_0._id_D0CB = 1;
}

_id_D3F0( var_0 )
{
    var_0 thread maps\_utility::play_sound_on_entity( "roadkill_whistle" );
    wait 0.9;
    common_scripts\utility::flag_set( "bridgelayer_starts" );
}

_id_D326( var_0 )
{
    var_0._id_C573 = 1;
    var_0 _id_B648();
}

_id_B648()
{
    self endon( "point_end" );
    var_0 = maps\_utility::getanim( "ending_additive_controller" );
    var_1 = maps\_utility::getanim( "ending_additive_left" );
    var_2 = maps\_utility::getanim( "ending_additive_right" );
    var_3 = 45;

    for (;;)
    {
        var_4 = maps\_utility::getanim( "ending" );
        var_5 = anglestoright( self.angles );
        var_6 = vectornormalize( level.player.origin - self.origin );
        var_7 = anglestoforward( self.angles );
        var_5 = anglestoright( self.angles );
        var_8 = vectordot( var_7, var_6 );
        var_9 = vectordot( var_5, var_6 );
        var_10 = acos( var_8 );
        var_10 = abs( var_10 );
        var_11 = 0;

        if ( var_9 > 0 )
        {
            if ( var_10 > var_3 )
                var_10 = var_3;

            var_11 = var_10 / var_3;
            self setanim( var_1, 0, 0.2, 1 );
            self setanim( var_2, 1, 0.2, 1 );
        }
        else
        {
            var_10 += 10;

            if ( var_10 > var_3 )
                var_10 = var_3;

            var_11 = var_10 / var_3;
            self setanim( var_1, 1, 0.2, 1 );
            self setanim( var_2, 0, 0.2, 1 );
        }

        if ( isdefined( self._id_C573 ) )
        {
            if ( abs( var_11 ) >= 1 )
                self setlookatentity( level.player );
            else
                self setlookatentity();
        }

        self setanim( var_0, var_11, 0.2, 1 );
        wait 0.05;
    }
}

_id_BA7F( var_0 )
{
    wait 2.9;
    var_0._id_C573 = undefined;
    var_0 setlookatentity();
    var_0 notify( "point_end" );
    var_1 = var_0 maps\_utility::getanim( "ending_additive_controller" );
    var_0 clearanim( var_1, 0.2 );
}

_id_C404( var_0 )
{
    var_1 = common_scripts\utility::getfx( "m203" );
    var_2 = var_0 gettagorigin( "tag_flash" );
    var_3 = var_0 gettagangles( "tag_flash" );
    playfxontag( var_1, var_0, "tag_flash" );
    var_4 = ( -1734.0, -1205.0, 740.0 );
    magicbullet( "m203_m16", var_2, var_4 );
}
#using_animtree("script_model");

_id_C892()
{
    level.scr_animtree["gun_model"] = #animtree;
    level.scr_model["gun_model"] = "weapon_colt_anaconda_animated";
    level.scr_animtree["door"] = #animtree;
    level.scr_anim["door"]["run_garage"] = %h2_roadkill_civiliangarage_doorpull;
    level.scr_animtree["radio_handheld"] = #animtree;
    level.scr_anim["radio_handheld"]["stair_ranger_idle_start"] = %h2_roadkill_onerangernearstairs_radio_idlein;
    level.scr_anim["radio_handheld"]["stair_ranger_idle_loop"] = %h2_roadkill_onerangernearstairs_radio_idle;
    level.scr_anim["radio_handheld"]["stair_ranger_idle_to_wave"] = %h2_roadkill_onerangernearstairs_radio_idleout;
    level.scr_anim["radio_handheld"]["stair_wave"][0] = %h2_roadkill_onerangernearstairs_radio_waves;
    level.scr_animtree["lamp_post"] = #animtree;
    level.scr_anim["lamp_post"]["lamp_post_anim_a"] = %h2_rkl_streetlight_explosion_react_a;
    level.scr_anim["lamp_post"]["lamp_post_anim_b"] = %h2_rkl_streetlight_explosion_react_b;
    level.scr_anim["lamp_post"]["lamp_post_anim_c"] = %h2_rkl_streetlight_explosion_react_c;
    level.scr_anim["lamp_post"]["lamp_post_anim_d"] = %h2_rkl_streetlight_explosion_react_d;
    level.scr_anim["lamp_post"]["lamp_post_anim_e"] = %h2_rkl_streetlight_explosion_react_e;
}
#using_animtree("player");

_id_B845()
{
    if ( getdvarint( "use_old_getinlaatpv_anims" ) )
        level.scr_anim["player_rig"]["player_getin"] = %roadkill_laatpv_player_getin;
    else
        level.scr_anim["player_rig"]["player_getin"] = %h2_roadkill_laatpv_player_getin;

    level.scr_animtree["player_rig"] = #animtree;
    level.scr_model["player_rig"] = "h2_gfl_ump45_viewhands_player";
    level.scr_animtree["viewbody"] = #animtree;
    level.scr_model["viewbody"] = "h2_gfl_ump45_viewbody";
    level.scr_animtree["player_worldbody"] = #animtree;
    level.scr_model["player_worldbody"] = "h2_gfl_ump45_viewbody";
    level.scr_anim["player_worldbody"]["exit_latvee"] = %h2_roadkill_thrownoutlatvee_player;
    level.scr_anim["player_worldbody"]["player_shep_intro"] = %h2_roadkill_intro_pickup_player;
    maps\_anim::addnotetrack_customfunction( "player_worldbody", "intro_plr_getup", maps\roadkill_aud::_id_BA67, "player_shep_intro" );
    level.scr_anim["player_worldbody"]["h2_intro"] = %h2_roadkill_missiontruckintro_player;
}

h2_intro_clear_cam_movement( var_0 )
{
    var_1 = var_0 gettagorigin( "tag_player" );
    var_2 = var_0 gettagangles( "tag_player" );
    level.player maps\_utility::lerp_player_view_to_position( var_1, var_2, 0.2, 1, 0, 0, 0, 0, 0 );
    level.player playerlinktodelta( var_0, "tag_player", 0.2, 1, 0, 0, 0, 0, 1 );
}
#using_animtree("vehicles");

_id_ADA7()
{
    level.scr_anim["bridge_layer_bridge"]["bridge_lower"] = %h2_roadkill_m60a1_bridge_lower;
    level.scr_anim["bridge_layer_bridge"]["bridge_driveup"] = %h2_roadkill_m60a1_bridge_driveup;
    level.scr_anim["bridge_layer_bridge"]["bridge_up"] = %h2_roadkill_m60a1_bridge_up;
    level.scr_anim["bridge_layer"]["bridge_lower"] = %h2_roadkill_m60a1_tank_lower;
    level.scr_anim["bridge_layer"]["bridge_driveup"] = %h2_roadkill_m60a1_tank_driveup;
    level.scr_anim["bridge_layer"]["bridge_cross"] = %h2_roadkill_m60a1_tank_cross;
    level.scr_anim["bridge_layer"]["bridge_up"] = %h2_roadkill_m60a1_tank_up;
    level.scr_animtree["bridge_layer_bridge"] = #animtree;
    level.scr_animtree["bridge_layer"] = #animtree;
    level.scr_animtree["player_latvee"] = #animtree;
    level.scr_anim["player_latvee"]["roadkill_intro_orders"] = %roadkill_orders_laatpv;

    if ( getdvarint( "use_old_getinlaatpv_anims" ) )
        level.scr_anim["player_latvee"]["roadkill_player_door_open"] = %roadkill_laatpv_door_soldier;
    else
        level.scr_anim["player_latvee"]["roadkill_player_door_open"] = %h2_roadkill_laatpv_soldier_opendoor_door;

    level.scr_anim["player_latvee"]["technical_pushed"] = %h2_roadkill_pushed_truck_latvee;
    maps\_anim::addnotetrack_customfunction( "player_latvee", "start_latvee_reverse", maps\roadkill_aud::player_laatpv_flee_area_04, "technical_pushed" );
    maps\_anim::addnotetrack_customfunction( "player_latvee", "h2_impact_1", ::impact_camera_shake, "technical_pushed", 1 );
    maps\_anim::addnotetrack_customfunction( "player_latvee", "h2_impact_2", ::impact_camera_shake, "technical_pushed", 2 );
    maps\_anim::addnotetrack_customfunction( "player_latvee", "h2_impact_3", ::impact_camera_shake, "technical_pushed", 3 );

    if ( getdvarint( "use_old_getinlaatpv_anims" ) )
        level.scr_anim["turret"]["player_getin"] = %roadkill_laatpv_gun_getin;
    else
        level.scr_anim["turret"]["player_getin"] = %h2_roadkill_laatpv_player_getin_minigun;

    level.scr_animtree["turret"] = #animtree;
    level.scr_anim["technical"]["technical_pushed"] = %h2_roadkill_pushed_truck_pickup;
    level.scr_animtree["technical"] = #animtree;
    maps\_anim::addnotetrack_customfunction( "technical", "h2_collision_truck", maps\roadkill_code::technical_pushed_collision, "technical_pushed" );
    maps\_anim::addnotetrack_customfunction( "technical", "scn_npc_technical_pickup_impact_01", maps\roadkill_aud::traffic_jam_truck_impact_01, "technical_pushed" );
    maps\_anim::addnotetrack_customfunction( "technical", "scn_npc_technical_pickup_impact_02", maps\roadkill_aud::traffic_jam_truck_impact_02, "technical_pushed" );
    level.scr_model["vehicle_latvee_camo"] = "vehicle_laatpv_viewmodel";
    level.scr_animtree["vehicle_latvee_camo"] = #animtree;
    level.scr_anim["vehicle_latvee_camo"]["h2_intro_vehicle"] = %h2_roadkill_missiontruckintro_latvee;
    level._id_D115["h2_intro_vehicle"]["origin"] = ( -3197.65, -6530.29, 179.914 );
    level._id_D115["h2_intro_vehicle"]["angles"] = ( 0.0, 0.0, 0.0 );
}

impact_camera_shake( var_0, var_1 )
{
    if ( var_1 == 1 )
        earthquake( 0.5, 1.5, level.player.origin, 10000 );
    else if ( var_1 == 2 )
        earthquake( 0.4, 1.5, level.player.origin, 10000 );
    else
        earthquake( 0.3, 1.2, level.player.origin, 10000 );
}

_id_D439( var_0 )
{
    common_scripts\_exploder::exploder( "intro_boom" );
}
#using_animtree("generic_human");

_id_BA03()
{
    level.scr_sound["generic"]["roadkill_fly_yourM203"] = "roadkill_fly_yourM203";
    level.scr_sound["generic"]["roadkill_fly_acrossriver"] = "roadkill_fly_acrossriver";
    level.scr_sound["generic"]["roadkill_fly_10oclockhigh"] = "roadkill_fly_10oclockhigh";
    level.scr_sound["generic"]["roadkill_fly_onthebridge"] = "roadkill_fly_onthebridge";
    level.scr_sound["generic"]["roadkill_shp_dontcare"] = "roadkill_shp_dontcare";
    level.scr_sound["generic"]["roadkill_fly_yessir"] = "roadkill_fly_yessir";
    level.scr_sound["generic"]["roadkill_fly_wereswimming"] = "roadkill_fly_wereswimming";
    level.scr_sound["generic"]["roadkill_fly_makingapush"] = "roadkill_fly_makingapush";
    level.scr_sound["generic"]["roadkill_fly_keephitting"] = "roadkill_fly_keephitting";
    level.scr_sound["generic"]["roadkill_fly_bridgecomplete"] = "roadkill_fly_bridgecomplete";
    level.scr_face["generic"]["roadkill_fly_bridgecomplete"] = %roadkill_fly_bridgecomplete;
    level.scr_sound["generic"]["roadkill_cpd_airstrike"] = "roadkill_cpd_airstrike";
    level.scr_radio["roadkill_auc_ontheline"] = "roadkill_auc_ontheline";
    level.scr_radio["roadkill_fp1_devil11"] = "roadkill_fp1_devil11";
    level.scr_sound["generic"]["roadkill_cpd_checkin"] = "roadkill_cpd_checkin";
    level.scr_radio["roadkill_fp1_standingby"] = "roadkill_fp1_standingby";
    level.scr_sound["generic"]["roadkill_cpd_levelbuilding"] = "roadkill_cpd_levelbuilding";
    level.scr_radio["roadkill_fp1_targetacquired"] = "roadkill_fp1_targetacquired";
    level.scr_sound["generic"]["roadkill_cpd_clearedhot"] = "roadkill_cpd_clearedhot";
    level.scr_radio["roadkill_fp1_offsafe"] = "roadkill_fp1_offsafe";
    level.scr_sound["generic"]["roadkill_ar3_holup"] = "roadkill_ar3_holup";
    level.scr_sound["generic"]["roadkill_cpd_majorfiremission"] = "roadkill_cpd_majorfiremission";
    level.scr_sound["generic"]["roadkill_ar3_dangerclose"] = "roadkill_ar3_dangerclose";
    level.scr_sound["generic"]["roadkill_cpd_sincewhen"] = "roadkill_cpd_sincewhen";
    level.scr_sound["generic"]["roadkill_cpd_getsome"] = "roadkill_cpd_getsome";
    level.scr_sound["generic"]["roadkill_ar1_yeah"] = "roadkill_ar1_yeah";
    level.scr_sound["generic"]["roadkill_ar2_wooyeah"] = "roadkill_ar2_wooyeah";
    level.scr_sound["generic"]["roadkill_ar1_huahyeah"] = "roadkill_ar1_huahyeah";
    level.scr_sound["generic"]["roadkill_cpd_paybig"] = "roadkill_cpd_paybig";
    level.scr_sound["generic"]["roadkill_ar2_keepdreamin"] = "roadkill_ar2_keepdreamin";
    level.scr_sound["generic"]["roadkill_cpd_extreme"] = "roadkill_cpd_extreme";
    level.scr_sound["generic"]["roadkill_ar1_whoa"] = "roadkill_ar1_whoa";
    level.scr_sound["generic"]["roadkill_ar2_yeahcough"] = "roadkill_ar2_yeahcough";
    level.scr_sound["generic"]["roadkill_gar_cough1"] = "roadkill_gar_cough1";
    level.scr_sound["generic"]["roadkill_gar_cough2"] = "roadkill_gar_cough2";
    level.scr_sound["generic"]["roadkill_gar_cough3"] = "roadkill_gar_cough3";
    level.scr_sound["generic"]["roadkill_gar_cough4"] = "roadkill_gar_cough4";
    level.scr_sound["generic"]["roadkill_gar_cough5"] = "roadkill_gar_cough5";
    level.scr_sound["generic"]["roadkill_gar_cough6"] = "roadkill_gar_cough6";
    level.scr_sound["generic"]["roadkill_cpd_movinout"] = "roadkill_cpd_movinout";
    level.scr_sound["generic"]["roadkill_ar2_huah"] = "roadkill_ar2_huah";
    level.scr_sound["generic"]["roadkill_ar3_backinvehicle"] = "roadkill_ar3_backinvehicle";
    level.scr_sound["generic"]["roadkill_ar4_oscarmike"] = "roadkill_ar4_oscarmike";
    level.scr_sound["generic"]["roadkill_fly_oscarmike"] = "roadkill_fly_oscarmike";
    level.scr_sound["generic"]["roadkill_ar2_oscarmike"] = "roadkill_ar2_oscarmike";
    level.scr_sound["generic"]["roadkill_cpd_notstoppin"] = "roadkill_cpd_notstoppin";
    level.scr_sound["generic"]["roadkill_fly_movingout"] = "roadkill_fly_movingout";
    level.scr_sound["generic"]["roadkill_fly_mountup"] = "roadkill_fly_mountup";
    level.scr_sound["generic"]["roadkill_fly_comeongetin"] = "roadkill_fly_comeongetin";
    level.scr_sound["generic"]["roadkill_fly_holdingupline"] = "roadkill_fly_holdingupline";
    level.scr_sound["generic"]["roadkill_fly_hurryup"] = "roadkill_fly_hurryup";
    level.scr_sound["generic"]["roadkill_fly_moveletsgo"] = "roadkill_fly_moveletsgo";
    level.scr_sound["generic"]["roadkill_fly_breakingaway"] = "roadkill_fly_breakingaway";
    level.scr_radio["roadkill_hqr_copyhunter2"] = "roadkill_hqr_copyhunter2";
    level.scr_sound["generic"]["roadkill_fly_scanrooftops"] = "roadkill_fly_scanrooftops";
    level.scr_sound["generic"]["roadkill_fly_lastlonger"] = "roadkill_fly_lastlonger";
    level.scr_sound["generic"]["roadkill_fly_eyeoutforciv"] = "roadkill_fly_eyeoutforciv";
    level.scr_sound["generic"]["roadkill_fly_holdoff"] = "roadkill_fly_holdoff";
    level.scr_sound["generic"]["roadkill_cpd_scoutingus"] = "roadkill_cpd_scoutingus";
    level.scr_sound["generic"]["roadkill_fly_doesntmean"] = "roadkill_fly_doesntmean";
    level.scr_sound["generic"]["roadkill_fly_nothingthere"] = "roadkill_fly_nothingthere";
    level.scr_sound["generic"]["roadkill_fly_standdown"] = "roadkill_fly_standdown";
    level.scr_sound["generic"]["roadkill_fly_ceasefire"] = "roadkill_fly_ceasefire";
    level.scr_sound["generic"]["roadkill_fly_watchsector"] = "roadkill_fly_watchsector";
    level.scr_sound["generic"]["roadkill_cpd_seeanything"] = "roadkill_cpd_seeanything";
    level.scr_sound["generic"]["roadkill_fly_stayfrosty"] = "roadkill_fly_stayfrosty";
    level.scr_sound["generic"]["roadkill_fly_eyesforward"] = "roadkill_fly_eyesforward";
    level.scr_sound["generic"]["roadkill_fly_watchalleys"] = "roadkill_fly_watchalleys";
    level.scr_sound["generic"]["roadkill_cpd_contact12"] = "roadkill_cpd_contact12";
    level.scr_sound["generic"]["roadkill_fly_sittingducks"] = "roadkill_fly_sittingducks";
    level.scr_sound["generic"]["roadkill_fly_strungout"] = "roadkill_fly_strungout";
    level.scr_sound["generic"]["roadkill_cpd_keepmoving"] = "roadkill_cpd_keepmoving";
    level.scr_radio["roadkill_ar2_shotup"] = "roadkill_ar2_shotup";
    level.scr_sound["generic"]["roadkill_fly_hangtight"] = "roadkill_fly_hangtight";
    level.scr_radio["roadkill_ar2_solidcopy"] = "roadkill_ar2_solidcopy";
    level.scr_sound["generic"]["roadkill_cpd_cutoff"] = "roadkill_cpd_cutoff";
    level.scr_sound["generic"]["roadkill_fly_pushthrough"] = "roadkill_fly_pushthrough";
    level.scr_sound["generic"]["roadkill_fly_headsup"] = "roadkill_fly_rpgtopfloor";
    level.scr_sound["generic"]["roadkill_fly_getoffstreet"] = "roadkill_fly_getoffstreet";
    level.scr_sound["generic"]["dcemp_cpd_lookout2"] = "dcemp_cpd_lookout2";
    level.scr_sound["generic"]["roadkill_fly_followme"] = "roadkill_fly_followme";
    level.scr_sound["generic"]["roadkill_fly_everybodyok"] = "roadkill_fly_everybodyok";
    level.scr_sound["generic"]["roadkill_cpd_huah"] = "roadkill_cpd_huah";
    level.scr_sound["generic"]["roadkill_ar1_huah"] = "roadkill_ar1_huah";
    level.scr_sound["generic"]["roadkill_ar2_huah2"] = "roadkill_ar2_huah2";
    level.scr_sound["generic"]["roadkill_cpd_movinaroundup"] = "roadkill_cpd_movinaroundup";
    level.scr_sound["generic"]["roadkill_fly_securetopfloor"] = "roadkill_fly_securetopfloor";
    level.scr_sound["generic"]["roadkill_fly_eyesonschool"] = "roadkill_fly_eyesonschool";
    level.scr_radio["roadkill_ar3_ineffective"] = "roadkill_ar3_ineffective";
    level.scr_sound["generic"]["roadkill_fly_keepittogether"] = "roadkill_fly_keepittogether";
    level.scr_sound["generic"]["roadkill_fly_intheschool"] = "roadkill_fly_intheschool";
    level.scr_sound["generic"]["roadkill_shp_copythat21"] = "roadkill_shp_copythat21";
    level.scr_sound["generic"]["roadkill_cpd_historyclass"] = "roadkill_cpd_historyclass";
    level.scr_sound["generic"]["roadkill_fly_rogerthat"] = "roadkill_fly_rogerthat";
    level.scr_sound["generic"]["roadkill_fly_sawone"] = "roadkill_fly_sawone";
    level.scr_sound["generic"]["roadkill_fly_moreresistance"] = "roadkill_fly_moreresistance";
    level.scr_sound["generic"]["roadkill_cpd_frontofschool"] = "roadkill_cpd_frontofschool";
    level.scr_sound["generic"]["roadkill_cpd_classonright"] = "roadkill_cpd_classonright";
    level.scr_sound["generic"]["roadkill_shp_thanksforassist"] = "roadkill_shp_thanksforassist";
    level.scr_sound["generic"]["roadkill_fly_allthewaysir"] = "roadkill_fly_allthewaysir";
    level.scr_sound["generic"]["roadkill_shp_alltheway"] = "roadkill_shp_alltheway";
    level.scr_sound["generic"]["roadkill_fly_pressureoff"] = "roadkill_fly_pressureoff";
    level.scr_radio["roadkill_shp_thanksforassist"] = "roadkill_shp_thanksforassist";
    level.scr_sound["generic"]["roadkill_fly_allthewaysir"] = "roadkill_fly_allthewaysir";
    level.scr_radio["roadkill_shp_alltheway"] = "roadkill_shp_alltheway";
    level.scr_sound["generic"]["roadkill_fly_togoliath"] = "roadkill_fly_togoliath";
    level.scr_radio["roadkill_ar3_sendtraffic"] = "roadkill_ar3_sendtraffic";
    level.scr_sound["generic"]["roadkill_fly_schoolsecure"] = "roadkill_fly_schoolsecure";
    level.scr_radio["roadkill_ar3_rallypoint"] = "roadkill_ar3_rallypoint";
    level.scr_sound["generic"]["roadkill_fly_thanksfortip"] = "roadkill_fly_thanksfortip";
    level.scr_sound["generic"]["roadkill_fly_watchstragglers"] = "roadkill_fly_watchstragglers";
    level.scr_sound["generic"]["roadkill_fly_lastofem"] = "roadkill_fly_lastofem";
    level.scr_sound["generic"]["roadkill_shp_shocktrauma"] = "roadkill_shp_shocktrauma";
    level.scr_sound["generic"]["roadkill_shp_goodwork"] = "roadkill_shp_goodwork";
    level.scr_sound["generic"]["roadkill_shp_specialop"] = "roadkill_shp_specialop";
    level.scr_sound["generic"]["roadkill_ar1_sparemre"] = "roadkill_ar1_sparemre";
    level.scr_sound["generic"]["roadkill_ar2_oscarmike2"] = "roadkill_ar2_oscarmike2";
    level.scr_sound["generic"]["roadkill_ar3_stowyourgear"] = "roadkill_ar3_stowyourgear";
    level.scr_sound["generic"]["roadkill_ar4_upandrunning"] = "roadkill_ar4_upandrunning";
    level.scr_sound["generic"]["roadkill_shp_ontheline"] = "roadkill_shp_ontheline";
    level.scr_sound["generic"]["roadkill_ar1_whichbuilding"] = "roadkill_ar1_whichbuilding";
    level.scr_sound["generic"]["roadkill_ar2_tallone"] = "roadkill_ar2_tallone";
    level.scr_sound["generic"]["roadkill_ar3_heydawg"] = "roadkill_ar3_heydawg";
    level.scr_sound["generic"]["roadkill_ar4_whichone"] = "roadkill_ar4_whichone";
    level.scr_sound["generic"]["roadkill_ar5_oneonleft"] = "roadkill_ar5_oneonleft";
    level.scr_sound["generic"]["roadkill_ar1_howlong"] = "roadkill_ar1_howlong";
    level.scr_sound["generic"]["roadkill_ar2_runsout"] = "roadkill_ar2_runsout";
    level.scr_sound["generic"]["roadkill_ar1_10seconds"] = "roadkill_ar1_10seconds";
    level.scr_sound["generic"]["roadkill_ar2_10seconds"] = "roadkill_ar2_10seconds";
    level.scr_sound["generic"]["roadkill_ar3_10seconds"] = "roadkill_ar3_10seconds";
    level.scr_sound["generic"]["roadkill_ar4_goinon"] = "roadkill_ar4_goinon";
    level.scr_sound["generic"]["roadkill_ar5_majorfire"] = "roadkill_ar5_majorfire";
    level.scr_sound["generic"]["roadkill_ar4_memoryleft"] = "roadkill_ar4_memoryleft";
    level.scr_sound["generic"]["roadkill_ar5_shouldbegood"] = "roadkill_ar5_shouldbegood";
    level.scr_sound["generic"]["roadkill_ar3_dangerclose"] = "roadkill_ar3_dangerclose";
    level.scr_sound["generic"]["roadkill_cpd_sincewhen"] = "roadkill_cpd_sincewhen";
    level.scr_sound["generic"]["roadkill_ar1_boom"] = "roadkill_ar1_boom";
    level.scr_sound["generic"]["roadkill_ar2_yeah"] = "roadkill_ar2_yeah";
    level.scr_sound["generic"]["roadkill_ar3_woo"] = "roadkill_ar3_woo";
    level.scr_sound["generic"]["roadkill_ar4_yeah"] = "roadkill_ar4_yeah";
    level.scr_sound["generic"]["roadkill_ar5_hotman"] = "roadkill_ar5_hotman";
    level.scr_sound["generic"]["roadkill_ar1_4thofjuly"] = "roadkill_ar1_4thofjuly";
    level.scr_sound["generic"]["roadkill_ar1_catcalls"] = "roadkill_ar1_catcalls";
    level.scr_sound["generic"]["roadkill_ar2_catcalls"] = "roadkill_ar2_catcalls";
    level.scr_sound["generic"]["roadkill_ar3_catcalls"] = "roadkill_ar3_catcalls";
    level.scr_sound["generic"]["roadkill_ar1_battalionom"] = "roadkill_ar1_battalionom";
    level.scr_sound["generic"]["roadkill_cpd_oscarmike"] = "roadkill_cpd_oscarmike";
    level.scr_sound["generic"]["roadkill_ar3_onthemove"] = "roadkill_ar3_onthemove";
    level.scr_sound["generic"]["roadkill_ar4_rogerthat"] = "roadkill_ar4_rogerthat";
    level.scr_sound["generic"]["roadkill_fly_breakingaway"] = "roadkill_fly_breakingaway";
    level.scr_sound["generic"]["roadkill_hqr_copyhunter2"] = "roadkill_hqr_copyhunter2";
    level.scr_sound["generic"]["roadkill_fly_eyeoutforciv"] = "roadkill_fly_eyeoutforciv";
    level.scr_sound["generic"]["roadkill_fly_scanrooftops"] = "roadkill_fly_scanrooftops";
    level.scr_sound["generic"]["roadkill_cpd_seeanything"] = "roadkill_cpd_seeanything";
    level.scr_sound["generic"]["roadkill_cpd_placeisdead"] = "roadkill_cpd_placeisdead";
    level.scr_sound["generic"]["roadkill_ar3_huah"] = "roadkill_ar3_huah";
    level.scr_sound["generic"]["roadkill_fly_crossstreeteliz"] = "roadkill_fly_crossstreeteliz";
    level.scr_sound["generic"]["roadkill_hqr_caution"] = "roadkill_hqr_caution";
    level.scr_sound["generic"]["roadkill_cpd_wildwest"] = "roadkill_cpd_wildwest";
    level.scr_sound["generic"]["roadkill_ar3_rogerthat"] = "roadkill_ar3_rogerthat";
    level.scr_sound["generic"]["roadkill_fly_watchalleys"] = "roadkill_fly_watchalleys";
    level.scr_sound["generic"]["roadkill_ar3_covering"] = "roadkill_ar3_covering";
    level.scr_sound["generic"]["roadkill_ar1_probablemilitia"] = "roadkill_ar1_probablemilitia";
    level.scr_sound["generic"]["roadkill_fly_aretheyarmed"] = "roadkill_fly_aretheyarmed";
    level.scr_sound["generic"]["roadkill_ar1_watchingus"] = "roadkill_ar1_watchingus";
    level.scr_sound["generic"]["roadkill_cpd_scoutingus"] = "roadkill_cpd_scoutingus";
    level.scr_sound["generic"]["roadkill_fly_doesntmean"] = "roadkill_fly_doesntmean";
    level.scr_sound["generic"]["roadkill_fly_nothingthere"] = "roadkill_fly_nothingthere";
    level.scr_sound["generic"]["roadkill_fly_ceasefire"] = "roadkill_fly_ceasefire";
    level.scr_sound["generic"]["roadkill_ar2_seeem"] = "roadkill_ar2_seeem";
    level.scr_sound["generic"]["roadkill_cpd_dontseejack"] = "roadkill_cpd_dontseejack";
    level.scr_sound["generic"]["roadkill_fly_prepeng"] = "roadkill_fly_prepeng";
    level.scr_sound["generic"]["roadkill_cpd_goinin"] = "roadkill_cpd_goinin";
    level.scr_sound["generic"]["roadkill_ar1_spinemup"] = "roadkill_ar1_spinemup";
    level.scr_sound["generic"]["roadkill_ar3_12and6"] = "roadkill_ar3_12and6";
    level.scr_sound["generic"]["roadkill_ar4_tonacontacts"] = "roadkill_ar4_tonacontacts";
    level.scr_sound["generic"]["roadkill_cpd_watclatmnt"] = "roadkill_cpd_watclatmnt";
    level.scr_sound["generic"]["roadkill_ar5_longrange"] = "roadkill_ar5_longrange";
    level.scr_sound["generic"]["roadkill_ar2_goinforward"] = "roadkill_ar2_goinforward";
    level.scr_sound["generic"]["roadkill_ar1_rightthere"] = "roadkill_ar1_rightthere";
    level.scr_sound["generic"]["roadkill_cpd_shutitoff"] = "roadkill_cpd_shutitoff";
    level.scr_sound["generic"]["roadkill_cpd_lightemup"] = "roadkill_cpd_lightemup";
    level.scr_sound["generic"]["roadkill_cpd_backup"] = "roadkill_cpd_backup";
    level.scr_sound["generic"]["roadkill_cpd_outtahere"] = "roadkill_cpd_outtahere";
    level.scr_sound["generic"]["roadkill_bmr_9_326"] = "roadkill_bmr_9_326";
    level.scr_sound["generic"]["roadkill_bmr_12_115"] = "roadkill_bmr_12_115";
    level.scr_sound["generic"]["roadkill_bmr_3_357"] = "roadkill_bmr_3_357";
    level.scr_sound["generic"]["roadkill_bmr_6_381"] = "roadkill_bmr_6_381";
    level.scr_sound["generic"]["roadkill_bmr_7_110"] = "roadkill_bmr_7_110";
    level.scr_sound["generic"]["roadkill_bmr_11_108"] = "roadkill_bmr_11_108";
    level.scr_sound["generic"]["roadkill_bmr_6_423"] = "roadkill_bmr_6_423";
    level.scr_sound["generic"]["roadkill_bmr_12_86"] = "roadkill_bmr_12_86";
    level.scr_sound["generic"]["roadkill_bmr_9_285"] = "roadkill_bmr_9_285";
    level.scr_sound["generic"]["roadkill_bmr_6_560"] = "roadkill_bmr_6_560";
    level.scr_sound["generic"]["roadkill_bmr_7_252"] = "roadkill_bmr_7_252";
    level.scr_sound["generic"]["roadkill_bmr_9_381"] = "roadkill_bmr_9_381";
    level.scr_sound["generic"]["roadkill_bmr_9_332"] = "roadkill_bmr_9_332";
    level.scr_sound["generic"]["roadkill_bmr_3_277"] = "roadkill_bmr_3_277";
    level.scr_sound["generic"]["roadkill_cpd_clear"] = "roadkill_cpd_clear";
    level.scr_sound["generic"]["roadkill_cpd_2cominout"] = "roadkill_cpd_2cominout";
    level.scr_sound["generic"]["roadkill_cpd_3cominout"] = "roadkill_cpd_3cominout";
    level.scr_sound["generic"]["roadkill_cpd_farside"] = "roadkill_cpd_farside";
    level.scr_sound["generic"]["roadkill_cpd_bridgelayer"] = "roadkill_cpd_bridgelayer";
    level.scr_sound["generic"]["roadkill_cpd_looklook"] = "roadkill_cpd_looklook";
    level.scr_sound["generic"]["roadkill_cpd_hahaitsdown"] = "roadkill_cpd_hahaitsdown";
    level.scr_sound["generic"]["roadkill_AB2_heretheycome"] = "roadkill_AB2_heretheycome";
    level.scr_sound["generic"]["roadkill_AB2_rpgslatvees"] = "roadkill_AB2_rpgslatvees";
    level.scr_sound["generic"]["roadkill_AB2_hassanmove"] = "roadkill_AB2_hassanmove";
    level.scr_sound["generic"]["roadkill_AB2_diedogs"] = "roadkill_AB2_diedogs";
    level.scr_sound["generic"]["roadkill_AB2_movex3"] = "roadkill_AB2_movex3";
    level.scr_sound["generic"]["roadkill_fly_getflashbang"] = "roadkill_fly_getflashbang";
    level.scr_sound["generic"]["roadkill_intro_ranger_stairs_vo"] = "roadkill_intro_ranger_stairs_vo";
}
#using_animtree("script_model");

_id_BAF7()
{
    level.scr_animtree["exploder_script_model"] = #animtree;
    level._id_A98C = [];
    level._id_A98C[0] = "exploder_script_model";
    level.scr_anim["exploder_script_model"]["h2_rk_build_a0_anim"] = %h2_rk_build_a0_anim;
    level.scr_anim["exploder_script_model"]["h2_rk_build_a1_anim"] = %h2_rk_build_a1_anim;
    level.scr_anim["exploder_script_model"]["h2_rk_build_a2_anim"] = %h2_rk_build_a2_anim;
    level.scr_anim["exploder_script_model"]["h2_rk_build_a_glass0_anim"] = %h2_rk_build_a_glass0_anim;
    level.scr_anim["exploder_script_model"]["h2_rk_build_a_glass1_anim"] = %h2_rk_build_a_glass1_anim;
    level.scr_anim["exploder_script_model"]["h2_rk_build_a_glass2_anim"] = %h2_rk_build_a_glass2_anim;
    level.scr_anim["exploder_script_model"]["h2_rk_build_b0_anim"] = %h2_rk_build_b0_anim;
    level.scr_anim["exploder_script_model"]["h2_rk_build_b1_anim"] = %h2_rk_build_b1_anim;
    level.scr_anim["exploder_script_model"]["h2_rk_build_b2_anim"] = %h2_rk_build_b2_anim;
    level.scr_anim["exploder_script_model"]["h2_rk_build_b_glass0_anim"] = %h2_rk_build_b_glass0_anim;
    level.scr_anim["exploder_script_model"]["h2_rk_build_b_glass1_anim"] = %h2_rk_build_b_glass1_anim;
    level.scr_anim["exploder_script_model"]["h2_rk_build_b_glass2_anim"] = %h2_rk_build_b_glass2_anim;
    level.scr_anim["exploder_script_model"]["h2_rk_build_b_glass3_anim"] = %h2_rk_build_b_glass3_anim;
    level.scr_anim["exploder_script_model"]["h2_rk_split_build0_anim"] = %h2_rk_split_build0_anim;
    level.scr_anim["exploder_script_model"]["h2_rk_split_build1_anim"] = %h2_rk_split_build1_anim;
    level.scr_anim["exploder_script_model"]["h2_rk_split_build2_anim"] = %h2_rk_split_build2_anim;
    level.scr_anim["exploder_script_model"]["h2_rk_split_build3_anim"] = %h2_rk_split_build3_anim;
    level.scr_anim["exploder_script_model"]["h2_rk_split_build4_anim"] = %h2_rk_split_build4_anim;
    level.scr_anim["exploder_script_model"]["h2_rk_split_build5_anim"] = %h2_rk_split_build5_anim;
    level.scr_anim["exploder_script_model"]["h2_rkl_tree_a0_anim"] = %h2_rkl_tree_a0_anim;
    level.scr_anim["exploder_script_model"]["h2_rkl_tree_a1_anim"] = %h2_rkl_tree_a1_anim;
    level.scr_anim["exploder_script_model"]["h2_rkl_tree_b0_anim"] = %h2_rkl_tree_b0_anim;
    level.scr_anim["exploder_script_model"]["h2_rkl_tree_b1_anim"] = %h2_rkl_tree_b1_anim;
    level.scr_anim["exploder_script_model"]["h2_rkl_tree_c_anim"] = %h2_rkl_tree_c_anim;
    level.scr_anim["exploder_script_model"]["h2_rkl_tree_d_anim"] = %h2_rkl_tree_d_anim;
    level.scr_anim["exploder_script_model"]["h2_rkl_tree_e0_anim"] = %h2_rkl_tree_e0_anim;
    level.scr_anim["exploder_script_model"]["h2_rkl_tree_e1_anim"] = %h2_rkl_tree_e1_anim;
    level.scr_anim["exploder_script_model"]["h2_rkl_anim_highway_sign_animated_anim"] = %h2_rkl_highway_sign_explosion_react;
    level.scr_anim["exploder_script_model"]["me_satellitedish_animated_anim"] = %h2_rkl_satellitedish_explosion_react;
    level.scr_anim["exploder_script_model"]["h2_rkl_anim_fence_upper_right_anim"] = %h2_rkl_anim_fence_upper_right_anim;
    level.scr_anim["exploder_script_model"]["h2_rkl_anim_fence_upper_left_anim"] = %h2_rkl_anim_fence_upper_left_anim;
    level.scr_anim["exploder_script_model"]["h2_rkl_anim_fence_lower_right_anim"] = %h2_rkl_anim_fence_lower_right_anim;
    level.scr_anim["exploder_script_model"]["h2_rkl_anim_fence_lower_left_anim"] = %h2_rkl_anim_fence_lower_left_anim;
}
#using_animtree("generic_human");

_id_C3C8()
{
    var_0 = _id_C250::setanims();

    if ( getdvarint( "use_old_getinlaatpv_anims" ) )
        return var_0;

    var_0[1].getin = %h2_roadkill_laatpv_dunn_getin;
    var_0[0].idle = %h2_roadkill_laatpv_driver_idle;
    var_0[1].idle = %h2_roadkill_laatpv_dunn_idle;
    var_0[2].idle = %h2_roadkill_laatpv_soldier_idle;
    var_0[0]._id_B099 = "react_player_getin_driver";
    var_0[1]._id_B099 = "react_player_getin_dunn";
    var_0[2]._id_B099 = "react_player_getin_soldier";
    level.scr_anim["generic"][var_0[0]._id_B099] = %h2_roadkill_laatpv_driver_playerinlatvee;
    level.scr_anim["generic"][var_0[1]._id_B099] = %h2_roadkill_laatpv_dunn_playerinlatvee;
    level.scr_anim["generic"][var_0[2]._id_B099] = %h2_roadkill_laatpv_soldier_playerinlatvee;
    level.scr_anim["dunn"]["waiting_to_getin"][0] = %h2_roadkill_laatpv_dunn_waitingidle;
    return var_0;
}
#using_animtree("vehicles");

_id_C052( var_0 )
{
    var_0 = _id_C250::set_vehicle_anims( var_0 );

    if ( getdvarint( "use_old_getinlaatpv_anims" ) )
        return var_0;

    var_0[1].vehicle_getinanim = %h2_roadkill_laatpv_dunn_getin_door;
    return var_0;
}

roadkill_init_animsounds()
{
    waittillframeend;
    maps\_anim::addonstart_animsound( "player_worldbody", "h2_intro", "scn_mission_truck_intro_player" );
}
#using_animtree("mg42");

turret_animations()
{
    level.scr_anim["50cal"]["technical_pushed"] = %h2_technical_turret_roadkill_bump_50cal;
}

stairs_ranger_moveup_vo( var_0 )
{
    if ( !common_scripts\utility::flag( "player_climbs_stairs" ) )
        var_0 maps\_utility::generic_dialogue_queue( "roadkill_intro_ranger_stairs_vo" );
}
