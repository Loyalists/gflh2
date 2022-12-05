// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_A902()
{
    _id_C297();

    if ( level.script == "ending" )
    {
        player_animations();
        chicken_anims();
        model_anims();
    }

    _id_C892();
    _id_BA3A();
    _id_B405();
}
#using_animtree("generic_human");

_id_B405()
{
    level.scr_animtree["player_body"] = #animtree;
    level.scr_model["player_body"] = "h2_gfl_m4_sopmod_ii_body";
    level.scr_anim["player_body"]["price_wakeup"] = %afchase_ending_player_body;
    level.scr_animtree["worldbody"] = #animtree;

    // if ( level.script == "ending" )
    //     level.scr_model["worldbody"] = "viewbody_tf141_wet";
    // else
    //     level.scr_model["worldbody"] = "viewbody_tf141";

    level.scr_model["worldbody"] = "h2_gfl_m4_sopmod_ii_viewbody";
    level.scr_anim["worldbody"]["impaled_takedown"] = %h2_af_chase_impaled_takedown_player;
    level.scr_anim["worldbody"]["crawl_takedown"] = %h2_af_chase_crawl_takedown_player;
    maps\_anim::addnotetrack_customfunction( "worldbody", "switch_bloody", ::_id_B7C7 );
    level.scr_anim["worldbody"]["jumpin_zodiac"] = %h2_afchase_boat_jumpin_player;
}

_id_C297()
{
    level._id_D572 = %root;
    level.scr_anim["crawl_death_1"]["crawl"] = %h2_dying_crawl_untouched;
    level.scr_anim["crawl_death_1"]["death"][0] = %h2_dying_crawl_alt_death01;
    level.scr_anim["crawl_death_1"]["death"][1] = %h2_dying_crawl_alt_death02;
    level.scr_anim["crawl_death_1"]["death"][2] = %h2_dying_crawl_alt_death03;
    level.scr_anim["crawl_death_1"]["blood_fx_rate"] = 1;
    level.scr_sound["generic"]["afchase_pri_zodiacnine"] = "afchase_pri_zodiacnine";
    level.scr_sound["generic"]["afchase_pri_gettingaway"] = "afchase_pri_gettingaway";
    level.scr_sound["generic"]["afchase_pri_gogogo"] = "afchase_pri_gogogo";
    level.scr_sound["generic"]["afchase_pri_cantlet"] = "afchase_pri_cantlet";
    level.scr_sound["generic"]["afchase_pri_losinghim"] = "afchase_pri_losinghim";
    level.scr_sound["generic"]["afchase_pri_aroundcorner"] = "afchase_pri_aroundcorner";
    level.scr_sound["generic"]["afchase_pri_getonboat"] = "afchase_pri_getonboat";
    level.scr_sound["generic"]["afchase_pri_drivingtheboat"] = "afchase_pri_drivingtheboat";
    level.scr_sound["generic"]["afchase_pri_anotherchance"] = "afchase_pri_anotherchance";
    level.scr_sound["generic"]["afchase_pri_wrongway"] = "afchase_pri_wrongway";
    level.scr_sound["generic"]["afchase_pri_turntoobjective"] = "afchase_pri_turntoobjective";
    level.scr_sound["generic"]["afchase_pri_wheregoing"] = "afchase_pri_wheregoing";
    level.scr_sound["generic"]["afchase_pri_enemysix"] = "afchase_pri_enemysix";
    level.scr_sound["generic"]["afchase_pri_zodiacsix"] = "afchase_pri_zodiacsix";
    level.scr_sound["generic"]["afchase_pri_evasive"] = "afchase_pri_evasive";
    level.scr_sound["generic"]["afchase_pri_enginesdead"] = "afchase_pri_enginesdead";
    level.scr_sound["generic"]["afchase_pri_behindrocks"] = "afchase_pri_behindrocks";
    level.scr_sound["generic"]["afchase_pri_miniguns"] = "afchase_pri_miniguns";
    level.scr_sound["generic"]["afchase_pri_shakeemoff"] = "afchase_pri_shakeemoff";
    level.scr_sound["generic"]["afchase_pri_threadtheneedle"] = "afchase_pri_threadtheneedle";
    level.scr_sound["generic"]["afchase_pri_enemyboats"] = "afchase_pri_enemyboats";
    level.scr_sound["generic"]["afchase_pri_openareas"] = "afchase_pri_openareas";
    level.scr_sound["generic"]["afchase_pri_dodgedodge"] = "afchase_pri_dodgedodge";
    level.scr_sound["generic"]["afchase_pri_leftleft"] = "afchase_pri_leftleft";
    level.scr_sound["generic"]["afchase_pri_rightright"] = "afchase_pri_rightright";
    level.scr_sound["generic"]["afchase_pri_left"] = "afchase_pri_left";
    level.scr_sound["generic"]["afchase_pri_right"] = "afchase_pri_right";
    level.scr_sound["generic"]["afchase_pri_rpgsonbridge"] = "afchase_pri_rpgsonbridge";
    level.scr_sound["generic"]["afchase_pri_otherside"] = "afchase_pri_otherside";
    level.scr_sound["generic"]["afchase_pri_technical"] = "afchase_pri_technical";
    level.scr_sound["generic"]["dialog_helicopter_six2"] = "dialog_helicopter_six2";
    level.scr_sound["generic"]["afchase_pri_dodgeheli"] = "afchase_pri_dodgeheli";
    level.scr_sound["generic"]["afchase_pri_gunsspinup"] = "afchase_pri_gunsspinup";
    level.scr_sound["generic"]["afchase_pri_steerclear"] = "afchase_pri_steerclear";
    level.scr_sound["generic"]["afchase_pri_rapidsahead"] = "afchase_pri_rapidsahead";
    level.scr_sound["generic"]["afchase_pri_fullpower"] = "afchase_pri_fullpower";
    level.scr_sound["generic"]["afchase_pri_thrucave"] = "afchase_pri_thrucave";
    level.scr_anim["generic"]["rapids_in"] = %zodiac_rightside_rapids_trans_in;
    level.scr_anim["generic"]["rapids_loop"][0] = %zodiac_rightside_rapids_loopb;
    level.scr_sound["generic"]["rapids_in"] = "afchase_pri_rapidsahead";
    level.scr_anim["generic"]["rapids_out"] = %h2_zodiac_rightside_rapids_trans_out;
    level.scr_anim["generic"]["left_react_bump"] = %h2_zodiac_rightside_react_bump_mid_med;
    level.scr_anim["generic"]["left_react_bump_big"] = %h2_zodiac_rightside_react_bump_mid_hard_a;
    level.scr_anim["generic"]["right_react_bump"] = %h2_zodiac_leftside_react_bump_mid_med;
    level.scr_anim["generic"]["right_react_bump_big"] = %h2_zodiac_leftside_react_bump_mid_hard;
    level.scr_anim["generic"]["left_afchase_pri_gettingaway"] = %h2_afchase_pri_1_3_hes_getting_away_r;
    level.scr_anim["generic"]["left_afchase_pri_gogogo"] = %h2_afchase_pri_1_4_gogogo_r;
    level.scr_anim["generic"]["left_afchase_pri_cantlet"] = %h2_afchase_pri_2_1_cant_let_shepherd_escape_r;
    level.scr_anim["generic"]["left_afchase_pri_losinghim"] = %h2_afchase_pri_2_2_losinghim_r;
    level.scr_anim["generic"]["left_afchase_pri_drivingtheboat"] = %h2_afchase_pri_2_3_focus_on_driving_r;
    level.scr_anim["generic"]["left_afchase_pri_fullpower"] = %h2_afchase_pri_3_4_fullpower_r;
    level.scr_anim["generic"]["right_afchase_pri_gettingaway"] = %h2_afchase_pri_1_3_hes_getting_away_l;
    level.scr_anim["generic"]["right_afchase_pri_gogogo"] = %h2_afchase_pri_1_4_gogogo_l;
    level.scr_anim["generic"]["right_afchase_pri_cantlet"] = %h2_afchase_pri_2_1_cant_let_shepherd_escape_l;
    level.scr_anim["generic"]["right_afchase_pri_losinghim"] = %h2_afchase_pri_2_2_losinghim_l;
    level.scr_anim["generic"]["right_afchase_pri_drivingtheboat"] = %h2_afchase_pri_2_3_focus_on_driving_l;
    level.scr_anim["generic"]["right_afchase_pri_fullpower"] = %h2_afchase_pri_3_4_fullpower_l;
    level.scr_anim["generic"]["left_afchase_pri_thrucave"] = %h2_afchase_pri_3_1_through_that_cave_r;
    level.scr_anim["generic"]["left_afchase_pri_dodgeheli"] = %h2_afchase_pri_4_1_dodge_that_helicopter_r;
    level.scr_anim["generic"]["left_afchase_pri_evasive"] = %h2_afchase_pri_4_2_chopper_on_6_r;
    level.scr_anim["generic"]["left_afchase_pri_gunsspinup"] = %h2_afchase_pri_7_1_little_bird_r;
    level.scr_anim["generic"]["left_afchase_pri_steerclear"] = %h2_afchase_pri_7_2_stay_clear_of_chopper_r;
    level.scr_anim["generic"]["left_afchase_pri_miniguns"] = %h2_afchase_pri_8_2_shake_em_r;
    level.scr_anim["generic"]["left_afchase_pri_shakeemoff"] = %h2_afchase_pri_8_3_shake_em_off_r;
    level.scr_anim["generic"]["left_afchase_pri_openareas"] = %h2_afchase_pri_8_6_stay_clear_r;
    level.scr_anim["generic"]["left_afchase_pri_leftleft"] = %h2_afchase_pri_8_8b_left_r;
    level.scr_anim["generic"]["left_afchase_pri_rightright"] = %h2_afchase_pri_8_9_right_r;
    level.scr_anim["generic"]["left_afchase_pri_left"] = %h2_afchase_pri_8_10_short_left_r;
    level.scr_anim["generic"]["left_afchase_pri_right"] = %h2_afchase_pri_8_9_right_r;
    level.scr_anim["generic"]["left_afchase_pri_rpgsonbridge"] = %h2_afchase_pri_8_12_rpg_on_bridge_r;
    level.scr_anim["generic"]["left_TF_pri_callout_targetclock_12"] = %h2_afchase_tf_pri_co_contactclock_12_01_r;
    level.scr_anim["generic"]["right_afchase_pri_thrucave"] = %h2_afchase_pri_3_1_through_that_cave_l;
    level.scr_anim["generic"]["right_afchase_pri_dodgeheli"] = %h2_afchase_pri_4_1_dodge_that_helicopter_l;
    level.scr_anim["generic"]["right_afchase_pri_evasive"] = %h2_afchase_pri_4_2_chopper_on_6_l;
    level.scr_anim["generic"]["right_afchase_pri_gunsspinup"] = %h2_afchase_pri_7_1_little_bird_l;
    level.scr_anim["generic"]["right_afchase_pri_steerclear"] = %h2_afchase_pri_7_2_stay_clear_of_chopper_l;
    level.scr_anim["generic"]["right_afchase_pri_miniguns"] = %h2_afchase_pri_8_2_shake_em_l;
    level.scr_anim["generic"]["right_afchase_pri_shakeemoff"] = %h2_afchase_pri_8_3_shake_em_off_l;
    level.scr_anim["generic"]["right_afchase_pri_openareas"] = %h2_afchase_pri_8_6_stay_clear_l;
    level.scr_anim["generic"]["right_afchase_pri_leftleft"] = %h2_afchase_pri_8_8b_left_l;
    level.scr_anim["generic"]["right_afchase_pri_rightright"] = %h2_afchase_pri_8_9_right_l;
    level.scr_anim["generic"]["right_afchase_pri_left"] = %h2_afchase_pri_8_8b_left_l;
    level.scr_anim["generic"]["right_afchase_pri_right"] = %h2_afchase_pri_8_11_short_right_l;
    level.scr_anim["generic"]["right_afchase_pri_rpgsonbridge"] = %h2_afchase_pri_8_12_rpg_on_bridge_l;
    level.scr_anim["generic"]["right_TF_pri_callout_targetclock_12"] = %h2_afchase_tf_pri_co_contactclock_12_01_l;
    level.scr_sound["generic"]["left_afchase_pri_thrucave"] = "afchase_pri_thrucave";
    level.scr_sound["generic"]["left_afchase_pri_dodgeheli"] = "afchase_pri_dodgeheli";
    level.scr_sound["generic"]["left_afchase_pri_evasive"] = "afchase_pri_evasive";
    level.scr_sound["generic"]["left_afchase_pri_gunsspinup"] = "afchase_pri_gunsspinup";
    level.scr_sound["generic"]["left_afchase_pri_steerclear"] = "afchase_pri_steerclear";
    level.scr_sound["generic"]["left_afchase_pri_miniguns"] = "afchase_pri_miniguns";
    level.scr_sound["generic"]["left_afchase_pri_shakeemoff"] = "afchase_pri_shakeemoff";
    level.scr_sound["generic"]["left_afchase_pri_openareas"] = "afchase_pri_openareas";
    level.scr_sound["generic"]["left_afchase_pri_leftleft"] = "afchase_pri_leftleft";
    level.scr_sound["generic"]["left_afchase_pri_rightright"] = "afchase_pri_rightright";
    level.scr_sound["generic"]["left_afchase_pri_left"] = "afchase_pri_left";
    level.scr_sound["generic"]["left_afchase_pri_right"] = "afchase_pri_right";
    level.scr_sound["generic"]["left_afchase_pri_rpgsonbridge"] = "afchase_pri_rpgsonbridge";
    level.scr_sound["generic"]["left_TF_pri_callout_targetclock_12"] = "TF_pri_callout_targetclock_12";
    level.scr_sound["generic"]["right_afchase_pri_thrucave"] = "afchase_pri_thrucave";
    level.scr_sound["generic"]["right_afchase_pri_dodgeheli"] = "afchase_pri_dodgeheli";
    level.scr_sound["generic"]["right_afchase_pri_evasive"] = "afchase_pri_evasive";
    level.scr_sound["generic"]["right_afchase_pri_gunsspinup"] = "afchase_pri_gunsspinup";
    level.scr_sound["generic"]["right_afchase_pri_steerclear"] = "afchase_pri_steerclear";
    level.scr_sound["generic"]["right_afchase_pri_miniguns"] = "afchase_pri_miniguns";
    level.scr_sound["generic"]["right_afchase_pri_shakeemoff"] = "afchase_pri_shakeemoff";
    level.scr_sound["generic"]["right_afchase_pri_openareas"] = "afchase_pri_openareas";
    level.scr_sound["generic"]["right_afchase_pri_leftleft"] = "afchase_pri_leftleft";
    level.scr_sound["generic"]["right_afchase_pri_rightright"] = "afchase_pri_rightright";
    level.scr_sound["generic"]["right_afchase_pri_left"] = "afchase_pri_left";
    level.scr_sound["generic"]["right_afchase_pri_right"] = "afchase_pri_right";
    level.scr_sound["generic"]["right_afchase_pri_rpgsonbridge"] = "afchase_pri_rpgsonbridge";
    level.scr_sound["generic"]["right_TF_pri_callout_targetclock_12"] = "TF_pri_callout_targetclock_12";
    level.scr_sound["generic"]["right_afchase_pri_gettingaway"] = "afchase_pri_gettingaway";
    level.scr_sound["generic"]["right_afchase_pri_gogogo"] = "afchase_pri_gogogo";
    level.scr_sound["generic"]["right_afchase_pri_cantlet"] = "afchase_pri_cantlet";
    level.scr_sound["generic"]["right_afchase_pri_losinghim"] = "afchase_pri_losinghim";
    level.scr_sound["generic"]["right_afchase_pri_drivingtheboat"] = "afchase_pri_drivingtheboat";
    level.scr_sound["generic"]["right_afchase_pri_fullpower"] = "afchase_pri_fullpower";
    level.scr_sound["generic"]["left_afchase_pri_gettingaway"] = "afchase_pri_gettingaway";
    level.scr_sound["generic"]["left_afchase_pri_gogogo"] = "afchase_pri_gogogo";
    level.scr_sound["generic"]["left_afchase_pri_cantlet"] = "afchase_pri_cantlet";
    level.scr_sound["generic"]["left_afchase_pri_losinghim"] = "afchase_pri_losinghim";
    level.scr_sound["generic"]["left_afchase_pri_drivingtheboat"] = "afchase_pri_drivingtheboat";
    level.scr_sound["generic"]["left_afchase_pri_fullpower"] = "afchase_pri_fullpower";
    level.scr_anim["generic"]["standby"] = %walk_cqb_f;
    level.scr_sound["generic"]["TF_pri_callout_targetclock_12"] = "TF_pri_callout_targetclock_12";
    level.scr_sound["generic"]["TF_pri_callout_targetclock_1"] = "TF_pri_callout_targetclock_1";
    level.scr_sound["generic"]["TF_pri_callout_targetclock_2"] = "TF_pri_callout_targetclock_2";
    level.scr_sound["generic"]["TF_pri_callout_targetclock_3"] = "TF_pri_callout_targetclock_3";
    level.scr_sound["generic"]["TF_pri_callout_targetclock_4"] = "TF_pri_callout_targetclock_4";
    level.scr_sound["generic"]["TF_pri_callout_targetclock_5"] = "TF_pri_callout_targetclock_5";
    level.scr_sound["generic"]["TF_pri_callout_targetclock_6"] = "TF_pri_callout_targetclock_6";
    level.scr_sound["generic"]["TF_pri_callout_targetclock_7"] = "TF_pri_callout_targetclock_7";
    level.scr_sound["generic"]["TF_pri_callout_targetclock_8"] = "TF_pri_callout_targetclock_8";
    level.scr_sound["generic"]["TF_pri_callout_targetclock_9"] = "TF_pri_callout_targetclock_9";
    level.scr_sound["generic"]["TF_pri_callout_targetclock_10"] = "TF_pri_callout_targetclock_10";
    level.scr_sound["generic"]["TF_pri_callout_targetclock_11"] = "TF_pri_callout_targetclock_11";
    level.scr_sound["generic"]["TF_pri_callout_yourclock_12"] = "TF_pri_callout_yourclock_12";
    level.scr_sound["generic"]["TF_pri_callout_yourclock_1"] = "TF_pri_callout_yourclock_1";
    level.scr_sound["generic"]["TF_pri_callout_yourclock_2"] = "TF_pri_callout_yourclock_2";
    level.scr_sound["generic"]["TF_pri_callout_yourclock_3"] = "TF_pri_callout_yourclock_3";
    level.scr_sound["generic"]["TF_pri_callout_yourclock_4"] = "TF_pri_callout_yourclock_4";
    level.scr_sound["generic"]["TF_pri_callout_yourclock_5"] = "TF_pri_callout_yourclock_5";
    level.scr_sound["generic"]["TF_pri_callout_yourclock_6"] = "TF_pri_callout_yourclock_6";
    level.scr_sound["generic"]["TF_pri_callout_yourclock_7"] = "TF_pri_callout_yourclock_7";
    level.scr_sound["generic"]["TF_pri_callout_yourclock_8"] = "TF_pri_callout_yourclock_8";
    level.scr_sound["generic"]["TF_pri_callout_yourclock_9"] = "TF_pri_callout_yourclock_9";
    level.scr_sound["generic"]["TF_pri_callout_yourclock_10"] = "TF_pri_callout_yourclock_10";
    level.scr_sound["generic"]["TF_pri_callout_yourclock_11"] = "TF_pri_callout_yourclock_11";
    maps\_anim::addnotetrack_sound( "shepherd", "dialog1", "gun_fight", "afchase_shp_noshortage", undefined, "J_Jaw" );
    maps\_anim::addnotetrack_sound( "shepherd", "dialog2", "gun_fight", "afchase_shp_iknow", undefined, "J_Jaw" );
    level.scr_sound["shepherd"]["afchase_shp_waitingfor"] = "afchase_shp_waitingfor";
    level.scr_sound["shepherd"]["afchase_shp_digtwograves"] = "afchase_shp_digtwograves";
    level.scr_sound["shepherd"]["afchase_shp_goahead"] = "afchase_shp_goahead";
    level.scr_sound["shepherd"]["afchase_shp_couldntdoit"] = "afchase_shp_couldntdoit";
    level.scr_sound["shepherd"]["afchase_shp_goodwarrior"] = "afchase_shp_goodwarrior";
    level.scr_sound["shepherd"]["afchase_shp_extrastep"] = "afchase_shp_extrastep";
    level.scr_sound["shepherd"]["afchase_shp_necessary"] = "afchase_shp_necessary";
    maps\_anim::addnotetrack_customfunction( "shepherd", "fire", ::_id_B14E, "gun_fight" );
    level.scr_anim["shepherd"]["knife_moment"] = %afchase_ending_shepherd_knife_moment;
    maps\_anim::addnotetrack_sound( "shepherd", "gun_kick", "gun_kick", "scn_ending_gun_kick" );
    level.scr_anim["shepherd"]["prone_stand"] = %hunted_pronehide_2_stand_v3;
    _id_B95F();
    level.scr_anim["price"]["knife_moment"] = %afchase_ending_price_knife_moment;
    maps\_anim::addnotetrack_sound( "price", "dialog1", "endgame", "afchase_pri_soap1" );
    maps\_anim::addnotetrack_sound( "price", "dialog2", "endgame", "afchase_pri_soap2" );
    level.scr_anim["generic"]["zodiac_rapids_price"] = %h2_afchase_waterfall_price_fall;
    maps\_anim::addnotetrack_flag( "generic", "fire", "price_fire_zodiac", "zodiac_rapids_price" );
    maps\_anim::addnotetrack_flag( "generic", "shoot", "price_shoot", "zodiac_rapids_price" );
    maps\_anim::addnotetrack_flag( "generic", "start_aim", "price_add_aim", "zodiac_rapids_price" );
    maps\_anim::addnotetrack_flag_clear( "generic", "stop_aim", "price_add_aim", "zodiac_rapids_price" );
    maps\_anim::addnotetrack_flag( "generic", "dialog", "price_end_aiming_thread", "zodiac_rapids_price" );
    maps\_anim::addnotetrack_flag( "generic", "steady_2", "boat_start_rubber_band", "zodiac_rapids_price" );
    maps\_anim::addnotetrack_flag( "generic", "start_falling", "player_jumping_over_waterfall", "zodiac_rapids_price" );
    maps\_anim::addnotetrack_flag_clear( "generic", "start_falling", "boat_start_rubber_band", "zodiac_rapids_price" );
    maps\_anim::addnotetrack_sound( "generic", "steady_1", "zodiac_rapids_price", "afchase_pri_holdsteady" );
    maps\_anim::addnotetrack_sound( "generic", "steady_2", "zodiac_rapids_price", "afchase_pri_steady1" );
    maps\_anim::addnotetrack_sound( "generic", "steady_3", "zodiac_rapids_price", "afchase_pri_steady1" );
    maps\_anim::addnotetrack_sound( "generic", "dialog", "zodiac_rapids_price", "afchase_pri_backup" );
    maps\_anim::addnotetrack_customfunction( "generic", "hide_price", ::_id_A952 );
    maps\_anim::addnotetrack_sound( "price", "dialog3", "endgame", "afchase_pri_holdfornow" );
    maps\_anim::addnotetrack_sound( "price", "dialog4", "endgame", "afchase_pri_toldyou" );
    maps\_anim::addnotetrack_sound( "price", "dialog5", "endgame", "afchase_pri_soapouttahere" );
    level.scr_sound["price"]["afchase_pri_holdfornow"] = "afchase_pri_holdfornow";
    level.scr_sound["price"]["afchase_pri_toldyou"] = "afchase_pri_toldyou";
    level.scr_sound["price"]["afchase_pri_soapouttahere"] = "afchase_pri_soapouttahere";
    level.scr_sound["nikolai"]["afchase_nkl_lookingforus"] = "afchase_nkl_lookingforus";
    level.scr_sound["nikolai"]["afchase_nkl_knowaplace"] = "afchase_nkl_knowaplace";
    maps\_anim::addnotetrack_dialogue( "nikolai", "dialog", "endgame", "afchase_nkl_lookingforus" );
    maps\_anim::addnotetrack_dialogue( "nikolai", "dialog", "endgame", "afchase_nkl_knowaplace" );
    level.scr_anim["generic"]["civilian_crawl_1"] = %civilian_crawl_1;
    level.scr_anim["generic"]["civilian_crawl_2"] = %civilian_crawl_2;
    level.scr_anim["generic"]["dying_crawl"] = %dying_crawl;
    level.scr_anim["impaled"]["death"] = %afchase_impaled_guy_knife_death;
    level.scr_anim["impaled"]["aim_controller"] = %afchase_impaled_additive;
    level.scr_anim["impaled"]["aim_controller_left"] = %afchase_impaled_additive_left;
    level.scr_anim["impaled"]["aim_controller_right"] = %afchase_impaled_additive_right;
    level.scr_anim["impaled"]["idle"][0] = %h2_afchase_pilot02_idle;
    level.scr_anim["impaled"]["react"] = %h2_afchase_pilot02_reacta;
    level.scr_anim["impaled"]["react_death"] = %h2_afchase_pilot02_react_end;
    level.scr_anim["impaled"]["react_loop"][0] = %h2_afchase_pilot02_react_idle;
    level.scr_anim["impaled"]["aim_6"] = %h2_afchase_pilot02_aimr;
    level.scr_anim["impaled"]["aim_4"] = %h2_afchase_pilot02_aiml;
    level.scr_anim["impaled"]["impaled_takedown"] = %h2_af_chase_impaled_takedown_npc;
    level.scr_anim["generic"]["crawl_takedown"] = %h2_af_chase_crawl_takedown_npc;
    maps\_anim::addonstart_animsound( "generic", "crawl_takedown", "scn_ending_crawling_guy_throat_slit" );
    maps\_anim::addonstart_animsound( "impaled", "impaled_takedown", "scn_ending_impaled_guy_killed" );
    maps\_anim::addnotetrack_sound( "shepherd", "bodyfall large", "knifepull_throw_kill", "scn_afchase_shepherd_death_bodyfall" );
    maps\_anim::addnotetrack_customfunction( "shepherd", "slowmo_early", ::_id_C20B );
    maps\_anim::addnotetrack_customfunction( "shepherd", "slowmo", ::_id_C20B );
    maps\_anim::addnotetrack_customfunction( "shepherd", "settle", ::_id_B267 );
    maps\_anim::addnotetrack_customfunction( "impaled", "click", ::_id_B6FB );
    maps\_anim::addnotetrack_customfunction( "impaled", "stop_aim", ::_id_BB5B, "react_death" );
    maps\_anim::addnotetrack_customfunction( "impaled", "start_aim", ::_id_D4CA, "react" );
    maps\_anim::addnotetrack_customfunction( "impaled", "pistol_pickup", ::_id_BFB1 );
    maps\_anim::addnotetrack_customfunction( "price", "footstep_right_large", ::_id_BE08 );
    maps\_anim::addnotetrack_customfunction( "price", "footstep_left_large", ::_id_D106 );
    maps\_anim::addnotetrack_customfunction( "price", "footstep_right_small", ::_id_BF65 );
    maps\_anim::addnotetrack_customfunction( "price", "footstep_left_small", ::_id_C57F );
    maps\_anim::addnotetrack_customfunction( "nikolai", "footstep_right_large", ::_id_BE08, "endgame" );
    maps\_anim::addnotetrack_customfunction( "nikolai", "footstep_left_large", ::_id_D106, "endgame" );
    maps\_anim::addnotetrack_customfunction( "nikolai", "footstep_right_small", ::_id_BF65, "endgame" );
    maps\_anim::addnotetrack_customfunction( "nikolai", "footstep_left_small", ::_id_C57F, "endgame" );
    maps\_anim::addnotetrack_customfunction( "shepherd", "bodyfall large", ::_id_BEED );
    maps\_anim::addnotetrack_customfunction( "shepherd", "bodyfall small", ::_id_BEED );
    maps\_anim::addnotetrack_customfunction( "price", "bodyfall large", ::_id_BEED );
    maps\_anim::addnotetrack_customfunction( "price", "bodyfall small", ::_id_BEED );
    level.scr_sound["generic"]["afchase_pri_steady1"] = "afchase_pri_steady1";
    level.scr_sound["generic"]["afchase_pri_steady2"] = "afchase_pri_steady2";
    level.scr_sound["shepherd"]["afchase_shp_fiveyearsago"] = "afchase_shp_fiveyearsago";
    level.scr_sound["shepherd"]["afchase_shp_noshortage"] = "afchase_shp_noshortage";
    level.scr_sound["shepherd"]["afchase_shp_iknow"] = "afchase_shp_iknow";
    level.scr_radio["afchase_shp_sitrep"] = "afchase_shp_sitrep";
    level.scr_radio["afchase_uav_downriver"] = "afchase_uav_downriver";
    level.scr_radio["afchase_shp_comininhot"] = "afchase_shp_comininhot";
    level.scr_radio["afchase_plp_above30knots"] = "afchase_plp_above30knots";
    level.scr_sound["generic"]["afchase_shp_digtwograves"] = "afchase_shp_digtwograves";
    level.scr_sound["generic"]["afchase_shp_goahead"] = "afchase_shp_goahead";
    level.scr_sound["generic"]["afchase_shp_couldntdoit"] = "afchase_shp_couldntdoit";
    level.scr_sound["generic"]["afchase_shp_goodwarrior"] = "afchase_shp_goodwarrior";
    level.scr_sound["generic"]["afchase_shp_extrastep"] = "afchase_shp_extrastep";
    level.scr_sound["generic"]["afchase_shp_necessary"] = "afchase_shp_necessary";
    level.scr_anim["generic"]["endgame_price_intro"] = %h2_afchase_intro_price;
    level.scr_anim["generic"]["price_into_boat"] = %h2_afchase_boat_jumpin_price;
    level.scr_goaltime["generic"]["price_into_boat"] = 0;
    level.scr_anim["generic"]["price_into_boat_idle"] = %h2_afchase_boat_wave_price;
    maps\_anim::addnotetrack_dialogue( "generic", "dialog1", "endgame_price_intro", "afchase_pri_aroundcorner" );
    maps\_anim::addnotetrack_dialogue( "generic", "dialog2", "endgame_price_intro", "afchase_pri_getonboat" );
    level.scr_anim["shepherd"]["turn_buckle_idle"][0] = %h2_afchase_shepherd_turnbuckle_idle;
    level.scr_anim["shepherd"]["turn_buckle_idleb"][0] = %h2_afchase_shepherd_turnbuckle_idleb;
    level.scr_anim["shepherd"]["turn_buckle"] = %h2_afchase_shepherd_turnbuckle;
    level.scr_anim["shepherd"]["turn_buckle_alt"] = %h2_afchase_shepherd_turnbuckle_alt;
    level.scr_anim["shepherd"]["gun_monologue"] = %h2_afchase_shepherd_gun_monologue;
    level.scr_anim["shepherd"]["gun_fight"] = %h2_afchase_shepherd_gun_fight;
    level.scr_anim["shepherd"]["gun_drop"] = %h2_afchase_shepherd_gun_drop;
    level.scr_anim["shepherd"]["price_wakeup"] = %h2_afchase_shepherd_wakeup;
    level.scr_anim["shepherd"]["gun_kick"] = %h2_afchase_shepherd_gun_kick;
    level.scr_anim["shepherd"]["fight"] = %h2_afchase_fightc_shepherd;
    level.scr_anim["shepherd"]["fight_C2"] = %h2_afchase_fightc_shepherd;
    level.scr_anim["shepherd"]["fight_B2"] = %h2_afchase_fightb_shepherd_short;
    level.scr_anim["shepherd"]["fight_D3_swapped"] = %h2_afchase_fightd3_shepherd;
    level.scr_anim["shepherd"]["fight_E"] = %h2_afchase_fighte_shepherd;
    level.scr_anim["shepherd"]["wakeup"] = %h2_afchase_shepherd_wakeup;
    level.scr_anim["shepherd"]["fight_E_loop"][0] = %h2_afchase_fighte_shepherd_punchloop_b;
    level.scr_anim["shepherd"]["fight_E_loop"][1] = %h2_afchase_fighte_shepherd_punchloop_c;
    level.scr_anim["shepherd"]["fight_B"] = %h2_afchase_fightb_shepherd;
    level.scr_anim["shepherd"]["fight_C"] = %h2_afchase_fightc_shepherd;
    level.scr_anim["shepherd"]["flee"] = %h2_afchase_shepherd_flee;
    level.scr_anim["shepherd"]["run"] = %h2_afchase_shepherd_flee_loop;
    level.scr_anim["shepherd"]["knifepull_throw_kill"] = %h2_afchase_shepherd_dies;
    level.scr_anim["shepherd"]["endgame"] = %h2_afchase_shepherd_endgame;
    level.scr_goaltime["shepherd"]["endgame"] = 1;
    level.scr_anim["shepherd"]["crawl"] = %h2_afchase_shepherd_crawl;
    level.scr_goaltime["shepherd"]["gun_kick"] = 0;
    level.scr_anim["shepherd"]["nearcar_monologue_1"] = %h2_afchase_shepherd_nearcar_monologue1;
    level.scr_anim["shepherd"]["nearcar_monologue_2"] = %h2_afchase_shepherd_nearcar_monologue2;
    level.scr_anim["shepherd"]["nearcar_monologue_3"] = %h2_afchase_shepherd_nearcar_monologue3;
    level.scr_anim["shepherd"]["nearcar_monologue_4"] = %h2_afchase_shepherd_nearcar_monologue4;
    level.scr_anim["shepherd"]["nearcar_monologue_5"] = %h2_afchase_shepherd_nearcar_monologue5;
    level.scr_anim["shepherd"]["nearcar_monologue_6"] = %h2_afchase_shepherd_nearcar_monologue6;
    maps\_anim::addnotetrack_dialogue( "shepherd", "dialog1", "nearcar_monologue_1", "afchase_shp_digtwograves" );
    maps\_anim::addnotetrack_dialogue( "shepherd", "dialog2", "nearcar_monologue_2", "afchase_shp_goahead" );
    maps\_anim::addnotetrack_dialogue( "shepherd", "dialog3", "nearcar_monologue_3", "afchase_shp_couldntdoit" );
    maps\_anim::addnotetrack_dialogue( "shepherd", "dialog4", "nearcar_monologue_4", "afchase_shp_goodwarrior" );
    maps\_anim::addnotetrack_dialogue( "shepherd", "dialog5", "nearcar_monologue_5", "afchase_shp_extrastep" );
    maps\_anim::addnotetrack_dialogue( "shepherd", "dialog6", "nearcar_monologue_6", "afchase_shp_necessary" );
    level.scr_anim["price"]["fight_B"] = %h2_afchase_fightb_price;
    level.scr_anim["price"]["fight_B2"] = %h2_afchase_fightb_price_short;
    level.scr_anim["price"]["fight_C"] = %h2_afchase_fightc_price;
    level.scr_anim["price"]["fight_D3_swapped"] = %h2_afchase_fightd3_price;
    level.scr_anim["price"]["fight_E_loop"][0] = %h2_afchase_fighte_price_punchloop_b;
    level.scr_anim["price"]["fight_E_loop"][1] = %h2_afchase_fighte_price_punchloop_c;
    level.scr_anim["price"]["gun_drop"] = %h2_afchase_price_gun_drop;
    level.scr_anim["price"]["gun_fight"] = %h2_afchase_price_gun_fight;
    level.scr_anim["price"]["gun_kick_price"] = %h2_afchase_price_gun_kick;
    level.scr_anim["price"]["gun_kick_price_loop"][0] = %h2_afchase_price_gun_kick_loop;
    level.scr_anim["price"]["price_wakeup"] = %h2_afchase_price_wakeup;
    level.scr_anim["price"]["fight"] = %h2_afchase_fightc_price;
    level.scr_anim["price"]["fight_C2"] = %h2_afchase_fightc_price;
    level.scr_anim["price"]["fight_D3"] = %h2_afchase_fightd3_price;
    level.scr_anim["price"]["fight_E"] = %h2_afchase_fighte_price;
    level.scr_anim["price"]["walk_off"] = %h2_afchase_price_walkoff;
    level.scr_anim["price"]["fight_D2"] = %afchase_fightd2_price;
    level.scr_anim["price"]["knifepull_throw_kill"] = %h2_afchase_price_shepherd_dies;
    level.scr_anim["price"]["endgame"] = %h2_afchase_price_endgame;
    level.scr_goaltime["price"]["endgame"] = 1;
    level.scr_anim["price"]["crawl"] = %h2_afchase_price_crawl;
    level.scr_goaltime["price"]["gun_kick_price"] = 0;
    level.scr_anim["nikolai"]["walk_off"] = %h2_afchase_nicholai_walkoff;
    level.scr_anim["nikolai"]["endgame"] = %h2_afchase_nicholai_endgame;
    maps\_anim::addnotetrack_customfunction( "price", "h2_price_hat_detach", maps\af_chase_knife_fight_code::h2_price_hat_detach );
    maps\_anim::addnotetrack_customfunction( "price", "h2_price_hat_reattach", maps\af_chase_knife_fight_code::h2_price_hat_reattach );
}

_id_C7A7( var_0 )
{
    if ( isdefined( level._id_B416.cheat._id_C86E ) && level._id_B416.cheat._id_C86E )
        level._id_B416 _id_C0C3::_id_CB5C( 1 );

    var_1 = "jnt_eyeball_L";
    var_2 = common_scripts\utility::spawn_tag_origin();
    var_2 linkto( level._id_B416, var_1, ( 1.5, 0.0, 0.0 ), ( 0.0, 180.0, 0.0 ) );
    var_3 = 2;

    for ( var_4 = 0; var_4 < var_3; var_4++ )
    {
        playfxontag( common_scripts\utility::getfx( "blood_sheperd_eye" ), var_2, "tag_origin" );
        wait(randomfloatrange( 0.1, 0.15 ));
    }
}

_id_C20B( var_0 )
{

}

_id_B267( var_0 )
{
    maps\_utility::slowmo_start();
    maps\_utility::slowmo_setspeed_slow( 0.33 );
    maps\_utility::slowmo_setlerptime_in( 0 );
    maps\_utility::slowmo_lerp_in();
    wait 2;
    maps\_utility::slowmo_setlerptime_out( 1 );
    maps\_utility::slowmo_lerp_out();
    maps\_utility::slowmo_end();
}

_id_A952( var_0 )
{
    level.price hide();
}

_id_CF6D( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 14;

    maps\af_chase_knife_fight_code::_id_C914( var_0 );
    level._id_C381 moveto( ( 65.0, 0.0, 0.0 ), var_0, var_0 * 0.5, var_0 * 0.5 );
}

_id_BFB1( var_0 )
{
    if ( isdefined( level._id_D0D2 ) )
        level._id_D0D2 delete();

    var_1 = var_0 gettagorigin( "tag_weapon_right" );
    var_2 = var_0 gettagangles( "tag_weapon_right" );
}

_id_D4CA( var_0 )
{
    var_0 thread h2_impaled_aims_at_player();
    var_0 thread maps\af_chase_knife_fight_code::impaled_takedown_additive_reset();
}

h2_impaled_aims_at_player()
{
    self endon( "death" );
    self endon( "stop_aim" );
    var_0 = maps\_utility::getanim( "aim_controller_left" );
    var_1 = maps\_utility::getanim( "aim_controller_right" );
    var_2 = maps\_utility::getanim( "aim_6" );
    var_3 = maps\_utility::getanim( "aim_4" );
    var_4 = -27;
    var_5 = -13;
    var_6 = 58;
    self setanimlimited( var_2, 1, 0, 1 );
    self setanimlimited( var_3, 1, 0, 1 );
    var_7 = anglestoforward( self.angles );
    var_7 = vectornormalize( var_7 * ( 1.0, 1.0, 0.0 ) );
    var_8 = anglestoright( self.angles );
    var_8 = vectornormalize( var_8 * ( 1.0, 1.0, 0.0 ) );

    for (;;)
    {
        var_9 = level.player.origin - self.origin;
        var_9 = vectornormalize( var_9 * ( 1.0, 1.0, 0.0 ) );
        var_10 = vectordot( var_7, var_9 );
        var_11 = vectordot( var_8, var_9 );

        if ( var_10 >= 1 )
            var_12 = 0;
        else
        {
            var_12 = acos( var_10 );
            var_12 = abs( var_12 ) * common_scripts\utility::sign( var_11 );
        }

        var_13 = 0;

        if ( var_12 > var_5 )
        {
            if ( var_12 > var_6 )
                var_12 = var_6;

            var_13 = ( var_12 - var_5 ) / ( var_6 - var_5 );
            self setanimlimited( var_1, var_13, 0.1, 1 );
            self setanimlimited( var_0, 0, 0.1, 1 );
        }
        else
        {
            if ( var_12 < var_4 )
                var_12 = var_4;

            var_13 = ( var_5 - var_12 ) / ( var_5 - var_4 );
            self setanimlimited( var_0, var_13, 0.1, 1 );
            self setanimlimited( var_1, 0, 0.1, 1 );
        }

        wait 0.05;
    }
}

_id_B62E()
{
    self endon( "death" );
    self endon( "stop_aim" );
    var_0 = maps\_utility::getanim( "aim_controller" );
    var_1 = maps\_utility::getanim( "aim_6" );
    var_2 = maps\_utility::getanim( "aim_4" );
    var_3 = 45;
    self setanim( var_0, 1, 0.2, 1 );

    for (;;)
    {
        var_4 = anglestoright( self.angles );
        var_5 = vectornormalize( level.player.origin - self.origin );
        var_6 = anglestoforward( self.angles );
        var_4 = anglestoright( self.angles );
        var_7 = vectordot( var_6, var_5 );
        var_8 = vectordot( var_4, var_5 );
        var_9 = acos( var_7 );
        var_9 = abs( var_9 );
        var_10 = 0;

        if ( var_8 > 0 )
        {
            if ( var_9 > var_3 )
                var_9 = var_3;

            var_10 = var_9 / var_3;
            self setanim( var_1, var_10, 0.2, 1 );
            self setanim( var_2, 1 - var_10, 0.2, 1 );
        }
        else
        {
            var_9 += 10;

            if ( var_9 > var_3 )
                var_9 = var_3;

            var_10 = var_9 / var_3;
            self setanim( var_2, var_10, 0.2, 1 );
            self setanim( var_1, 1 - var_10, 0.2, 1 );
        }

        wait 0.05;
    }
}

_id_C722()
{
    self endon( "death" );
    self endon( "stop_aim" );
    var_0 = maps\_utility::getanim( "aim_controller" );
    var_1 = maps\_utility::getanim( "aim_4" );
    var_2 = maps\_utility::getanim( "aim_6" );
    var_3 = 45;
    self setanim( var_0, 1, 0.2, 1 );

    for (;;)
    {
        var_4 = anglestoright( self.angles );
        var_5 = vectornormalize( level.player.origin - self.origin );
        var_6 = anglestoforward( self.angles );
        var_4 = anglestoright( self.angles );
        var_7 = vectordot( var_6, var_5 );
        var_8 = vectordot( var_4, var_5 );
        var_9 = acos( var_7 );
        var_9 = abs( var_9 );
        var_10 = 0;

        if ( var_8 > 0 )
        {
            if ( var_9 > var_3 )
                var_9 = var_3;

            var_10 = var_9 / var_3;
            self setanim( var_1, var_10, 0.2, 1 );
            self setanim( var_2, 1 - var_10, 0.2, 1 );
        }
        else
        {
            var_9 += 10;

            if ( var_9 > var_3 )
                var_9 = var_3;

            var_10 = var_9 / var_3;
            self setanim( var_2, var_10, 0.2, 1 );
            self setanim( var_1, 1 - var_10, 0.2, 1 );
        }

        wait 0.05;
    }
}

_id_BB5B( var_0 )
{
    var_0 notify( "stop_aim" );
}

_id_B6FB( var_0 )
{
    var_0._id_AC61++;

    if ( var_0._id_AC61 >= 6 )
    {
        if ( randomint( 100 ) > 50 )
            return;
    }

    var_1 = var_0 gettagorigin( "tag_inhand" );
    common_scripts\utility::play_sound_in_space( "scn_afchase_dryfire_pistol_npc", var_1 );
}
#using_animtree("player");

player_animations()
{
    level.scr_animtree["player_rig"] = #animtree;
    level.scr_model["player_rig"] = "h2_gfl_m4_sopmod_ii_viewbody";
    level.scr_anim["player_rig"]["knife_moment"] = %player_afchase_ending_knife_moment;
    level.scr_anim["player_rig"]["wakeup"] = %h2_afchase_player_getup;
    level.scr_anim["player_rig"]["prethrow"] = %h2_afchase_player_knife_throw_soon;
    level.scr_anim["player_rig"]["gun_monologue"] = %h2_afchase_player_gun_monologue;
    level.scr_anim["player_rig"]["gun_fight"] = %h2_afchase_player_gun_fight;
    level.scr_anim["player_rig"]["endgame"] = %h2_afchase_player_endgame;
    level.scr_goaltime["player_rig"]["endgame"] = 0.1;
    maps\_anim::addnotetrack_customfunction( "player_rig", "dof", maps\af_chase_knife_fight_code::_id_AC22, "gun_fight" );
    level.scr_anim["player_rig"]["gun_drop_player"] = %h2_afchase_player_gun_drop;
    level.scr_anim["player_rig"]["gun_kick"] = %h2_afchase_player_gun_kick;
    level.scr_goaltime["player_rig"]["gun_kick"] = 0;
    maps\_anim::addnotetrack_customfunction( "player_rig", "rumble", maps\af_chase_knife_fight_code::_id_AF02, "gun_kick" );
    maps\_anim::addnotetrack_customfunction( "player_rig", "vision_effect", ::_id_B7D4, "gun_kick" );
    level.scr_anim["player_rig"]["turn_buckle_alt"] = %h2_afchase_player_turnbuckle_alt;
    maps\_anim::addnotetrack_detach( "player_rig", "vision_effect", "weapon_commando_knife", "TAG_WEAPON_LEFT", "turn_buckle_alt" );
    maps\_anim::addnotetrack_customfunction( "player_rig", "rumble", ::_id_C290, "turn_buckle_alt" );
    maps\_anim::addnotetrack_customfunction( "player_rig", "vision_effect", ::_id_C7F0, "turn_buckle_alt" );
    maps\_anim::addnotetrack_customfunction( "player_rig", "fadeout", ::fade_out, "turn_buckle_alt" );
    level.scr_anim["player_rig"]["turn_buckle"] = %h2_afchase_player_turnbuckle;
    maps\_anim::addnotetrack_detach( "player_rig", "vision_effect", "weapon_commando_knife", "TAG_WEAPON_LEFT", "turn_buckle" );
    maps\_anim::addnotetrack_customfunction( "player_rig", "rumble", ::_id_C290, "turn_buckle" );
    maps\_anim::addnotetrack_customfunction( "player_rig", "vision_effect", ::_id_C7F0, "turn_buckle" );
    maps\_anim::addnotetrack_customfunction( "player_rig", "fadeout", ::fade_out, "turn_buckle" );
    level.scr_anim["player_rig"]["walk_off"] = %h2_afchase_player_walkoff;
    level.scr_anim["player_rig"]["gun_crawl_00"] = %h2_afchase_player_gun_crawl_00;
    level.scr_anim["player_rig"]["gun_crawl_01"] = %h2_afchase_player_gun_crawl_01;
    level.scr_anim["player_rig"]["gun_crawl_02"] = %h2_afchase_player_gun_crawl_02;
    level.scr_anim["player_rig"]["gun_crawl_03"] = %h2_afchase_player_gun_crawl_03;
    level.scr_anim["player_rig"]["gun_crawl_04"] = %h2_afchase_player_gun_crawl_04;
    level.scr_anim["player_rig"]["gun_crawl_05"] = %h2_afchase_player_gun_crawl_05;
    level.scr_anim["player_rig"]["gun_crawl_06"] = %h2_afchase_player_gun_crawl_06;
    level.scr_anim["player_rig"]["gun_crawl_00_idle"][0] = %h2_afchase_player_gun_crawl_idle_00;
    level.scr_anim["player_rig"]["gun_crawl_01_idle"][0] = %h2_afchase_player_gun_crawl_idle_01;
    level.scr_anim["player_rig"]["gun_crawl_02_idle"][0] = %h2_afchase_player_gun_crawl_idle_02;
    level.scr_anim["player_rig"]["gun_crawl_03_idle"][0] = %h2_afchase_player_gun_crawl_idle_03;
    level.scr_anim["player_rig"]["gun_crawl_04_idle"][0] = %h2_afchase_player_gun_crawl_idle_04;
    level.scr_anim["player_rig"]["gun_crawl_05_idle"][0] = %h2_afchase_player_gun_crawl_idle_05;
    level.scr_anim["player_rig"]["gun_crawl_06_idle"][0] = %h2_afchase_player_gun_crawl_idle_06;
    level.scr_anim["player_rig"]["knifepull_grab_01"] = %h2_afchase_player_knife_grab_01;
    level.scr_anim["player_rig"]["knifepull_grab_02"] = %h2_afchase_player_knife_grab_02;
    level.scr_anim["player_rig"]["knifepull_grab_idle"][0] = %h2_afchase_player_knife_grab_idle;
    level.scr_anim["player_rig"]["knifepull_passout"] = %h2_afchase_player_knife_passout;
    level.scr_anim["player_rig"]["knifepull_pull_01"] = %h2_afchase_player_knife_pull_01;
    level.scr_anim["player_rig"]["knifepull_pull_02"] = %h2_afchase_player_knife_pull_02;
    level.scr_anim["player_rig"]["knifepull_pull_03"] = %h2_afchase_player_knife_pull_03;
    level.scr_anim["player_rig"]["knifepull_pullout_flip"] = %h2_afchase_player_knife_pullout_2_flip;
    maps\_anim::addnotetrack_customfunction( "player_rig", "blood", ::_id_C232, "knifepull_pullout_flip" );
    maps\_anim::addnotetrack_customfunction( "player_rig", "right_hand", ::_id_CE2F );
    maps\_anim::addnotetrack_customfunction( "player_rig", "left_hand", ::_id_B8A0 );
    level.scr_goaltime["player_rig"]["knifepull_pullout_flip_idle"] = 1.0;
    level.scr_anim["player_rig"]["knifepull_pullout_flip_idle"][0] = %h2_afchase_player_knife_pullout_2_flip_idle;
    level.scr_anim["player_rig"]["knifepull_throw"] = %h2_afchase_player_knife_throw;
    level.scr_anim["player_rig"]["knifepull_throw_kill"] = %h2_afchase_player_knife_throw_kill;
    level.scr_anim["player_rig"]["knifepull_throw_passout"] = %h2_afchase_player_throw_passout;
    level.scr_anim["player_rig"]["price_wakeup"] = %h2_afchase_player_end_wakeup;
    level.scr_anim["player_rig"]["pull_additive_root"] = %h2_player_pull_additive;
    level.scr_anim["player_rig"]["pull_additive_02"] = %h2_afchase_player_knife_pull_02_add;
    level.scr_anim["player_rig"]["pull_additive_03"] = %h2_afchase_player_knife_pull_03_add;
    level.scr_animtree["dizzy_stumble"] = #animtree;
    level.scr_model["dizzy_stumble"] = "h2_gfl_m4_sopmod_ii_viewhands";
    level.scr_anim["dizzy_stumble"]["dizzy_stumble_1"] = %h2_wpn_melee_knife_dizzy_stumble_l;
    level.scr_anim["dizzy_stumble"]["dizzy_stumble_2"] = %h2_wpn_melee_knife_dizzy_stumble_r;
    level.scr_anim["dizzy_stumble"]["dizzy_stumble_3"] = %h2_wpn_melee_knife_dizzy_idlebreaker;
    level.scr_viewanim = [];
    level.scr_viewanim["dizzy_stumble_1"] = "h2_wpn_melee_knife_dizzy_stumble_l";
    level.scr_viewanim["dizzy_stumble_2"] = "h2_wpn_melee_knife_dizzy_stumble_r";
    level.scr_viewanim["dizzy_stumble_3"] = "h2_wpn_melee_knife_dizzy_idlebreaker";
}

_id_C232( var_0 )
{
    _id_C953( 3 );
}

_id_C953( var_0 )
{
    level.player playrumblelooponentity( "damage_heavy" );
    thread maps\ending_aud::_id_CABB();
    level.player shellshock( "af_chase_ending_kill", 60 );
}

_id_C7F0( var_0 )
{
    level.player playrumblelooponentity( "damage_light" );
    var_1 = maps\af_chase_knife_fight_code::get_white_overlay();
    var_1.alpha = 1;
    var_1 fadeovertime( 1.0 );
    var_1.alpha = 0.0;
    level.player stopshellshock();
    setblur( 0, 2 );
    maps\_utility::set_vision_set( "ending_fight", 1 );
    maps\_utility::fog_set_changes( "ending_fight", 1 );
    level.player maps\_utility::_id_BF21( "ending_fight" );
    level.player playrumblelooponentity( "damage_heavy" );
    setomnvar( "ui_consciousness_init", 1 );
    setomnvar( "ui_consciousness_play", 2 );
}

_id_B7D4( var_0 )
{
    level.player playrumblelooponentity( "damage_heavy" );
    level.player dodamage( 50 / level.player.damagemultiplier, level.player.origin );
    level.player thread maps\_utility::play_sound_on_entity( "face_stomp" );
    maps\af_chase_knife_fight_code::_id_CE3C( "af_chase_turn_buckle_slam" );
    level.player playrumblelooponentity( "damage_heavy" );
    wait 0.05;
    level.player setnormalhealth( 1 );
}
#using_animtree("script_model");

_id_C892()
{
    level.scr_animtree["gun_model"] = #animtree;
    level.scr_model["gun_model"] = "weapon_colt_anaconda_animated";
    level.scr_anim["gun_model"]["gun_drop"] = %h2_afchase_revolver_gun_drop;
    level.scr_anim["gun_model"]["gun_kick_gun"] = %h2_afchase_revolver_gun_kick;
    level.scr_anim["gun_model"]["gun_monologue"] = %h2_afchase_revolver_gun_monologue;
    level.scr_anim["gun_model"]["gun_fight"] = %h2_afchase_revolver_gun_fight;
    maps\_anim::addnotetrack_customfunction( "gun_model", "bullets", ::_id_C772, "gun_fight" );
    level.scr_model["knife"] = "weapon_commando_knife";
    level.scr_animtree["knife"] = #animtree;
    level.scr_animtree["window"] = #animtree;
    level.scr_anim["window"]["idle1"][0] = %h2_afch_window_panels_01_slowswing;
    level.scr_anim["window"]["idle2"][0] = %h2_afch_window_panels_02_slowswing;
    level.scr_animtree["fence"] = #animtree;
    level.scr_anim["fence"]["idle1"][0] = %h2_afch_fence_01_swing;
    level.scr_animtree["crane"] = #animtree;
    level.scr_anim["crane"]["idle1"][0] = %h2_machinery_crane01_slowswing;
    level.scr_animtree["chain"] = #animtree;
    level.scr_anim["chain"]["idle1"][0] = %h2_afch_cave_chain_swing;
    level.scr_animtree["light"] = #animtree;
    level.scr_anim["light"]["idle1"][0] = %h2_af_chase_light_river_idle;
    level.scr_anim["knife"]["turn_buckle"] = %h2_afchase_knife_turnbuckle;
    maps\_anim::addnotetrack_customfunction( "knife", "blood", ::_id_CFD3, "turn_buckle" );
    level.scr_anim["knife"]["turn_buckle_alt"] = %h2_afchase_knife_turnbuckle_alt;
    maps\_anim::addnotetrack_customfunction( "knife", "blood", ::_id_CFD3, "turn_buckle_alt" );
    level.scr_anim["knife"]["gun_drop"] = %h2_afchase_knife_gun_drop;
    level.scr_anim["knife"]["gun_monologue"] = %h2_afchase_knife_gun_monologue;
    level.scr_anim["knife"]["gun_fight"] = %h2_afchase_knife_gun_fight;
    level.scr_anim["knife"]["knifepull_grab_01"] = %h2_afchase_knife_grab_01;
    level.scr_anim["knife"]["knifepull_grab_02"] = %h2_afchase_knife_grab_02;
    level.scr_anim["knife"]["knifepull_grab_idle"][0] = %h2_afchase_knife_grab_idle;
    level.scr_anim["knife"]["knifepull_passout"] = %h2_afchase_knife_passout;
    level.scr_anim["knife"]["knifepull_pull_01"] = %h2_afchase_knife_pull_01;
    level.scr_anim["knife"]["knifepull_pull_02"] = %h2_afchase_knife_pull_02;
    level.scr_anim["knife"]["knifepull_pull_03"] = %h2_afchase_knife_pull_03;
    level.scr_anim["knife"]["knifepull_pullout_flip"] = %h2_afchase_knife_pullout_2_flip;
    level.scr_anim["knife"]["knifepull_pullout_flip_idle"][0] = %h2_afchase_knife_pullout_2_flip_idle;
    level.scr_anim["knife"]["knifepull_throw"] = %h2_afchase_knife_throw;
    level.scr_anim["knife"]["prethrow"] = %h2_afchase_knife_throw_soon;
    level.scr_anim["knife"]["knifepull_throw_kill"] = %h2_afchase_knife_throw_kill;
    level.scr_anim["knife"]["knifepull_throw_passout"] = %h2_afchase_knife_throw_passout;
    level.scr_anim["knife"]["endgame"] = %h2_afchase_knife_endgame;
    level.scr_goaltime["knife"]["endgame"] = 0.1;
    level.scr_goaltime["knife"]["knifepull_pullout_flip_idle"] = 1.0;
    maps\_anim::addnotetrack_customfunction( "knife", "blood", ::_id_CFD3, "turn_buckle" );
    maps\_anim::addnotetrack_customfunction( "shepherd", "knife_in_eye", ::_id_C7A7, "endgame" );
    maps\_anim::addnotetrack_customfunction( "knife", "knife_out", ::_id_CFD3, "knifepull_pullout_flip" );
    level.scr_anim["rotation"]["z_down"] = %rotate_z_l;
}

_id_C290( var_0 )
{
    level.player playrumblelooponentity( "damage_heavy" );
}

fade_out( var_0 )
{
    common_scripts\utility::flag_set( "turn_buckle_fadeout" );
}
#using_animtree("vehicles");

_id_BA3A()
{
    level.scr_anim["littlebird"]["endgame"] = %h2_afchase_chopper_landing;
    level.scr_anim["zodiac_player"]["zodiac_waterfall_right"] = %afchase_waterfall_zodiac_r;
    level.scr_anim["zodiac_player"]["zodiac_waterfall_left"] = %afchase_waterfall_zodiac_l;
    level.scr_anim["zodiac_player"]["waterfall_over"] = %h2_afchase_waterfall_zodiac_fall;
    level.scr_goaltime["zodiac_player"]["waterfall_over"] = 0;
    maps\_anim::addnotetrack_customfunction( "zodiac_player", "zodiac_hide", ::afch_hide_customfunction );
    level.scr_anim["zodiac_player"]["zodiac_waterfall_add_left"] = %zodiac_waterfall_add_left;
    level.scr_anim["zodiac_player"]["zodiac_waterfall_left"] = %afchase_waterfall_player_zodiac_add_l;
    level.scr_anim["zodiac_player"]["zodiac_waterfall_add_right"] = %zodiac_waterfall_add_right;
    level.scr_anim["zodiac_player"]["zodiac_waterfall_right"] = %afchase_waterfall_player_zodiac_add_r;
    level.scr_anim["zodiac_player"]["sniper_waterfall"] = %afchase_waterfall_player_zodiac;
    level.scr_anim["pavelow"]["sniper_waterfall"] = %afchase_waterfall_pavelow;
    level.scr_anim["pavelow"]["sniper_waterfall_idle"][0] = %afchase_waterfall_pavelow_idle;
    level.scr_anim["zodiac_player"]["player_view_fall"] = %player_zodiac_view_fall;
    level.scr_anim["zodiac_player"]["player_view_fall_anim"] = %h2_afchase_waterfall_player_view_fall;
}

afch_hide_customfunction( var_0 )
{
    var_0 hide();
}

_id_C31C( var_0 )
{
    level notify( "bullets" );
}

_id_CFD3( var_0 )
{
    maps\af_chase_knife_fight_code::_id_C1D9();
    playfxontag( common_scripts\utility::getfx( "player_stabbed" ), var_0, "TAG_FX" );
}

_id_C772( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "revolver_bullets" ), var_0, "J_Cylinder_Spin" );
}

_id_BE08( var_0 )
{
    common_scripts\utility::_id_C203( common_scripts\utility::getfx( "footstep_dust_sandstorm_runner" ), var_0, "J_Ball_RI", ( 0.0, 0.0, 0.0 ), ( 0.0, -90.0, 90.0 ) );
}

_id_D106( var_0 )
{
    common_scripts\utility::_id_C203( common_scripts\utility::getfx( "footstep_dust_sandstorm_runner" ), var_0, "J_Ball_LE", ( 0.0, 0.0, 0.0 ), ( 0.0, -90.0, 90.0 ) );
}

_id_BF65( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "footstep_dust_sandstorm_small_runner" ), var_0, "J_Ball_RI" );
}

_id_C57F( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "footstep_dust_sandstorm_small_runner" ), var_0, "J_Ball_LE" );
}

_id_CE2F( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "crawl_dust_sandstorm_runner" ), var_0, "J_Mid_RI_2" );
}

_id_B8A0( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "crawl_dust_sandstorm_runner" ), var_0, "J_Mid_LE_2" );
}

_id_BEED( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "bodyfall_dust_sandstorm_large_runner" ), var_0, "J_SpineUpper" );
}

_id_B14E( var_0 )
{
    maps\af_chase_knife_fight_code::_id_AC39();
    var_1 = 0.5;
    level._id_C381 moveto( ( 40.0, 0.0, 0.0 ), var_1, 0, var_1 );
}

_id_B95F()
{
    level.scr_animsound["price"]["0fight_E_loop"] = "scn_afchase_e_loop_price_foley";
    level.scr_animsound["shepherd"]["0fight_E_loop"] = "scn_afchase_e_loop_shep_foley";
}

_id_B212()
{
    level.scr_animsound["price"]["0fight_E_loop"] = undefined;
    level.scr_animsound["shepherd"]["0fight_E_loop"] = undefined;
}

_id_B7C7( var_0 )
{
    if ( isdefined( level.player._id_C5BB ) )
        return;

    level.player takeweapon( "ending_knife" );
    level.player giveweapon( "ending_knife_bloody" );
    level.player switchtoweapon( "ending_knife_bloody" );
    level.player._id_C5BB = 1;
}
#using_animtree("animals");

chicken_anims()
{
    level.scr_animtree["chicken"] = #animtree;
    level.scr_anim["chicken"]["chicken_cage_freakout"][0] = %chicken_cage_freakout;
    level.scr_anim["chicken"]["chicken_cage_pecking_idle"][0] = %chicken_cage_pecking_idle;
    level.scr_anim["chicken"]["chicken_cage_seated_idle"][0] = %chicken_cage_seated_idle;
    level.scr_anim["chicken"]["chicken_cage_loop_01"] = %chicken_cage_loop_01;
    level.scr_anim["chicken"]["chicken_cage_loop_02"] = %chicken_cage_loop_02;
    level.scr_anim["chicken"]["chicken_cage_death"] = %chicken_cage_death;
    level.scr_anim["chicken"]["chicken_cage_death_02"] = %chicken_cage_death_02;
}
#using_animtree("script_model");

model_anims()
{
    level.scr_anim["pit_gun"]["training_pit_sitting_welcome_gun"] = %training_pit_sitting_welcome_gun;
    level.scr_anim["pit_gun"]["training_pit_sitting_idle_gun"] = %training_pit_sitting_idle_gun;
    level.scr_anim["pit_gun"]["training_pit_stand_idle_gun"] = %training_pit_stand_idle_gun;
    level.scr_anim["pit_gun"]["training_pit_open_case_gun"] = %training_pit_open_case_gun;
    level.scr_animtree["pit_gun"] = #animtree;
    level.scr_animtree["bell"] = #animtree;
    level.scr_anim["bell"]["pressing_button_infront"] = %h2_ending_player_press_bell_front_prop;
    level.scr_anim["bell"]["pressing_button_behind"] = %h2_ending_player_press_bell_behind_prop;
    level.scr_anim["bell"]["pressing_button_else"] = %h2_ending_player_press_bell_no_player;
    maps\_anim::addnotetrack_animsound( "bell", "pressing_button_infront", "ring", "detpack_trigger" );
    maps\_anim::addnotetrack_animsound( "bell", "pressing_button_behind", "ring", "detpack_trigger" );
    maps\_anim::addnotetrack_animsound( "bell", "pressing_button_else", "ring", "detpack_trigger" );
    level.scr_animtree["lantern"] = #animtree;
    level.scr_model["lantern"] = "h2_dcb_lamp_ceiling_animate";
    level.scr_anim["lantern"]["idle"][0] = %h2_dcb_lamp_ceiling_idle;
}
