// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    character\gfl\character_gfl_ak12::precache();
    level._id_BEB2 = 0.65;
    level.guys = [];
    level._id_C32B = "none";
    level._id_CA35 = [];
    level._id_B1CF = 0;
    level.pmc_alljuggernauts = 1;
    common_scripts\utility::flag_init( "do_museum_credits" );
    common_scripts\utility::flag_init( "panic_button" );
    common_scripts\utility::flag_init( "fade_from_black" );
    common_scripts\utility::flag_init( "looked_at_big_board" );
    common_scripts\utility::flag_init( "museum_ready" );
    common_scripts\utility::flag_init( "spawn_room1_civs" );
    common_scripts\utility::flag_init( "af_caves_done" );
    common_scripts\utility::flag_init( "dc_burning_done" );
    common_scripts\utility::flag_init( "airport_done" );
    common_scripts\utility::flag_init( "cliffhanger_done" );
    common_scripts\utility::flag_init( "favela_done" );
    common_scripts\utility::flag_init( "oilrig_done" );
    common_scripts\utility::flag_init( "estate_done" );
    common_scripts\utility::flag_init( "hostage_done" );
    common_scripts\utility::flag_init( "arcadia_done" );
    common_scripts\utility::flag_init( "trainer_done" );
    common_scripts\utility::flag_init( "shepherd_anim" );
    common_scripts\utility::flag_init( "mugs_dropped_a" );
    common_scripts\utility::flag_init( "mugs_dropped_b" );
    common_scripts\utility::flag_init( "started_af_caves" );
    common_scripts\utility::flag_init( "started_dc_burning" );
    common_scripts\utility::flag_init( "started_airport" );
    common_scripts\utility::flag_init( "started_cliffhanger" );
    common_scripts\utility::flag_init( "started_favela" );
    common_scripts\utility::flag_init( "started_oilrig" );
    common_scripts\utility::flag_init( "started_estate" );
    common_scripts\utility::flag_init( "started_hostage" );
    common_scripts\utility::flag_init( "started_trainer" );
    common_scripts\utility::flag_init( "started_arcadia" );
    common_scripts\utility::flag_init( "in_an_exhibit" );
    common_scripts\utility::flag_init( "in_a_corridor" );
    common_scripts\utility::flag_init( "camera_is_parented_delta" );
    common_scripts\utility::flag_init( "exhibit_zoomout_done" );
    common_scripts\utility::flag_init( "custom_exhibit_done" );

    switch ( level._id_AC38 )
    {
        case "free":
            maps\_utility::default_start( ::_id_B967 );

            if ( getdvar( "createfx" ) == "on" )
            {
                maps\_utility::template_level( "char_museum" );
                maps\ending_lighting::_id_C1DB( "ending_museum" );
            }

            maps\_utility::add_start( "free", ::_id_B967, "[free_roam]", ::_id_BB4D );
            setdvar( "start", "" );
            break;
        case "credits_black":
            maps\_credits::initcredits();
            level.credits_speed = 17;
            maps\_utility::default_start( ::_id_B500 );
            maps\_utility::add_start( "black", ::_id_B500, "[black_credits]", ::_id_D43D );
            break;
        case "credits_1":
            maps\_credits::initcredits();
            break;
        case "credits_2":
            maps\_credits::initcredits();
            maps\_utility::default_start( ::_id_D1BD );
            break;
    }

    maps\_utility::add_start( "af_caves", ::_id_D1BD, "[af_caves]", ::_id_D156 );
    maps\_utility::add_start( "dc_burning", ::_id_C32F, "[dc_burning]", ::_id_C04B );
    maps\_utility::add_start( "airport", ::_id_CF43, "[airport]", ::_id_C59A );
    maps\_utility::add_start( "cliffhanger", ::_id_AFAB, "[cliffhanger]", ::_id_BA44 );
    maps\_utility::add_start( "favela", ::_id_CE02, "[favela]", ::_id_C51D );
    maps\_utility::add_start( "hallway1", ::_id_D5CC, "[hallway1]", ::_id_C009 );
    maps\_utility::add_start( "vehicles", ::_id_C6B0, "[vehicles]", ::_id_B950 );
    maps\_utility::add_start( "hallway2", ::_id_B70E, "[hallway2]", ::_id_D0FD );
    maps\_utility::add_start( "oilrig", ::_id_C433, "[oilrig]", ::_id_D1E1 );
    maps\_utility::add_start( "estate", ::_id_C5F8, "[estate]", ::_id_CB07 );
    maps\_utility::add_start( "hostage", ::_id_B024, "[hostage]", ::_id_C13F );
    maps\_utility::add_start( "trainer", ::_id_CBFD, "[trainer]", ::_id_C965 );
    maps\_utility::add_start( "arcadia", ::_id_CF0B, "[arcadia]", ::_id_C1EE );
    animscripts\dog\dog_init::initdoganimations();
    _id_CE8B::main();
    _id_B0A7::main();

    if ( getdvar( "createfx" ) != "on" || level._id_AC38 == "free" )
        _id_C94E::main();

    if ( level._id_AC38 != "credits_1" )
    {
        maps\_load::main();
        setsaveddvar( "sv_saveOnStartMap", 0 );
        var_0 = "levelshots / autosave / autosave_" + level.script + "start";
        savegame( "levelstart", &"AUTOSAVE_LEVELSTART", var_0, 1 );
        maps\_load::set_player_viewhand_model( "h2_gfl_ump45_viewhands_player" );
    }

    maps\_drone_civilian::init();
    maps\_drone_ai::init();
    thread _id_C9BD();
    level.room1_cleared = 0;
    level.room2_cleared = 0;
    thread maps\char_museum_code::museum_vfx_volumes();
    thread deagle_ee();
    _func_2F1( 0, "xy", 0, 0 );
    maps\char_museum_code::museum_monitors();
    var_1 = getentarray( "display_case_fake_glass", "targetname" );

    foreach ( var_3 in var_1 )
        var_3 hide();

    if ( level._id_AC38 == "free" )
        common_scripts\utility::array_call( getentarray( "free_hide", "targetname" ), ::hide );
    else
        common_scripts\utility::array_call( getentarray( "credits_hide", "targetname" ), ::hide );

    if ( level._id_AC38 == "free" )
        common_scripts\utility::array_call( getentarray( "free_dyn", "targetname" ), ::physicslaunchclient );

    thread ramirez_jukebox();
}

danger_close_fix()
{
    self.cheat._id_BDF2 = 1;
}

deagle_ee()
{
    for (;;)
    {
        level waittill( "player_flashed" );
        var_0 = getentarray( "weapon_deserteagle", "classname" );

        if ( common_scripts\utility::flag( "player_flashed" ) )
            common_scripts\utility::array_thread( var_0, ::deagle_thread );
    }
}

deagle_thread()
{
    waitframe();
    var_0 = self;

    if ( !isdefined( var_0 ) || !isdefined( var_0.angles ) )
        return;

    level.player disableweaponpickup();
    var_1 = var_0.origin;
    var_2 = var_0.angles;
    var_3 = spawn( "weapon_deserteagle_gold", var_1, var_0.spawnflags );
    var_3.angles = var_2;
    var_0 delete();
    var_3 itemweaponsetammo( 7, 21 );
    var_4 = 1.85;
    level.player enableweaponpickup();

    while ( level.player.flashendtime > gettime() + var_4 * 1000 )
    {
        if ( !isdefined( var_3 ) )
            break;

        waitframe();
    }

    level.player disableweaponpickup();

    if ( isdefined( var_3 ) )
    {
        var_5 = spawn( "weapon_deserteagle", var_1, var_3.spawnflags );
        var_5.angles = var_2;
        var_5 itemweaponsetammo( 7, 21 );
        var_3 delete();
    }

    level.player enableweaponpickup();
}

_id_C9BD()
{
    if ( level._id_AC38 == "credits_1" )
    {
        common_scripts\utility::flag_wait( "do_museum_credits" );
        thread _id_D1BD();
    }

    maps\char_museum_anim::main();
    thread maps\char_museum_code::_id_BE73();
    common_scripts\utility::array_thread( getentarray( "c4barrelPacks", "script_noteworthy" ), maps\char_museum_code::_id_C00C );
    setsaveddvar( "player_sprintUnlimited", "1" );
    setsaveddvar( "ui_hidemap", "1" );
    level.friendlyfiredisabled = 1;
    thread maps\_utility::battlechatter_off();
    maps\char_museum_aud::main();
}

h2_museum_done_flag_parity( var_0 )
{
    if ( common_scripts\utility::flag( "started_" + var_0 ) )
        return;

    if ( var_0 == "af_caves" && self.animation != "h2_museum_afchase_shepherd" )
        return;

    common_scripts\utility::flag_set( "started_" + var_0 );
    var_1 = 0;

    switch ( var_0 )
    {
        case "af_caves":
            var_1 = 6.65;
            break;
        case "dc_burning":
            var_1 = 16.35;
            break;
        case "airport":
            var_1 = 8.35;
            break;
        case "cliffhanger":
            var_1 = 15.1;
            break;
        case "favela":
            var_1 = 18.3;
            break;
        case "oilrig":
            var_1 = 15;
            break;
        case "estate":
            var_1 = 9.5;
            break;
        case "hostage":
            var_1 = 9;
            break;
        case "trainer":
            var_1 = 11.6;
            break;
        default:
            break;
    }

    wait(var_1);
    common_scripts\utility::flag_set( var_0 + "_done" );
    common_scripts\utility::flag_clear( "started_" + var_0 );

    foreach ( var_3 in level._id_CA35[var_0] )
        var_3 maps\_utility::ent_flag_clear( "do_anim" );
}

_id_BF19()
{
    level._id_CA35["af_caves"] = [];
    common_scripts\utility::array_thread( getentarray( "ai_af_caves", "script_noteworthy" ), maps\_utility::add_spawn_function, ::_id_C94F );
    common_scripts\utility::array_thread( getentarray( "ai_af_caves", "script_noteworthy" ), maps\_utility::add_spawn_function, ::_id_B18D );
}

_id_D156()
{
    if ( level._id_AC38 == "credits_1" )
    {
        common_scripts\utility::flag_wait( "do_museum_credits" );
        common_scripts\utility::flag_wait( "museum_ready" );
    }

    common_scripts\utility::array_thread( getentarray( "civ_af_caves_1", "script_noteworthy" ), maps\_utility::add_spawn_function, ::_id_AF75 );
    thread _id_AD1D();
    var_0 = common_scripts\utility::ter_op( level._id_AC38 == "credits_1", 3.5, 0 );
    thread maps\char_museum_code::h2_museum_prepare_exhibit_input( "fade_from_black", "af_caves_done", 28 + var_0 );
    common_scripts\utility::flag_wait( "af_caves_spawn_civs" );
    common_scripts\utility::array_thread( getentarray( "civ_af_caves_1", "script_noteworthy" ), maps\_utility::spawn_ai, 1 );
    common_scripts\utility::flag_wait( "spawn_room1_civs" );
    common_scripts\utility::array_thread( getentarray( "civ_af_caves_2", "script_noteworthy" ), maps\_utility::spawn_ai, 1 );
    common_scripts\utility::flag_wait( "af_caves_done" );
    wait 1.25;
    common_scripts\utility::array_thread( getentarray( "civ_af_caves_3", "script_noteworthy" ), maps\_utility::delaythread, 1.25, maps\_utility::spawn_ai, 1 );
    maps\char_museum_code::_id_B50B( "camara_path_dc_burning", 25 );
}

_id_AD1D()
{
    common_scripts\utility::flag_wait( "fade_from_black" );
    var_0 = getvehiclenode( "camara_path_af_caves", "targetname" );
    level.camera vehicle_teleport( var_0.origin, var_0.angles );
    level.camera thread maps\_vehicle::vehicle_paths( var_0 );
    level.camera attachpath( var_0 );
    level.camera vehicle_setspeedimmediate( 0, 1000, 1000 );
    wait 0.5;
    level.camera resumespeed( 0.5 );
    level.camera waittill( "reached_end_node" );
    maps\char_museum_code::_id_B50B( "camara_path_af_caves2", 6.5 );
    level.camera resumespeed( 0.5 );
    level.camera waittill( "reached_end_node" );
}

_id_AF75()
{
    var_0 = [];

    foreach ( var_2 in level._id_CA35["af_caves"] )
    {
        switch ( var_2.script_wtf )
        {
            case "rightguy1":
                var_0[0] = var_2;
                continue;
            case "rightguy2":
                var_0[1] = var_2;
                continue;
            case "frontguy":
                var_0[2] = var_2;
                continue;
            case "shepherd":
                var_0[3] = var_2;
                continue;
            case "price":
                var_0[4] = var_2;
                continue;
            case "leftguy":
                var_0[5] = var_2;
                continue;
        }
    }

    var_4 = 0;

    while ( var_4 < 6 )
    {
        wait 0.05;
        var_5 = level.player.origin;
        var_5 = ( var_5[0], var_5[1], 0 );
        var_6 = self.origin;
        var_6 = ( var_6[0], var_6[1], 0 );
        var_7 = var_0[var_4].origin;
        var_7 = ( var_7[0], var_7[1], 0 );
        var_8 = vectordot( vectornormalize( var_7 - var_5 ), vectornormalize( var_6 - var_5 ) );

        if ( var_8 < 0.999 )
            continue;

        var_0[var_4] maps\_utility::ent_flag_set( "do_anim" );

        if ( var_4 == 3 )
            common_scripts\utility::flag_set( "shepherd_anim" );

        var_4++;
    }

    common_scripts\utility::flag_set( "spawn_room1_civs" );
}

_id_C94F()
{
    maps\char_museum_code::_id_AF50( "af_caves" );
    var_0 = self.anim_node;
    wait 0.05;

    switch ( var_0.animation )
    {
        case "afchase_ending_shepherd_gun_monologue":
            self.anim_speed = level._id_BEB2 * 1.23;
            break;
        case "zodiac_trans_L2R":
            self._id_D547 = 0.28;
            self setanimtime( maps\_utility::getanim_generic( var_0.animation ), self._id_D547 );
            break;
        case "h2_museum_afchase_shepherd":
            self.anim_speed = level._id_BEB2 * 1.6;
            self.gun_remove = 1;
            maps\_utility::gun_remove();
            thread h2_shepherd_gun_animation();
            break;
    }
}

_id_B18D()
{
    self endon( "panic_button" );
    self endon( "death" );

    while ( !maps\_utility::ent_flag_exist( "do_anim" ) )
        wait 0.05;

    maps\_utility::ent_flag_wait( "do_anim" );
    var_0 = self.anim_node;
    maps\char_museum_code::_id_AD0B( maps\_utility::getanim_generic( var_0.animation ), 1, 0, self.anim_speed );
    thread h2_museum_done_flag_parity( "af_caves" );

    switch ( var_0.animation )
    {
        case "zodiac_trans_L2R":
            thread _id_AC8A( var_0.animation );
            break;
        case "afgan_caves_Price_rappel_idle":
            thread maps\char_museum_code::_id_D00C( var_0.animation );
            break;
        case "training_intro_foley_idle_talk_1":
            thread maps\char_museum_code::_id_C60E( var_0.animation, "foley_talk" );
            break;
        case "h2_museum_afchase_shepherd":
            break;
        default:
            thread maps\char_museum_code::_id_C60E( var_0.animation, "casual_stand" );
            break;
    }
}
#using_animtree("generic_human");

_id_AC8A( var_0 )
{
    self endon( "panic_button" );
    self endon( "death" );
    self endon( "do_anim" );
    self.current_anim = maps\_utility::getanim_generic( var_0 );
    thread maps\char_museum_code::_id_B42E();
    maps\char_museum_code::_id_B856( %zodiac_rightside_wave );
    maps\char_museum_code::_id_B856( %zodiac_trans_r2l );
    maps\char_museum_code::_id_B856( %zodiac_leftside_wave );
    maps\char_museum_code::_id_B856( %zodiac_trans_l2r );
}

_id_CDDA()
{
    level._id_CA35["dc_burning"] = [];
    common_scripts\utility::array_thread( getentarray( "ai_dc_burning", "script_noteworthy" ), maps\_utility::add_spawn_function, ::_id_BEAC );
    common_scripts\utility::array_thread( getentarray( "ai_dc_burning", "script_noteworthy" ), maps\_utility::add_spawn_function, ::_id_ABF3 );
}

_id_C04B()
{
    thread _id_C996();
    common_scripts\utility::flag_wait( "dc_burning_go" );
    thread maps\char_museum_code::h2_museum_prepare_exhibit_input( "dc_burning_go", "dc_burning_done", 1 );
    wait 2;

    foreach ( var_1 in level._id_CA35["dc_burning"] )
        var_1 maps\_utility::ent_flag_set( "do_anim" );

    common_scripts\utility::array_thread( getentarray( "civ_dc_burning_1", "script_noteworthy" ), maps\_utility::delaythread, 11, maps\_utility::spawn_ai, 1 );
    common_scripts\utility::flag_wait( "dc_burning_done" );
    common_scripts\utility::array_thread( getentarray( "civ_dc_burning_2", "script_noteworthy" ), maps\_utility::spawn_ai, 1 );
    common_scripts\utility::array_thread( getentarray( "room1_civ_talkers", "targetname" ), maps\_utility::spawn_ai, 1 );
    wait 2;
    common_scripts\utility::array_thread( getentarray( "civ_dc_burning_3", "script_noteworthy" ), maps\_utility::spawn_ai, 1 );
    common_scripts\utility::array_thread( getentarray( "civ_dc_burning_4", "script_noteworthy" ), maps\_utility::delaythread, 1.25, maps\_utility::spawn_ai, 1 );
    maps\char_museum_code::_id_B50B( "camara_path_airport_mid", 35 );
    level.camera resumespeed( 5 );
    wait 2;
    common_scripts\utility::flag_set( "in_a_corridor" );
    maps\char_museum_code::_id_B50B( "camara_path_airport", 45, 0 );
}

_id_C996()
{
    var_0 = getvehiclenode( "camara_path_dc_burning", "targetname" );
    level.camera vehicle_teleport( var_0.origin, var_0.angles );
    level.camera thread maps\_vehicle::vehicle_paths( var_0 );

    if ( level.start_point == "dc_burning" )
    {
        level.camera vehicle_teleport( var_0.origin, var_0.angles );
        level.camera attachpath( var_0 );
        level.camera vehicle_setspeedimmediate( 0, 1000, 1000 );
    }

    level.camera resumespeed( 0.5 );
    level.camera waittill( "reached_end_node" );
}

_id_BEAC()
{
    maps\char_museum_code::_id_AF50( "dc_burning" );
    var_0 = self.anim_node;
    wait 0.05;

    switch ( var_0.animation )
    {
        case "h2_museum_ooto_dunn":
            self.cheat.attachheadlast = 1;
            thread h2_museum_attach_gun_thread( "h2_weapon_desert_eagle_silver" );
            self.gun_remove = 1;
            maps\_utility::gun_remove();
            self.animname = "generic";
            self._id_D547 = 0.15;
            self setanimtime( maps\_utility::getanim_generic( var_0.animation ), self._id_D547 );
            break;
        case "h2_museum_ooto_foley":
            self.anim_speed = level._id_BEB2 * 1.23;
            self.animplaybackrate = self.anim_speed;
            self.moveplaybackrate = self.anim_speed;
            break;
        case "civilian_sitting_talking_A_1":
            self.gun_remove = 1;
            maps\_utility::gun_remove();
            self.cheat.attachheadlast = 1;
            break;
        case "riotshield_idle":
            if ( !isai( self ) )
                self attach( "weapon_riot_shield", "TAG_WEAPON_LEFT" );

            break;
    }
}

_id_ABF3()
{
    self endon( "panic_button" );
    self endon( "death" );

    while ( !maps\_utility::ent_flag_exist( "do_anim" ) )
        wait 0.05;

    maps\_utility::ent_flag_wait( "do_anim" );
    var_0 = self.anim_node;

    if ( var_0.animation == "h2_museum_ooto_dunn" )
        var_0 thread maps\_anim::anim_single_solo( self, "h2_museum_ooto_dunn" );
    else
        maps\char_museum_code::_id_AD0B( maps\_utility::getanim_generic( var_0.animation ), 1, 0, self.anim_speed );

    thread h2_museum_done_flag_parity( "dc_burning" );

    switch ( var_0.animation )
    {
        case "h2_museum_ooto_dunn":
            var_1 = maps\_utility::getanim_generic( "h2_museum_ooto_dunn" );
            waitframe();
            self _meth_83D4( var_1, self.anim_speed );
            break;
        case "h2_museum_ooto_foley":
            thread _id_BB23( var_0.animation );
            break;
        case "civilian_sitting_talking_A_1":
            thread maps\char_museum_code::_id_D00C( var_0.animation );
            break;
        case "stinger_fire":
            thread maps\char_museum_code::_id_C60E( var_0.animation, "rpg" );
        case "casual_crouch_idle":
            thread maps\char_museum_code::_id_C60E( var_0.animation, "casual_crouch" );
            break;
        case "riotshield_idle":
            thread maps\char_museum_code::_id_D00C( var_0.animation );
            break;
        case "casual_stand_v2_twitch_radio":
            thread maps\char_museum_code::_id_C60E( var_0.animation, "casual_stand_no_radio" );
            break;
        default:
            thread maps\char_museum_code::_id_C60E( var_0.animation, "casual_stand" );
            break;
    }
}

_id_B79C( var_0 )
{
    self endon( "panic_button" );
    self endon( "death" );
    self endon( "do_anim" );
    self.current_anim = maps\_utility::getanim_generic( var_0 );
    thread maps\char_museum_code::_id_B42E();
    var_1 = 0.41;
    var_2 = 0.1;
    wait(var_2);
}

_id_C78F()
{
    foreach ( var_1 in level._id_CA35["dc_burning"] )
        var_1 maps\_utility::ent_flag_clear( "do_anim" );
}

_id_CF17( var_0 )
{
    self._id_CA3F = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    self._id_CA3F setmodel( "viewmodel_desert_eagle" );
    self._id_CA3F.origin = var_0.origin;
    self._id_CA3F.animname = "pit_gun";
    self._id_CA3F maps\_utility::assign_animtree();
    self._id_CA3F maps\_anim::set_start_pos( var_0.animation + "_gun", var_0.origin, var_0.angles );
    self._id_CA3F maps\char_museum_code::_id_AD0B( self._id_CA3F maps\_utility::getanim( var_0.animation + "_gun" ), 1, 0, 0 );
}
#using_animtree("script_model");

_id_D528( var_0 )
{
    self._id_CA3F maps\_utility::ent_flag_init( "do_anim" );
    self._id_CA3F maps\_utility::ent_flag_set( "do_anim" );
    self._id_CA3F thread maps\char_museum_code::_id_B42E();
    self._id_CA3F maps\char_museum_code::_id_AD0B( self._id_CA3F maps\_utility::getanim( var_0 + "_gun" ), 1, 0, self.anim_speed );
    self._id_CA3F.current_anim = self._id_CA3F maps\_utility::getanim( var_0 + "_gun" );
    self._id_CA3F maps\char_museum_code::_id_B856( %training_pit_open_case_gun );
}

_id_BB23( var_0 )
{
    self endon( "panic_button" );
    self endon( "death" );
    self endon( "do_anim" );
    self.current_anim = maps\_utility::getanim_generic( var_0 );
    thread maps\char_museum_code::_id_B42E();
}

_id_C43A()
{
    level._id_CA35["airport"] = [];
    common_scripts\utility::array_thread( getentarray( "ai_airport", "script_noteworthy" ), maps\_utility::add_spawn_function, ::_id_ACA5 );
    common_scripts\utility::array_thread( getentarray( "ai_airport", "script_noteworthy" ), maps\_utility::add_spawn_function, ::_id_C9E3 );
}

_id_C59A()
{
    thread _id_BC1D();
    common_scripts\utility::flag_wait( "airport_go" );
    thread maps\char_museum_code::h2_museum_prepare_exhibit_input( "airport_go", "airport_done", 1.8 );
    thread maps\_utility::flag_set_delayed( "looked_at_big_board", 3 );
    wait 1.5;

    foreach ( var_1 in level._id_CA35["airport"] )
        var_1 maps\_utility::ent_flag_set( "do_anim" );

    common_scripts\utility::array_thread( getentarray( "civ_airport_1", "script_noteworthy" ), maps\_utility::delaythread, 6.5, maps\_utility::spawn_ai, 1 );
    common_scripts\utility::flag_wait( "airport_done" );
    wait 1.5;
    common_scripts\utility::array_thread( getentarray( "civ_airport_2", "script_noteworthy" ), maps\_utility::delaythread, 0.5, maps\_utility::spawn_ai, 1 );
    common_scripts\utility::array_thread( getentarray( "civ_airport_3", "script_noteworthy" ), maps\_utility::delaythread, 2.5, maps\_utility::spawn_ai, 1 );
    maps\char_museum_code::_id_B50B( "camara_path_cliffhanger", 70 );
}

_id_BC1D()
{
    var_0 = getvehiclenode( "camara_path_airport", "targetname" );
    level.camera thread maps\_vehicle::vehicle_paths( var_0 );

    if ( level.start_point == "airport" )
    {
        level.camera vehicle_teleport( var_0.origin, var_0.angles );
        level.camera attachpath( var_0 );
        level.camera vehicle_setspeedimmediate( 0, 1000, 1000 );
    }

    level.camera resumespeed( 0.5 );
    level.camera waittill( "reached_end_node" );
}

_id_ACA5()
{
    maps\char_museum_code::_id_AF50( "airport" );
    var_0 = self.anim_node;
    wait 0.05;

    switch ( var_0.animation )
    {
        case "h2_museum_airport_kiril":
        case "h2_museum_airport_makarov":
            self.anim_speed = level._id_BEB2 * 0.65;
            self.animplaybackrate = self.anim_speed;
            self.moveplaybackrate = self.anim_speed;
            break;
        case "airport_security_guard_pillar_react_R":
        case "airport_security_civ_rush_guard":
            thread maps\char_museum_code::_id_CC37();
            break;
        case "riotshield_bashB_attack":
            if ( !isai( self ) )
                self attach( "weapon_riot_shield", "TAG_WEAPON_LEFT" );

            break;
    }
}

_id_C9E3()
{
    self endon( "panic_button" );
    self endon( "death" );

    while ( !maps\_utility::ent_flag_exist( "do_anim" ) )
        wait 0.05;

    maps\_utility::ent_flag_wait( "do_anim" );
    var_0 = self.anim_node;
    maps\char_museum_code::_id_AD0B( maps\_utility::getanim_generic( var_0.animation ), 1, 0, self.anim_speed );
    thread h2_museum_done_flag_parity( "airport" );

    switch ( var_0.animation )
    {
        case "h2_museum_airport_makarov":
            break;
        case "airport_security_guard_pillar_react_R":
        case "airport_security_civ_rush_guard":
            thread _id_D0D8();
            break;
        case "casual_stand_v2_idle":
            thread maps\char_museum_code::_id_C60E( var_0.animation, "casual_stand" );
            break;
    }
}
#using_animtree("generic_human");

_id_D0D8()
{
    self endon( "panic_button" );
    self endon( "death" );
    self endon( "do_anim" );
    maps\char_museum_code::_id_B856( %airport_security_guard_pillar_death_r );
}

_id_CFCF()
{
    level._id_CA35["cliffhanger"] = [];
    common_scripts\utility::array_thread( getentarray( "ai_cliffhanger", "script_noteworthy" ), maps\_utility::add_spawn_function, ::_id_C001 );
    common_scripts\utility::array_thread( getentarray( "ai_cliffhanger", "script_noteworthy" ), maps\_utility::add_spawn_function, ::_id_D262 );
}

_id_BA44()
{
    thread _id_CE76();
    common_scripts\utility::flag_wait( "cliffhanger_go" );
    thread maps\char_museum_code::h2_museum_prepare_exhibit_input( "cliffhanger_go", "cliffhanger_done", 1.5 );
    wait 2;

    foreach ( var_1 in level._id_CA35["cliffhanger"] )
        var_1 maps\_utility::ent_flag_set( "do_anim" );

    common_scripts\utility::flag_wait( "cliffhanger_done" );
    wait 1.5;
    common_scripts\utility::array_thread( getentarray( "civ_favela_0", "script_noteworthy" ), maps\_utility::delaythread, 0, maps\_utility::spawn_ai, 1 );
    common_scripts\utility::array_thread( getentarray( "civ_favela_1", "script_noteworthy" ), maps\_utility::delaythread, 1.5, maps\_utility::spawn_ai, 1 );
    maps\char_museum_code::_id_B50B( "camara_path_favela" );
}

_id_CE76()
{
    var_0 = getvehiclenode( "camara_path_cliffhanger", "targetname" );
    level.camera vehicle_teleport( var_0.origin, var_0.angles );
    level.camera thread maps\_vehicle::vehicle_paths( var_0 );

    if ( level.start_point == "cliffhanger" )
    {
        level.camera vehicle_teleport( var_0.origin, var_0.angles );
        level.camera attachpath( var_0 );
        level.camera vehicle_setspeedimmediate( 0, 1000, 1000 );
    }

    level.camera resumespeed( 0.5 );
    level.camera waittill( "reached_end_node" );
}

_id_C001()
{
    if ( self.team == "axis" ) {
        character\gfl\character_gfl_ak12::main();
    }

    maps\char_museum_code::_id_AF50( "cliffhanger" );
    var_0 = self.anim_node;
    wait 0.05;

    switch ( var_0.animation )
    {
        case "killhouse_sas_price":
            self.gun_remove = 1;
            maps\_utility::gun_remove();
            self._id_D547 = 0.2;
            self setanimtime( maps\_utility::getanim_generic( var_0.animation ), self._id_D547 );
            break;
        case "killhouse_sas_1":
        case "killhouse_sas_2":
        case "killhouse_sas_3":
            self._id_D547 = 0.15;
            self setanimtime( maps\_utility::getanim_generic( var_0.animation ), self._id_D547 );
            break;
        default:
            self._id_D547 = 0.01;
            self setanimtime( maps\_utility::getanim_generic( var_0.animation ), self._id_D547 );
            break;
    }
}

_id_D262()
{
    self endon( "panic_button" );
    self endon( "death" );

    while ( !maps\_utility::ent_flag_exist( "do_anim" ) )
        wait 0.05;

    maps\_utility::ent_flag_wait( "do_anim" );
    var_0 = self.anim_node;
    maps\char_museum_code::_id_AD0B( maps\_utility::getanim_generic( var_0.animation ), 1, 0, self.anim_speed );
    thread h2_museum_done_flag_parity( "cliffhanger" );

    switch ( var_0.animation )
    {
        case "killhouse_sas_price":
            break;
        case "guardA_standing_cold_idle":
        case "guardB_standing_cold_idle":
            thread maps\char_museum_code::_id_D00C( var_0.animation );
            break;
        case "casual_crouch_idle":
            thread maps\char_museum_code::_id_C60E( var_0.animation, "casual_crouch" );
            break;
        case "casual_stand_v2_idle":
            thread maps\char_museum_code::_id_C60E( var_0.animation, "casual_stand" );
            break;
    }
}

_id_C751()
{
    level._id_CA35["favela"] = [];
    common_scripts\utility::array_thread( getentarray( "ai_favela", "script_noteworthy" ), maps\_utility::add_spawn_function, ::_id_B69A );
    common_scripts\utility::array_thread( getentarray( "ai_favela", "script_noteworthy" ), maps\_utility::add_spawn_function, ::_id_C0DD );
}

_id_C51D()
{
    thread _id_B36E();
    common_scripts\utility::flag_wait( "favela_go" );
    thread maps\char_museum_code::h2_museum_prepare_exhibit_input( "favela_go", "favela_done", 1 );
    wait 3;

    foreach ( var_1 in level._id_CA35["favela"] )
        var_1 maps\_utility::ent_flag_set( "do_anim" );

    common_scripts\utility::array_thread( getentarray( "civ_favela_3", "script_noteworthy" ), maps\_utility::delaythread, 6, maps\_utility::spawn_ai, 1 );
    common_scripts\utility::flag_wait( "favela_done" );
    wait 1;
    common_scripts\utility::array_thread( getentarray( "civ_hallway1_1", "script_noteworthy" ), maps\_utility::delaythread, 0, maps\_utility::spawn_ai, 1 );
    maps\char_museum_code::_id_B50B( "camara_path_hallway1", 70 );
}

_id_B36E()
{
    var_0 = getvehiclenode( "camara_path_favela", "targetname" );
    level.camera vehicle_teleport( var_0.origin, var_0.angles );
    level.camera thread maps\_vehicle::vehicle_paths( var_0 );

    if ( level.start_point == "favela" )
    {
        level.camera vehicle_teleport( var_0.origin, var_0.angles );
        level.camera attachpath( var_0 );
        level.camera vehicle_setspeedimmediate( 0, 1000, 1000 );
    }

    level.camera resumespeed( 0.5 );
    level.camera waittill( "reached_end_node" );
}

_id_B69A()
{
    maps\char_museum_code::_id_AF50( "favela" );
    var_0 = self.anim_node;

    switch ( var_0.animation )
    {
        case "airport_civ_in_line_15_B":
            self setanimtime( maps\_utility::getanim_generic( var_0.animation ), 0.05 );
            break;
        case "estate_ghost_radio":
            maps\char_museum_code::_id_CE56( var_0, 0.09 );
            break;
        case "invasion_vehicle_cover_dialogue_guy1":
        case "invasion_vehicle_cover_dialogue_guy2":
        case "vehicle_cover_dialogue_guy1_museum":
        case "vehicle_cover_dialogue_guy2_museum":
            var_0 thread maps\_anim::anim_single_solo( self, var_0.animation, undefined, undefined, "generic" );
            maps\char_museum_code::_id_CE56( var_0, 0.03 );
            var_1 = maps\_utility::getanim_generic( var_0.animation );
            waitframe();
            self _meth_83D4( var_1, 0 );
            break;
        case "h2_museum_favela_soap":
            thread h2_museum_attach_gun_thread( "h2_weapon_m4_grenadier", 1 );
            self.gun_remove = 1;
            maps\_utility::gun_remove();
            self.anim_speed = level._id_BEB2 * 0.65;
            break;
    }
}

_id_C0DD()
{
    self endon( "panic_button" );
    self endon( "death" );

    while ( !maps\_utility::ent_flag_exist( "do_anim" ) )
        wait 0.05;

    maps\_utility::ent_flag_wait( "do_anim" );
    var_0 = self.anim_node;

    if ( var_0.animation == "vehicle_cover_dialogue_guy1_museum" || var_0.animation == "vehicle_cover_dialogue_guy2_museum" )
        self _meth_83D4( maps\_utility::getanim_generic( var_0.animation ), self.anim_speed );
    else
        maps\char_museum_code::_id_AD0B( maps\_utility::getanim_generic( var_0.animation ), 1, 0, self.anim_speed );

    thread h2_museum_done_flag_parity( "favela" );

    switch ( var_0.animation )
    {
        case "h2_museum_favela_soap":
            break;
        case "favela_chaotic_standcover_gunjamB":
            thread maps\char_museum_code::_id_C60E( var_0.animation, "favela_stand" );
            break;
        case "favela_chaotic_crouchcover_grenadefireA":
            thread maps\char_museum_code::_id_C60E( var_0.animation, "favela_crouch" );
            break;
        case "german_shepherd_attackidle":
            thread maps\char_museum_code::_id_B1D7( var_0.animation, "dog" );
            break;
    }
}

_id_C009()
{
    thread _id_C4BA();
    common_scripts\utility::array_thread( getentarray( "civ_hallway1_2", "script_noteworthy" ), maps\_utility::delaythread, 0, maps\_utility::spawn_ai, 1 );
    common_scripts\utility::flag_wait( "skip_vehicles" );
    var_0 = maps\_utility::get_living_ai_array( "civ_talkers", "script_noteworthy" );
    common_scripts\utility::array_call( var_0, ::delete );
    common_scripts\utility::array_thread( getentarray( "room3_civ_talkers", "targetname" ), maps\_utility::delaythread, 0.5, maps\_utility::spawn_ai, 1 );
    common_scripts\utility::array_thread( getentarray( "civ_hallway1_3", "script_noteworthy" ), maps\_utility::delaythread, 0, maps\_utility::spawn_ai, 1 );
    common_scripts\utility::flag_wait( "hallway1_go" );
}

_id_C4BA()
{
    var_0 = getvehiclenode( "camara_path_hallway1", "targetname" );
    level.camera vehicle_teleport( var_0.origin, var_0.angles );
    level.camera thread maps\_vehicle::vehicle_paths( var_0 );

    if ( level.start_point == "hallway1" )
    {
        level.camera vehicle_teleport( var_0.origin, var_0.angles );
        level.camera attachpath( var_0 );
        level.camera vehicle_setspeedimmediate( 0, 1000, 1000 );
    }

    level.camera resumespeed( 5 );
    level.camera waittill( "reached_end_node" );
}

_id_B950()
{
    thread maps\char_museum_code::h2_museum_custom_exhibit( 4.0, 8.65, 0 );
    thread maps\char_museum_code::h2_museum_custom_exhibit( 12.85, 16.85, 1 );
    thread maps\char_museum_code::h2_museum_custom_exhibit( 21.15, 23.0, 0 );
    thread maps\char_museum_code::h2_museum_custom_exhibit( 26.3, 31.5, 0 );
    thread maps\char_museum_code::h2_museum_custom_exhibit( 35.65, 40.6, 1 );
    common_scripts\utility::array_thread( getentarray( "civ_vehicles_1", "script_noteworthy" ), maps\_utility::delaythread, 10, maps\_utility::spawn_ai, 1 );
    thread _id_CB61();
    common_scripts\utility::flag_wait( "vehicles_go" );
}

_id_CB61()
{
    if ( level.start_point == "vehicles" )
    {
        var_0 = getvehiclenode( "camara_path_vehicles", "targetname" );
        level.camera vehicle_teleport( var_0.origin, var_0.angles );
        level.camera thread maps\_vehicle::vehicle_paths( var_0 );
        level.camera vehicle_teleport( var_0.origin, var_0.angles );
        level.camera attachpath( var_0 );
        level.camera vehicle_setspeedimmediate( 0, 1000, 1000 );
        level.camera resumespeed( 2 );
    }

    level.camera waittill( "reached_end_node" );
    common_scripts\utility::array_thread( getentarray( "civ_vehicles_2", "script_noteworthy" ), maps\_utility::delaythread, 2, maps\_utility::spawn_ai, 1 );
    maps\char_museum_code::_id_B50B( "camara_path_vehicles2", 20, 0.25, 0.75 );
    wait 3;
    common_scripts\utility::array_thread( getentarray( "civ_vehicles_3", "script_noteworthy" ), maps\_utility::delaythread, 3.5, maps\_utility::spawn_ai, 1 );
    common_scripts\utility::array_thread( getentarray( "civ_vehicles_4", "script_noteworthy" ), maps\_utility::delaythread, 10, maps\_utility::spawn_ai, 1 );
    maps\char_museum_code::_id_B50B( "camara_path_vehicles3", 20, 0.75, 0.25 );
    level.camera resumespeed( 2 );
    level.camera waittill( "reached_end_node" );
}

_id_D0FD()
{
    thread _id_A9AF();
    common_scripts\utility::flag_wait( "skip_vehicles_to" );
    var_0 = maps\_utility::get_living_ai_array( "civ_talkers", "script_noteworthy" );
    common_scripts\utility::array_call( var_0, ::delete );
    common_scripts\utility::array_thread( getentarray( "room2_civ_talkers", "targetname" ), maps\_utility::delaythread, 0.5, maps\_utility::spawn_ai, 1 );
    common_scripts\utility::array_thread( getentarray( "civ_hallway2_1", "script_noteworthy" ), maps\_utility::delaythread, 0, maps\_utility::spawn_ai, 1 );
    common_scripts\utility::flag_wait( "hallway2_go" );
}

_id_A9AF()
{
    if ( level.start_point == "hallway2" )
    {
        var_0 = getvehiclenode( "camara_path_hallway2", "targetname" );
        level.camera vehicle_teleport( var_0.origin, var_0.angles );
        level.camera thread maps\_vehicle::vehicle_paths( var_0 );
        level.camera vehicle_teleport( var_0.origin, var_0.angles );
        level.camera attachpath( var_0 );
        level.camera vehicle_setspeedimmediate( 0, 1000, 1000 );
        level.camera resumespeed( 5 );
    }

    level.camera waittill( "reached_end_node" );
}

_id_B579()
{
    level._id_CA35["oilrig"] = [];
    common_scripts\utility::array_thread( getentarray( "ai_oilrig", "script_noteworthy" ), maps\_utility::add_spawn_function, ::_id_C546 );
    common_scripts\utility::array_thread( getentarray( "ai_oilrig", "script_noteworthy" ), maps\_utility::add_spawn_function, ::_id_ADDA );
}

_id_D1E1()
{
    thread _id_C4DF();
    common_scripts\utility::flag_wait( "oilrig_go" );
    thread maps\char_museum_code::h2_museum_parent_camera_delta( 0 );
    thread maps\char_museum_code::h2_museum_prepare_exhibit_input( "oilrig_go", "oilrig_done", 0.5 );
    wait 2;

    foreach ( var_1 in level._id_CA35["oilrig"] )
        var_1 maps\_utility::ent_flag_set( "do_anim" );

    common_scripts\utility::array_thread( getentarray( "civ_oilrig_1", "script_noteworthy" ), maps\_utility::delaythread, 12, maps\_utility::spawn_ai, 1 );
    common_scripts\utility::flag_wait( "oilrig_done" );
    common_scripts\utility::array_thread( getentarray( "civ_oilrig_2", "script_noteworthy" ), maps\_utility::delaythread, 1.5, maps\_utility::spawn_ai, 1 );
    wait 1.75;
    maps\char_museum_code::_id_B50B( "camara_path_estate" );
}

_id_C4DF()
{
    if ( level.start_point == "oilrig" )
    {
        var_0 = getvehiclenode( "camara_path_oilrig", "targetname" );
        level.camera vehicle_teleport( var_0.origin, var_0.angles );
        level.camera thread maps\_vehicle::vehicle_paths( var_0 );
        level.camera vehicle_teleport( var_0.origin, var_0.angles );
        level.camera attachpath( var_0 );
        level.camera vehicle_setspeedimmediate( 0, 1000, 1000 );
        level.camera resumespeed( 0.5 );
    }

    level.camera waittill( "reached_end_node" );
}

_id_C546()
{
    wait 0.1;
    maps\char_museum_code::_id_AF50( "oilrig" );
    var_0 = self.anim_node;
}

_id_ADDA()
{
    self endon( "panic_button" );
    self endon( "death" );

    while ( !maps\_utility::ent_flag_exist( "do_anim" ) )
        wait 0.05;

    maps\_utility::ent_flag_wait( "do_anim" );
    var_0 = self.anim_node;
    maps\char_museum_code::_id_AD0B( maps\_utility::getanim_generic( var_0.animation ), 1, 0, self.anim_speed );
    thread h2_museum_done_flag_parity( "oilrig" );

    switch ( var_0.animation )
    {
        case "h2_museum_oilrig_underwater_ghost":
            break;
        case "h2_museum_oilrig_underwater_soap":
            break;
        case "oilrig_sub_B_idle_3":
        case "oilrig_sub_B_idle_4":
            thread maps\char_museum_code::_id_D464();
        default:
            thread maps\char_museum_code::_id_D00C( var_0.animation );
            break;
    }
}

_id_BCCA()
{
    level._id_CA35["estate"] = [];
    common_scripts\utility::array_thread( getentarray( "ai_estate", "script_noteworthy" ), maps\_utility::add_spawn_function, ::_id_B883 );
    common_scripts\utility::array_thread( getentarray( "ai_estate", "script_noteworthy" ), maps\_utility::add_spawn_function, ::_id_C046 );
}

_id_CB07()
{
    thread _id_B27F();
    common_scripts\utility::flag_wait( "estate_go" );
    thread maps\char_museum_code::h2_museum_prepare_exhibit_input( "estate_go", "estate_done", 1 );
    wait 2;

    foreach ( var_1 in level._id_CA35["estate"] )
        var_1 maps\_utility::ent_flag_set( "do_anim" );

    common_scripts\utility::array_thread( getentarray( "civ_estate_1", "script_noteworthy" ), maps\_utility::delaythread, 6, maps\_utility::spawn_ai, 1 );
    common_scripts\utility::flag_wait( "estate_done" );
    wait 2;
    common_scripts\utility::array_thread( getentarray( "civ_estate_2", "script_noteworthy" ), maps\_utility::delaythread, 0, maps\_utility::spawn_ai, 1 );
    maps\char_museum_code::_id_B50B( "camara_path_hostage_mid", 55 );
    level.camera resumespeed( 5 );
    wait 3.5;
    common_scripts\utility::flag_set( "in_a_corridor" );
    maps\char_museum_code::_id_B50B( "camara_path_hostage", 75, 0 );
}

_id_B27F()
{
    var_0 = getvehiclenode( "camara_path_estate", "targetname" );
    level.camera vehicle_teleport( var_0.origin, var_0.angles );
    level.camera thread maps\_vehicle::vehicle_paths( var_0 );

    if ( level.start_point == "estate" )
    {
        level.camera vehicle_teleport( var_0.origin, var_0.angles );
        level.camera attachpath( var_0 );
        level.camera vehicle_setspeedimmediate( 0, 1000, 1000 );
    }

    level.camera resumespeed( 0.5 );
    level.camera waittill( "reached_end_node" );
}

_id_B883()
{
    if ( isdefined( self.target ) && self.target == "bh_ai_node" )
        _id_B30A();

    maps\char_museum_code::_id_AF50( "estate" );
    var_0 = self.anim_node;

    switch ( var_0.animation )
    {
        case "bh_rope_drop_le":
        case "bh_6_drop":
            self.ragdoll_immediate = 1;
            self.anim_speed = level._id_BEB2 * 0.3;
            maps\char_museum_code::_id_CE56( var_0, 0.765 );
            break;
        case "roadkill_cover_spotter":
        case "roadkill_cover_soldier":
        case "roadkill_cover_active_soldier2":
            if ( isai( self ) )
                self.a.pose = "crouch";

            break;
        case "h2_museum_estate_ghost":
            self.animname = "generic";

            if ( isai( self ) )
                self animmode( "nogravity" );

            var_0 maps\_anim::anim_first_frame_solo( self, "h2_museum_estate_ghost" );
            thread h2_estate_diorama_rope_setup();
            break;
    }
}

_id_C046()
{
    self endon( "panic_button" );
    self endon( "death" );

    while ( !maps\_utility::ent_flag_exist( "do_anim" ) )
        wait 0.05;

    maps\_utility::ent_flag_wait( "do_anim" );
    var_0 = self.anim_node;

    if ( var_0.animation == "h2_museum_estate_ghost" )
        var_0 thread maps\_anim::anim_single_solo( self, "h2_museum_estate_ghost" );
    else
        maps\char_museum_code::_id_AD0B( maps\_utility::getanim_generic( var_0.animation ), 1, 0, self.anim_speed );

    thread h2_museum_done_flag_parity( "estate" );

    switch ( var_0.animation )
    {
        case "bh_rope_drop_le":
            break;
        case "h2_museum_estate_ghost":
            var_1 = maps\_utility::getanim_generic( "h2_museum_estate_ghost" );
            waitframe();
            var_2 = getanimlength( var_1 ) / 9.8;
            self _meth_83D4( var_1, var_2 );
            thread h2_estate_diorama_rope_think( var_2 );
            break;
        default:
            thread maps\char_museum_code::_id_D00C( var_0.animation );
            break;
    }
}

_id_AF19()
{
    var_0 = getent( self.target, "targetname" );
    var_1 = spawnstruct();

    if ( level._id_AC38 == "free" )
        var_1.origin = var_0 gettagorigin( "TAG_DETACH" ) + ( 0.0, 0.0, -10.0 );
    else
        var_1.origin = var_0 gettagorigin( "TAG_DETACH" );

    var_1.angles = var_0 gettagangles( "TAG_DETACH" );
    var_1.animation = "bh_6_drop";
    var_1.targetname = "bh_ai_node";

    if ( !isdefined( level.struct_class_names["targetname"][var_1.targetname] ) )
        level.struct_class_names["targetname"][var_1.targetname] = [];

    var_2 = level.struct_class_names["targetname"][var_1.targetname].size;
    level.struct_class_names["targetname"][var_1.targetname][var_2] = var_1;
    var_1 = spawnstruct();
    var_1.origin = var_0 gettagorigin( "TAG_FASTROPE_LE" ) + ( 0.0, 0.0, 0.5 );
    var_1.angles = var_0 gettagangles( "TAG_FASTROPE_LE" );
    var_1.animation = "bh_rope_drop_le";
    var_1.targetname = "bh_rope_node";

    if ( !isdefined( level.struct_class_names["targetname"][var_1.targetname] ) )
        level.struct_class_names["targetname"][var_1.targetname] = [];

    var_2 = level.struct_class_names["targetname"][var_1.targetname].size;
    level.struct_class_names["targetname"][var_1.targetname][var_2] = var_1;
    self.target = "bh_ai_node";
}

_id_B30A()
{
    var_0 = spawn( "script_model", self.origin );
    var_0 setmodel( "rope_test" );
    var_0.target = "bh_rope_node";
    var_0 useanimtree( #animtree );
    var_0 maps\_utility::ent_flag_init( "do_anim" );
    level.guys[level.guys.size] = var_0;
    level.rope = var_0;
    var_0 thread _id_B883();
    var_0 thread _id_C046();
}

_id_D482()
{
    level._id_CA35["hostage"] = [];
    common_scripts\utility::array_thread( getentarray( "ai_hostage", "script_noteworthy" ), maps\_utility::add_spawn_function, ::_id_CF99 );
    common_scripts\utility::array_thread( getentarray( "ai_hostage", "script_noteworthy" ), maps\_utility::add_spawn_function, ::_id_D04B );
}

_id_C13F()
{
    if ( level.start_point == "hostage" )
        level waittill( "cam_hostage" );

    thread _id_CBA5();
    common_scripts\utility::flag_wait( "hostage_go" );
    thread maps\char_museum_code::h2_museum_prepare_exhibit_input( "hostage_go", "hostage_done", 2 );

    foreach ( var_1 in level._id_CA35["hostage"] )
        var_1 maps\_utility::ent_flag_set( "do_anim" );

    common_scripts\utility::array_thread( getentarray( "civ_hostage_1", "script_noteworthy" ), maps\_utility::delaythread, 5, maps\_utility::spawn_ai, 1 );
    common_scripts\utility::flag_wait( "hostage_done" );
    wait 1;
    maps\char_museum_code::_id_B50B( "camara_path_trainer", 35 );
}

_id_CBA5()
{
    var_0 = getvehiclenode( "camara_path_hostage", "targetname" );
    level.camera thread maps\_vehicle::vehicle_paths( var_0 );
    level.camera resumespeed( 0.5 );
    level.camera waittill( "reached_end_node" );
}

_id_CF99()
{
    if ( self.classname != "actor_ally_hero_soap_udt" && getdvar( "loc_japanese_sku" ) == "1" )
    {
        maps\_utility::magic_bullet_shield();
        self setsurfacetype( "default" );
    }

    maps\char_museum_code::_id_AF50( "hostage" );
    var_0 = self.anim_node;

    switch ( var_0.animation )
    {
        case "takedown_room1B_hostage":
            self._id_AFFD = "gravity";

            if ( isai( self ) )
                self.a.pose = "crouch";
        case "takedown_room1B_soldier":
            maps\char_museum_code::_id_CE56( var_0, 0.19 );
            break;
        case "hostage_chair_dive":
            self._id_AFFD = "gravity";
            break;
    }
}

_id_D04B()
{
    self endon( "panic_button" );
    self endon( "death" );

    while ( !maps\_utility::ent_flag_exist( "do_anim" ) )
        wait 0.05;

    maps\_utility::ent_flag_wait( "do_anim" );
    var_0 = self.anim_node;
    maps\char_museum_code::_id_AD0B( maps\_utility::getanim_generic( var_0.animation ), 1, 0, self.anim_speed );

    if ( isdefined( self._id_A95C ) )
        thread maps\_utility::play_sound_on_tag_endon_death( self._id_A95C );

    thread h2_museum_done_flag_parity( "hostage" );

    switch ( var_0.animation )
    {
        case "h2_museum_oilrig_hostage":
        case "h2_museum_oilrig_soap":
            thread _id_AD41( var_0.animation );
            break;
        case "hostage_chair_dive":
            thread _id_AD1B( var_0.animation );
            break;
        default:
            thread _id_B0D2( var_0.animation );
            break;
    }
}

_id_AD41( var_0 )
{
    self endon( "death" );

    if ( !isai( self ) )
        return;

    maps\char_museum_code::_id_C5C0( 0.39 );

    switch ( var_0 )
    {
        case "takedown_room1B_hostage":
            self.a.pose = "prone";
            break;
        case "takedown_room1B_soldier":
            self.a.pose = "crouch";
            break;
    }
}

_id_B0D2( var_0 )
{
    self endon( "death" );
    self endon( "do_anim" );
    self.current_anim = maps\_utility::getanim_generic( var_0 );
    thread maps\char_museum_code::_id_B42E();
    maps\char_museum_code::_id_B856( %hostage_chair_twitch2 );
    maps\char_museum_code::_id_B856( %hostage_chair_twitch );
    maps\char_museum_code::_id_B856( %hostage_chair_idle );
}

_id_AD1B( var_0 )
{
    self endon( "death" );
    self endon( "do_anim" );
    self.current_anim = maps\_utility::getanim_generic( var_0 );
    thread maps\char_museum_code::_id_B42E();
    maps\char_museum_code::_id_B856( %hostage_chair_ground_idle );

    if ( isai( self ) )
        self.a.pose = "prone";

    maps\char_museum_code::_id_B856( %hostage_chair_ground_idle );
    maps\char_museum_code::_id_B856( %hostage_chair_ground_idle );
    maps\char_museum_code::_id_B856( %hostage_chair_ground_idle );
}

_id_B4E1()
{
    level._id_CA35["trainer"] = [];
    common_scripts\utility::array_thread( getentarray( "ai_trainer", "script_noteworthy" ), maps\_utility::add_spawn_function, ::_id_B643 );
    common_scripts\utility::array_thread( getentarray( "ai_trainer", "script_noteworthy" ), maps\_utility::add_spawn_function, ::_id_CB72 );
}

_id_C965()
{
    thread _id_C11A();
    common_scripts\utility::flag_wait( "trainer_go" );
    thread maps\char_museum_code::h2_museum_prepare_exhibit_input( "trainer_go", "trainer_done", 1.5 );
    wait 2.5;

    foreach ( var_1 in level._id_CA35["trainer"] )
        var_1 maps\_utility::ent_flag_set( "do_anim" );

    common_scripts\utility::flag_wait( "trainer_done" );
    common_scripts\utility::array_thread( getentarray( "civ_trainer_1", "script_noteworthy" ), maps\_utility::delaythread, 0, maps\_utility::spawn_ai, 1 );
    wait 2;
    maps\char_museum_code::_id_B50B( "camara_path_arcadia" );
}

_id_C11A()
{
    var_0 = getvehiclenode( "camara_path_trainer", "targetname" );
    level.camera vehicle_teleport( var_0.origin, var_0.angles );
    level.camera thread maps\_vehicle::vehicle_paths( var_0 );

    if ( level.start_point == "trainer" )
    {
        level.camera vehicle_teleport( var_0.origin, var_0.angles );
        level.camera attachpath( var_0 );
        level.camera vehicle_setspeedimmediate( 0, 1000, 1000 );
    }

    level.camera resumespeed( 0.5 );
    level.camera waittill( "reached_end_node" );
}

_id_B643()
{
    maps\char_museum_code::_id_AF50( "trainer" );
    var_0 = self.anim_node;

    switch ( var_0.animation )
    {
        case "training_pushups_guy1":
            self.gun_remove = 1;
            maps\_utility::gun_remove();
            self.grenadeweapon = "fraggrenade";
            self.grenadeammo = 0;
            maps\char_museum_code::_id_CE56( var_0, 0.93 );
            var_1 = getent( "pushups_guy_light_origin", "targetname" );
            self _meth_848A( var_1.origin );
            break;
        case "parabolic_leaning_guy_idle_training":
            self.grenadeweapon = "fraggrenade";
            self.grenadeammo = 0;
            var_1 = getent( "leaning_guy_light_origin", "targetname" );
            self _meth_848A( var_1.origin );
            break;
        case "h2_museum_training_translator":
            self.cheat.attachheadlast = 1;
            self.gun_remove = 1;
            maps\_utility::gun_remove();
        case "h2_museum_training_soldier":
        case "h2_museum_training_foley":
            break;
    }
}

_id_CB72()
{
    self endon( "panic_button" );
    self endon( "death" );

    while ( !maps\_utility::ent_flag_exist( "do_anim" ) )
        wait 0.05;

    maps\_utility::ent_flag_wait( "do_anim" );
    var_0 = self.anim_node;
    maps\char_museum_code::_id_AD0B( maps\_utility::getanim_generic( var_0.animation ), 1, 0, self.anim_speed );
    thread h2_museum_done_flag_parity( "trainer" );

    switch ( var_0.animation )
    {
        case "h2_museum_training_translator":
        case "h2_museum_training_soldier":
        case "h2_museum_training_foley":
            break;
        default:
            thread maps\char_museum_code::_id_D00C( var_0.animation );
            break;
    }
}

_id_B642()
{
    level._id_CA35["arcadia"] = [];
    common_scripts\utility::array_thread( getentarray( "ai_arcadia", "script_noteworthy" ), maps\_utility::add_spawn_function, ::_id_BDE0 );
    common_scripts\utility::array_thread( getentarray( "ai_arcadia", "script_noteworthy" ), maps\_utility::add_spawn_function, ::_id_BF4B );
}

_id_C1EE()
{
    thread _id_C724();
    common_scripts\utility::flag_wait( "arcadia_go" );
    thread maps\char_museum_code::h2_museum_prepare_exhibit_input( "arcadia_go", "arcadia_done", 1.5 );
    wait 2;

    foreach ( var_1 in level._id_CA35["arcadia"] )
        var_1 maps\_utility::ent_flag_set( "do_anim" );

    common_scripts\utility::array_thread( getentarray( "civ_arcadia_1", "script_noteworthy" ), maps\_utility::delaythread, 2.5, maps\_utility::spawn_ai, 1 );
    common_scripts\utility::flag_wait( "arcadia_done" );
    wait 1;
    level._id_CBB2 fadeovertime( 3 );
    level._id_CBB2.alpha = 1;
}

_id_C724()
{
    var_0 = getvehiclenode( "camara_path_arcadia", "targetname" );
    level.camera vehicle_teleport( var_0.origin, var_0.angles );
    level.camera thread maps\_vehicle::vehicle_paths( var_0 );

    if ( level.start_point == "arcadia" )
    {
        level.camera vehicle_teleport( var_0.origin, var_0.angles );
        level.camera attachpath( var_0 );
        level.camera vehicle_setspeedimmediate( 0, 1000, 1000 );
    }

    level.camera resumespeed( 0.5 );
    level.camera waittill( "reached_end_node" );
}

_id_BDE0()
{
    switch ( self.animation )
    {
        case "coup_guard2_jeera":
            self._id_D547 = 0.35;
            self.animation = "coup_guard2_jeera";
            break;
        case "coup_guard2_jeerb":
            self._id_D547 = 0.05;
            self.animation = "coup_guard2_jeera";
            break;
        case "coup_guard2_jeerc":
            self._id_D547 = 0.85;
            self.animation = "coup_guard2_jeera";
            break;
        case "coup_guard1_jeer":
            self._id_D547 = 0.6;
            self.animation = "coup_guard2_jeera";
            break;
    }

    maps\char_museum_code::_id_AF50( "arcadia" );
    var_0 = self.anim_node;

    switch ( self.animation )
    {
        case "h2_museum_wolverines_attacker":
        case "h2_museum_wolverines_defender":
            self.animname = "generic";
            var_0 maps\_anim::anim_first_frame_solo( self, self.animation );
            self.gun_remove = 1;
            maps\_utility::gun_remove();
            self.anim_speed = level._id_BEB2 * 0.5;
            self.cheat.attachheadlast = 1;
            break;
        default:
            maps\char_museum_code::_id_CE56( var_0, self._id_D547 );
            break;
    }
}

_id_BF4B()
{
    self endon( "panic_button" );
    self endon( "death" );

    while ( !maps\_utility::ent_flag_exist( "do_anim" ) )
        wait 0.05;

    maps\_utility::ent_flag_wait( "do_anim" );
    var_0 = self.anim_node;

    if ( var_0.animation == "h2_museum_wolverines_defender" || var_0.animation == "h2_museum_wolverines_attacker" )
        var_0 thread maps\_anim::anim_single_solo( self, var_0.animation );
    else
        maps\char_museum_code::_id_AD0B( maps\_utility::getanim_generic( var_0.animation ), 1, 0, self.anim_speed );

    switch ( var_0.animation )
    {
        case "h2_museum_wolverines_attacker":
        case "h2_museum_wolverines_defender":
            var_1 = maps\_utility::getanim_generic( var_0.animation );
            waitframe();
            self _meth_83D4( var_1, self.anim_speed );
            thread _id_C723( var_0.animation );
            var_2 = getanimlength( var_1 );
            var_2 = var_2 / self.anim_speed - 1;
            wait(var_2);

            foreach ( var_4 in level._id_CA35["arcadia"] )
                var_4 maps\_utility::ent_flag_clear( "do_anim" );

            common_scripts\utility::flag_set( "arcadia_done" );
            break;
        default:
            thread maps\char_museum_code::_id_D00C( var_0.animation );
            break;
    }
}

_id_C723( var_0 )
{
    self endon( "panic_button" );
    self endon( "death" );

    if ( !isai( self ) )
        return;

    switch ( var_0 )
    {
        case "h2_museum_wolverines_defender":
            maps\char_museum_code::_id_C5C0();
            self.ragdoll_immediate = 1;
            break;
        case "h2_museum_wolverines_attacker":
            maps\char_museum_code::_id_C5C0();
            self.a.pose = "crouch";
            break;
    }
}

_id_D43D()
{
    thread maps\_credits::playcredits();
    wait 415;
    thread maps\_utility::music_stop( 4 );
    wait 10;
    maps\_utility::nextmission();
    level waittill( "never" );
}

_id_BB4D()
{
    maps\char_museum_code::_id_AB7E();
    common_scripts\utility::flag_wait( "museum_ready" );
    var_0 = getent( "room1", "script_noteworthy" );
    var_0 maps\char_museum_code::_id_B194();
    thread maps\_introscreen::_id_CC2A();
    maps\_utility::set_console_status();
    wait 3;
    common_scripts\utility::array_call( level.players, ::freezecontrols, 0 );
    maps\char_museum_code::_id_AB7B( 1.5 );
    level waittill( "never" );
}

_id_B456()
{
    level notify( "new_room_anim_go" );
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "af_caves_go" );
    maps\_utility::add_func( maps\char_museum_code::_id_CD29, "af_caves" );
    level maps\_utility::add_abort( maps\_utility::waittill_msg, "new_room_anim_go" );
    thread maps\_utility::do_wait();
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "dc_burning_go" );
    maps\_utility::add_func( maps\char_museum_code::_id_CD29, "dc_burning" );
    level maps\_utility::add_abort( maps\_utility::waittill_msg, "new_room_anim_go" );
    thread maps\_utility::do_wait();
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "airport_go" );
    maps\_utility::add_func( maps\char_museum_code::_id_CD29, "airport" );
    level maps\_utility::add_abort( maps\_utility::waittill_msg, "new_room_anim_go" );
    thread maps\_utility::do_wait();
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "cliffhanger_go" );
    maps\_utility::add_func( maps\char_museum_code::_id_CD29, "cliffhanger" );
    level maps\_utility::add_abort( maps\_utility::waittill_msg, "new_room_anim_go" );
    thread maps\_utility::do_wait();
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "favela_go" );
    maps\_utility::add_func( maps\char_museum_code::_id_CD29, "favela" );
    level maps\_utility::add_abort( maps\_utility::waittill_msg, "new_room_anim_go" );
    thread maps\_utility::do_wait();
}

_id_D12E()
{
    level notify( "new_room_anim_go" );
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "oilrig_go" );
    maps\_utility::add_func( maps\char_museum_code::_id_CD29, "oilrig" );
    level maps\_utility::add_abort( maps\_utility::waittill_msg, "new_room_anim_go" );
    thread maps\_utility::do_wait();
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "estate_go" );
    maps\_utility::add_func( maps\char_museum_code::_id_CD29, "estate" );
    level maps\_utility::add_abort( maps\_utility::waittill_msg, "new_room_anim_go" );
    thread maps\_utility::do_wait();
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "hostage_go" );
    maps\_utility::add_func( maps\char_museum_code::_id_CD29, "hostage" );
    level maps\_utility::add_abort( maps\_utility::waittill_msg, "new_room_anim_go" );
    thread maps\_utility::do_wait();
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "arcadia_go" );
    maps\_utility::add_func( maps\char_museum_code::_id_CD29, "arcadia" );
    level maps\_utility::add_abort( maps\_utility::waittill_msg, "new_room_anim_go" );
    thread maps\_utility::do_wait();
    maps\_utility::add_wait( common_scripts\utility::flag_wait, "trainer_go" );
    maps\_utility::add_func( maps\char_museum_code::_id_CD29, "trainer" );
    level maps\_utility::add_abort( maps\_utility::waittill_msg, "new_room_anim_go" );
    thread maps\_utility::do_wait();
}

_id_D341()
{
    setsaveddvar( "hud_drawHUD", "0" );
    setsaveddvar( "ammoCounterHide", "1" );
    setsaveddvar( "actionSlotsHide", "1" );
    setsaveddvar( "compass", "0" );
    setsaveddvar( "g_friendlyNameDist", "0" );
    common_scripts\utility::trigger_off( "free_roam_look_ats", "targetname" );
    var_0 = maps\_hud_util::create_client_overlay_custom_size( "credits_side_bar", 0.45, 600, 480 );
    var_0.alignx = "left";
    var_0.horzalign = "left";
    var_0.x = -280;
    level._id_CBB2 = maps\_hud_util::create_client_overlay( "black", 1 );

    if ( level._id_AC38 != "credits_1" )
    {
        _id_ADA9();
        thread maps\_utility::music_loop( "mus_main_menu_ending_credits", 122, 1 );
    }
    else
        level.black_overlay common_scripts\utility::delaycall( 0.5, ::destroy );

    level.player allowcrouch( 0 );
    level.player allowprone( 0 );
    level.player takeallweapons();
    maps\_utility::add_global_spawn_function( "axis", maps\char_museum_code::_id_C67A );
    maps\_utility::add_global_spawn_function( "allies", maps\char_museum_code::_id_C67A );
    maps\_utility::add_global_spawn_function( "neutral", maps\char_museum_code::_id_C67A );
    level.camera = maps\_vehicle::spawn_vehicle_from_targetname_and_drive( "credits_camera" );
    level.player playerlinkto( level.camera, undefined, 1, 0, 0, 0, 0, 0 );
    level.player common_scripts\utility::delaycall( 0.1, ::freezecontrols, 1 );
    common_scripts\utility::noself_delaycall( 1, ::setsaveddvar, "cg_fov", 45 );
    var_1 = getentarray( "spawntrig", "targetname" );
    common_scripts\utility::array_thread( var_1, maps\char_museum_code::_id_C2DD );
    _id_BDD6();
    thread _id_D5BD();
}

_id_ADA9()
{

}

_id_BDD6()
{
    common_scripts\utility::array_thread( getentarray( "civ_talkers", "script_noteworthy" ), maps\_utility::add_spawn_function, maps\char_museum_code::_id_C764 );
    common_scripts\utility::array_thread( getentarray( "room1", "targetname" ), maps\char_museum_code::_id_B319 );
    common_scripts\utility::array_thread( getentarray( "room2", "targetname" ), maps\char_museum_code::_id_B319 );
    common_scripts\utility::array_thread( getentarray( "civilians", "targetname" ), maps\char_museum_code::_id_CAF1 );
    common_scripts\utility::array_thread( getentarray( "civilians", "targetname" ), maps\_utility::add_spawn_function, maps\char_museum_code::_id_ACA7 );
    common_scripts\utility::array_thread( getentarray( "civ_talkers", "script_noteworthy" ), maps\char_museum_code::_id_CAF1 );
    _id_BF19();
    _id_CDDA();
    _id_C43A();
    _id_CFCF();
    _id_C751();
    _id_B579();
    _id_BCCA();
    _id_D482();
    _id_B4E1();
    _id_B642();
    thread maps\_utility::flag_set_delayed( "museum_ready", 0.05 );
    thread maps\char_museum_code::museum_chicken();
    common_scripts\utility::array_thread( getentarray( "lantern_animate", "targetname" ), maps\char_museum_code::h2_wh_animated_lantern );
    h2_museum_coffee_guys();
}

_id_B967()
{
    _id_AC65::init();
    precachestring( &"CHAR_MUSEUM_LINE1" );
    precachestring( &"CHAR_MUSEUM_LINE3" );
    precachestring( &"CHAR_MUSEUM_LINE4" );
    maps\_utility::add_global_spawn_function( "axis", maps\char_museum_code::_id_C67A );
    maps\_utility::add_global_spawn_function( "allies", maps\char_museum_code::_id_C67A );
    maps\_utility::add_global_spawn_function( "neutral", maps\char_museum_code::_id_C67A );
    common_scripts\utility::array_thread( level.players, maps\char_museum_code::_id_CDE3 );
    var_0 = getentarray( "spawntrig", "targetname" );
    common_scripts\utility::array_thread( var_0, maps\char_museum_code::_id_C2DD );
    _id_BDD6();
    common_scripts\utility::array_thread( getentarray( "panic_button", "targetname" ), maps\char_museum_code::_id_AE75 );
}

_id_D1BD()
{
    _id_D341();
    common_scripts\utility::flag_wait( "museum_ready" );
    wait 0.05;
    var_0 = getent( "room1", "script_noteworthy" );
    var_0 maps\char_museum_code::_id_B194();
}

_id_C32F()
{
    _id_D341();
    common_scripts\utility::flag_wait( "museum_ready" );
    wait 0.05;
    var_0 = getent( "room1", "script_noteworthy" );
    var_0 maps\char_museum_code::_id_B194();
}

_id_CF43()
{
    _id_D341();
    common_scripts\utility::flag_wait( "museum_ready" );
    wait 0.05;
    var_0 = getent( "room1", "script_noteworthy" );
    var_0 maps\char_museum_code::_id_B194();
    common_scripts\utility::array_thread( getentarray( "room1_civ_talkers", "targetname" ), maps\_utility::spawn_ai, 1 );
}

_id_AFAB()
{
    _id_D341();
    common_scripts\utility::flag_wait( "museum_ready" );
    wait 0.05;
    var_0 = getent( "room1", "script_noteworthy" );
    var_0 maps\char_museum_code::_id_B194();
    common_scripts\utility::array_thread( getentarray( "room1_civ_talkers", "targetname" ), maps\_utility::spawn_ai, 1 );
}

_id_CE02()
{
    _id_D341();
    common_scripts\utility::flag_wait( "museum_ready" );
    wait 0.05;
    var_0 = getent( "room1", "script_noteworthy" );
    var_0 maps\char_museum_code::_id_B194();
    common_scripts\utility::array_thread( getentarray( "room1_civ_talkers", "targetname" ), maps\_utility::spawn_ai, 1 );
}

_id_D5CC()
{
    _id_D341();
    common_scripts\utility::flag_wait( "museum_ready" );
    wait 0.05;
    var_0 = getent( "room1", "script_noteworthy" );
    var_0 maps\char_museum_code::_id_B194();
    common_scripts\utility::array_thread( getentarray( "room1_civ_talkers", "targetname" ), maps\_utility::spawn_ai, 1 );
}

_id_C6B0()
{
    _id_D341();
    common_scripts\utility::flag_wait( "museum_ready" );
    wait 0.05;
    common_scripts\utility::array_thread( getentarray( "room3_civ_talkers", "targetname" ), maps\_utility::spawn_ai, 1 );
}

_id_B70E()
{
    _id_D341();
    common_scripts\utility::flag_wait( "museum_ready" );
    wait 0.05;
}

_id_C433()
{
    _id_D341();
    common_scripts\utility::flag_wait( "museum_ready" );
    wait 0.05;
    var_0 = getent( "room2", "script_noteworthy" );
    var_0 maps\char_museum_code::_id_B194();
    common_scripts\utility::array_thread( getentarray( "room2_civ_talkers", "targetname" ), maps\_utility::spawn_ai, 1 );
}

_id_C5F8()
{
    _id_D341();
    common_scripts\utility::flag_wait( "museum_ready" );
    wait 0.05;
    var_0 = getent( "room2", "script_noteworthy" );
    var_0 maps\char_museum_code::_id_B194();
    common_scripts\utility::array_thread( getentarray( "room2_civ_talkers", "targetname" ), maps\_utility::spawn_ai, 1 );
}

_id_B024()
{
    _id_D341();
    common_scripts\utility::flag_wait( "museum_ready" );
    wait 0.05;
    var_0 = getent( "room2", "script_noteworthy" );
    var_0 maps\char_museum_code::_id_B194();
    common_scripts\utility::array_thread( getentarray( "room2_civ_talkers", "targetname" ), maps\_utility::spawn_ai, 1 );
    maps\char_museum_code::_id_B50B( "camara_path_hostage_mid", 500, 0, 0.05 );
    level.camera resumespeed( 5 );
    wait 3.5;
    maps\char_museum_code::_id_B50B( "camara_path_hostage", 75, 0 );
    level notify( "cam_hostage" );
}

_id_CBFD()
{
    _id_D341();
    common_scripts\utility::flag_wait( "museum_ready" );
    wait 0.05;
    var_0 = getent( "room2", "script_noteworthy" );
    var_0 maps\char_museum_code::_id_B194();
    common_scripts\utility::array_thread( getentarray( "room2_civ_talkers", "targetname" ), maps\_utility::spawn_ai, 1 );
}

_id_CF0B()
{
    _id_D341();
    common_scripts\utility::flag_wait( "museum_ready" );
    wait 0.05;
    var_0 = getent( "room2", "script_noteworthy" );
    var_0 maps\char_museum_code::_id_B194();
    common_scripts\utility::array_thread( getentarray( "room2_civ_talkers", "targetname" ), maps\_utility::spawn_ai, 1 );
}

_id_B500()
{
    level._id_CBB2 = maps\_hud_util::create_client_overlay( "black", 1 );
    thread maps\_utility::music_loop( "mus_main_menu_ending_credits", 600, 1 );
    level.player allowcrouch( 0 );
    level.player allowprone( 0 );
    level.player takeallweapons();
    level.player disableweapons();
    level.player freezecontrols( 1 );
}

_id_D5BD()
{
    _func_2F1( 0, "xy", 0, 0 );
    thread display_case_hide();
    level.credits_speed = 36.2;
    _func_320();
    thread maps\_credits::playcredits();

    if ( level._id_AC38 == "credits_1" )
    {
        wait 3.5;
        wait 4;
    }

    thread fade_from_black();
    wait 290;
    wait 12;
    level.credits_speed = 5;
    common_scripts\utility::flag_set( "atvi_credits_go" );
    wait 100;
    thread maps\_utility::music_stop( 4 );
    wait 8;

    if ( level._id_AC38 == "credits_1" )
        common_scripts\utility::flag_set( "af_chase_nextmission" );
    else
        maps\_utility::nextmission();

    soundscripts\_snd::snd_message( "stop_credits_mix" );
    setdvar( "credits_active", 0 );
}

fade_from_black()
{
    wait 9;
    common_scripts\utility::flag_set( "fade_from_black" );
    wait 1;
    level._id_CBB2 fadeovertime( 2 );
    level._id_CBB2.alpha = 0;
}

h2_estate_diorama_rope_setup()
{
    self endon( "death" );
    var_0 = spawn( "script_model", self.origin );
    var_0 setmodel( "h2_ending_rappel_rope" );
    var_0.animname = "model";
    var_0 maps\_utility::assign_animtree();
    level.rope = var_0;
    var_1 = common_scripts\utility::getstruct( "bh_node", "targetname" );
    var_1 maps\_anim::anim_first_frame_solo( var_0, "h2_museum_estate_rope" );
}

h2_estate_diorama_rope_think( var_0 )
{
    self endon( "death" );
    var_1 = level.rope;
    var_2 = common_scripts\utility::getstruct( "bh_node", "targetname" );
    var_2 thread maps\_anim::anim_single_solo( var_1, "h2_museum_estate_rope" );
    waitframe();
    var_1 _meth_83D4( var_1 maps\_utility::getanim( "h2_museum_estate_rope" ), var_0 );
}

h2_shepherd_gun_animation()
{
    self endon( "death" );
    self endon( "panic_button" );
    common_scripts\utility::flag_clear( "af_caves_done" );
    var_0 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    var_0 setmodel( "h2_weapon_colt_anaconda_animated" );
    var_0.animname = "model";
    var_0 maps\_utility::assign_animtree();
    var_1 = common_scripts\utility::getstruct( "auto2889", "targetname" );
    thread monitor_shepherd_death( var_0 );
    thread monitor_shepherd_panic( var_0 );
    var_1 maps\_anim::anim_first_frame_solo( var_0, "h2_museum_afchase_gun" );
    common_scripts\utility::flag_wait_any( "af_caves_go", "shepherd_anim" );
    var_1 thread maps\_anim::anim_single_solo( var_0, "h2_museum_afchase_gun" );
    var_0 maps\_anim::anim_set_rate_internal( "h2_museum_afchase_gun", level._id_BEB2 * 1.6 );
    common_scripts\utility::flag_wait( "af_caves_done" );
    var_0 stopanimscripted();
}

monitor_shepherd_death( var_0 )
{
    self endon( "panic_button" );
    self waittill( "death" );
    var_0 delete();

    if ( isdefined( self ) )
        maps\_utility::gun_recall();
}

monitor_shepherd_panic( var_0 )
{
    self endon( "death" );
    self waittill( "panic_button" );
    var_0 delete();
}

display_case_hide()
{
    var_0 = getglassarray( "display_case_real_glass" );
    var_1 = getentarray( "display_case_fake_glass", "targetname" );

    foreach ( var_3 in var_0 )
        deleteglass( var_3 );

    var_5 = common_scripts\utility::getclosest( ( 533.0, 35.0, -287.0 ), getentarray( "weapon_riotshield", "classname" ) );
    var_5 hide();
    _func_31C( 1 );
    common_scripts\utility::flag_wait( "dc_burning_done" );

    foreach ( var_3 in var_1 )
        var_3 show();

    var_5 show();
    _func_31B( 1 );
    common_scripts\utility::flag_wait( "arcadia_go" );
    _func_31C( 1 );

    foreach ( var_3 in var_1 )
        var_3 hide();
}

h2_museum_coffee_guys()
{
    foreach ( var_1 in getentarray( "ai_cliffhanger", "script_noteworthy" ) )
    {
        if ( var_1.animation == "guardA_standing_cold_idle" || var_1.animation == "guardB_standing_cold_idle" )
            var_1 maps\_utility::add_spawn_function( ::h2_museum_coffee_guys_thread );
    }
}

h2_museum_coffee_guys_thread()
{
    var_0 = self;

    if ( var_0.animation == "guardA_standing_cold_idle" )
        var_1 = "a";
    else
        var_1 = "b";

    var_0 attach( "cs_coffeemug02", "tag_inhand" );
    var_0 h2_wait_for_button_or_death();

    if ( !isdefined( var_0 ) )
        return;

    var_0 detach( "cs_coffeemug02", "tag_inhand" );

    if ( common_scripts\utility::flag( "mugs_dropped_" + var_1 ) )
        return;

    var_2 = spawn( "script_model", var_0 gettagorigin( "tag_inhand" ) );
    var_2 setmodel( "cs_coffeemug02" );
    var_2 physicslaunchclient();
    common_scripts\utility::flag_set( "mugs_dropped_" + var_1 );
}

h2_wait_for_button_or_death()
{
    self endon( "death" );
    level waittill( "panic_button" );
    return 0;
}

h2_museum_attach_gun_thread( var_0, var_1 )
{
    self attach( var_0, "tag_weapon_right" );
    var_2 = h2_wait_for_button_or_death();

    if ( !_func_2A5( self ) )
    {
        self detach( var_0, "tag_weapon_right" );

        if ( isdefined( var_1 ) && !isdefined( var_2 ) )
            maps\_utility::gun_recall();
    }
}

ramirez_jukebox()
{
    common_scripts\utility::flag_wait( "museum_ready" );
    wait 4;
    var_0 = getent( "ramirez_jukebox", "targetname" );
    var_0 makeusable();

    for (;;)
    {
        var_0 waittill( "trigger" );
        var_1 = randomint( 37 );
        var_0 maps\_utility::play_sound_on_entity( "museum_ramirez_ee_" + var_1 );
    }
}
