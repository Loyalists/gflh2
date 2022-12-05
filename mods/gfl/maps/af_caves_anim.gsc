// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    anims();
    dialog();
    dog();
    script_models();
    player_animations();
    _id_C987();
    _id_BA3A();
}
#using_animtree("generic_human");

anims()
{
    level.scr_anim["price"]["launchfacility_a_c4_plant_short"] = %launchfacility_a_c4_plant_short;
    level.scr_anim["price"]["favela_run_and_wave"] = %favela_run_and_wave;
    level.scr_anim["price"]["laptop_stand_idle_start"] = %h2_afgan_caves_price_typing_in;
    level.scr_anim["price"]["laptop_stand_idle"][0] = %h2_afgan_caves_price_typing_idle;
    level.scr_anim["price"]["laptop_stand_yell"] = %h2_afgan_caves_price_typing_out;
    maps\_anim::addnotetrack_dialogue( "price", "dialog", "laptop_stand_idle", "afcaves_pri_usekeyboard" );
    maps\_anim::addnotetrack_dialogue( "price", "dialog", "laptop_stand_idle", "afcaves_pri_openthedoor" );
    maps\_anim::addnotetrack_dialogue( "price", "dialog", "laptop_stand_idle", "afcaves_pri_comeoncomeon" );
    maps\_anim::addnotetrack_dialogue( "price", "dialog", "laptop_stand_idle", "afcaves_pri_getdooropen" );
    maps\_anim::addnotetrack_customfunction( "price", "start_price_typing_loop", maps\af_caves_aud::price_start_typing_loop, "laptop_stand_idle" );
    maps\_anim::addnotetrack_customfunction( "price", "stop_price_typing_loop", maps\af_caves_aud::stop_price_typing_loop, "laptop_stand_idle" );
    level.scr_anim["price"]["invasion_vehicle_cover_dialogue_guy2"] = %h2_afghan_caves_explosionwake_price;
    level.scr_anim["generic"]["civilian_crawl_1"] = %civilian_crawl_1;
    level.scr_anim["generic"]["civilian_crawl_2"] = %civilian_crawl_2;
    level.scr_anim["generic"]["civilian_leaning_death"] = %civilian_leaning_death;
    level.scr_anim["generic"]["civilian_leaning_death_death"] = %civilian_leaning_death_shot;
    level.scr_anim["generic"]["hunted_dazed_walk_C_limp"] = %hunted_dazed_walk_c_limp;
    level.scr_anim["generic"]["hunted_dazed_walk_C_limp_death"] = %exposed_death_falltoknees;
    level.scr_anim["generic"]["hunted_dazed_walk_B_blind"] = %hunted_dazed_walk_b_blind;
    level.scr_anim["generic"]["cqb_stand_idle_scan"] = %patrol_bored_react_look_v1;
    level.scr_anim["generic"]["smoke_idle"][0] = %patrol_bored_idle_smoke;
    level.scr_anim["generic"]["smoke_reach"] = %patrol_bored_idle_smoke;
    level.scr_anim["generic"]["smoke"] = %patrol_bored_idle_smoke;
    level.scr_anim["generic"]["smoke_react"] = %patrol_bored_react_look_advance;
    level.scr_anim["generic"]["lean_smoke_idle"][0] = %parabolic_leaning_guy_smoking_idle;
    level.scr_anim["generic"]["lean_smoke_idle"][1] = %parabolic_leaning_guy_smoking_twitch;
    level.scr_anim["generic"]["lean_smoke_react"] = %parabolic_leaning_guy_react;
    level.scr_anim["lean_smoker"]["lean_smoke_idle"][0] = %parabolic_leaning_guy_smoking_idle;
    level.scr_anim["lean_smoker"]["lean_smoke_idle"][1] = %parabolic_leaning_guy_smoking_twitch;
    level.scr_anim["lean_smoker"]["lean_smoke_react"] = %parabolic_leaning_guy_react;
    level.scr_anim["generic"]["barracks_stealth_takedown"] = %h2_afgan_caves_takedown_npc;
    maps\_props::add_sit_load_ak_notetracks( "generic" );
    level.scr_anim["generic"]["sit_load_ak_idle"][0] = %sitting_guard_loadak_idle;
    level.scr_anim["generic"]["sit_load_ak_react"] = %sitting_guard_loadak_react1;
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
    maps\_anim::addnotetrack_notify( "generic", "attach phone", "attach_phone_notify", "phone_idle" );
    maps\_anim::addnotetrack_notify( "generic", "detach phone", "detach_phone_notify", "phone_idle" );
    level.scr_model["com_cellphone_on_anim"] = "com_cellphone_on_anim";
    level.scr_anim["generic"]["_stealth_behavior_whizby_0"] = %exposed_idle_reacta;
    level.scr_anim["generic"]["_stealth_behavior_whizby_1"] = %exposed_idle_reactb;
    level.scr_anim["generic"]["_stealth_behavior_whizby_2"] = %exposed_idle_twitch;
    level.scr_anim["generic"]["_stealth_behavior_whizby_3"] = %exposed_idle_twitch_v4;
    level.scr_anim["generic"]["_stealth_behavior_whizby_4"] = %run_pain_stumble;
    level.scr_anim["generic"]["_stealth_behavior_spotted_short"] = %exposed_idle_twitch_v4;
    level.scr_anim["generic"]["_stealth_behavior_spotted_long"] = %exposed_idle_twitch_v4;
    level.scr_anim["generic"]["_stealth_behavior_heard_scream"] = %exposed_idle_twitch_v4;
    level.scr_anim["generic"]["combat_jog"] = %combat_jog;
    level.scr_anim["generic"]["smoking_reach"] = %parabolic_leaning_guy_smoking_idle;
    level.scr_anim["generic"]["smoking"][0] = %parabolic_leaning_guy_smoking_idle;
    level.scr_anim["generic"]["smoking"][1] = %parabolic_leaning_guy_smoking_twitch;
    level.scr_anim["generic"]["smoking_react"] = %parabolic_leaning_guy_react;
    level.scr_anim["generic"]["sit_idle"][0] = %breach_chair_idle_v2;
    level.scr_anim["generic"]["sit_react"] = %breach_chair_reaction_v2;
    level.scr_anim["generic"]["fridge_idle"][0] = %arcadia_fridge_idle;
    level.scr_anim["generic"]["fridge_react"] = %arcadia_fridge_react;
    maps\_anim::addnotetrack_customfunction( "generic", "refrig_idle_foley", maps\af_caves_aud::aud_ammo_crate_guy_idle_foley, "fridge_idle" );
    maps\_anim::addnotetrack_customfunction( "generic", "refrig_react_foley", maps\af_caves_aud::aud_ammo_crate_guy_bump_into_foley, "fridge_react" );
    level.scr_anim["generic"]["sleep_idle1"][0] = %afgan_caves_sleeping_guard_idle;
    level.scr_anim["generic"]["sleep_death1"] = %cargoship_sleeping_guy_death_1;
    level.scr_anim["generic"]["sleep_alert1"] = %afgan_caves_sleeping_guard_scramble;
    level.scr_anim["generic"]["chess_surprise_1"] = %parabolic_chessgame_surprise_a;
    level.scr_anim["generic"]["chess_surprise_2"] = %parabolic_chessgame_surprise_b;
    level.scr_anim["generic"]["chess_idle_1"][0] = %parabolic_chessgame_idle_a;
    level.scr_anim["generic"]["chess_idle_2"][0] = %parabolic_chessgame_idle_b;
    level.scr_anim["chess_guy1"]["chess_death_1"] = %parabolic_chessgame_death_a;
    level.scr_anim["chess_guy2"]["chess_death_2"] = %parabolic_chessgame_death_b;
    level.scr_anim["generic"]["signal_moveout_cqb"] = %cqb_stand_signal_move_out;
    level.scr_anim["generic"]["signal_moveup_cqb"] = %cqb_stand_signal_move_up;
    level.scr_anim["generic"]["signal_go_cqb"] = %cqb_stand_wave_go_v1;
    level.scr_anim["generic"]["signal_stop_cqb"] = %cqb_stand_signal_stop;
    level.scr_anim["generic"]["signal_onme_cqb"] = %cqb_stand_wave_on_me;
    level.scr_anim["price"]["intro_stop"] = %afgan_caves_intro_stop;
    level.scr_anim["generic"]["run_2_crouch_f"] = %run_2_crouch_f;
    level.scr_anim["generic"]["crouch_fastwalk_f"] = %crouch_fastwalk_f;
    level.scr_anim["generic"]["crouch_talk"] = %casual_crouch_v2_talk;
    level.scr_anim["generic"]["crouch_idle"] = %casual_crouch_idle;
    level.scr_anim["generic"]["look_up_stand"] = %coverstand_look_moveup;
    level.scr_anim["generic"]["look_idle_stand"][0] = %coverstand_look_idle;
    level.scr_anim["generic"]["look_down_stand"] = %coverstand_look_movedown;
    level.scr_anim["price"]["rise_up"] = %scout_sniper_price_prone_opening;
    level.scr_anim["price"]["price_slide"] = %afgan_caves_price_slide;
    var_0 = common_scripts\utility::getfx( "sand_slide_price" );
    maps\_anim::addnotetrack_customfunction( "price", "slide_start", ::_id_D30D, "price_slide", var_0 );
    maps\_anim::addnotetrack_customfunction( "price", "slide_end", ::_id_D562, "price_slide" );
    level.scr_anim["price"]["rappel"] = %afgan_caves_price_rappel_animatic;
    level.scr_anim["price"]["pri_rappel_setup"] = %afgan_caves_price_rappel_setup;
    level.scr_anim["price"]["pri_rappel_idle"][0] = %afgan_caves_price_rappel_idle;
    maps\_anim::addnotetrack_customfunction( "price", "rope", maps\af_caves::_id_B889, "pri_rappel_setup" );
    level.scr_anim["price"]["pri_rappel_jump"] = %afgan_caves_price_rappel_jump;
    maps\_anim::addnotetrack_attach( "price", "knife", "weapon_parabolic_knife", "TAG_INHAND", "pri_rappel_jump" );
    level.scr_anim["price"]["pri_hanging_idle"][0] = %afgan_caves_price_hanging_idle;
    level.scr_anim["price"]["pri_rappel_kill"] = %afgan_caves_price_rappel_kill;
    maps\_anim::addnotetrack_detach( "price", "knife", "weapon_parabolic_knife", "TAG_INHAND", "pri_rappel_kill" );
    level.scr_anim["guard_2"]["flick"] = %cliff_guarda_flick;
    level.scr_anim["guard_2"]["guardB_idle"][0] = %cliff_guardb_idle;
    level.scr_anim["guard_2"]["guardB_react"] = %cliff_guardb_react;
    level.scr_anim["guard_2"]["guard_2_death"] = %afgan_caves_guard_2_death;
    level.scr_anim["guard_1"]["rappel_kill"] = %h2_afgan_caves_guard_a_death;
    level.scr_anim["guard_1"]["guardA_idle"][0] = %cliff_guarda_idle;
    level.scr_anim["guard_1"]["guardA_react"] = %cliff_guarda_react;
    maps\_anim::addnotetrack_customfunction( "guard_1", "kill", ::kill_me );
    maps\_anim::addnotetrack_customfunction( "guard_1", "death_gurgle", maps\af_caves_code::_id_B11E, "rappel_kill" );
    level.scr_anim["guard_2"]["rappel"] = %afgan_caves_guard_2_animatic;
    level.scr_anim["generic"]["steamroom_knifekill_price"] = %parabolic_knifekill_mark;
    level.scr_anim["generic"]["steamroom_knifekill_guard"] = %parabolic_knifekill_phoneguy;
    level.scr_anim["generic"]["steamroom_knifekill_guard_idle"][0] = %parabolic_phoneguy_idle;
    level.scr_anim["generic"]["steamroom_knifekill_guard_reaction"] = %parabolic_phoneguy_reaction;
    level.scr_anim["price"]["pri_dive"] = %hunted_dive_2_pronehide_v1;
    level.scr_anim["price"]["pri_prone_stand"] = %hunted_pronehide_2_stand_v1;
    level.scr_anim["price"]["pri_bridge_jump"] = %jump_across_100_stumble;
    maps\_anim::addnotetrack_flag( "price", "footstep_right_large", "price_jumping", "pri_bridge_jump" );
    maps\_anim::addnotetrack_flag( "price", "footstep_left_large", "price_jumped", "pri_bridge_jump" );
    level.scr_anim["destroyer"]["shoot_bridge"] = %corner_standl_trans_a_2_b_v2;
    level.scr_anim["generic"]["killhouse_sas_price_idle"][0] = %killhouse_sas_price_idle;
    level.scr_anim["generic"]["look_idle_cornerR"][0] = %corner_standr_look_idle;
    level.scr_anim["generic"]["alert2look_cornerR"] = %corner_standr_alert_2_look;
    level.scr_anim["generic"]["patrol_bored_react_walkstop"] = %patrol_bored_react_walkstop;
    level.scr_anim["generic"]["breach_react_push_guy2"] = %breach_react_push_guy2;
    level.scr_anim["generic"]["breach_react_push_guy1"] = %breach_react_push_guy1;
    level.scr_anim["generic"]["breach_react_guntoss_v2_guy1"] = %breach_react_guntoss_v2_guy1;
    level.scr_anim["generic"]["breach_react_guntoss_v2_guy2"] = %breach_react_guntoss_v2_guy2;
    level.scr_anim["generic"]["breach_react_knife_charge"] = %breach_react_knife_charge;
    level.scr_anim["generic"]["breach_react_knife_charge_death"] = %death_shotgun_back_v1;
    level.scr_anim["nade_tosser"]["cqb_nade_throw"] = %cqb_stand_grenade_throw;
    maps\_anim::addnotetrack_flag( "nade_tosser", "grenade_throw", "nade_tossed", "cqb_nade_throw" );
    _id_C5E6();
}

_id_C5E6()
{
    level.scr_anim["generic"]["patrol_turn_l45_rfoot"] = %h1_bored_patrol_walk_turn_l45_right_foot;
    level.scr_anim["generic"]["patrol_turn_l45_lfoot"] = %h1_bored_patrol_walk_turn_l45_left_foot;
    level.scr_anim["generic"]["patrol_turn_l90_rfoot"] = %h1_bored_patrol_walk_turn_l90_right_foot;
    level.scr_anim["generic"]["patrol_turn_l90_lfoot"] = %h1_bored_patrol_walk_turn_l90_left_foot;
    level.scr_anim["generic"]["patrol_turn_l135_rfoot"] = %h1_bored_patrol_walk_turn_l135_right_foot;
    level.scr_anim["generic"]["patrol_turn_l135_lfoot"] = %h1_bored_patrol_walk_turn_l135_left_foot;
    level.scr_anim["generic"]["patrol_turn_r45_rfoot"] = %h1_bored_patrol_walk_turn_r45_right_foot;
    level.scr_anim["generic"]["patrol_turn_r45_lfoot"] = %h1_bored_patrol_walk_turn_r45_left_foot;
    level.scr_anim["generic"]["patrol_turn_r90_rfoot"] = %h1_bored_patrol_walk_turn_r90_right_foot;
    level.scr_anim["generic"]["patrol_turn_r90_lfoot"] = %h1_bored_patrol_walk_turn_r90_left_foot;
    level.scr_anim["generic"]["patrol_turn_r135_rfoot"] = %h1_bored_patrol_walk_turn_r135_right_foot;
    level.scr_anim["generic"]["patrol_turn_r135_lfoot"] = %h1_bored_patrol_walk_turn_r135_left_foot;
    level.scr_anim["generic"]["patrol_walk_in_lfoot"] = %h1_bored_patrol_walk_turn_walk_in_left;
    level.scr_anim["generic"]["patrol_walk_out_lfoot"] = %h1_bored_patrol_walk_turn_walk_out_left;
    level.scr_anim["generic"]["patrol_walk_in_rfoot"] = %h1_bored_patrol_walk_turn_walk_in_right;
    level.scr_anim["generic"]["patrol_walk_out_rfoot"] = %h1_bored_patrol_walk_turn_walk_out_right;
}
#using_animtree("animated_props");

_id_C987()
{
    level.anim_prop_models["foliage_desertbrush_1_animated"]["sway"] = %foliage_desertbrush_1_sway;
}
#using_animtree("dog");

dog()
{
    level.scr_anim["generic"]["dog_idle"][0] = %german_shepherd_attackidle;
    level.scr_anim["generic"]["dog_eating"][0] = %german_shepherd_eating;
    level.scr_anim["generic"]["dog_eating_single"] = %german_shepherd_eating;
    level.scr_anim["generic"]["dog_growling"][0] = %german_shepherd_attackidle_growl;
    level.scr_anim["generic"]["dog_barking"][0] = %german_shepherd_attackidle_growl;
    level.scr_anim["generic"]["dog_barking"][1] = %german_shepherd_attackidle_bark;
    level.scr_anim["generic"]["dog_barking"][2] = %german_shepherd_attackidle_bark;
    level.scr_anim["generic"]["dog_barking"][3] = %german_shepherd_attackidle_bark;
}
#using_animtree("script_model");

script_models()
{
    level.scr_model["knife"] = "weapon_parabolic_knife";
    level.scr_anim["chair"]["sleep_react"] = %parabolic_guard_sleeper_react_chair;
    level.scr_animtree["chair"] = #animtree;
    level.scr_model["chair"] = "com_folding_chair";
    level.scr_anim["chair_ak"]["sit_load_ak_react"] = %sitting_guard_loadak_idle_chair;
    level.scr_animtree["chair_ak"] = #animtree;
    level.scr_model["chair_ak"] = "com_folding_chair";
    level.scr_anim["flashlight"]["fl_death"] = %blackout_flashlightguy_death_flashlight;
    level.scr_sound["flashlight"]["fl_death"] = "scn_blackout_drop_flashlight";
    level.scr_anim["flashlight"]["search"] = %blackout_flashlightguy_moment2death_flashlight;
    level.scr_sound["flashlight"]["search"] = "scn_blackout_drop_flashlight_draw";
    level.scr_anim["rope"]["rappel_hookup"] = %h2_afgan_caves_player_hookup_rope;
    level.scr_model["rope"] = "weapon_carabiner_thin_rope";
    level.scr_animtree["rope"] = #animtree;
    level.scr_anim["rope_price"]["pri_rappel_idle"][0] = %afgan_caves_price_idle_rope;
    level.scr_anim["rope_price"]["rope_hookup"] = %afgan_caves_price_hookup_rope;
    level.scr_model["rope_price"] = "weapon_carabiner_thin_rope";
    level.scr_animtree["rope_price"] = #animtree;
    level.scr_anim["rappel_rope_price"]["pri_rappel_jump"] = %afgan_caves_price_rappel_jump_rappelrope;
    level.scr_anim["rappel_rope_price"]["pri_hanging_idle"][0] = %afgan_caves_price_hanging_idle_rappelrope;
    level.scr_anim["rappel_rope_price"]["pri_rappel_idle"][0] = %afgan_caves_price_rappel_idle_rappelrope;
    level.scr_model["rappel_rope_price"] = "afgan_caves_rappel_rope";
    level.scr_animtree["rappel_rope_price"] = #animtree;
    level.scr_goaltime["price"]["pri_hanging_idle"] = 0.05;
    level.scr_goaltime["rappel_rope_price"]["pri_hanging_idle"] = 0.05;
    level.scr_anim["tarp"]["rise_up"] = %scout_sniper_sand_ghillie_tarp_emerge;
    level.scr_animtree["tarp"] = #animtree;
    level.scr_model["tarp"] = "scout_sniper_sand_ghillie_tarp";
    level.scr_anim["breach_door_model_caves"]["breach"] = %breach_player_door_v2;
    level.scr_animtree["breach_door_model_caves"] = #animtree;
    level.scr_model["breach_door_model_caves"] = "com_door_03_handleright";
    level.scr_anim["breach_door_hinge_caves"]["breach"] = %breach_player_door_hinge_v1;
    level.scr_animtree["breach_door_hinge_caves"] = #animtree;
    level.scr_model["breach_door_hinge_caves"] = "com_door_piece_hinge3";
    level.scr_animtree["lamp"] = #animtree;
    level.scr_model["lamp"] = "ch_industrial_light_animated_01_on";
    level.scr_anim["lamp"]["swing"] = %swinging_industrial_light_01_mild;
    level.scr_anim["lamp"]["swing_dup"] = %swinging_industrial_light_01_mild_dup;
    level.scr_anim["keyboard"]["keyboard_control"] = %h2_afgan_caves_player_typing_prop;
    level.scr_animtree["keyboard"] = #animtree;
    level.scr_model["keyboard"] = "com_computer_keyboard_black_animated";
    level.scr_animtree["cell_hook"] = #animtree;
    level.scr_anim["cell_hook"]["cell_hook1"][0] = %h2_cell_hook_01_idle;
    level.scr_anim["cell_hook"]["cell_hook2"][0] = %h2_cell_hook_02_idle;
    level.scr_animtree["ropes"] = #animtree;
    level.scr_anim["ropes"]["player_rope"][0] = %h2_afgan_caves_rope_wobble_player;
    level.scr_anim["ropes"]["price_rope"][0] = %h2_afgan_caves_rope_wobble_soldier;
    level.scr_animtree["bombardment_enviro"] = #animtree;
    level.scr_model["bombardment_enviro"] = "h2_cave_explosion_enviro_anim";
    level.scr_anim["bombardment_enviro"]["bombardment"] = %h2_cave_explosion_enviro_react;
    level.scr_animtree["light"] = #animtree;
    level.scr_anim["light"]["idle"] = %h2_cave_wired_lights_01_idle;
    level.scr_animtree["lights"] = #animtree;
    level.scr_anim["lights"]["idle"] = %h2_cave_wired_lights_02_idle;
    level.scr_animtree["heli_tarp"] = #animtree;
    level.scr_model["heli_tarp"] = "h2_cave_camo_net_helico_animated";
    level.scr_anim["heli_tarp"]["combat_cave_tarp"][0] = %h2_cave_camo_net_helico_idle;
    level.scr_anim["heli_tarp"]["combat_cave_tarp_wind"][0] = %h2_cave_camo_net_helico_wind;
}
#using_animtree("player");

player_animations()
{
    level.scr_animtree["player_rig"] = #animtree;
    level.scr_model["player_rig"] = "h2_gfl_m4_sopmod_ii_viewhands_player";
    level.scr_anim["player_rig"]["rappel_close"] = %h2_afgan_caves_player_rappel_close;
    level.scr_anim["player_rig"]["rappel_far"] = %h2_afgan_caves_player_rappel_far;
    level.scr_anim["player_rig"]["rappel_close_node"] = %cave_rappel_close;
    level.scr_anim["player_rig"]["rappel_far_node"] = %cave_rappel_far;
    level.scr_anim["player_rig"]["rappel_hookup"] = %h2_afgan_caves_player_rappel_hookup;
    level.scr_anim["player_rig"]["rappel_root"] = %cave_rappel;
    level.scr_anim["player_rig"]["rappel_kill"] = %h2_afgan_caves_player_rappel_end_kill;
    level.scr_animtree["worldbody"] = #animtree;
    level.scr_model["worldbody"] = "h2_gfl_m4_sopmod_ii_viewbody";
    level.scr_anim["worldbody"]["barracks_stealth_takedown"] = %h2_afgan_caves_takedown_player;
    maps\_anim::addnotetrack_customfunction( "player_rig", "start_guard", ::_id_BAE1 );
    level.scr_anim["worldbody"]["slide_in"] = %h2_cliffhanger_slide_in;
    level.scr_anim["worldbody"]["slide_loop"][0] = %h2_cliffhanger_slide_idle;
    level.scr_anim["worldbody"]["slide_out"] = %h2_cliffhanger_slide_out;
    level.scr_anim["worldbody"]["slide_back_loop"][0] = %h2_cliffhanger_slide_back;
    level.scr_anim["worldbody"]["slide_back_in"] = %h2_cliffhanger_slide_back_in;
    level.scr_anim["worldbody"]["slide_back_out"] = %h2_cliffhanger_slide_back_out;
    level.scr_anim["worldbody"]["slide_ar"] = %h2_cliffhanger_slide_turnl;
    level.scr_anim["worldbody"]["slide_al"] = %h2_cliffhanger_slide_turnr;
    var_0 = common_scripts\utility::getfx( "sand_slide_player" );
    maps\_anim::addnotetrack_customfunction( "worldbody", "slide_fx_start", ::_id_D30D, "slide_in", var_0 );
    maps\_anim::addnotetrack_customfunction( "worldbody", "slide_fx_end", ::_id_D562, "slide_out" );
    maps\_anim::addnotetrack_customfunction( "worldbody", "slide_fx_end", ::_id_D562, "slide_back_out" );
    maps\_anim::addnotetrack_customfunction( "worldbody", "slide_fx_end", ::_id_D00B, "slide_out", var_0 );
    maps\_anim::addnotetrack_customfunction( "worldbody", "slide_fx_end", ::_id_D00B, "slide_back_out", var_0 );
    level.scr_anim["worldbody"]["keyboard_control"] = %h2_afgan_caves_player_typing;
    level.scr_anim["worldbody"]["explosion"] = %h2_afghan_caves_explosion_player;
    level.scr_anim["worldbody"]["explosion_wake"] = %h2_afghan_caves_explosionwake_player;
}

_id_BAE1( var_0 )
{
    maps\_anim::anim_single_solo( self._id_AA0D, "rappel_kill" );
}

kill_me( var_0 )
{
    var_0.a.nodeath = 1;
    var_0.allowdeath = 1;
    var_0.diequietly = 1;
    _id_B190::_id_D55F( var_0 );
    var_0 kill();
}

_id_D30D( var_0, var_1 )
{
    var_0 endon( "stop_slide_fx" );
    var_0 endon( "death" );

    for (;;)
    {
        playfxontag( var_1, var_0, "tag_origin" );
        wait 0.1;
    }
}

_id_D00B( var_0, var_1 )
{
    var_0 endon( "stop_slide_fx" );
    var_0 endon( "death" );

    for (;;)
    {
        playfxontag( var_1, var_0, "tag_origin" );
        wait 0.1;
    }
}

_id_D562( var_0 )
{
    var_0 notify( "stop_slide_fx" );
}

dialog()
{
    level.scr_radio["afcaves_pri_suppressedweapon"] = "afcaves_pri_suppressedweapon";
    level.scr_radio["afcaves_nkl_waitforyou"] = "afcaves_nkl_waitforyou";
    level.scr_radio["afcaves_pri_dontbother"] = "afcaves_pri_dontbother";
    level.scr_radio["afcaves_nkl_goodluck"] = "afcaves_nkl_goodluck";
    level.scr_radio["afcaves_pri_moveout"] = "afcaves_pri_moveout";
    level.scr_radio["afcaves_pri_decryptioncode"] = "afcaves_pri_decryptioncode";
    level.scr_radio["afcaves_schq_goahead"] = "afcaves_schq_goahead";
    level.scr_radio["afcaves_pri_intelwassolid"] = "afcaves_pri_intelwassolid";
    level.scr_radio["afcaves_sc1_riverbedclear"] = "afcaves_sc1_riverbedclear";
    level.scr_radio["afcaves_schq_bravo"] = "afcaves_schq_bravo";
    level.scr_radio["afcaves_sc2_catwalkclear"] = "afcaves_sc2_catwalkclear";
    level.scr_radio["afcaves_schq_zulu"] = "afcaves_schq_zulu";
    level.scr_radio["afcaves_sc3_sandstorm"] = "afcaves_sc3_sandstorm";
    level.scr_radio["afcaves_sc1_startingpatrol"] = "afcaves_sc1_startingpatrol";
    level.scr_radio["afcaves_schq_finishsweep"] = "afcaves_schq_finishsweep";
    level.scr_radio["pri_holdup"] = "afcaves_pri_holdup2";
    level.scr_radio["pri_enemypatrol"] = "afcaves_pri_enemypatrol2";
    level.scr_radio["afcaves_pri_holdyourfire"] = "afcaves_pri_holdyourfire";
    level.scr_radio["afcaves_pri_splittingup"] = "afcaves_pri_splittingup";
    level.scr_radio["afcaves_pri_grouponright"] = "afcaves_pri_grouponright";
    level.scr_radio["afcaves_pri_twoonleft"] = "afcaves_pri_twoonleft";
    level.scr_radio["afcaves_pri_onmymark"] = "afcaves_pri_onmymark";
    level.scr_radio["afcaves_pri_three"] = "afcaves_pri_three";
    level.scr_radio["afcaves_pri_two"] = "afcaves_pri_two";
    level.scr_radio["afcaves_pri_one"] = "afcaves_pri_one";
    level.scr_radio["afcaves_pri_mark"] = "afcaves_pri_mark";
    level.scr_radio["afcaves_pri_justlikeoldtimes"] = "afcaves_pri_justlikeoldtimes";
    level.scr_radio["afcaves_pri_dogneutralized"] = "afcaves_pri_dogneutralized";
    level.scr_radio["afcaves_pri_closeenough"] = "afcaves_pri_closeenough";
    level.scr_radio["afcaves_pri_sticktoplan"] = "afcaves_pri_sticktoplan";
    level.scr_radio["afcaves_pri_beenspotted"] = "afcaves_pri_beenspotted";
    level.scr_radio["afcaves_pri_nomistakes"] = "afcaves_pri_nomistakes";
    level.scr_radio["afcaves_pri_beforecomeback"] = "afcaves_pri_beforecomeback";
    level.scr_radio["afcaves_pri_downhere"] = "afcaves_pri_downhere";
    level.scr_radio["afcaves_pri_groupsback"] = "afcaves_pri_groupsback";
    level.scr_radio["afcaves_pri_taketheothers"] = "afcaves_pri_taketheothers";
    level.scr_radio["afcaves_pri_taketheshot"] = "afcaves_pri_taketheshot";
    level.scr_radio["afcaves_pri_repositioning"] = "afcaves_pri_repositioning";
    level.scr_radio["afcaves_pri_findthebodies"] = "afcaves_pri_findthebodies";
    level.scr_radio["afcaves_pri_readytoshoot"] = "afcaves_pri_readytoshoot";
    level.scr_radio["afcaves_pri_foundbodies"] = "afcaves_pri_foundbodies";
    level.scr_radio["afcaves_pri_muchtime"] = "afcaves_pri_muchtime";
    level.scr_radio["pri_thermalspike"] = "afcaves_pri_thermalspike";
    level.scr_radio["afcaves_schq_d4whatsyourstatus"] = "afcaves_schq_d4whatsyourstatus";
    level.scr_radio["afcaves_schq_d4doyoucopy"] = "afcaves_schq_d4doyoucopy";
    level.scr_radio["afcaves_schq_badtransmitter"] = "afcaves_schq_badtransmitter";
    level.scr_radio["afcaves_schq_lostcontact2"] = "afcaves_schq_lostcontact2";
    level.scr_radio["afcaves_schq_badtransmitter2"] = "afcaves_schq_badtransmitter2";
    level.scr_radio["afcaves_schq_sendateam2"] = "afcaves_schq_sendateam2";
    level.scr_radio["afcaves_sc2_sendvinson"] = "afcaves_sc2_sendvinson";
    level.scr_radio["pri_hookup"] = "afcaves_pri_hookup";
    level.scr_radio["pri_soaphookup"] = "afcaves_pri_soaphookup";
    level.scr_radio["pri_whatstheproblem"] = "afcaves_pri_whatstheproblem";
    level.scr_radio["pri_hookupletsgo"] = "afcaves_pri_hookupletsgo";
    level.scr_radio["pri_go"] = "afcaves_pri_go";
    level.scr_radio["pri_2inthechest"] = "afcaves_pri_2inthechest";
    level.scr_radio["pri_letsgo"] = "afcaves_pri_letsgo";
    level.scr_radio["afcaves_pri_tangoupahead"] = "afcaves_pri_tangoupahead";
    level.scr_radio["afcaves_pri_patrolcoming"] = "afcaves_pri_patrolcoming";
    level.scr_radio["afcaves_pri_letthempass"] = "afcaves_pri_letthempass";
    level.scr_radio["afcaves_pri_havingasmoke"] = "afcaves_pri_havingasmoke";
    level.scr_radio["pri_goodnight"] = "afcaves_pri_goodnight";
    level.scr_radio["afcaves_pri_avoidbeingspotted"] = "afcaves_pri_avoidbeingspotted";
    level.scr_radio["afcaves_pri_move2"] = "afcaves_pri_move2";
    level.scr_radio["afcaves_pri_easynow"] = "afcaves_pri_easynow";
    level.scr_radio["afcaves_pri_incorridor"] = "afcaves_pri_incorridor";
    level.scr_radio["afcaves_pri_tangosonsix"] = "afcaves_pri_tangosonsix";
    level.scr_radio["afcaves_pri_tangoswithtaclights"] = "afcaves_pri_tangoswithtaclights";
    level.scr_radio["afcaves_pri_takeoneright"] = "afcaves_pri_takeoneright";
    level.scr_radio["afcaves_pri_impressive"] = "afcaves_pri_impressive";
    level.scr_radio["afcaves_pri_cleargo"] = "afcaves_pri_cleargo";
    level.scr_radio["afcaves_pri_guardsknow"] = "afcaves_pri_guardsknow";
    level.scr_radio["afcaves_pri_ontousgoloud"] = "afcaves_pri_ontousgoloud";
    level.scr_radio["afcaves_pri_compromisedgoloud"] = "afcaves_pri_compromisedgoloud";
    level.scr_radio["afcaves_pri_getbackhere"] = "afcaves_pri_getbackhere";
    level.scr_radio["afcaves_pri_gotlucky"] = "afcaves_pri_gotlucky";
    level.scr_radio["afcaves_pri_thatwasclose"] = "afcaves_pri_thatwasclose";
    level.scr_radio["afcaves_sc1_iseehim"] = "afcaves_sc1_iseehim";
    level.scr_radio["afcaves_sc1_spotted"] = "afcaves_sc1_spotted";
    level.scr_radio["afcaves_sc1_hostilemyloc"] = "afcaves_sc1_hostilemyloc";
    level.scr_radio["afcaves_schq_sitrep"] = "afcaves_schq_sitrep";
    level.scr_radio["afcaves_schq_sitrepover"] = "afcaves_schq_sitrepover";
    level.scr_radio["afcaves_schq_lostcontact"] = "afcaves_schq_lostcontact";
    level.scr_radio["afcaves_sc3_oncatwalk"] = "afcaves_sc3_oncatwalk";
    level.scr_radio["afcaves_pri_topofstairs"] = "afcaves_pri_topofstairs";
    level.scr_radio["afcaves_pri_nevermind"] = "afcaves_pri_nevermind";
    level.scr_radio["afcaves_sc3_atsteamroom"] = "afcaves_sc3_atsteamroom";
    level.scr_radio["afcaves_schq_godark"] = "afcaves_schq_godark";
    level.scr_radio["afcaves_pri_meetemheadon"] = "afcaves_pri_meetemheadon";
    level.scr_radio["afcaves_pri_getready"] = "afcaves_pri_getready";
    level.scr_radio["scl_movein"] = "afcaves_scl_movein";
    level.scr_radio["afcaves_sc3_chargeplanted"] = "afcaves_sc3_chargeplanted";
    level.scr_radio["afcaves_scl_hitit"] = "afcaves_scl_hitit";
    level.scr_radio["afcaves_sc3_breaching"] = "afcaves_sc3_breaching";
    level.scr_radio["afcaves_scl_foxtrotelement"] = "afcaves_scl_foxtrotelement";
    level.scr_radio["afcaves_scl_patternecho"] = "afcaves_scl_patternecho";
    level.scr_radio["afcaves_sc3_areaclear"] = "afcaves_sc3_areaclear";
    level.scr_radio["afcaves_scl_checkcorners"] = "afcaves_scl_checkcorners";
    level.scr_radio["afcaves_scl_theyrehere"] = "afcaves_scl_theyrehere";
    level.scr_radio["afcaves_scl_huntthemdown"] = "afcaves_scl_huntthemdown";
    level.scr_radio["afcaves_pri_goloud"] = "afcaves_pri_goloud";
    level.scr_radio["afcaves_schq_flatlined"] = "afcaves_schq_flatlined";
    level.scr_radio["afcaves_sc3_notpossible"] = "afcaves_sc3_notpossible";
    level.scr_radio["afcaves_shp_itsprice"] = "afcaves_shp_itsprice";
    level.scr_radio["afcaves_shp_burntherest"] = "afcaves_shp_burntherest";
    level.scr_radio["pri_gettingaway"] = "afcaves_pri_gettingaway";
    level.scr_radio["pri_positiontobreach"] = "afcaves_pri_positiontobreach";
    level.scr_radio["pri_doit"] = "afcaves_pri_doit";
    level.scr_radio["shp_menstaywithme"] = "afcaves_shp_menstaywithme";
    level.scr_radio["shp_twosquads"] = "afcaves_shp_twosquads";
    level.scr_radio["lnt_yessir3"] = "afcaves_lnt_yessir3";
    level.scr_radio["pri_intothetunnel"] = "afcaves_pri_intothetunnel";
    level.scr_radio["shp_airsupport"] = "afcaves_shp_airsupport";
    level.scr_radio["lnt_littlebirdinbound"] = "afcaves_lnt_littlebirdinbound";
    level.scr_radio["pri_gonnagetaway"] = "afcaves_pri_gonnagetaway";
    level.scr_radio["pri_takeoutheli"] = "afcaves_pri_takeoutheli";
    level.scr_radio["pri_regrouponme"] = "afcaves_pri_regrouponme";
    level.scr_radio["pri_keepmoving"] = "afcaves_pri_keepmoving";
    level.scr_radio["pri_moveup1"] = "afcaves_pri_moveup1";
}
#using_animtree("vehicles");

_id_BA3A()
{
    level.scr_animtree["zodiac"] = #animtree;
    level.scr_anim["zodiac"]["bounce"] = %h2_zodiac_afcave_additive;
}
