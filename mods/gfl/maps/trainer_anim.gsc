// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    anims();
    dialogue();
    vehicles();
    _id_B719();
    model_anims();
    player_anims();
    thread audio_anims();
}
#using_animtree("generic_human");

anims()
{
    maps\_props::add_smoking_notetracks( "generic" );
    level.scr_anim["foley"]["training_intro_begining"] = %h2_training_intro_foley_begining;
    maps\_anim::addnotetrack_dialogue( "foley", "dialog", "training_intro_begining", "train_fly_welcome" );
    maps\_anim::addnotetrack_dialogue( "foley", "dialog", "training_intro_begining", "train_fly_demonstration" );
    maps\_anim::addnotetrack_dialogue( "foley", "dialog", "training_intro_begining", "train_fly_nooffense" );
    maps\_anim::addnotetrack_dialogue( "foley", "dialog", "training_intro_begining", "train_fly_makesyoulook" );
    maps\_anim::addnotetrack_dialogue( "foley", "dialog", "training_intro_begining", "train_fly_showem" );
    maps\_anim::addnotetrack_dialogue( "foley", "dialog", "training_intro_begining", "train_fly_fireattargets" );
    maps\_anim::addnotetrack_flag( "foley", "activate_audiomix", "ps_train_fly_welcome", "training_intro_begining" );
    maps\_anim::addnotetrack_flag( "foley", "pickup", "foley_anim_pickup_weapon", "training_intro_begining" );
    level.scr_anim["translator"]["training_intro_begining"] = %h2_training_intro_translator_begining;
    maps\_anim::addnotetrack_dialogue( "translator", "dialog", "training_intro_begining", "train_aft_demonstration" );
    maps\_anim::addnotetrack_dialogue( "translator", "dialog", "training_intro_begining", "train_aft_makesyoulook" );
    level.scr_anim["foley"]["training_intro_idle"][0] = %h2_training_intro_foley_idle;
    level.scr_anim["foley"]["training_intro_idle2"][0] = %h2_training_intro_foley_idle2;
    level.scr_anim["foley"]["training_intro_idle3"][0] = %h2_training_intro_foley_idle3;
    level.scr_anim["translator"]["training_intro_idle"][0] = %h2_training_intro_translator_idle;
    level.scr_anim["translator"]["training_intro_idle2"][0] = %h2_training_intro_translator_idle2;
    level.scr_anim["trainee_01"]["training_intro_idle"][0] = %h2_training_intro_trainee_1_idle;
    level.scr_anim["foley"]["training_intro_talk2"] = %h2_training_intro_foley_talk2;
    maps\_anim::addnotetrack_dialogue( "foley", "dialog", "training_intro_talk2", "train_fly_sprayedbullets" );
    maps\_anim::addnotetrack_dialogue( "foley", "dialog", "training_intro_talk2", "train_fly_pickyourtargets", 1 );
    maps\_anim::addnotetrack_dialogue( "foley", "dialog", "training_intro_talk2", "train_fly_howtherangers" );
    maps\_anim::addnotetrack_dialogue( "foley", "dialog", "training_intro_talk2", "train_fly_crouchfirst", 1 );
    level.scr_anim["foley"]["training_intro_talk3"] = %h2_training_intro_foley_talk3;
    maps\_anim::addnotetrack_dialogue( "foley", "dialog", "training_intro_talk3", "train_fly_gottaaim" );
    level.scr_anim["foley"]["training_intro_talk4"] = %h2_training_intro_foley_talk4;
    maps\_anim::addnotetrack_dialogue( "foley", "dialog", "training_intro_talk4", "train_fly_switching" );
    maps\_anim::addnotetrack_dialogue( "foley", "dialog", "training_intro_talk4", "train_fly_popinandout" );
    maps\_anim::addnotetrack_dialogue( "foley", "dialog", "training_intro_talk4", "train_fly_showemprivate", 1 );
    maps\_anim::addnotetrack_dialogue( "foley", "dialog", "training_intro_talk4", "train_fly_iftargetclose", 1 );
    level.scr_anim["foley"]["training_intro_talk5"] = %h2_training_intro_foley_talk5;
    maps\_anim::addnotetrack_dialogue( "foley", "dialog", "training_intro_talk5", "train_fly_howyoudoit" );
    level.scr_anim["foley"]["training_intro_talk6"] = %h2_training_intro_foley_talk6;
    maps\_anim::addnotetrack_dialogue( "foley", "dialog", "training_intro_talk6", "train_fly_lightcover" );
    maps\_anim::addnotetrack_dialogue( "foley", "dialog", "training_intro_talk6", "train_fly_theprivatehere", 1 );
    level.scr_anim["foley"]["training_intro_talk7"] = %h2_training_intro_foley_talk7;
    maps\_anim::addnotetrack_dialogue( "foley", "dialog", "training_intro_talk7", "train_fly_tossafrag" );
    maps\_anim::addnotetrack_dialogue( "foley", "dialog", "training_intro_talk7", "train_fly_pickupfrag" );
    maps\_anim::addnotetrack_dialogue( "foley", "dialog", "training_intro_talk7", "train_fly_grenadedownrange", 1 );
    level.scr_anim["foley"]["training_intro_talk8"] = %h2_training_intro_foley_talk8;
    maps\_anim::addnotetrack_dialogue( "foley", "dialog", "training_intro_talk8", "train_fly_good" );
    maps\_anim::addnotetrack_dialogue( "foley", "dialog", "training_intro_talk8", "train_fly_fragstendtoroll", 1 );
    level.scr_anim["foley"]["training_intro_transition_talk3to6"] = %h2_training_intro_foley_transition;
    level.scr_anim["translator"]["training_intro_talk2"] = %h2_training_intro_translator_talk2;
    maps\_anim::addnotetrack_dialogue( "translator", "dialog", "training_intro_talk2", "train_aft_sprayedbullets" );
    maps\_anim::addnotetrack_dialogue( "translator", "dialog", "training_intro_talk2", "train_aft_pickyourtargets" );
    maps\_anim::addnotetrack_dialogue( "translator", "dialog", "training_intro_talk2", "train_aft_howtherangers" );
    level.scr_anim["translator"]["training_intro_talk3"] = %h2_training_intro_translator_talk3;
    maps\_anim::addnotetrack_dialogue( "translator", "dialog", "training_intro_talk3", "train_aft_crouchfirst" );
    level.scr_anim["translator"]["training_intro_talk4"] = %h2_training_intro_translator_talk4;
    maps\_anim::addnotetrack_dialogue( "translator", "dialog", "training_intro_talk4", "train_aft_switching" );
    maps\_anim::addnotetrack_dialogue( "translator", "dialog", "training_intro_talk4", "train_aft_popinandout" );
    level.scr_anim["translator"]["training_intro_talk5"] = %h2_training_intro_translator_talk5;
    level.scr_anim["translator"]["training_intro_talk6"] = %h2_training_intro_translator_talk6;
    maps\_anim::addnotetrack_dialogue( "translator", "dialog", "training_intro_talk6", "train_aft_lightcover" );
    level.scr_anim["translator"]["training_intro_talk7"] = %h2_training_intro_translator_talk7;
    maps\_anim::addnotetrack_dialogue( "translator", "dialog", "training_intro_talk7", "train_aft_tossafrag" );
    maps\_anim::addnotetrack_dialogue( "translator", "dialog", "training_intro_talk7", "train_aft_grenadedownrange" );
    level.scr_anim["translator"]["training_intro_talk8"] = %h2_training_intro_translator_talk8;
    maps\_anim::addnotetrack_dialogue( "translator", "dialog", "training_intro_talk8", "train_aft_fragstendtoroll" );
    level.scr_anim["translator"]["training_intro_transition_talk3to6"] = %h2_training_intro_translator_transition;
    level.scr_anim["foley"]["training_intro_end"] = %h2_training_intro_foley_end;
    maps\_anim::addnotetrack_dialogue( "foley", "dialog", "training_intro_end", "train_fly_thanksforhelp", 1 );
    maps\_anim::addnotetrack_dialogue( "foley", "dialog", "training_intro_end", "train_fly_gofirst" );
    level.scr_anim["translator"]["training_intro_end"] = %h2_training_intro_translator_end;
    level.scr_goaltime["translator"]["training_intro_end"] = 1;
    maps\_anim::addnotetrack_dialogue( "translator", "dialog", "training_intro_end", "train_aft_gofirst" );
    level.scr_anim["trainee_01"]["training_intro_pre_end_idle"][0] = %h2_training_intro_trainee_1_pre_end_idle;
    level.scr_anim["trainee_01"]["training_intro_end"] = %h2_training_intro_trainee_1_end;
    level.scr_goaltime["trainee_01"]["training_intro_end"] = 1;
    level.scr_anim["foley"]["training_intro_end_idle"][0] = %h2_training_intro_foley_end_idle;
    level.scr_anim["translator"]["training_intro_end_idle"][0] = %h2_training_intro_translator_end_idle;
    level.scr_anim["trainee_01"]["training_intro_end_idle"][0] = %h2_training_intro_trainee_1_end_idle;
    maps\_anim::addnotetrack_customfunction( "trainee_01", "fire_spray", ::_id_BA58 );
    level.scr_anim["soldier_wounded"]["laatpv_sequence"] = %training_latvee_wounded;
    level.scr_anim["soldier_door"]["laatpv_sequence"] = %training_latvee_soldier;
    level.scr_anim["generic"]["training_intro_soldier1_idle"][0] = %h2_training_intro_soldier1_idle;
    level.scr_anim["generic"]["training_intro_soldier1_pre_end_idle"][0] = %h2_training_intro_soldier1_pre_end_idle;
    level.scr_anim["generic"]["training_intro_soldier1_end"] = %h2_training_intro_soldier1_end;
    level.scr_goaltime["generic"]["training_intro_soldier1_end"] = 1;
    level.scr_anim["generic"]["training_intro_soldier1_end_idle"][0] = %h2_training_intro_soldier1_end_idle;
    level.scr_anim["generic"]["training_intro_soldier2_idle"][0] = %h2_training_intro_soldier2_idle;
    level.scr_anim["generic"]["training_intro_soldier2_pre_end_idle"][0] = %h2_training_intro_soldier2_pre_end_idle;
    level.scr_anim["generic"]["training_intro_soldier2_end"] = %h2_training_intro_soldier2_end;
    level.scr_goaltime["generic"]["training_intro_soldier2_end"] = 1;
    level.scr_anim["generic"]["training_intro_soldier2_end_idle"][0] = %h2_training_intro_soldier2_end_idle;
    level.scr_anim["generic"]["training_intro_soldier3_idle"][0] = %h2_training_intro_soldier3_idle;
    level.scr_anim["generic"]["training_intro_soldier3_pre_end_idle"][0] = %h2_training_intro_soldier3_pre_end_idle;
    level.scr_anim["generic"]["training_intro_soldier3_end"] = %h2_training_intro_soldier3_end;
    level.scr_goaltime["generic"]["training_intro_soldier3_end"] = 1;
    level.scr_anim["generic"]["training_intro_soldier3_end_idle"][0] = %h2_training_intro_soldier3_end_idle;
    level.scr_anim["generic"]["training_intro_soldier4_idle"][0] = %h2_training_intro_soldier4_idle;
    level.scr_anim["generic"]["training_intro_soldier4_pre_end_idle"][0] = %h2_training_intro_soldier4_pre_end_idle;
    level.scr_anim["generic"]["training_intro_soldier4_end"] = %h2_training_intro_soldier4_end;
    level.scr_goaltime["generic"]["training_intro_soldier4_end"] = 1;
    level.scr_anim["generic"]["training_intro_soldier4_end_idle"][0] = %h2_training_intro_soldier4_end_idle;
    level.scr_anim["generic"]["training_intro_soldier6_idle"][0] = %h2_training_intro_soldier6_idle;
    level.scr_anim["generic"]["training_intro_soldier6_pre_end_idle"][0] = %h2_training_intro_soldier6_pre_end_idle;
    level.scr_anim["generic"]["training_intro_soldier6_end"] = %h2_training_intro_soldier6_end;
    level.scr_goaltime["generic"]["training_intro_soldier6_end"] = 1;
    level.scr_anim["generic"]["training_intro_soldier6_end_idle"][0] = %h2_training_intro_soldier6_end_idle;
    level.scr_anim["generic"]["training_intro_soldier7_idle"][0] = %h2_training_intro_soldier7_idle;
    level.scr_anim["generic"]["training_intro_soldier7_pre_end_idle"][0] = %h2_training_intro_soldier7_pre_end_idle;
    level.scr_anim["generic"]["training_intro_soldier7_end"] = %h2_training_intro_soldier7_end;
    level.scr_goaltime["generic"]["training_intro_soldier7_end"] = 1;
    level.scr_anim["generic"]["training_intro_soldier7_end_idle"][0] = %h2_training_intro_soldier7_end_idle;
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
    level.scr_anim["generic"]["combat_jog"] = %combat_jog;
    level.scr_anim["generic"]["smoking_reach"] = %parabolic_leaning_guy_smoking_idle;
    level.scr_anim["generic"]["smoking"][0] = %parabolic_leaning_guy_smoking_idle;
    level.scr_anim["generic"]["smoking"][1] = %parabolic_leaning_guy_smoking_twitch;
    level.scr_anim["generic"]["smoking_react"] = %parabolic_leaning_guy_react;
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
    level.scr_anim["generic"]["training_jog_guy1"] = %training_jog_guy1;
    level.scr_anim["generic"]["training_jog_guy2"] = %training_jog_guy2;
    level.scr_anim["generic"]["casual_killer_jog_A"] = %casual_killer_jog_a;
    level.scr_anim["generic"]["casual_killer_jog_B"] = %casual_killer_jog_b;
    level.scr_anim["generic"]["freerunnerA_loop"] = %freerunnera_loop;
    level.scr_anim["generic"]["freerunnerB_loop"] = %freerunnerb_loop;
    level.scr_anim["generic"]["huntedrun_1_idle"] = %huntedrun_1_idle;
    level.scr_anim["generic"]["training_sleeping_in_chair"][0] = %training_sleeping_in_chair;
    level.scr_anim["generic"]["training_basketball_rest"][0] = %training_basketball_rest;
    level.scr_anim["generic"]["training_basketball_guy1"][0] = %training_basketball_guy1;
    level.scr_anim["generic"]["training_basketball_guy2"][0] = %training_basketball_guy2;
    level.scr_anim["generic"]["training_latvee_repair"][0] = %training_latvee_repair;
    level.scr_anim["generic"]["h2_training_pushups_guy1"][0] = %h2_training_pushups_guy1;
    level.scr_anim["generic"]["h2_training_pushups_guy2"][0] = %h2_training_pushups_guy2;
    level.scr_anim["generic"]["h2_training_jumpingjack_guy3"][0] = %h2_training_jumpingjack_guy3;
    level.scr_anim["generic"]["h2_training_latveerepair_underguy"][0] = %h2_training_latveerepair_underguy;
    maps\_anim::addnotetrack_customfunction( "generic", "detach_wrench", ::detachitem, "h2_training_latveerepair_underguy", "wrench" );
    maps\_anim::addnotetrack_customfunction( "generic", "attach_pliers", ::attachitem, "h2_training_latveerepair_underguy", "plier" );
    maps\_anim::addnotetrack_customfunction( "generic", "detach_pliers", ::detachitem, "h2_training_latveerepair_underguy", "plier" );
    maps\_anim::addnotetrack_customfunction( "generic", "attach_wrench", ::attachitem, "h2_training_latveerepair_underguy", "wrench" );
    level.scr_anim["generic"]["h2_training_latveerepair_behindguy"][0] = %h2_training_latveerepair_behindguy;
    level.scr_anim["generic"]["h2_training_latveerepair_topguy"][0] = %h2_training_latveerepair_topguy;
    level.scr_anim["generic"]["h2_training_soldierreading"][0] = %h2_training_soldierreading;
    level.scr_anim["generic"]["h2_training_rangerschilling_cell"][0] = %h2_training_rangerschilling_cell;
    level.scr_anim["generic"]["h2_training_rangerschilling_rifle"][0] = %h2_training_rangerschilling_rifle;
    level.scr_anim["generic"]["h2_training_jogging_runner1"][0] = %h2_training_jogging_runner1;
    level.scr_anim["generic"]["h2_training_jogging_runner2"][0] = %h2_training_jogging_runner2;
    level.scr_anim["generic"]["h2_training_jogging_runner3"][0] = %h2_training_jogging_runner3;
    level.scr_anim["generic"]["h2_training_jogging_runner4"][0] = %h2_training_jogging_runner4;
    level.scr_anim["generic"]["h2_training_shootingrange_ranger01"][0] = %h2_training_shootingrange_ranger01;
    level.scr_anim["generic"]["h2_training_shootingrange_ranger02"][0] = %h2_training_shootingrange_ranger02;
    level.scr_anim["generic"]["h2_training_shootingrange_ranger03"][0] = %h2_training_shootingrange_ranger03;
    level.scr_anim["generic"]["h2_training_shootingrange_ranger04"][0] = %h2_training_shootingrange_ranger04;
    level.scr_anim["generic"]["h2_training_stand_0"] = %h2_training_shootingrange_stand_shootloop_single;
    level.scr_anim["generic"]["h2_training_stand_1"] = %h2_training_shootingrange_stand_shootloop_burst;
    level.scr_anim["generic"]["h2_training_stand_2"] = %h2_training_shootingrange_stand_reload;
    level.scr_anim["generic"]["h2_training_stand_3"] = %h2_training_shootingrange_stand_gunjam;
    level.scr_anim["generic"]["h2_training_stand_4"] = %h2_training_shootingrange_stand_gunproblem;
    level.scr_anim["generic"]["h2_training_stand_5"] = %h2_training_shootingrange_stand_surprised;
    level.scr_anim["generic"]["h2_training_stand_6"] = %h2_training_shootingrange_stand_lookaround;
    level.scr_anim["generic"]["h2_training_stand_7"] = %h2_training_shootingrange_stand_2_crouch;
    level.scr_anim["generic"]["h2_training_crouch_0"] = %h2_training_shootingrange_crouch_shootloop_single;
    level.scr_anim["generic"]["h2_training_crouch_1"] = %h2_training_shootingrange_crouch_shootloop_mixed;
    level.scr_anim["generic"]["h2_training_crouch_2"] = %h2_training_shootingrange_crouch_reload;
    level.scr_anim["generic"]["h2_training_crouch_3"] = %h2_training_shootingrange_crouch_2_stand_reload;
    level.scr_anim["generic"]["h2_training_shootingrange_formation_student"][0] = %h2_training_shootingrange_formation_student;
    level.scr_anim["generic"]["h2_training_shootingrange_formation_teacher"][0] = %h2_training_shootingrange_formation_teacher;
    maps\_anim::addonstart_animsound( "generic", "h2_training_stand_0", "scn_h2_training_stand_0" );
    maps\_anim::addonstart_animsound( "generic", "h2_training_stand_1", "scn_h2_training_stand_1" );
    maps\_anim::addonstart_animsound( "generic", "h2_training_stand_2", "scn_h2_training_stand_2" );
    maps\_anim::addonstart_animsound( "generic", "h2_training_stand_3", "scn_h2_training_stand_3" );
    maps\_anim::addonstart_animsound( "generic", "h2_training_stand_4", "scn_h2_training_stand_4" );
    maps\_anim::addonstart_animsound( "generic", "h2_training_stand_5", "scn_h2_training_stand_5" );
    maps\_anim::addonstart_animsound( "generic", "h2_training_stand_6", "scn_h2_training_stand_6" );
    maps\_anim::addonstart_animsound( "generic", "h2_training_stand_7", "scn_h2_training_stand_7" );
    maps\_anim::addonstart_animsound( "generic", "h2_training_crouch_0", "scn_h2_training_crouch_0" );
    maps\_anim::addonstart_animsound( "generic", "h2_training_crouch_1", "scn_h2_training_crouch_1" );
    maps\_anim::addonstart_animsound( "generic", "h2_training_crouch_2", "scn_h2_training_crouch_2" );
    maps\_anim::addonstart_animsound( "generic", "h2_training_crouch_3", "scn_h2_training_crouch_3" );
    level.scr_animtree["generic"] = #animtree;
    level.scr_anim["generic"]["h2_training_triotalking_soldier01_intro"] = %h2_training_triotalking_soldier01_intro;
    level.scr_anim["generic"]["h2_training_triotalking_soldier01"][0] = %h2_training_triotalking_soldier01;
    level.scr_anim["generic"]["h2_training_triotalking_soldier02_intro"] = %h2_training_triotalking_soldier02_intro;
    level.scr_anim["generic"]["h2_training_triotalking_soldier02"][0] = %h2_training_triotalking_soldier02;
    level.scr_anim["generic"]["h2_training_triotalking_soldier03_intro"] = %h2_training_triotalking_soldier03_intro;
    level.scr_anim["generic"]["h2_training_triotalking_soldier03"][0] = %h2_training_triotalking_soldier03;
    level.scr_anim["generic"]["h2_training_handshake_walking_01_intro"] = %h2_training_handshake_walking_01_intro;
    level.scr_anim["generic"]["h2_training_handshake_walking_01"][0] = %h2_training_handshake_walking_01;
    level.scr_anim["generic"]["h2_training_handshake_walking_02_intro"] = %h2_training_handshake_walking_02_intro;
    level.scr_anim["generic"]["h2_training_handshake_walking_02"][0] = %h2_training_handshake_walking_02;
    level.scr_anim["generic"]["h2_training_handshake_join_01_intro"] = %h2_training_handshake_join_01_intro;
    level.scr_anim["generic"]["h2_training_handshake_join_01"][0] = %h2_training_handshake_join_01;
    level.scr_anim["generic"]["h2_training_handshake_join_02_intro"] = %h2_training_handshake_join_02_intro;
    level.scr_anim["generic"]["h2_training_handshake_join_02"][0] = %h2_training_handshake_join_02;
    level.scr_anim["generic"]["h2_training_bbq_guy"][0] = %h2_training_bbq_guy;
    level.scr_anim["generic"]["h2_training_daydream_sit_01"][0] = %h2_training_daydream_sit_01;
    level.scr_anim["generic"]["h2_training_daydream_lean_02"][0] = %h2_training_daydream_lean_02;
    level.scr_anim["generic"]["h2_training_daydream_sitground_01"][0] = %h2_training_daydream_sitground_01;
    level.scr_anim["generic"]["h2_training_daydream_leg_crate"][0] = %h2_training_daydream_leg_crate;
    level.scr_anim["generic"]["h2_training_daydream_sitchair"][0] = %h2_training_daydream_sitchair;
    level.scr_anim["generic"]["h2_training_chilling_ground_ranger01"][0] = %h2_training_chilling_ground_ranger01;
    level.scr_anim["generic"]["h2_training_chilling_ground_ranger02"][0] = %h2_training_chilling_ground_ranger02;
    level.scr_anim["generic"]["h2_training_crowdlife_duotalking_01"][0] = %h2_training_crowdlife_duotalking_01;
    level.scr_anim["generic"]["h2_training_crowdlife_duotalking_02"][0] = %h2_training_crowdlife_duotalking_02;
    level.scr_anim["generic"]["h2_training_controlroom_soldier"][0] = %h2_training_controlroom_soldier;
    level.scr_anim["generic"]["h2_training_burgertown_truck_soldier"][0] = %h2_training_burgertown_truck_soldier;
    level.scr_anim["generic"]["h2_parabolic_leaning_guy_smoking_idle"][0] = %h2_parabolic_leaning_guy_smoking_idle;
    level.scr_anim["generic"]["h1_killhouse_laptopguy_generic_typing"][0] = %h1_killhouse_laptopguy_generic_typing;
    level.scr_anim["generic"]["h1_killhouse_laptopguy_typing_variation"][0] = %h1_killhouse_laptopguy_typing_variation;
    level.scr_anim["generic"]["h2_training_basketball_guy1"][0] = %h2_training_basketball_guy1;
    level.scr_anim["generic"]["h2_training_basketball_guy2"][0] = %h2_training_basketball_guy2;
    level.scr_anim["generic"]["h2_roadkill_latvee_map_sequence_quiet_idle"][0] = %h2_roadkill_latvee_map_sequence_quiet_idle;
    level.scr_anim["generic"]["h2_training_shepherdwatching_shepherd_walk"] = %h2_training_shepherdwatching_shepherd_walk;
    level.scr_anim["generic"]["h2_training_shepherdwatching_shepherd_loop"][0] = %h2_training_shepherdwatching_shepherd_loop;
    level.scr_anim["generic"]["h2_training_shepherdwatching_shepherd_forward"] = %h2_training_shepherdwatching_shepherd_forward;
    level.scr_anim["generic"]["h2_training_shepherdwatching_shepherd_Endloop"][0] = %h2_training_shepherdwatching_shepherd_endloop;
    level.scr_anim["generic"]["h2_training_shepherdwatching_soldier01_walk"] = %h2_training_shepherdwatching_soldier01_walk;
    level.scr_anim["generic"]["h2_training_shepherdwatching_soldier01_loop"][0] = %h2_training_shepherdwatching_soldier01_loop;
    level.scr_anim["generic"]["h2_training_shepherdwatching_soldier01_forward"] = %h2_training_shepherdwatching_soldier01_forward;
    level.scr_anim["generic"]["h2_training_shepherdwatching_soldier01_Endloop"][0] = %h2_training_shepherdwatching_soldier01_endloop;
    level.scr_anim["generic"]["h2_training_shepherdwatching_soldier02_walk"] = %h2_training_shepherdwatching_soldier02_walk;
    level.scr_anim["generic"]["h2_training_shepherdwatching_soldier02_loop"][0] = %h2_training_shepherdwatching_soldier02_loop;
    level.scr_anim["generic"]["h2_training_shepherdwatching_soldier02_forward"] = %h2_training_shepherdwatching_soldier02_forward;
    level.scr_anim["generic"]["h2_training_shepherdwatching_soldier02_Endloop"][0] = %h2_training_shepherdwatching_soldier02_endloop;
    level.scr_anim["dunn"]["sitting_welcome_soldier"] = %h2_training_pit_sitting_welcome_soldier;
    maps\_anim::addnotetrack_dialogue( "dunn", "dialog", "sitting_welcome_soldier", "train_cpd_welcomeback" );
    maps\_anim::addnotetrack_dialogue( "dunn", "dialog", "sitting_welcome_soldier", "train_cpd_specialop" );
    level.scr_anim["dunn"]["sitting_welcome_soldier_grab"] = %h2_training_pit_sitting_welcome_pistol_soldier;
    maps\_anim::addnotetrack_dialogue( "dunn", "dialog", "sitting_welcome_soldier_grab", "train_cpd_grabapistol" );
    level.scr_anim["dunn"]["sitting_welcome_soldier_sidearm"] = %h2_training_pit_sitting_welcome_sidearm_soldier;
    maps\_anim::addnotetrack_dialogue( "dunn", "dialog", "sitting_welcome_soldier_sidearm", "train_cpd_alreadyhave" );
    level.scr_anim["dunn"]["sitting_idle_soldier"][0] = %h2_training_pit_sitting_idle_soldier;
    maps\_anim::addnotetrack_customfunction( "dunn", "stopidle", ::dunnreadytocontinue, "sitting_idle_soldier" );
    level.scr_anim["dunn"]["sitting_switchgun_VO1"] = %h2_training_pit_sitting_switchgun_vo1_soldier;
    maps\_anim::addnotetrack_dialogue( "dunn", "dialog", "sitting_switchgun_VO1", "train_cpd_switchtorifle" );
    level.scr_anim["dunn"]["sitting_switchgun_VO1_switch"] = %h2_training_pit_sitting_switchgun_vo1_sidearm_soldier;
    maps\_anim::addnotetrack_dialogue( "dunn", "dialog", "sitting_switchgun_VO1_switch", "train_cpd_tryswitching" );
    level.scr_anim["dunn"]["sitting_switchgun_idle"][0] = %h2_training_pit_sitting_switchgun_idle_soldier;
    maps\_anim::addnotetrack_customfunction( "dunn", "stopidle", ::dunnreadytocontinue, "sitting_switchgun_idle" );
    level.scr_anim["dunn"]["sitting_switchgun_VO2"] = %h2_training_pit_sitting_switchgun_vo2_soldier;
    maps\_anim::addnotetrack_dialogue( "dunn", "dialog", "sitting_switchgun_VO2", "train_cpd_switchtosidearm" );
    level.scr_anim["dunn"]["open_case_soldier"] = %h2_training_pit_open_case_soldier;
    maps\_anim::addnotetrack_dialogue( "dunn", "dialog", "open_case_soldier", "train_cpd_alwaysfaster" );
    maps\_anim::addnotetrack_dialogue( "dunn", "dialog", "open_case_soldier", "train_cpd_smileforcameras" );
    maps\_anim::addnotetrack_dialogue( "dunn", "dialog", "open_case_soldier", "train_cpd_timerstarts" );
    maps\_anim::addnotetrack_dialogue( "dunn", "dialog", "open_case_soldier", "train_cpd_putusin" );
    maps\_anim::addnotetrack_dialogue( "dunn", "dialog", "open_case_soldier", "train_cpd_socombrass" );
    maps\_anim::addnotetrack_dialogue( "dunn", "dialog", "open_case_soldier", "train_cpd_realaction" );
    maps\_anim::addnotetrack_flag( "dunn", "case_flip_01", "case_flip_01", "open_case_soldier" );
    maps\_anim::addnotetrack_flag( "dunn", "case_flip_02", "case_flip_02", "open_case_soldier" );
    maps\_anim::addnotetrack_flag( "dunn", "button_press", "button_press", "open_case_soldier" );
    level.scr_anim["dunn"]["stand_wait_idle"] = %h2_training_pit_stand_wait_idle_soldier;
    level.scr_anim["dunn"]["stand_End_VO3"] = %h2_training_pit_stand_end_vo3_soldier;
    maps\_anim::addnotetrack_dialogue( "dunn", "dialog", "stand_End_VO3", "train_cpd_donthaveallday" );
    level.scr_anim["dunn"]["stand_End_idle"][0] = %h2_training_pit_stand_end_idle_soldier;
    level.scr_anim["dunn"]["stand_End_VO4"] = %h2_training_pit_stand_end_vo4_soldier;
    maps\_anim::addnotetrack_dialogue( "dunn", "dialog", "stand_End_VO4", "train_cpd_bothintrouble" );
    level.scr_anim["dunn"]["dunn_pit_outro"] = %h2_training_pit_outro;
    maps\_anim::addnotetrack_customfunction( "dunn", "Result_dialog", ::playdunnvo, "dunn_pit_outro" );
    maps\_anim::addnotetrack_customfunction( "dunn", "dialog", ::h2_dunn_headupstairs, "dunn_pit_outro" );
    level.scr_anim["dunn"]["dunn_pit_outro_idle"][0] = %h2_training_pit_outro_idle;
    level.scr_anim["dunn"]["dunn_pit_outro_retry"] = %h2_training_pit_outro_stay;
    maps\_anim::addnotetrack_customfunction( "dunn", "dialog", ::playdunnvo, "dunn_pit_outro_retry" );
    level.scr_anim["dunn"]["dunn_pit_outro_retry_idle"][0] = %h2_training_pit_outro_stay_idle;
    level.scr_anim["dunn"]["dunn_pit_tryagain"] = %h2_training_pit_outro_tryagain;
    maps\_anim::addnotetrack_dialogue( "dunn", "dialog", "dunn_pit_tryagain", "train_cpd_anothergo" );
    level.scr_anim["dunn"]["h2_headupstairs_outro_out"] = %h2_training_pit_outro_out;
    maps\_anim::addnotetrack_dialogue( "dunn", "dialog", "h2_headupstairs_outro_out", "train_cpd_headupstairs" );
    level.scr_anim["generic"]["training_latvee_repair"][0] = %training_latvee_repair;
    level.scr_anim["generic"]["killhouse_laptop_idle"][0] = %killhouse_laptop_idle;
    level.scr_anim["generic"]["killhouse_laptop_idle"][1] = %killhouse_laptop_lookup;
    level.scr_anim["generic"]["killhouse_laptop_idle"][2] = %killhouse_laptop_twitch;
    level.scr_anim["generic"]["cliffhanger_welder_wing"][0] = %cliffhanger_welder_wing;
    level.scr_anim["generic"]["cliffhanger_welder_engine"][0] = %cliffhanger_welder_engine;
    level.scr_anim["generic"]["patrolstand_idle"][0] = %patrolstand_idle;
    level.scr_anim["generic"]["parabolic_guard_sleeper_idle"][0] = %parabolic_guard_sleeper_idle;
    level.scr_anim["generic"]["roadkill_cover_spotter_idle"][0] = %roadkill_cover_spotter_idle;
    level.scr_anim["generic"]["oilrig_balcony_smoke_idle"][0] = %oilrig_balcony_smoke_idle;
    level.scr_anim["generic"]["killhouse_gaz_idleB"][0] = %killhouse_gaz_idleb;
    level.scr_anim["generic"]["civilian_sitting_talking_A_2"][0] = %civilian_sitting_talking_a_2;
    level.scr_anim["generic"]["parabolic_leaning_guy_smoking_idle"][0] = %parabolic_leaning_guy_smoking_idle;
    level.scr_anim["generic"]["parabolic_leaning_guy_idle"][0] = %parabolic_leaning_guy_idle;
    level.scr_anim["generic"]["parabolic_leaning_guy_idle_training"][0] = %parabolic_leaning_guy_idle_training;
    level.scr_anim["generic"]["civilian_texting_sitting"][0] = %civilian_texting_sitting;
    level.scr_anim["generic"]["sitting_guard_loadAK_idle"][0] = %sitting_guard_loadak_idle;
    level.scr_anim["generic"]["afgan_caves_sleeping_guard_idle"][0] = %afgan_caves_sleeping_guard_idle;
    level.scr_anim["generic"]["cargoship_sleeping_guy_idle_2"][0] = %cargoship_sleeping_guy_idle_2;
    level.scr_anim["generic"]["civilian_sitting_talking_A_1"][0] = %civilian_sitting_talking_a_1;
    level.scr_anim["generic"]["bunker_toss_idle_guy1"][0] = %bunker_toss_idle_guy1;
    level.scr_anim["generic"]["roadkill_cover_radio_soldier3"][0] = %roadkill_cover_radio_soldier3;
    level.scr_anim["generic"]["civilian_sitting_talking_B_1"][0] = %civilian_sitting_talking_b_1;
    level.scr_anim["generic"]["civilian_smoking_A"][0] = %civilian_smoking_a;
    level.scr_anim["generic"]["civilian_reader_1"][0] = %civilian_reader_1;
    level.scr_anim["generic"]["civilian_reader_2"][0] = %civilian_reader_2;
    level.scr_anim["generic"]["guardA_sit_sleeper_sleep_idle"] = %guarda_sit_sleeper_sleep_idle;
    level.scr_anim["generic"]["roadkill_latvee_map_sequence_quiet_idle"][0] = %roadkill_latvee_map_sequence_quiet_idle;
    level.scr_anim["generic"]["guardB_sit_drinker_idle"][0] = %guardb_sit_drinker_idle;
    level.scr_anim["generic"]["guardB_standing_cold_idle"][0] = %guardb_standing_cold_idle;
    level.scr_anim["generic"]["civilian_texting_standing"][0] = %civilian_texting_standing;
    level.scr_anim["generic"]["killhouse_sas_2_idle"][0] = %killhouse_sas_2_idle;
    level.scr_anim["generic"]["killhouse_sas_3_idle"][0] = %killhouse_sas_3_idle;
    level.scr_anim["generic"]["killhouse_sas_price_idle"][0] = %killhouse_sas_price_idle;
    level.scr_anim["generic"]["killhouse_sas_1_idle"][0] = %killhouse_sas_1_idle;
    level.scr_anim["generic"]["little_bird_casual_idle_guy1"][0] = %little_bird_casual_idle_guy1;
    level.scr_anim["generic"]["sniper_escape_spotter_idle"][0] = %sniper_escape_spotter_idle;
    level.scr_anim["generic"]["patrol_bored_idle"][0] = %patrol_bored_idle;
    level.scr_anim["generic"]["training_woundedwalk_soldier_1"] = %training_woundedwalk_soldier_1;
    level.scr_anim["generic"]["training_woundedwalk_soldier_2"] = %training_woundedwalk_soldier_2;
    level.scr_anim["generic"]["hostage_pickup_runout_guy1"] = %hostage_pickup_runout_guy1;
    level.scr_anim["generic"]["hostage_pickup_runout_guy2"] = %hostage_pickup_runout_guy2;
    level.scr_anim["generic"]["DC_Burning_stop_bleeding_medic"] = %dc_burning_stop_bleeding_medic;
    maps\_anim::addnotetrack_attach( "generic", "attach prop", "clotting_powder_animated", "TAG_INHAND", "DC_Burning_stop_bleeding_medic" );
    maps\_anim::addnotetrack_detach( "generic", "dettach prop", "clotting_powder_animated", "TAG_INHAND", "DC_Burning_stop_bleeding_medic" );
    level.scr_anim["generic"]["DC_Burning_stop_bleeding_wounded"] = %dc_burning_stop_bleeding_wounded;
    level.scr_anim["generic"]["DC_Burning_stop_bleeding_medic_idle"][0] = %dc_burning_stop_bleeding_medic_endidle;
    level.scr_anim["generic"]["DC_Burning_stop_bleeding_wounded_idle"][0] = %dc_burning_stop_bleeding_wounded_endidle;
    level.scr_anim["carrier"]["wounded_pickup"] = %wounded_pickup_carrierguy;
    level.scr_anim["carried"]["wounded_pickup"] = %wounded_pickup_carriedguy;
    level.scr_anim["carrier"]["wounded_carry"] = %wounded_carry_fastwalk_carrier;
    level.scr_anim["carried"]["wounded_carry"] = %wounded_carry_fastwalk_wounded;
    level.scr_anim["generic"]["cliff_guardA_flick"] = %cliff_guarda_flick;
    level.scr_anim["generic"]["unarmed_climb_wall"] = %unarmed_climb_wall;
    level.scr_anim["generic"]["civilian_walk_coffee"][0] = %civilian_walk_coffee;
    level.scr_anim["generic"]["civilian_walk_cool"][0] = %civilian_walk_cool;
    level.scr_anim["generic"]["patrol_bored_patrolwalk"][0] = %patrol_bored_patrolwalk;
    level.scr_anim["generic"]["patrolwalk_swagger"][0] = %patrolwalk_swagger;
    level.scr_anim["generic"]["civilian_walk_hurried_1"][0] = %civilian_walk_hurried_1;
    level.scr_anim["generic"]["civilian_crowd_behavior_A"][0] = %civilian_crowd_behavior_a;
    level.scr_anim["generic"]["civilian_crazywalker_loop"][0] = %civilian_crazywalker_loop;
    level.scr_anim["generic"]["civilian_cellphonewalk"][0] = %civilian_cellphonewalk;
    level.scr_anim["generic"]["civilian_briefcase_walk_shoelace"][0] = %civilian_briefcase_walk_shoelace;
    level.scr_anim["generic"]["civilian_sodawalk"][0] = %civilian_sodawalk;
    maps\_anim::addnotetrack_customfunction( "generic", "footstep_right_large", ::bounce_fx_guy );
    maps\_anim::addnotetrack_customfunction( "generic", "footstep_left_large", ::bounce_fx_guy );
    maps\_anim::addnotetrack_customfunction( "generic", "footstep_right_small", ::bounce_fx_guy );
    maps\_anim::addnotetrack_customfunction( "generic", "footstep_left_small", ::bounce_fx_guy );
    level.scr_anim["generic"]["h2_training_ending_soldier02"] = %h2_training_ending_soldier02;
    level.scr_anim["generic"]["h2_training_ending_soldier03"] = %h2_training_ending_soldier03;
    maps\_anim::addnotetrack_dialogue( "generic", "dialog", "h2_training_ending_soldier03", "train_ar1_trapped" );
    maps\_anim::addnotetrack_customfunction( "generic", "dialog", ::guytalk, "h2_training_ending_soldier03", 3 );
    level.scr_anim["generic"]["h2_training_ending_soldier04"] = %h2_training_ending_soldier04;
    level.scr_anim["generic"]["h2_training_ending_injured"] = %h2_training_ending_injured;
    level.scr_anim["generic"]["h2_training_ending_soldier01"] = %h2_training_ending_soldier01;
    maps\_anim::addnotetrack_dialogue( "generic", "dialog", "h2_training_ending_soldier01", "train_ar2_blewthebridge" );
    maps\_anim::addnotetrack_customfunction( "generic", "dialog", ::guytalk, "h2_training_ending_soldier01", 1.5 );
    level.scr_anim["foley"]["h2_training_ending_foley"] = %h2_training_ending_foley;
    maps\_anim::addnotetrack_dialogue( "foley", "dialog", "h2_training_ending_foley", "train_fly_movingout" );
    level.scr_anim["generic"]["h2_training_ending_foleylatdriver"] = %h2_training_ending_foleylatdriver;
    level.scr_anim["generic"]["h2_training_ending_lat01_guy"] = %h2_training_ending_lat01_guy;
    level.scr_anim["generic"]["h2_training_ending_lat01_guy2"] = %h2_training_ending_lat01_guy2;
    level.scr_anim["generic"]["h2_training_ending_lat02_frontguy"] = %h2_training_ending_lat02_frontguy;
    level.scr_anim["generic"]["h2_training_ending_lat02_backguy"] = %h2_training_ending_lat02_backguy;
    level.scr_anim["generic"]["h2_training_ending_lat02_driver"] = %h2_training_ending_lat02_driver;
    level.scr_anim["generic"]["h2_training_ending_lat01_medic01"] = %h2_training_ending_lat01_medic01;
    level.scr_anim["generic"]["h2_training_ending_lat01_medic02"] = %h2_training_ending_lat01_medic02;
    level.scr_anim["generic"]["h2_training_ending_carrier"] = %h2_training_ending_carrier;
}

dialogue()
{
    level.scr_sound["court_nag_00"] = "train_ar2_getoffcourt";
    level.scr_sound["court_nag_01"] = "train_ar2_waityourturn";
    level.scr_sound["court_nag_02"] = "train_ar2_allenwhatthe";
    level.scr_sound["foley"]["train_fly_turnaround"] = "train_fly_turnaround";
    level.scr_face["foley"]["train_fly_turnaround"] = %h2_training_intro_foley_turnaround;
    level.scr_sound["foley"]["nag_rifle_pickup_01"] = "train_fly_grabthatweapon";
    level.scr_sound["foley"]["nag_rifle_pickup_02"] = "train_fly_comeonallen";
    level.scr_sound["foley"]["nag_hip_fire_01"] = "train_fly_dontaimdown";
    level.scr_sound["foley"]["nag_hip_fire_02"] = "train_fly_firefromthehip";
    level.scr_sound["foley"]["train_fly_tryafew"] = "train_fly_tryafew";
    level.scr_sound["foley"]["nag_ads_fire_01"] = "train_fly_beforeengaging";
    level.scr_sound["foley"]["nag_ads_fire_02"] = "train_fly_dontforget";
    level.scr_sound["foley"]["nag_crouch_fire_01"] = "train_fly_crouchingstance";
    level.scr_sound["foley"]["nag_crouch_fire_02"] = "train_fly_crouched";
    level.scr_sound["foley"]["timed_ads_too_slow_00"] = "train_fly_tooslow";
    level.scr_sound["foley"]["timed_ads_too_slow_01"] = "train_fly_acquirenew";
    level.scr_sound["foley"]["timed_ads_too_slow_02"] = "train_fly_poppinginandout";
    level.scr_sound["foley"]["timed_ads_not_snapping_00"] = "train_fly_speeditup";
    level.scr_sound["foley"]["timed_ads_not_snapping_01"] = "train_fly_notsnapping";
    level.scr_sound["foley"]["timed_ads_not_snapping_02"] = "train_fly_doingitwrong";
    level.scr_sound["foley"]["nag_ads_snap_01"] = "train_fly_aimtosnap";
    level.scr_sound["foley"]["nag_ads_snap_02"] = "train_fly_forgettoaim";
    level.scr_sound["foley"]["nag_ads_snap_03"] = "train_fly_fromthehip";
    level.scr_sound["foley"]["nag_ads_snap_04"] = "train_fly_notaimingprop";
    level.scr_sound["foley"]["nag_penetration_fire_01"] = "train_fly_woodpanel";
    level.scr_face["foley"]["nag_penetration_fire_01"] = %train_fly_woodpanel;
    level.scr_sound["foley"]["nag_penetration_fire_02"] = "train_fly_allenwoodpanel";
    level.scr_sound["foley"]["frag_nag_00"] = "train_fly_throwagrenade";
    level.scr_sound["foley"]["frag_nag_01"] = "train_fly_letsgothrow";
    level.scr_sound["foley"]["frag_nag_02"] = "train_fly_grenadedownrange";
    level.scr_sound["dunn"]["train_cpd_welcomeback"] = "train_cpd_welcomeback";
    level.scr_sound["dunn"]["train_cpd_specialop"] = "train_cpd_specialop";
    level.scr_sound["dunn"]["train_cpd_grabapistol"] = "train_cpd_grabapistol";
    level.scr_sound["dunn"]["train_cpd_alreadyhave"] = "train_cpd_alreadyhave";
    level.scr_sound["dunn"]["train_cpd_switchtorifle"] = "train_cpd_switchtorifle";
    level.scr_sound["dunn"]["train_cpd_switchtosidearm"] = "train_cpd_switchtosidearm";
    level.scr_sound["dunn"]["train_cpd_tryswitching"] = "train_cpd_tryswitching";
    level.scr_sound["dunn"]["train_cpd_alwaysfaster"] = "train_cpd_alwaysfaster";
    level.scr_sound["dunn"]["train_cpd_smileforcameras"] = "train_cpd_smileforcameras";
    level.scr_sound["dunn"]["train_cpd_timerstarts"] = "train_cpd_timerstarts";
    level.scr_sound["dunn"]["train_cpd_donthaveallday"] = "train_cpd_donthaveallday";
    level.scr_sound["dunn"]["train_cpd_bothintrouble"] = "train_cpd_bothintrouble";
    level.scr_sound["dunn"]["train_cpd_putusin"] = "train_cpd_putusin";
    level.scr_sound["dunn"]["train_cpd_socombrass"] = "train_cpd_socombrass";
    level.scr_sound["dunn"]["train_cpd_realaction"] = "train_cpd_realaction";
    level.scr_sound["dunn"]["train_cpd_sigh"] = "train_cpd_sigh";
    level.scr_radio["train_cpd_clearthearea"] = "train_cpd_clearthearea";
    level.scr_radio["train_cpd_clearfirstgogogo"] = "train_cpd_clearfirstgogogo";
    level.scr_radio["train_cpd_areacleared"] = "train_cpd_areacleared";
    level.scr_radio["train_cpd_upthestairs"] = "train_cpd_upthestairs";
    level.scr_radio["train_cpd_lastareamove"] = "train_cpd_lastareamove";
    level.scr_radio["train_cpd_justswitch"] = "train_cpd_justswitch";
    level.scr_radio["train_cpd_missedsome"] = "train_cpd_missedsome";
    level.scr_radio["train_cpd_lefttargets"] = "train_cpd_lefttargets";
    level.scr_radio["train_cpd_watchout"] = "train_cpd_watchout";
    level.scr_radio["train_cpd_awwkilled"] = "train_cpd_awwkilled";
    level.scr_radio["train_cpd_acivilian"] = "train_cpd_acivilian";
    level.scr_radio["train_cpd_melee"] = "train_cpd_melee";
    level.scr_radio["train_cpd_jumpdown"] = "train_cpd_jumpdown";
    level.scr_radio["train_cpd_sprint"] = "train_cpd_sprint";
    level.scr_radio["melee_nag_00"] = "train_cpd_melee";
    level.scr_radio["melee_nag_01"] = "train_cpd_needtouseknife";
    level.scr_radio["melee_nag_02"] = "train_cpd_nobullets";
    level.scr_radio["melee_nag_03"] = "train_cpd_meleethattarget";
    level.scr_radio["melee_nag_04"] = "train_cpd_useyourknife";
    level.scr_radio["pit_ads_nag_00"] = "train_cpd_stopfiringfromhip";
    level.scr_radio["pit_ads_nag_01"] = "train_cpd_aimsightsprivate";
    level.scr_radio["pit_ads_nag_02"] = "train_cpd_needtoaim";
    level.scr_radio["nag_hurry_00"] = "train_cpd_timedcourse";
    level.scr_radio["nag_hurry_01"] = "train_cpd_movingforward";
    level.scr_radio["nag_hurry_02"] = "train_cpd_movingforwardgo";
    level.scr_radio["nag_hurry_03"] = "train_cpd_runningoutoftime";
    level.scr_radio["nag_hurry_04"] = "train_cpd_timedcourse2";
    level.scr_radio["nag_didnt_sprint_00"] = "train_cpd_needtosprint";
    level.scr_radio["nag_didnt_sprint_01"] = "train_cpd_didntsprint";
    level.scr_radio["nag_didnt_sprint_02"] = "train_cpd_gobackandsprint";
    level.scr_radio["nag_didnt_sprint_03"] = "train_cpd_cantfinishsprint";
    level.scr_radio["nag_sprint_00"] = "train_cpd_sprinttoexit";
    level.scr_radio["nag_sprint_01"] = "train_cpd_movesprint";
    level.scr_radio["nag_sprint_02"] = "train_cpd_sprintallengogogo";
    level.scr_radio["nag_sprint_03"] = "train_cpd_nowsprint";
    level.scr_sound["dunn"]["train_cpd_targetswithknife"] = "train_cpd_targetswithknife";
    level.scr_sound["dunn"]["train_cpd_longandcivilians"] = "train_cpd_longandcivilians";
    level.scr_sound["dunn"]["train_cpd_longandtargets"] = "train_cpd_longandtargets";
    level.scr_sound["dunn"]["train_cpd_targets"] = "train_cpd_targets";
    level.scr_sound["dunn"]["train_cpd_civilians"] = "train_cpd_civilians";
    level.scr_sound["dunn"]["train_cpd_needtorunagain"] = "train_cpd_needtorunagain";
    level.scr_sound["dunn"]["train_cpd_anothergo"] = "train_cpd_anothergo";
    level.scr_sound["dunn"]["train_cpd_headupstairs"] = "train_cpd_headupstairs";
    level.scr_sound["dunn"]["train_cpd_runagain"] = "train_cpd_runagain";
    level.scr_face["dunn"]["train_cpd_runagain"] = %h2_training_pit_outro_okheadupstairs;
    level.scr_sound["dunn"]["end_of_course_easy_01"] = "train_cpd_sloppy";
    level.scr_sound["dunn"]["end_of_course_easy_02"] = "train_cpd_alrgihtiguess";
    level.scr_face["dunn"]["end_of_course_easy_02"] = %h2_training_pit_outro_notbadlooks;
    level.scr_sound["dunn"]["end_of_course_easy_03"] = "train_cpd_goodenough";
    level.scr_sound["dunn"]["end_of_course_reg_01"] = "train_cpd_roughedges";
    level.scr_sound["dunn"]["end_of_course_reg_02"] = "train_cpd_wasnthorrible";
    level.scr_sound["dunn"]["end_of_course_reg_03"] = "train_cpd_lookok";
    level.scr_face["dunn"]["end_of_course_reg_03"] = %h2_training_pit_outro_youlookedok;
    level.scr_sound["dunn"]["end_of_course_hard_01"] = "train_cpd_stillgotit";
    level.scr_sound["dunn"]["end_of_course_hard_02"] = "train_cpd_prettygood";
    level.scr_sound["dunn"]["end_of_course_hard_03"] = "train_cpd_verynice";
    level.scr_face["dunn"]["end_of_course_hard_03"] = %h2_training_pit_outro_okthatwas;
    level.scr_sound["dunn"]["end_of_course_vet_01"] = "train_cpd_veryimpressive";
    level.scr_face["dunn"]["end_of_course_vet_01"] = %h2_training_pit_outro_veryimpressive;
    level.scr_sound["dunn"]["end_of_course_vet_02"] = "train_cpd_amazingwork";
    level.scr_radio["train_hqr_headedout"] = "train_hqr_headedout";
    level.scr_sound["foley"]["train_fly_movingout"] = "train_fly_movingout";
    level.scr_sound["generic"]["train_ar2_blewthebridge"] = "train_ar2_blewthebridge";
    level.scr_sound["generic"]["train_ar1_trapped"] = "train_ar1_trapped";
    level.scr_sound["conversation_01"][0] = "train_ar3_boonbugged";
    level.scr_sound["conversation_01"][1] = "train_ar4_awol";
    level.scr_sound["conversation_01"][2] = "train_ar2_getthoseletters";
    level.scr_sound["conversation_01"][3] = "train_ar5_wordcame";
    level.scr_sound["conversation_01"][4] = "train_ar2_camelspiders";
    level.scr_sound["conversation_01"][5] = "train_ar1_somebatteries";
    level.scr_sound["conversation_01"][6] = "train_ar4_likeagirl";
    level.scr_sound["conversation_01"][7] = "train_ar4_holdgun";
    level.scr_sound["conversation_01"][8] = "train_ar2_secureturret";
    level.scr_sound["conversation_01"][9] = "train_ar3_sarmajor";
    level.scr_sound["conversation_01"][10] = "train_ar2_nowomen";
    level.scr_sound["conversation_01"][11] = "train_ar2_watchtonight";
    level.scr_sound["conversation_01"][12] = "train_ar5_rolledout";
    level.scr_sound["conversation_01"][13] = "train_ar1_alltheaction";
    level.scr_sound["conversation_01"][14] = "train_ar2_icantsleep";
    level.scr_sound["conversation_01"][15] = "train_ar2_newplugs";
    level.scr_sound["conversation_01"][16] = "train_ar3_getthat";
    level.scr_sound["conversation_01"][17] = "train_ar3_toyourself";
    level.scr_sound["conversation_01"][18] = "train_ar2_combatjack";
    level.scr_sound["conversation_01"][19] = "train_ar5_laugh1";
    level.scr_sound["conversation_01"][20] = "train_ar4_traincops";
    level.scr_sound["conversation_01"][21] = "train_ar4_tracksuits";
    level.scr_sound["conversation_01"][22] = "train_ar4_ridiculous";
    level.scr_sound["conversation_02"][0] = "train_ar1_noammo";
    level.scr_sound["conversation_02"][1] = "train_ar2_coldblooded";
    level.scr_sound["conversation_02"][2] = "train_ar4_monkey";
    level.scr_sound["conversation_02"][3] = "train_ar5_laugh1";
    level.scr_sound["conversation_02"][4] = "train_ar2_wannagohome";
    level.scr_sound["conversation_02"][5] = "train_ar1_motorpool";
    level.scr_sound["conversation_02"][6] = "train_ar2_getpaid";
    level.scr_sound["conversation_02"][7] = "train_ar3_checkmate";
    level.scr_sound["conversation_02"][8] = "train_ar4_weakman";
    level.scr_sound["conversation_02"][9] = "train_ar5_deltateam";
    level.scr_sound["conversation_02"][10] = "train_ar1_dontthink";
    level.scr_sound["conversation_02"][11] = "train_ar2_freakymask";
    level.scr_sound["conversation_02"][12] = "train_ar3_nonregulation";
    level.scr_sound["conversation_02"][13] = "train_ar4_yathink";
    level.scr_sound["conversation_02"][14] = "train_ar5_bendersays";
    level.scr_sound["conversation_02"][15] = "train_ar1_nobody";
    level.scr_sound["conversation_02"][16] = "train_ar2_tellinya";
    level.scr_sound["conversation_02"][17] = "train_ar3_bendersaysalot";
    level.scr_sound["conversation_02"][18] = "train_ar2_whateverjerk";
    level.scr_sound["conversation_02"][19] = "train_ar4_raisins";
    level.scr_sound["conversation_02"][20] = "train_ar5_yeah";
    level.scr_sound["conversation_02"][21] = "train_ar1_forkemover";
    level.scr_sound["conversation_02"][22] = "train_ar2_thanksman";
    level.scr_sound["conversation_02"][23] = "train_ar2_howsyourfamily";
    level.scr_sound["conversation_02"][24] = "train_ar3_bloodtype";
    level.scr_sound["conversation_02"][25] = "train_ar4_dboysdo";
    level.scr_sound["conversation_02"][26] = "train_ar2_boxoftracers";
    level.scr_sound["conversation_02"][27] = "train_ar2_sleepsometime";
    level.scr_sound["conversation_02"][28] = "train_ar4_tasteofsand";
    level.scr_sound["conversation_02"][29] = "train_ar4_sandyorafice";
    level.scr_sound["conversation_02"][30] = "train_ar4_crapsand";
    level.scr_sound["conversation_03"][0] = "train_ar2_stufffrommom";
    level.scr_sound["conversation_03"][1] = "train_ar5_laugh3";
    level.scr_sound["conversation_03"][2] = "train_ar3_onetracer";
    level.scr_sound["conversation_03"][3] = "train_ar4_coolidea";
    level.scr_sound["conversation_03"][4] = "train_ar4_oldlady";
    level.scr_sound["conversation_03"][5] = "train_ar4_dontwish";
    level.scr_sound["conversation_03"][6] = "train_ar1_extramag";
    level.scr_sound["conversation_03"][7] = "train_ar2_gotfive";
    level.scr_sound["conversation_03"][8] = "train_ar5_wannalive";
    level.scr_sound["conversation_03"][9] = "train_ar1_huah";
    level.scr_sound["conversation_03"][10] = "train_ar1_carefulbooker";
    level.scr_sound["conversation_03"][11] = "train_ar2_tightschedule";
    level.scr_sound["conversation_03"][12] = "train_ar3_tooslow";
    level.scr_sound["conversation_03"][13] = "train_ar4_swimming";
    level.scr_sound["conversation_03"][14] = "train_ar2_seedeltaguys";
    level.scr_sound["conversation_03"][15] = "train_ar2_shewashot";
}
#using_animtree("vehicles");

vehicles()
{
    level.scr_anim["bridge_layer_bridge"]["bridge_lower"] = %h2_roadkill_m60a1_bridge_lower;
    level.scr_anim["bridge_layer_bridge"]["bridge_raise"] = %m60a1_bridge_raise;
    level.scr_anim["bridge_layer"]["bridge_lower"] = %h2_roadkill_m60a1_tank_lower;
    level.scr_anim["bridge_layer"]["bridge_raise"] = %m60a1_tank_raise;
    level.scr_anim["bridge_layer"]["bridge_arm_lower"] = %roadkill_m60a1_arm_lower;
    level.scr_animtree["bridge_layer_bridge"] = #animtree;
    level.scr_animtree["bridge_layer"] = #animtree;
}
#using_animtree("player");

player_anims()
{
    level.scr_model["viewbody"] = "h2_gfl_ump45_viewbody";
    level.scr_animtree["viewbody"] = #animtree;
    level.scr_model["worldbody"] = "h2_gfl_ump45_viewbody";
    level.scr_animtree["worldbody"] = #animtree;
    level.scr_anim["worldbody"]["training_intro_gunpickup"] = %h2_training_intro_player_gunpickup;
    level.scr_anim["worldbody"]["training_intro_grenadepickup"] = %h2_training_intro_player_grenadepickup;
    maps\_anim::addnotetrack_customfunction( "worldbody", "pick_up_additional_grenade", maps\trainer::firing_range_player_pick_up_additional_grenade, "training_intro_grenadepickup" );
}
#using_animtree("script_model");

model_anims()
{
    level.scr_anim["laatpv"]["h2_training_ending_foleylatvee"] = %h2_training_ending_foleylatvee;
    level.scr_anim["laatpv"]["h2_training_ending_latvee01"] = %h2_training_ending_latvee01;
    level.scr_anim["laatpv"]["h2_training_ending_latvee02"] = %h2_training_ending_latvee02;
    level.scr_animtree["laatpv"] = #animtree;
    level.scr_anim["pit_gun"]["sitting_welcome_soldier"] = %h2_training_pit_sitting_welcome_gun;
    level.scr_anim["pit_gun"]["sitting_welcome_soldier_grab"] = %h2_training_pit_sitting_welcome_pistol_gun;
    level.scr_anim["pit_gun"]["sitting_welcome_soldier_sidearm"] = %h2_training_pit_sitting_welcome_sidearm_gun;
    level.scr_anim["pit_gun"]["sitting_idle_soldier"][0] = %h2_training_pit_sitting_idle_gun;
    level.scr_anim["pit_gun"]["sitting_switchgun_VO1"] = %h2_training_pit_sitting_switchgun_vo1_gun;
    level.scr_anim["pit_gun"]["sitting_switchgun_VO1_switch"] = %h2_training_pit_sitting_switchgun_vo1_sidearm_gun;
    level.scr_anim["pit_gun"]["sitting_switchgun_idle"][0] = %h2_training_pit_sitting_switchgun_idle_gun;
    level.scr_anim["pit_gun"]["sitting_switchgun_VO2"] = %h2_training_pit_sitting_switchgun_vo2_gun;
    level.scr_anim["pit_gun"]["open_case_soldier"] = %h2_training_pit_open_case_gun;
    level.scr_anim["pit_gun"]["stand_wait_idle"] = %h2_training_pit_stand_wait_idle_gun;
    level.scr_anim["pit_gun"]["stand_End_VO3"] = %h2_training_pit_stand_end_vo3_gun;
    level.scr_anim["pit_gun"]["stand_End_idle"][0] = %h2_training_pit_stand_end_idle_gun;
    level.scr_anim["pit_gun"]["stand_End_VO4"] = %h2_training_pit_stand_end_vo4_gun;
    level.scr_anim["ac130"]["ac130_intro"] = %h2_training_ac130_intro;
    level.scr_anim["ac130"]["h2_training_ac130_intro_rotors"][0] = %h2_training_ac130_intro_rotors;
    level.scr_animtree["ac130"] = #animtree;
    level.scr_animtree["pit_gun"] = #animtree;
    level.scr_anim["training_case_01"]["open_case_soldier"] = %h2_training_pit_case_1;
    level.scr_anim["training_case_02"]["open_case_soldier"] = %h2_training_pit_case_2;
    level.scr_animtree["training_case_01"] = #animtree;
    level.scr_animtree["training_case_02"] = #animtree;
    level.scr_anim["tarp"]["training_camo_tarp_wind"][0] = %training_camo_tarp_wind;
    level.scr_animtree["tarp"] = #animtree;
    var_0 = getentarray( "tarps", "targetname" );

    foreach ( var_2 in var_0 )
    {
        var_2.animent = spawn( "script_origin", ( 0.0, 0.0, 0.0 ) );
        var_2.animent.origin = var_2.origin;
        var_2.animent.angles = var_2.angles;
        var_2.animname = "tarp";
        var_2 maps\_utility::assign_animtree();
        var_2.animent thread maps\_anim::anim_loop_solo( var_2, "training_camo_tarp_wind", undefined, "stop_loop" );
    }

    level.scr_animtree["grenade_box"] = #animtree;
    level.scr_anim["grenade_box"]["training_intro_talk7"] = %h2_training_intro_foley_grenadebox;
    level.scr_animtree["grenade1"] = #animtree;
    level.scr_anim["grenade1"]["training_intro_grenadepickup"] = %h2_training_intro_player_grenadepickup_grenade1;
    level.scr_animtree["grenade2"] = #animtree;
    level.scr_anim["grenade2"]["training_intro_grenadepickup"] = %h2_training_intro_player_grenadepickup_grenade2;
    level.scr_animtree["grenade3"] = #animtree;
    level.scr_anim["grenade3"]["training_intro_grenadepickup"] = %h2_training_intro_player_grenadepickup_grenade3;
    level.scr_animtree["intro_gun"] = #animtree;
    level.scr_anim["intro_gun"]["training_intro_gunpickup"] = %h2_training_intro_player_gunpickup_gun;
    level.scr_animtree["windstock"] = #animtree;
    level.scr_anim["windstock"]["windstock_animated_slow"][0] = %h2_accessories_windsock_animated_slow;
    level.scr_anim["windstock"]["windstock_animated_fast"][0] = %h2_accessories_windsock_animated_fast;
}
#using_animtree("animated_props");

_id_B719()
{
    level.scr_anim["basketball"]["training_basketball_loop"][0] = %training_basketball_ball;
    level.scr_animtree["basketball"] = #animtree;
    maps\_anim::addnotetrack_customfunction( "basketball", "ps_scn_trainer_bball_dribble", ::_id_B203 );
    maps\_anim::addnotetrack_customfunction( "basketball", "ps_scn_trainer_bball_bounce_pass", ::_id_B203 );
}

_id_B203( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "ball_bounce_dust_runner" ), var_0, "tag_origin" );
}

bounce_fx_guy( var_0 )
{
    playfxontag( common_scripts\utility::getfx( "basketball_player_bounce_dust" ), var_0, "tag_origin" );
}

dunnreadytocontinue( var_0 )
{
    level._id_B85D notify( "readyToGo" );
}

_id_BA58( var_0 )
{
    if ( !common_scripts\utility::flag( "player_near_range" ) )
        return;

    var_0 playsound( "h2_wpn_m4a1_npc_close" );
    playfxontag( common_scripts\utility::getfx( "m16_muzzleflash" ), var_0, "tag_flash" );
}

guytalk( var_0, var_1 )
{
    var_0 thread maps\_anim::talk_for_time( var_1 );
}

detachitem( var_0, var_1 )
{
    var_2 = getent( "h2_prop_wrench", "targetname" );
    var_3 = getent( "h2_prop_plier", "targetname" );

    switch ( var_1 )
    {
        case "wrench":
            var_0 detach( "h2_cs_tool_wrench_adjustable_lrg_anim", "TAG_INHAND" );
            var_2 show();
            break;
        case "plier":
            var_0 detach( "h2_fav_plier", "TAG_INHAND" );
            var_3 show();
            break;
    }
}

attachitem( var_0, var_1 )
{
    var_2 = getent( "h2_prop_wrench", "targetname" );
    var_3 = getent( "h2_prop_plier", "targetname" );

    switch ( var_1 )
    {
        case "wrench":
            var_0 attach( "h2_cs_tool_wrench_adjustable_lrg_anim", "TAG_INHAND" );
            var_2 hide();
            break;
        case "plier":
            var_0 attach( "h2_fav_plier", "TAG_INHAND" );
            var_3 hide();
            break;
    }
}

playdunnvo( var_0 )
{
    var_1 = undefined;

    switch ( level._id_C9E9 )
    {
        case "train_cpd_targetswithknife":
            var_1 = 4;
            break;
        case "train_cpd_longandcivilians":
            var_1 = 3.65;
            break;
        case "train_cpd_longandtargets":
            var_1 = 4.15;
            break;
        case "train_cpd_targets":
            var_1 = 2.8;
            break;
        case "train_cpd_civilians":
            var_1 = 3.75;
            break;
        case "train_cpd_needtorunagain":
            var_1 = 2.4;
            break;
        case "end_of_course_easy_01":
            var_1 = 3.4;
            break;
        case "end_of_course_easy_02":
            break;
        case "end_of_course_easy_03":
            var_1 = 2.5;
            break;
        case "end_of_course_reg_01":
            var_1 = 3.3;
            break;
        case "end_of_course_reg_02":
            var_1 = 2.7;
            break;
        case "end_of_course_reg_03":
            break;
        case "end_of_course_hard_01":
            var_1 = 3.9;
            break;
        case "end_of_course_hard_02":
            var_1 = 3.2;
            break;
        case "end_of_course_hard_03":
            break;
        case "end_of_course_vet_01":
            break;
        case "end_of_course_vet_02":
            var_1 = 3.6;
            break;
        case "train_cpd_headupstairs":
            break;
    }

    level._id_B85D thread maps\trainer::dialogue_execute( level._id_C9E9 );

    if ( isdefined( var_1 ) )
        var_0 thread maps\_anim::talk_for_time( var_1 );
}

audio_anims()
{
    wait 0.1;
    maps\_anim::addonstart_animsound( "worldbody", "training_intro_gunpickup", "scn_trainer_plr_gunpickup" );
    maps\_anim::addonstart_animsound( "worldbody", "training_intro_grenadepickup", "scn_trainer_plr_grenadepickup" );
    maps\_anim::addonstart_animsound( "foley", "training_intro_talk7", "scn_trainer_foley_open_grenade_case" );
    maps\_anim::addonstart_animsound( "generic", "h2_training_latveerepair_topguy", "scn_trainer_latvee_welder" );
    maps\_anim::addonstart_animsound( "generic", "h1_killhouse_laptopguy_generic_typing", "npc_generic_typing" );
    maps\_anim::addonstart_animsound( "generic", "h1_killhouse_laptopguy_typing_variation", "npc_typing_variation" );
    maps\_anim::addnotetrack_customfunction( "laatpv", "open_door", ::aud_open_door_foleylatvee, "h2_training_ending_foleylatvee" );
    maps\_anim::addnotetrack_customfunction( "laatpv", "close_door", ::aud_close_door_foleylatvee, "h2_training_ending_foleylatvee" );
    maps\_anim::addnotetrack_customfunction( "laatpv", "open_door", ::aud_open_door_latvee01, "h2_training_ending_latvee01" );
    maps\_anim::addnotetrack_customfunction( "laatpv", "open_door", ::aud_open_door_latvee02, "h2_training_ending_latvee02" );
}

aud_open_door_foleylatvee( var_0 )
{
    var_0 thread maps\_utility::play_sound_on_tag( "laatpv_door_open", "rear_door_left_jnt" );
}

aud_close_door_foleylatvee( var_0 )
{
    var_0 thread maps\_utility::play_sound_on_tag( "laatpv_door_close", "rear_door_left_jnt" );
}

aud_open_door_latvee01( var_0 )
{
    var_0 thread maps\_utility::play_sound_on_tag( "laatpv_door_open", "front_door_right_jnt" );
}

aud_open_door_latvee02( var_0 )
{
    var_0 thread maps\_utility::play_sound_on_tag( "laatpv_door_open", "front_door_right_jnt" );
}

h2_dunn_headupstairs( var_0 )
{
    level._id_B85D maps\_utility::dialogue_queue( "train_cpd_runagain" );
}
