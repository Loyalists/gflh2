// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    precacheshader( "h1_hud_tutorial_blur" );
    precacheshader( "h1_hud_tutorial_border" );
    precachestring( &"SCRIPT_PLATFORM_CHEAT_USETOSLOWMO" );
    precacheshellshock( "chaplincheat" );
    level.vision_cheat_enabled = 0;
    setsaveddvar( "using_vision_cheat", 0 );
    level._id_AE18 = [];
    level._id_BC8C = [];
    level._id_B06E = [];
    level._id_B0DB = getdvar( "bg_bobAmplitudeStanding" );
    level._id_C4E5 = 0;
    level.invisibleman_body = "h2_invisibleman_body";
    level.invisibleman_head = "h2_invisibleman_head";
    precachemodel( level.invisibleman_body );
    precachemodel( level.invisibleman_head );
    level._id_AE66 = 0;
    level.sf = spawnstruct();

    if ( getdvar( "ui_char_museum_mode" ) != "free" )
        level.sf.badguyteams = [ "axis", "team3" ];
    else
        level.sf.badguyteams = [ "axis", "allies", "neutral" ];

    thread _id_BBA0();
    thread _id_BF57();
    thread _id_B09E();
    thread _id_C969();
    thread _id_C5B6();
    thread _id_C5E7();
    thread _id_B190::init();
    add_specialfeatures_function( ::_id_D017 );

    if ( !isdefined( level._effect ) )
        level._effect = [];

    level._effect["grain_test"] = loadfx( "fx/misc/grain_test" );
    common_scripts\utility::flag_init( "has_cheated" );
    level._id_C51C["bw"] = 0;
    level._id_C51C["invert"] = 0;
    level._id_C51C["contrast"] = 0;
    level._id_C51C["chaplin"] = 0;
    level._id_C51C["edge"] = 0;
    slowmo_system_init();
    thread _id_B254();
    common_scripts\utility::flag_init( "disable_slowmo_cheat" );

    // if ( level.script == "airport" )
    //     return;

    level.player thread _id_B9E1();
}

cheat_init()
{
    if ( !isdefined( self.cheat ) )
        self.cheat = spawnstruct();
}

_id_B254()
{
    _id_CD26();

    for (;;)
    {
        if ( issaverecentlyloaded() )
            _id_CD26();

        wait 0.1;
    }
}

_id_CD26()
{
    for ( var_0 = 0; var_0 < level._id_B06E.size; var_0++ )
        setdvar( level._id_B06E[var_0], level._id_AE18[level._id_B06E[var_0]] );

    if ( !isdefined( level.credits_active ) || !level.credits_active )
    {
        setdvar( "credits_active", "0" );
        setdvar( "credits_load", "0" );
    }
}

_id_BDFA( var_0 )
{
    var_1 = getdvarint( var_0, 0 ) && getdvar( "arcademode" ) != "1" && getdvar( "credits_active" ) != "1";
    return var_1;
}

_id_CE65( var_0, var_1 )
{
    setdynamicdvar( var_0, 0 );
    level._id_AE18[var_0] = _id_BDFA( var_0 );
    level._id_BC8C[var_0] = var_1;

    if ( level._id_AE18[var_0] )
        [[ var_1 ]]( level._id_AE18[var_0] );
}

_id_CEBB( var_0 )
{
    var_1 = _id_BDFA( var_0 );

    if ( level._id_AE18[var_0] == var_1 )
        return;

    if ( var_1 )
        common_scripts\utility::flag_set( "has_cheated" );

    level._id_AE18[var_0] = var_1;
    thread [[ level._id_BC8C[var_0] ]]( var_1 );
    setomnvar( "ui_refreshcheathud", var_1 );
}

_id_B9E1()
{
    level waittill( "load_finished" );
    _id_CE65( "sf_use_bw", ::_id_C65F );
    _id_CE65( "sf_use_slowmo", ::_id_CED6 );
    _id_CE65( "sf_use_chaplin", ::_id_B005 );
    _id_CE65( "sf_use_ignoreammo", ::_id_D523 );
    _id_CE65( "sf_use_clustergrenade", ::_id_B12E );
    _id_CE65( "sf_use_tire_explosion", ::_id_A956 );
    _id_CE65( "sf_use_ragdoll_mode", ::_id_AF83 );
    _id_CE65( "sf_use_pomegrenade_mode", ::_id_C4A9 );
    _id_CE65( "sf_use_pineapple_mode", ::_id_B61A );
    _id_CE65( "sf_use_wolf_mode", ::_id_C23F );
    _id_CE65( "sf_use_football_mode", ::_id_CB85 );
    _id_CE65( "sf_use_pinata_mode", ::_id_D376 );
    _id_CE65( "sf_use_edge_mode", ::edge_mode_update );
    _id_CE65( "sf_use_attraction_mode", _id_B190::_id_B34A );
    _id_CE65( "sf_use_desperation_mode", _id_B190::_id_B13A );
    _id_CE65( "sf_use_fortitude_mode", _id_B190::_id_BB56 );
    _id_CE65( "sf_use_greenberet_mode", _id_B190::greenberet_mode_update );
    _id_CE65( "sf_use_martyr_mode", _id_B190::_id_D3B3 );
    _id_CE65( "sf_use_polterghost_mode", _id_B190::_id_D40C );
    _id_CE65( "sf_use_precision_mode", _id_B190::_id_D3FC );
    _id_CE65( "sf_use_starvation_mode", _id_B190::_id_D20D );
    level._id_B06E = getarraykeys( level._id_AE18 );

    if ( _id_AD40() )
        common_scripts\utility::flag_set( "has_cheated" );

    for (;;)
    {
        for ( var_0 = 0; var_0 < level._id_B06E.size; var_0++ )
            _id_CEBB( level._id_B06E[var_0] );

        if ( getdvar( "credits_active" ) == "1" )
            break;

        wait 0.05;
    }
}

_id_BBA0()
{
    precachemodel( "com_junktire" );
    level._id_B72B = "com_junktire";
    level._id_B5C6 = 0;
    level._id_B69E = [];
    level._id_C326 = 90;
    level._id_C090 = 15;
}

_id_A956( var_0 )
{
    if ( var_0 )
        level._id_B5C6 = 1;
    else
        level._id_B5C6 = 0;
}

_id_B12E( var_0 )
{
    if ( var_0 )
        level.player thread _id_BF3B();
    else
        level notify( "end_cluster_grenades" );
}

_id_BF3B()
{
    level endon( "end_cluster_grenades" );

    for (;;)
    {
        self waittill( "grenade_fire", var_0, var_1 );

        if ( isdefined( var_0._id_B7F4 ) && var_0._id_B7F4 )
            continue;

        if ( var_1 == "fraggrenade" || var_1 == level._id_C8B7 )
            var_0 thread _id_B843( "fraggrenade" );
    }
}

_id_B843( var_0 )
{
    self endon( "timeout" );
    var_1 = self.origin;
    thread maps\_utility::timeout( 8 );
    self waittill( "explode", var_2 );
    var_1 = var_2 + ( 0.0, 0.0, 5.0 );
    var_3 = 8;

    for ( var_4 = 0; var_4 < var_3; var_4++ )
    {
        var_5 = _id_D158();
        var_6 = 1.5 + var_4 / 6 + randomfloat( 0.1 );
        var_7 = magicgrenademanual( var_0, var_1, var_5, var_6, level.player );
        var_7._id_B7F4 = 1;
    }
}

_id_D158()
{
    var_0 = randomfloat( 360 );
    var_1 = randomfloatrange( 65, 85 );
    var_2 = sin( var_1 );
    var_3 = cos( var_1 );
    var_4 = cos( var_0 ) * var_3;
    var_5 = sin( var_0 ) * var_3;
    var_6 = randomfloatrange( 400, 600 );
    var_7 = ( var_4, var_5, var_2 ) * var_6;
    return var_7;
}

_id_D523( var_0 )
{
    if ( level.script == "ac130" )
        return;

    if ( var_0 )
        setsaveddvar( "player_sustainAmmo", 1 );
    else
        setsaveddvar( "player_sustainAmmo", 0 );
}

_id_C57D( var_0 )
{
    if ( var_0 )
        level._id_C51C["contrast"] = 1;
    else
        level._id_C51C["contrast"] = 0;

    _id_B858();
}

_id_C65F( var_0 )
{
    if ( var_0 )
        level._id_C51C["bw"] = 1;
    else
        level._id_C51C["bw"] = 0;

    _id_B858();
}

_id_B420( var_0 )
{
    if ( var_0 )
        level._id_C51C["invert"] = 1;
    else
        level._id_C51C["invert"] = 0;

    _id_B858();
}

_id_B858( var_0 )
{
    if ( level.script == "ac130" )
        return;

    if ( isdefined( var_0 ) )
        var_1 = var_0;
    else
        var_1 = 0;

    var_2 = "";

    if ( level._id_C51C["bw"] )
        var_2 += "_bw";

    if ( level._id_C51C["invert"] )
    {
        var_2 += "_invert";

        if ( isdefined( level._id_C8CB ) )
            var_2 += level._id_C8CB;
    }

    if ( level._id_C51C["contrast"] )
    {
        var_2 += "_contrast";

        if ( isdefined( level._id_C00D ) )
            var_2 += level._id_C00D;
    }

    if ( level._id_C51C["chaplin"] )
        var_2 = "sepia";

    if ( level._id_C51C["edge"] )
    {
        var_2 = "edge";
        setsaveddvar( "r_useCheatPostFX", 1 );
    }
    else
        setsaveddvar( "r_useCheatPostFX", 0 );

    if ( var_2 != "" )
    {
        level.vision_cheat_enabled = 1;
        setsaveddvar( "using_vision_cheat", 1 );

        if ( var_2 == "edge" || var_2 == "sepia" )
            visionsetnaked( var_2, var_1 );
        else
            visionsetnaked( "cheat" + var_2, var_1 );
    }
    else
    {
        level.vision_cheat_enabled = 0;
        setsaveddvar( "using_vision_cheat", 0 );
        maps\_utility::set_vision_set( level.lvl_visionset, var_1 );
    }
}

slowmo_system_init()
{
    level.slowmo = spawnstruct();
    slowmo_system_defaults();
    notifyoncommand( "_cheat_player_press_slowmo", "+melee" );
    notifyoncommand( "_cheat_player_press_slowmo", "+melee_breath" );
    notifyoncommand( "_cheat_player_press_slowmo", "+melee_zoom" );
}

slowmo_system_defaults()
{
    level.slowmo.lerp_time_in = 0.0;
    level.slowmo.lerp_time_out = 0.25;
    level.slowmo.speed_slow = 0.4;
    level.slowmo.speed_norm = 1.0;
}

_id_C993()
{
    return 1;
}

_id_CF08()
{
    level endon( "disable_slowmo" );
    common_scripts\utility::flag_wait( "introscreen_complete" );

    if ( level._id_C4E5 != 0 )
    {
        level._id_C4E5 = 0;
        return;
    }

    if ( level.console )
        var_0 = 5;
    else
        var_0 = 6;

    level._id_C4E5 = 1;
    var_1 = 180;
    level.cheat_slowmo_hud = spawnstruct();
    level.cheat_slowmo_hud.myhintbackerblur = maps\_hud_util::createicon( "h1_hud_tutorial_blur", 400, 25 );
    level.cheat_slowmo_hud.myhintbackerbordertop = maps\_hud_util::createicon( "h1_hud_tutorial_border", 400, 1 );
    level.cheat_slowmo_hud.myhintbackerborderbottom = maps\_hud_util::createicon( "h1_hud_tutorial_border", 400, 1 );
    level.cheat_slowmo_hud.myhintbackerblur maps\_hud_util::setpoint( "TOP", undefined, 0, var_1 );
    level.cheat_slowmo_hud.myhintbackerblur.sort = 1;
    level.cheat_slowmo_hud.myhintbackerblur.hidewheninmenu = 1;
    level.cheat_slowmo_hud.myhintbackerblur.hidewhendead = 1;
    level.cheat_slowmo_hud.myhintbackerblur.alpha = 0.9;
    level.cheat_slowmo_hud.myhintbackerbordertop maps\_hud_util::setpoint( "TOP", undefined, 0, var_1 );
    level.cheat_slowmo_hud.myhintbackerbordertop.sort = 1;
    level.cheat_slowmo_hud.myhintbackerbordertop.hidewheninmenu = 1;
    level.cheat_slowmo_hud.myhintbackerbordertop.hidewhendead = 1;
    level.cheat_slowmo_hud.myhintbackerbordertop.alpha = 0.05;
    level.cheat_slowmo_hud.myhintbackerborderbottom maps\_hud_util::setpoint( "TOP", undefined, 0, var_1 + 24 );
    level.cheat_slowmo_hud.myhintbackerborderbottom.sort = 1;
    level.cheat_slowmo_hud.myhintbackerborderbottom.hidewheninmenu = 1;
    level.cheat_slowmo_hud.myhintbackerborderbottom.hidewhendead = 1;
    level.cheat_slowmo_hud.myhintbackerborderbottom.alpha = 0.05;
    level.cheat_slowmo_hud.myhintstring = maps\_hud_util::createfontstring( "timer", 0.5 );
    level.cheat_slowmo_hud.myhintstring.hidewheninmenu = 1;
    level.cheat_slowmo_hud.myhintstring maps\_hud_util::setpoint( "TOP", undefined, 0, var_1 + var_0 );
    level.cheat_slowmo_hud.myhintstring.sort = 0.5;
    level.cheat_slowmo_hud.myhintstring settext( &"SCRIPT_PLATFORM_CHEAT_USETOSLOWMO" );

    for ( var_2 = 0; var_2 < 100; var_2++ )
    {
        if ( level._id_C4E5 != 1 )
            break;

        wait 0.1;
    }

    level._id_C4E5 = 0;
    level.cheat_slowmo_hud.myhintbackerblur fadeovertime( 0.5 );
    level.cheat_slowmo_hud.myhintbackerblur.alpha = 0;
    level.cheat_slowmo_hud.myhintbackerbordertop fadeovertime( 0.5 );
    level.cheat_slowmo_hud.myhintbackerbordertop.alpha = 0;
    level.cheat_slowmo_hud.myhintbackerborderbottom fadeovertime( 0.5 );
    level.cheat_slowmo_hud.myhintbackerborderbottom.alpha = 0;
    level.cheat_slowmo_hud.myhintstring fadeovertime( 0.5 );
    level.cheat_slowmo_hud.myhintstring.alpha = 0;
    wait 0.5;
    level.cheat_slowmo_hud.myhintbackerblur destroy();
    level.cheat_slowmo_hud.myhintbackerbordertop destroy();
    level.cheat_slowmo_hud.myhintbackerborderbottom destroy();
    level.cheat_slowmo_hud.myhintstring destroy();
}

_id_CED6( var_0 )
{
    level._id_C58A = common_scripts\utility::ter_op( var_0, 1, 0 );

    if ( level._id_C58A )
    {
        level.slowmo thread _id_B3AA();
        level.player allowmelee( 0 );
        thread _id_CF08();
    }
    else
    {
        level notify( "disable_slowmo" );
        level.player allowmelee( 1 );
        level.slowmo thread _id_C00B();
        level._id_C4E5 = 0;

        if ( isdefined( level.cheat_slowmo_hud ) )
        {
            if ( isdefined( level.cheat_slowmo_hud.myhintbackerblur ) )
            {
                level.cheat_slowmo_hud.myhintbackerblur fadeovertime( 0.5 );
                level.cheat_slowmo_hud.myhintbackerblur.alpha = 0;
                level.cheat_slowmo_hud.myhintbackerblur destroy();
            }

            if ( isdefined( level.cheat_slowmo_hud.myhintbackerbordertop ) )
            {
                level.cheat_slowmo_hud.myhintbackerbordertop fadeovertime( 0.5 );
                level.cheat_slowmo_hud.myhintbackerbordertop.alpha = 0;
                level.cheat_slowmo_hud.myhintbackerbordertop destroy();
            }

            if ( isdefined( level.cheat_slowmo_hud.myhintbackerborderbottom ) )
            {
                level.cheat_slowmo_hud.myhintbackerborderbottom fadeovertime( 0.5 );
                level.cheat_slowmo_hud.myhintbackerborderbottom.alpha = 0;
                level.cheat_slowmo_hud.myhintbackerborderbottom destroy();
            }

            if ( isdefined( level.cheat_slowmo_hud.myhintstring ) )
            {
                level.cheat_slowmo_hud.myhintstring fadeovertime( 0.5 );
                level.cheat_slowmo_hud.myhintstring.alpha = 0;
                level.cheat_slowmo_hud.myhintstring destroy();
            }
        }
    }
}

_id_B3AA()
{
    level endon( "disable_slowmo" );
    level.slowmo_mode_slowed = 0;
    thread _id_CA13();
    thread gamespeed_disable_watch();

    for (;;)
    {
        level.player waittill( "_cheat_player_press_slowmo" );
        level._id_C4E5 = 0;
        slowmo_system_defaults();

        if ( !common_scripts\utility::flag( "disable_slowmo_cheat" ) )
        {
            if ( gettimescale() < level.slowmo.speed_norm )
                thread _id_C00B();
            else
                thread _id_C7F7();
        }

        waittillframeend;
    }
}

_id_CA13()
{
    level notify( "gamespeed_reset_on_death" );
    level endon( "gamespeed_reset_on_death" );
    level.player waittill( "death" );
    thread _id_C00B( 1 );
}

_id_C7F7()
{
    soundscripts\_snd::snd_message( "aud_start_slowmo_cheat" );
    setslowmotion( self.speed_norm, self.speed_slow, self.lerp_time_in );
    level.slowmo_mode_slowed = 1;
}

_id_C00B( var_0 )
{
    level.player thread common_scripts\utility::stop_loop_sound_on_entity( "h1_slowmo_cheat_heartbeat" );
    soundscripts\_snd::snd_message( "aud_stop_slowmo_cheat" );

    if ( !common_scripts\utility::flag( "disable_slowmo_cheat" ) )
    {
        setslowmotion( self.speed_slow, self.speed_norm, self.lerp_time_out );
        level.slowmo_mode_slowed = 0;
    }

    if ( isdefined( var_0 ) )
        common_scripts\utility::flag_set( "disable_slowmo_cheat" );
}

gamespeed_disable_watch()
{
    level endon( "disable_slowmo" );

    for (;;)
    {
        common_scripts\utility::flag_wait( "disable_slowmo_cheat" );
        common_scripts\utility::flag_waitopen( "disable_slowmo_cheat" );
        waitframe();

        if ( level.slowmo_mode_slowed )
        {
            slowmo_system_defaults();
            setslowmotion( gettimescale(), self.speed_slow, self.lerp_time_in );
        }
    }
}

_id_B47E()
{
    level endon( "slowmo_resume" );

    if ( gettimescale() < level.slowmo.speed_norm )
        level._id_C2D0 = 1;

    for (;;)
    {
        if ( isdefined( level._id_C58A ) && level._id_C58A )
        {
            level notify( "disable_slowmo" );
            level.slowmo thread _id_C00B();
            level.player allowmelee( 1 );
        }

        wait 0.05;
    }
}

_id_D57F()
{
    level notify( "slowmo_resume" );
    level._id_C2D0 = undefined;

    if ( isdefined( level._id_C58A ) && level._id_C58A )
    {
        if ( isdefined( level._id_C2D0 ) )
            level.slowmo thread _id_C7F7();

        level.slowmo thread _id_B3AA();
        level.player allowmelee( 0 );
    }
}

_id_B005( var_0 )
{
    if ( var_0 )
    {
        setsaveddvar( "chaplincheat", "1" );
        level._id_B0DB = getdvar( "bg_weaponBobAmplitudeStanding" );
        setsaveddvar( "bg_weaponBobAmplitudeStanding", "0.08 0.04" );
        setomnvar( "ui_ragtimewarefare_overlay", 1 );
        level._id_C51C["chaplin"] = 1;
        _id_AF0A();
        thread _id_C109();
    }
    else
    {
        level notify( "disable_chaplin" );
        level notify( "disable_chaplin_grain" );
        _id_CEF5();
        level.player stopshellshock();
        setomnvar( "ui_ragtimewarefare_overlay", 0 );
        level._id_C51C["chaplin"] = 0;
        maps\_utility::delaythread( 0.05, soundscripts\_snd::snd_message, "aud_stop_ragtime_warfare" );
        setsaveddvar( "bg_weaponBobAmplitudeStanding", level._id_B0DB );
        setsaveddvar( "chaplincheat", "0" );

        if ( !common_scripts\utility::flag( "disable_slowmo_cheat" ) )
            settimescale( 1.0 );
    }

    _id_B858();
}

_id_D01A()
{
    var_0 = newhudelem();
    var_0.x = 0;
    var_0.y = 0;
    var_0 setshader( "black", 640, 480 );
    var_0.alignx = "left";
    var_0.aligny = "top";
    var_0.horzalign = "fullscreen";
    var_0.vertalign = "fullscreen";
    var_0.alpha = 1;
    var_0.foreground = 1;
    var_0.sort = 0;
    return var_0;
}

_id_CEAA( var_0 )
{
    var_1 = newhudelem();
    var_1.x = 0;
    var_1.y = -40;
    var_1.alignx = "center";
    var_1.aligny = "middle";
    var_1.horzalign = "center";
    var_1.vertalign = "middle";
    var_1.foreground = 1;
    var_1 settext( var_0 );
    var_1.fontscale = 3;
    var_1.alpha = 1;
    var_1.sort = 1;
    var_1.color = ( 0.976, 0.796, 0.412 );
    return var_1;
}

_id_AA39( var_0 )
{
    if ( getdvar( "chaplincheat" ) != "1" )
        return;

    if ( getdvar( "cheat_chaplin_titlecardshowing" ) == "1" )
        return;

    if ( common_scripts\utility::flag( "disable_slowmo_cheat" ) )
        return;

    setdvar( "cheat_chaplin_titlecardshowing", 1 );
    var_1 = _id_D01A();
    var_2 = _id_CEAA( var_0 );
    settimescale( 0.05 );
    wait 0.15;
    settimescale( 1 );
    var_1 destroy();
    var_2 destroy();
    setdvar( "cheat_chaplin_titlecardshowing", 0 );
}

_id_C109()
{
    level endon( "disable_chaplin" );
    soundscripts\_snd::snd_message( "aud_start_ragtime_warfare" );

    for (;;)
    {
        level.player shellshock( "chaplincheat", 60, 1 );
        wait 0.5;

        if ( !common_scripts\utility::flag( "disable_slowmo_cheat" ) )
        {
            if ( getdvar( "cheat_chaplin_titlecardshowing" ) == "1" )
            {
                settimescale( 0.05 );
                continue;
            }

            settimescale( 1.7 );
        }
    }
}

_id_AF0A()
{
    level._id_B114 = spawn( "script_model", level.player geteye() );
    level._id_B114 setmodel( "tag_origin" );
    level._id_B114 hide();
    playfxontag( level._effect["grain_test"], level._id_B114, "tag_origin" );
    thread _id_B5B9();
}

_id_CEF5()
{
    if ( !isdefined( level._id_B114 ) )
        return;

    level._id_B114 delete();
}

_id_B5B9()
{
    level endon( "disable_chaplin_grain" );

    for (;;)
    {
        level._id_B114.origin = level.player geteye() + 50 * anglestoforward( level.player getplayerangles() );
        wait 0.01;
    }
}

_id_AD40()
{
    for ( var_0 = 0; var_0 < level._id_B06E.size; var_0++ )
    {
        if ( level._id_AE18[level._id_B06E[var_0]] )
            return 1;
    }

    return 0;
}

_id_AF83( var_0 )
{
    level._id_AE66 = common_scripts\utility::ter_op( var_0, 1, 0 );
}

_id_C48A()
{
    level._id_BCF0 = 0;
    level._id_AFB8 = loadfx( "fx/props/watermelon" );
    level._id_BA90 = "j_head";
    level._id_D248 = "me_fruit_watermelon_oblong";
    precachemodel( level._id_D248 );
    maps\_utility::add_global_spawn_function( "axis", ::_id_D2D7 );
    common_scripts\utility::array_thread( getaiarray( "axis" ), ::_id_D2D7 );
}

_id_D467( var_0 )
{
    level._id_BCF0 = common_scripts\utility::ter_op( var_0, 1, 0 );
    level notify( "melonhead_mode_updated" );
}

_id_D2D7()
{
    self endon( "death" );
    self notify( "melonhead_monitor" );
    self endon( "melonhead_monitor" );
    waitframe();

    if ( isdefined( self._id_AA5E ) && self._id_AA5E )
        return;

    for (;;)
    {
        if ( level._id_BCF0 )
            _id_A8C6();
        else
            _id_B95B();

        level waittill( "melonhead_mode_updated" );
    }
}

_id_A8C6()
{
    if ( _func_2A5( self ) )
        return;

    if ( isdefined( self._id_AF0D ) && self._id_AF0D )
        return;

    if ( isdefined( self._id_C543 ) )
        return;

    self attach( level._id_D248, level._id_BA90, 1 );
    self._id_C543 = 1;
    thread _id_A7F9();
    thread _id_BA97();
}

_id_B95B( var_0, var_1 )
{
    if ( _func_2A5( self ) )
        return;

    if ( isdefined( var_1 ) && var_1 )
        self._id_AF0D = 1;

    if ( !isdefined( self._id_C543 ) )
        return;

    self detach( level._id_D248, level._id_BA90 );
    self._id_C543 = undefined;

    if ( isdefined( var_0 ) && var_0 )
    {
        playfx( level._id_AFB8, self gettagorigin( level._id_BA90 ), anglestoforward( self.angles ) );
        thread common_scripts\utility::play_sound_in_space( "h1_hit_watermelon", self gettagorigin( level._id_BA90 ) );
    }

    self notify( "melonhead_removed" );
}

_id_A7F9()
{
    self endon( "melonhead_removed" );
    self waittill( "death" );
    _id_B95B( 1 );
}

_id_BA97()
{
    self endon( "melonhead_removed" );

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );

        if ( !isdefined( self.damagelocation ) )
            continue;

        if ( ( self.damagelocation == "head" || self.damagelocation == "helmet" ) && var_4 != "MOD_IMPACT" )
        {
            _id_B95B( 1 );
            break;
        }
    }
}

_id_BAF4()
{
    level._id_B20A = 0;
    level._id_AB37 = "h1_cheathandgun";
    level._id_BA80 = undefined;
    precacheitem( level._id_AB37 );
}

_id_CCF8( var_0 )
{
    if ( level.script == "ac130" )
        return;

    level._id_B20A = common_scripts\utility::ter_op( var_0, 1, 0 );
    level notify( "handgun_mode_updated" );

    if ( level._id_B20A )
        _id_C053();
    else
        _id_D389();
}

_id_BC31()
{
    self endon( "handgun_removed" );
    self endon( "death" );

    for (;;)
    {
        if ( level.player issplitscreenplayer() == 1 && level.player getcurrentweapon() == level._id_AB37 )
            level.player maps\_utility::playerallowweaponpickup( 0, "cheat_handgun" );
        else if ( level.player issplitscreenplayer() == 0 && level.player getcurrentweapon() != level._id_AB37 )
            level.player maps\_utility::playerallowweaponpickup( 1, "cheat_handgun" );

        wait 0.05;
    }
}

_id_CA30()
{
    self endon( "handgun_removed" );
    self endon( "death" );

    for (;;)
    {
        if ( level.player isreloading() )
        {
            level.player givemaxammo( level._id_AB37 );
            level.player setweaponammoclip( level._id_AB37, weaponclipsize( level._id_AB37 ) );
        }

        wait 0.05;
    }
}

_id_C053()
{
    level._id_BA80 = level.player getcurrentweapon();
    level.player giveweapon( level._id_AB37 );
    level.player givemaxammo( level._id_AB37 );
    level.player switchtoweaponimmediate( level._id_AB37 );
    thread _id_BC31();
    thread _id_CA30();
}

_id_D389()
{
    if ( level.player issplitscreenplayer() == 0 )
        level.player maps\_utility::playerallowweaponpickup( 1, "cheat_handgun" );

    var_0 = level.player getcurrentweapon();
    var_1 = 0;

    if ( var_0 == level._id_AB37 && level._id_BA80 != "none" )
    {
        var_2 = level.player getweaponslistall();

        foreach ( var_4 in var_2 )
        {
            if ( var_4 == level._id_BA80 )
            {
                level.player switchtoweaponimmediate( var_4 );
                var_1 = 1;
                break;
            }
        }

        if ( !var_1 && var_2.size > 0 )
            level.player switchtoweaponimmediate( var_2[0] );
    }

    level.player takeweapon( level._id_AB37 );
    self notify( "handgun_removed" );
}

_id_BC55()
{
    level._id_B999 = 0;
    level._id_C559 = "h1_cheatlemonade";
    level._id_D2E5 = undefined;
    precacheitem( level._id_C559 );
}

_id_C7FF( var_0 )
{
    level._id_B999 = common_scripts\utility::ter_op( var_0, 1, 0 );

    if ( level._id_B999 )
        _id_B6C9();
    else
        _id_ACCA();
}

_id_B6C9()
{
    level._id_D2E5 = level.player getoffhandprimaryclass();

    if ( isdefined( level._id_D2E5 ) && level._id_D2E5 != "none" )
    {
        var_0 = level.player getweaponammostock( level._id_D2E5 );
        level.player takeweapon( level._id_D2E5 );
        level.player setoffhandprimaryclass( level._id_C559 );
        level.player giveweapon( level._id_C559 );
        level.player setweaponammostock( level._id_C559, var_0 );
    }
}

_id_ACCA()
{
    var_0 = level.player getweaponammostock( level._id_C559 );
    level.player takeweapon( level._id_C559 );

    if ( isdefined( level._id_D2E5 ) )
    {
        level.player setoffhandprimaryclass( level._id_D2E5 );
        level.player giveweapon( level._id_D2E5 );
        level.player setweaponammostock( level._id_D2E5, var_0 );
    }
}

_id_AA99()
{
    level._id_B317 = 0;

    if ( level.script == "ac130" )
    {
        level._id_C070 = "body_zakhaev_viktor_collar_ac130";
        level._id_ABB9 = "head_zakhaev_viktor_ac130";
    }
    else
    {
        level._id_C070 = "body_zakhaev_viktor_collar";
        level._id_ABB9 = "head_zakhaev_viktor";
    }

    level._id_AD94 = "rpg";
    precachemodel( level._id_C070 );
    precachemodel( level._id_ABB9 );
    precacheitem( level._id_AD94 );
    precacheitem( "rpg_player" );
    maps\_utility::add_global_spawn_function( "axis", ::_id_AEEB );
    common_scripts\utility::array_thread( getaiarray( "axis" ), ::_id_AEEB );
}

_id_CBBF( var_0 )
{
    level._id_B317 = common_scripts\utility::ter_op( var_0, 1, 0 );
    level notify( "tracksuit_mode_updated" );
}

_id_AEEB()
{
    self endon( "death" );
    waitframe();

    if ( isdefined( self._id_D3BC ) && self._id_D3BC )
        return;

    if ( isdefined( self.animtree ) && self.animtree == "dog.atr" )
        return;

    for (;;)
    {
        if ( level._id_B317 )
            _id_C0B1();
        else
            _id_D12D();

        level waittill( "tracksuit_mode_updated" );
    }
}

_id_C0B1()
{
    if ( _func_2A5( self ) )
        return;

    self._id_A8F4 = 1;

    if ( isdefined( self.weapon ) && !isdefined( self._id_D4B4 ) && self.classname != "script_model" )
    {
        if ( isdefined( self.a ) && isdefined( self.a.aimidlethread ) )
            animscripts\combat_utility::endfireandanimidlethread();

        self._id_AE61 = animscripts\utility::getaiprimaryweapon();
        var_0 = _id_A9BE();
        maps\_utility::forceuseweapon( level._id_AD94, "primary" );

        if ( !var_0 )
            maps\_utility::gun_remove();

        self._id_AC29 = self.a.neverlean;
        self.a.neverlean = 1;
        self._id_CD9E = self.a.rocketvisible;
        self.a.rocketvisible = 1;
        thread animscripts\shared::rpgplayerrepulsor();
        self.primaryweapon = level._id_AD94;
        self.weapon = level._id_AD94;
        self.lastweapon = level._id_AD94;
        self._id_D34C = self.secondaryweapon;
        self.secondaryweapon = "none";
    }

    if ( self.model == level._id_C070 || self.model == "body_zakhaev_viktor" )
        return;

    if ( isdefined( self.hatmodel ) )
    {
        self._id_C964 = self.hatmodel;
        self detach( self.hatmodel );
        self.hatmodel = undefined;
    }

    if ( isdefined( self.headmodel ) )
    {
        self._id_AD58 = self.headmodel;
        self detach( self.headmodel );
    }

    self._id_B599 = self.model;
    self setmodel( level._id_C070 );
    self attach( level._id_ABB9 );
    self.headmodel = level._id_ABB9;
}

_id_D12D()
{
    if ( _func_2A5( self ) )
        return;

    if ( !isdefined( self._id_A8F4 ) )
        return;

    if ( isdefined( self._id_B599 ) )
    {
        self detach( self.headmodel );
        self.headmodel = undefined;
        self setmodel( self._id_B599 );
        self._id_B599 = undefined;
    }

    if ( isdefined( self._id_AD58 ) )
    {
        self attach( self._id_AD58 );
        self.headmodel = self._id_AD58;
        self._id_AD58 = undefined;
    }

    if ( isdefined( self._id_C964 ) )
    {
        self attach( self._id_C964 );
        self.hatmodel = self._id_C964;
        self._id_C964 = undefined;
    }

    if ( isdefined( self._id_AE61 ) && !isdefined( self._id_D4B4 ) )
    {
        if ( isdefined( self.a ) && isdefined( self.a.aimidlethread ) )
            animscripts\combat_utility::endfireandanimidlethread();

        if ( _id_A9BE() )
            maps\_utility::forceuseweapon( self._id_AE61, "primary" );

        self.secondaryweapon = self._id_D34C;
        self.a.neverlean = self._id_AC29;
        self.a.rocketvisible = self._id_CD9E;
    }

    self._id_A8F4 = 0;
    self notify( "tracksuit_removed" );
}

_id_A9BE()
{
    foreach ( var_1 in self.weaponinfo )
    {
        if ( var_1.position != "none" )
            return 1;
    }

    return 0;
}

_id_BF57()
{
    level._id_C70E = 0;
    level._id_C8B7 = "h2_cheatpomegrenade";
    level._id_D034 = undefined;
    precacheitem( level._id_C8B7 );
}

_id_C4A9( var_0 )
{
    level._id_C70E = common_scripts\utility::ter_op( var_0, 1, 0 );

    if ( level._id_C70E )
        _id_BE44();
    else
        _id_D0C5();
}

_id_BE44()
{
    level._id_D034 = level.player getoffhandprimaryclass();

    if ( isdefined( level._id_D034 ) && level._id_D034 != "none" )
    {
        var_0 = level.player getweaponammostock( level._id_D034 );
        level.player takeweapon( level._id_D034 );
        level.player setoffhandprimaryclass( level._id_C8B7 );
        level.player giveweapon( level._id_C8B7 );
        level.player setweaponammostock( level._id_C8B7, var_0 );
    }
}

_id_D0C5()
{
    var_0 = level.player getweaponammostock( level._id_C8B7 );
    level.player takeweapon( level._id_C8B7 );

    if ( isdefined( level._id_D034 ) )
    {
        level.player setoffhandprimaryclass( level._id_D034 );
        level.player giveweapon( level._id_D034 );
        level.player setweaponammostock( level._id_D034, var_0 );
    }
}

_id_B09E()
{
    level._id_C4C8 = 0;
    level._id_BB14 = loadfx( "fx/props/pineapple_heads" );
    level._id_AF76 = "j_head";
    level._id_CE42 = "h2_projectile_cheat_pineapple";
    precachemodel( level._id_CE42 );
    add_specialfeatures_function( ::_id_CB0D );
}

_id_B61A( var_0 )
{
    level._id_C4C8 = common_scripts\utility::ter_op( var_0, 1, 0 );
    setsaveddvar( "cg_melee_knife_fx", !level._id_C4C8 );
    level notify( "pineapple_mode_updated" );
}

_id_CB0D()
{
    self endon( "death" );
    self notify( "pineapple_monitor" );
    self endon( "pineapple_monitor" );
    waitframe();

    if ( isdefined( self.cheat._id_A9E4 ) && self.cheat._id_A9E4 )
        return;

    if ( isdefined( self.code_classname ) && self.code_classname == "script_vehicle" )
        return;

    for (;;)
    {
        if ( level._id_C4C8 )
            _id_CC39();
        else
            _id_CB5C();

        level waittill( "pineapple_mode_updated" );
    }
}

_id_CC39()
{
    if ( _func_2A5( self ) )
        return;

    if ( isdefined( self.cheat._id_BDEE ) && self.cheat._id_BDEE )
        return;

    if ( isdefined( self.cheat._id_C86E ) )
        return;

    if ( isdefined( self.hatmodel ) )
    {
        self.cheat.pineapple_previoushat = self.hatmodel;
        self detach( self.hatmodel );
        self.hatmodel = undefined;
    }

    if ( isdefined( self.headmodel ) )
    {
        self.cheat.pineapple_previoushead = self.headmodel;
        self detach( self.headmodel );
    }

    if ( isdefined( self.cheat.attachheadlast ) && self.cheat.attachheadlast )
    {
        self attach( level._id_CE42, level._id_AF76, 1 );
        self attach( level.invisibleman_head );
    }
    else
    {
        self attach( level.invisibleman_head );
        self attach( level._id_CE42, level._id_AF76, 1 );
    }

    self.headmodel = level.invisibleman_head;
    self.cheat._id_C86E = 1;
    thread _id_C654();
    thread _id_CE72();
}

_id_CB5C( var_0, var_1 )
{
    if ( _func_2A5( self ) )
        return;

    if ( isdefined( var_1 ) && var_1 )
        self.cheat._id_BDEE = 1;

    if ( !isdefined( self.cheat._id_C86E ) )
        return;

    if ( iswolf( self ) )
    {
        if ( isdefined( self.cheat._id_D184 ) )
            self.cheat.pineapple_previoushead = level._id_D0CD;

        if ( isdefined( self.cheat.pineapple_previoushat ) )
        {
            self.cheat._id_C590 = self.cheat.pineapple_previoushat;
            self.cheat.pineapple_previoushat = undefined;
        }
    }

    if ( isdefined( self.cheat.pineapple_previoushead ) && !isdefined( self._id_A87F.polterghostmode ) )
    {
        self detach( level.invisibleman_head );
        self attach( self.cheat.pineapple_previoushead );
        self.headmodel = self.cheat.pineapple_previoushead;
        self.cheat.pineapple_previoushead = undefined;
    }

    if ( isdefined( self.cheat.pineapple_previoushat ) && !isdefined( self._id_A87F.polterghostmode ) )
    {
        self attach( self.cheat.pineapple_previoushat );
        self.hatmodel = self.cheat.pineapple_previoushat;
        self.cheat.pineapple_previoushat = undefined;
    }

    self detach( level._id_CE42, level._id_AF76 );
    self.cheat._id_C86E = undefined;

    if ( isdefined( var_0 ) && var_0 )
    {
        playfx( level._id_BB14, self gettagorigin( level._id_AF76 ), anglestoforward( self.angles ) );
        thread common_scripts\utility::play_sound_in_space( "h1_hit_waterpineapple", self gettagorigin( level._id_AF76 ) );
    }

    self notify( "pineapple_removed" );
}

_id_C654()
{
    self endon( "pineapple_removed" );
    self waittill( "death" );
    _id_CB5C( 1 );
}

_id_CE72()
{
    self endon( "pineapple_removed" );

    for (;;)
    {
        self waittill( "damage", var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 );

        if ( isdefined( self.cheat.ignoredamageinpineapplemode ) && self.cheat.ignoredamageinpineapplemode )
            continue;

        if ( !isdefined( self.damagelocation ) || var_1.classname == "worldspawn" )
            continue;

        if ( animscripts\utility::damagelocationisany( "head", "helmet" ) && var_4 != "MOD_IMPACT" )
        {
            _id_CB5C( 1 );
            break;
        }
    }
}

_id_C5B6()
{
    level._id_CE78 = 0;
    level._id_C08E = "h2_cheatfootball";
    level._id_C124 = undefined;
    level.cheat_football_array = [];
    precacheitem( level._id_C08E );
    level.player thread football_listener();
}

_id_CB85( var_0 )
{
    level._id_CE78 = common_scripts\utility::ter_op( var_0, 1, 0 );

    if ( level._id_CE78 )
        _id_B76C();
    else
        _id_D1F3();
}

_id_B76C()
{
    level._id_C124 = level.player getoffhandsecondaryclass();

    if ( isdefined( level._id_C124 ) && level._id_C124 != "none" )
    {
        var_0 = level.player getweaponammostock( level._id_C124 );
        level.player takeweapon( level._id_C124 );
        level.player setoffhandsecondaryclass( level._id_C08E );
        level.player giveweapon( level._id_C08E );
        level.player setweaponammostock( level._id_C08E, var_0 );
    }
}

_id_D1F3()
{
    var_0 = level.player getweaponammostock( level._id_C08E );
    level.player takeweapon( level._id_C08E );

    if ( isdefined( level._id_C124 ) )
    {
        level.player setoffhandsecondaryclass( level._id_C124 );
        level.player giveweapon( level._id_C124 );
        level.player setweaponammostock( level._id_C124, var_0 );
    }
}

football_listener()
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "grenade_fire", var_0, var_1 );

        if ( var_1 == "h2_cheatfootball" )
        {
            level.cheat_football_array = common_scripts\utility::array_add( level.cheat_football_array, var_0 );

            while ( level.cheat_football_array.size > 30 )
            {
                var_2 = maps\_utility::get_farthest_ent( level.player.origin, level.cheat_football_array );
                level.cheat_football_array = common_scripts\utility::array_remove( level.cheat_football_array, var_2 );
                var_2 delete();
            }
        }
    }
}

_id_C5E7()
{
    level._id_B5A0 = 0;
    level._id_C3C7 = loadfx( "vfx/unique/confetti_firework" );
}

_id_D376( var_0 )
{
    level._id_B5A0 = common_scripts\utility::ter_op( var_0, 1, 0 );
}

_id_D017()
{
    if ( !isai( self ) || self.classname == "script_model" )
        return;

    self waittill( "death", var_0, var_1 );

    if ( isdefined( self.cheat._id_C46A ) && self.cheat._id_C46A )
        return;

    if ( _id_AD40() )
    {
        if ( _func_2A5( self ) )
            return;

        waittillframeend;
        _id_B190::martyr_mode_dropgrenade( var_0, var_1 );

        if ( level._id_B5C6 )
        {
            for ( var_2 = 0; var_2 < level._id_C090; var_2++ )
                thread _id_C5DD( self.origin, self geteye() );
        }

        if ( isdefined( level._id_C3C7 ) && level._id_B5A0 )
        {
            var_3 = self.origin;
            var_4 = self.angles;

            if ( isdefined( self.damagelocation ) )
            {
                if ( animscripts\utility::damagelocationisany( "helmet", "head", "neck" ) )
                    var_3 = self gettagorigin( "J_Head" );
                else if ( animscripts\utility::damagelocationisany( "torso_upper", "torso_lower", "right_arm_upper", "left_arm_upper", "right_arm_lower", "left_arm_lower", "right_hand", "left_hand" ) )
                    var_3 = self gettagorigin( "J_SpineLower" );
            }

            for ( var_2 = 0; var_2 < 5; var_2++ )
            {
                var_5 = randomintrange( -24, 24 );
                var_6 = randomintrange( -24, 24 );
                var_7 = randomintrange( 0, 15 );
                var_8 = var_3 + ( var_5, var_6, var_7 );
                playfx( level._id_C3C7, var_8, anglestoforward( var_4 ) );
                thread common_scripts\utility::play_sound_in_space( "h2_party_time_explosion_fireworks", var_8 );
                wait(0.1 + randomfloat( 0.2 ));
            }
        }

        if ( isdefined( self ) && ( level._id_B5A0 || level._id_B5C6 ) )
        {
            if ( isdefined( self.classname ) && self.classname != "actor_enemy_dog" )
                animscripts\shared::dropaiweapon( self.weapon );

            wait 0.15;

            if ( isdefined( self ) && !_func_2A5( self ) )
                self delete();
        }
    }
}

cheat_death_corpse_check( var_0 )
{
    if ( isdefined( level._id_B5A0 ) && level._id_B5A0 || isdefined( level._id_B5C6 ) && level._id_B5C6 )
    {
        if ( !isdefined( var_0 ) )
            var_0 = 10;

        wait(var_0);
        var_1 = getcorpsearray();

        if ( isdefined( var_1 ) )
            var_2 = var_1.size - 1;
        else
            return;

        wait 0.05;

        if ( isdefined( var_1[var_2] ) && !_func_2A5( var_1[var_2] ) )
            var_1[var_2] delete();
    }
}

_id_C5DD( var_0, var_1 )
{
    if ( level._id_B69E.size == level._id_C326 )
    {
        level._id_B69E[0] delete();
        level._id_B69E = maps\_utility::array_remove_index( level._id_B69E, 0 );
    }

    var_2 = spawn( "script_model", ( 0.0, 0.0, 0.0 ) );
    var_2.angles = ( 0, randomint( 360 ), 0 );
    var_3 = randomfloat( 1 );
    var_2.origin = var_0 * var_3 + var_1 * ( 1 - var_3 );
    var_2 setmodel( level._id_B72B );
    var_4 = common_scripts\utility::randomvector( 15000 );
    var_4 = ( var_4[0], var_4[1], abs( var_4[2] ) );
    var_2 physicslaunchclient( var_2.origin, var_4 );
    level._id_B69E[level._id_B69E.size] = var_2;
    var_2 endon( "death" );
    wait(randomfloatrange( 5.0, 10.0 ));

    if ( isdefined( var_2 ) )
    {
        level._id_B69E = common_scripts\utility::array_remove( level._id_B69E, var_2 );
        var_2 delete();
    }
}

_id_CF38( var_0 )
{
    precachemodel( var_0 );
    level._id_B72B = var_0;
}

_id_C969()
{
    level._id_CE1E = 0;
    level._id_C952 = "h2_gfl_rpk16_body";
    level._id_D0CD = "h2_gfl_rpk16_head";
    level.accessorymodels_cheat = [ "h2_gfl_rpk16_outline" ];
    level._id_C9BA = "coltanaconda";
    level._id_B156 = 12;
    level.gacha = true;
    // precachemodel( level._id_C952 );
    // precachemodel( level._id_D0CD );
    maps\gfl\_utility::precache_all_characters();

    precacheitem( level._id_C9BA );
    add_specialfeatures_function( ::_id_CA1D );
}

randomize()
{
    level._id_C952 = undefined;
    level._id_D0CD = undefined;
    level.accessorymodels_cheat = undefined;

	switch( randomint(34) )
	{
	case 0:
        level._id_C952 = "h2_gfl_hk416_body";
        level._id_D0CD = "h2_gfl_hk416_head";
		break;
	case 1:
        level._id_C952 = "h2_gfl_g11_body";
        level._id_D0CD = "h2_gfl_g11_head";
        level.accessorymodels_cheat = [ "h2_gfl_g11_hair" ];
		break;
	case 2:
        level._id_C952 = "h2_gfl_m4a1_body";
        level._id_D0CD = "h2_gfl_m4a1_head";
        level.accessorymodels_cheat = [ "h2_gfl_m4a1_hair", "h2_gfl_m4a1_outline" ];
		break;
	case 3:
        level._id_C952 = "h2_gfl_m4_sopmod_ii_body";
        level._id_D0CD = "h2_gfl_m4_sopmod_ii_head";
		break;
	case 4:
        level._id_C952 = "h2_gfl_ro635_body";
        level._id_D0CD = "h2_gfl_ro635_head";
        level.accessorymodels_cheat = [ "h2_gfl_ro635_hair" ];
		break;
	case 5:
        level._id_C952 = "h2_gfl_rpk16_body";
        level._id_D0CD = "h2_gfl_rpk16_head";
        level.accessorymodels_cheat = [ "h2_gfl_rpk16_outline" ];
		break;
	case 6:
        level._id_C952 = "h2_gfl_suomi_body";
        level._id_D0CD = "h2_gfl_suomi_head";
        level.accessorymodels_cheat = [ "h2_gfl_suomi_hair" ];
		break;
	case 7:
        level._id_C952 = "h2_gfl_dima_body";
        level._id_D0CD = "h2_gfl_dima_head";
        level.accessorymodels_cheat = [ "h2_gfl_dima_outline" ];
		break;
	case 8:
        level._id_C952 = "h2_gfl_ak12_body";
        level._id_D0CD = "h2_gfl_ak12_head";
        level.accessorymodels_cheat = [ "h2_gfl_ak12_hair", "h2_gfl_ak12_outline" ];
		break;
	case 9:
        level._id_C952 = "h2_gfl_p90_body";
        level._id_D0CD = "h2_gfl_p90_head";
        level.accessorymodels_cheat = [ "h2_gfl_p90_clothes" ];
		break;
	case 10:
        level._id_C952 = "h2_gfl_9a91_body";
        level._id_D0CD = "h2_gfl_9a91_head";
        level.accessorymodels_cheat = [ "h2_gfl_9a91_hair" ];
		break;
	case 11:
        level._id_C952 = "h2_gfl_rfb_body";
        level._id_D0CD = "h2_gfl_rfb_head";
        level.accessorymodels_cheat = [ "h2_gfl_rfb_hair", "h2_gfl_rfb_clothes" ];
		break;
	case 12:
        level._id_C952 = "h2_gfl_type97_body";
        level._id_D0CD = "h2_gfl_type97_head";
        level.accessorymodels_cheat = [ "h2_gfl_type97_hair" ];
		break;
	case 13:
        level._id_C952 = "h2_gfl_saiga12_body";
        level._id_D0CD = "h2_gfl_saiga12_head";
        level.accessorymodels_cheat = [ "h2_gfl_saiga12_clothes" ];
		break;
	case 14:
        level._id_C952 = "h2_gfl_fnc_body";
        level._id_D0CD = "h2_gfl_fnc_head";
        level.accessorymodels_cheat = [ "h2_gfl_fnc_clothes" ];
		break;
	case 15:
        level._id_C952 = "h2_gfl_sten_body";
        level._id_D0CD = "h2_gfl_sten_head";
		break;
	case 16:
        level._id_C952 = "h2_gfl_ak74m_body";
        level._id_D0CD = "h2_gfl_ak74m_head";
        level.accessorymodels_cheat = [ "h2_gfl_ak74m_hair", "h2_gfl_ak74m_outline" ];
		break;
	case 17:
        level._id_C952 = "h1_gfl_sp9_v2_body";
        level._id_D0CD = "h1_gfl_sp9_v2_head";
        level.accessorymodels_cheat = [ "h1_gfl_sp9_v2_hair" ];
		break;
	case 18:
        level._id_C952 = "h2_gfl_tac50_body";
        level._id_D0CD = "h2_gfl_tac50_head";
        level.accessorymodels_cheat = [ "h2_gfl_tac50_clothes", "h2_gfl_tac50_outline" ];
		break;
	case 19:
        level._id_C952 = "h2_gfl_commander_body";
        level._id_D0CD = "h2_gfl_commander_head";
		break;
	case 20:
        level._id_C952 = "h2_gfl_ouroboros_body";
        level._id_D0CD = "h2_gfl_ouroboros_head";
		break;
	case 21:
        level._id_C952 = "h2_gfl_vespid_fb";
		break;
	case 22:
        level._id_C952 = "h2_gfl_jaeger_fb";
        level.accessorymodels_cheat = [ "h2_gfl_jaeger_goggle_up" ];
		break;
	case 23:
        level._id_C952 = "h2_gfl_ripper_fb";
		break;
	case 24:
        level._id_C952 = "h2_gfl_guard_fb";
        level.accessorymodels_cheat = [ "h2_gfl_guard_visor_up" ];
		break;
	case 25:
        level._id_C952 = "h1_gfl_dreamer_body";
        level._id_D0CD = "h1_gfl_dreamer_head";
		break;
	case 26:
        level._id_C952 = "h1_gfl_destroyer_body";
        level._id_D0CD = "h1_gfl_destroyer_head";
		break;
	case 27:
        level._id_C952 = "h1_gfl_ppsh41_body";
        level._id_D0CD = "h1_gfl_ppsh41_head";
		break;
	case 28:
        level._id_C952 = "h1_gfl_super_sass_body";
        level._id_D0CD = "h1_gfl_super_sass_head";
        level.accessorymodels_cheat = [ "h1_gfl_super_sass_clothes" ];
		break;
	case 29:
        level._id_C952 = "s1_gfl_mp7_body_tights";
        level._id_D0CD = "s1_gfl_mp7_head";
        level.accessorymodels_cheat = [ "s1_gfl_mp7_jacket", "s1_gfl_mp7_hat", "s1_gfl_mp7_headset" ];
		break;
	case 30:
        level._id_C952 = "s1_gfl_m14_body";
        level._id_D0CD = "s1_gfl_m14_head";
        level.accessorymodels_cheat = [ "s1_gfl_m14_hair" ];
		break;
	case 31:
        level._id_C952 = "s1_gfl_spas12_body";
        level._id_D0CD = "s1_gfl_spas12_head";
        level.accessorymodels_cheat = [ "s1_gfl_spas12_hair", "s1_gfl_spas12_outline" ];
		break;
	case 32:
        level._id_C952 = "s1_gfl_sv98_body";
        level._id_D0CD = "s1_gfl_sv98_head";
		break;
	case 33:
        level._id_C952 = "s1_gfl_g36c_body";
        level._id_D0CD = "s1_gfl_g36c_head";
        level.accessorymodels_cheat = [ "s1_gfl_g36c_vest" ];
		break;
	}
}

override_wolf_model( var_0 )
{
    precachemodel( var_0 );
    level._id_C952 = var_0;
}

_id_C23F( var_0 )
{
    level._id_CE1E = common_scripts\utility::ter_op( var_0, 1, 0 );
    level notify( "wolf_mode_updated" );
}

_id_CA1D()
{
    self endon( "death" );
    waitframe();

    if ( isdefined( self.cheat._id_D4B8 ) && self.cheat._id_D4B8 )
        return;

    if ( isdefined( self.animtree ) && self.animtree == "dog.atr" )
        return;

    if ( isdefined( self.code_classname ) && self.code_classname == "script_vehicle" )
        return;

    for (;;)
    {
        if ( level._id_CE1E )
            _id_CC3A();
        else
            _id_AEA0();

        level waittill( "wolf_mode_updated" );
    }
}

_id_CC3A()
{
    if ( _func_2A5( self ) )
        return;

    if ( issubstr( self.model, "body_vil_shepherd" ) )
        return;

    if ( isdefined( self._id_A87F.polterghostmode ) && self._id_A87F.polterghostmode )
        self waittill( "polterghost_removed" );

    if ( isdefined( self.cheat.wolfmode_presetmodelfunc ) )
        self [[ self.cheat.wolfmode_presetmodelfunc ]]();

    if ( isdefined( self.accessorymodels ) )
    {
        self.accessorymodels_prev = self.accessorymodels;
        foreach ( acc in self.accessorymodels ) 
        {
            self detach( acc );
        }
        
        self.accessorymodels = undefined;
    }

    if ( isdefined( self.hatmodel ) )
    {
        self.cheat._id_C590 = self.hatmodel;
        self detach( self.hatmodel );
        self.hatmodel = undefined;
    }

    if ( isdefined( self.headmodel ) )
    {
        if ( !isdefined( self.cheat.pineapple_previoushead ) )
        {
            self.cheat._id_D184 = self.headmodel;
            self detach( self.headmodel );
        }
        else
            self.cheat._id_D184 = self.cheat.pineapple_previoushead;
    }

    if ( level.gacha ) 
    {
        randomize();
        level.gacha = false;
    }

    self.cheat._id_B9FC = self.model;
    self setmodel( level._id_C952 );

    self.accessorymodels = level.accessorymodels_cheat;
    if ( isdefined( level.accessorymodels_cheat ) )
    {
        foreach ( acc in self.accessorymodels ) 
        {
            self attach( acc, "", true );
        }
    }

    if ( !isdefined( self.cheat.pineapple_previoushead ) )
    {
        self attach( level._id_D0CD );
        self.headmodel = level._id_D0CD;
    }

    if ( isdefined( self.weapon ) && !isdefined( self.cheat._id_BDF2 ) && self.classname != "script_model" )
    {
        self.cheat._id_AE3F = self.grenadeweapon;
        self.cheat._id_BCCE = self.grenadeammo;
        self.grenadeammo = level._id_B156;
        self.grenadeweapon = "fraggrenade";
        maps\_utility::forceuseweapon( self.primaryweapon, "primary" );

        if ( weaponclass( self.primaryweapon ) != "rocketlauncher" )
        {
            if ( isdefined( self.sidearm ) && self.sidearm != "none" )
                self.cheat._id_C9F7 = self.sidearm;

            maps\_utility::forceuseweapon( level._id_C9BA, "sidearm" );

            if ( isdefined( self.forcesidearm ) )
                self.cheat.previousforcesidearm = self.forcesidearm;

            self.forcesidearm = 1;
        }
    }

    if ( isdefined( self.cheat.wolfmode_postsetmodelfunc ) )
        self [[ self.cheat.wolfmode_postsetmodelfunc ]]();

    self.cheat._id_C447 = 1;

    if ( isai( self ) && self.classname != "script_model" )
        thread _id_C973();
}

_id_AEA0()
{
    if ( _func_2A5( self ) )
        return;

    if ( !iswolf( self ) )
        return;

    if ( isdefined( self.cheat.wolfmode_presetmodelfunc ) )
        self [[ self.cheat.wolfmode_presetmodelfunc ]]();

    if ( !level.gacha ) 
    {
        level.gacha = true;
    }

    if ( isdefined( self.accessorymodels ) )
    {
        foreach ( acc in self.accessorymodels ) 
        {
            self detach( acc );
        }

        self.accessorymodels = undefined;
    }

    if ( isdefined( self.accessorymodels_prev ) )
    {
        self.accessorymodels = self.accessorymodels_prev;
        foreach ( acc in self.accessorymodels ) 
        {
            self attach( acc, "", true );
        }

        self.accessorymodels_prev = undefined;
    }

    if ( isdefined( self.cheat._id_B9FC ) )
    {
        self setmodel( self.cheat._id_B9FC );
        self.cheat._id_B9FC = undefined;
    }

    if ( !isdefined( self.cheat._id_D184 ) && isdefined( self.headmodel ) )
    {
        self detach( self.headmodel );
        self.headmodel = undefined;
    }

    if ( isdefined( self.cheat._id_D184 ) && !isdefined( self.cheat._id_C86E ) )
    {
        self detach( self.headmodel );
        self.headmodel = undefined;
        self attach( self.cheat._id_D184 );
        self.headmodel = self.cheat._id_D184;
        self.cheat._id_D184 = undefined;
    }
    else if ( isdefined( self.cheat._id_D184 ) )
        self.cheat.pineapple_previoushead = self.cheat._id_D184;

    if ( isdefined( self.cheat._id_C590 ) && !isdefined( self.cheat._id_C86E ) )
    {
        self attach( self.cheat._id_C590 );
        self.hatmodel = self.cheat._id_C590;
        self.cheat._id_C590 = undefined;
    }
    else if ( isdefined( self.cheat._id_C590 ) )
        self.cheat.pineapple_previoushat = self.cheat._id_C590;

    if ( !isdefined( self.cheat._id_BDF2 ) )
    {
        self.grenadeweapon = self.cheat._id_AE3F;
        self.grenadeammo = self.cheat._id_BCCE;
        maps\_utility::forceuseweapon( self.primaryweapon, "primary" );

        if ( isdefined( self.cheat._id_C9F7 ) )
        {
            self.sidearm = self.cheat._id_C9F7;
            maps\_utility::forceuseweapon( self.cheat._id_C9F7, "sidearm" );
        }
        else
        {
            self.sidearm = "none";
            maps\_utility::forceuseweapon( "none", "sidearm" );
        }

        self.cheat._id_C9F7 = undefined;
        self.lastweapon = self.primaryweapon;

        if ( isdefined( self.cheat.previousforcesidearm ) )
            self.forcesidearm = self.cheat.previousforcesidearm;
        else
            self.forcesidearm = 0;
    }

    if ( isdefined( self.cheat.wolfmode_postsetmodelfunc ) )
        self [[ self.cheat.wolfmode_postsetmodelfunc ]]();

    self.weaponinfo[level._id_C9BA] = undefined;
    self.cheat._id_C447 = 0;
    self notify( "wolf_removed" );
}

_id_AC45()
{
    foreach ( var_1 in self.weaponinfo )
    {
        if ( var_1.position != "none" )
            return 1;
    }

    return 0;
}

_id_C973()
{
    self endon( "death" );
    self endon( "wolf_removed" );

    if ( isdefined( self.cheat.ignorewolfthink ) && self.cheat.ignorewolfthink )
        return;

    for (;;)
    {
        wait(randomintrange( 1, 5 ));

        if ( isdefined( level._stealth ) && isdefined( level._stealth.logic ) && isdefined( level._stealth.logic.detection_level ) && level._stealth.logic.detection_level == "hidden" )
            continue;

        var_0 = randomint( 6 );

        switch ( var_0 )
        {
            case 0:
                continue;
            case 1:
            case 2:
                _id_B012();
                continue;
            case 3:
            case 4:
            case 5:
                _id_ADE5();
                continue;
        }
    }
}

_id_B012()
{
    if ( distancesquared( self.origin, self.goalpos ) < self.goalradius * self.goalradius )
    {
        self.goalradius = 90;
        self setgoalpos( level.player.origin );
        self.favoriteenemy = level.player;
    }
}

iswolf( var_0 )
{
    return isdefined( var_0.cheat._id_C447 ) && var_0.cheat._id_C447;
}

_id_ADE5()
{
    if ( isdefined( self.grenadeweapon ) && self.grenadeweapon == "fraggrenade" && isdefined( self.a.array ) )
    {
        self.grenadeammo = level._id_B156;
        maps\_utility::throwgrenadeatplayerasap();
    }
}

add_specialfeatures_function( var_0 )
{
    if ( getdvarint( "r_reflectionProbeGenerate" ) == 1 )
        return;

    if ( !isdefined( var_0 ) || !_func_314( var_0 ) )
        return;

    foreach ( var_2 in level.sf.badguyteams )
    {
        maps\_utility::add_global_spawn_function( var_2, var_0 );
        common_scripts\utility::array_thread( getaispeciesarray( var_2, "all" ), var_0 );
    }
}

remove_specialfeatures_function( var_0 )
{
    if ( !isdefined( var_0 ) || !_func_314( var_0 ) )
        return;

    foreach ( var_2 in level.sf.badguyteams )
        maps\_utility::remove_global_spawn_function( var_2, var_0 );
}

addspecialmonitors()
{
    thread _id_CA1D();
    thread _id_CB0D();
    thread _id_B190::_id_C41E();
    thread _id_D017();
}

edge_mode_update( var_0 )
{
    if ( var_0 )
        level._id_C51C["edge"] = 1;
    else
        level._id_C51C["edge"] = 0;

    _id_B858();
}

weapons_specialfeatures( var_0 )
{
    if ( isdefined( var_0 ) )
    {
        while ( !isdefined( level.player getcurrentweapon( 1 ) ) || level.player getcurrentweapon( 1 ) == "none" )
            waitframe();
    }

    if ( isdefined( level._id_A87F.tactical_greenberet ) && level._id_A87F.tactical_greenberet )
        _id_B190::greenberet_giveweapon();

    if ( isdefined( level._id_CE78 ) && level._id_CE78 )
        _id_B76C();

    if ( isdefined( level._id_C70E ) && level._id_C70E )
        _id_BE44();
}

weapons_specialfeatures_reset()
{
    level._id_A87F.greenberet_disabled = undefined;

    if ( isdefined( level._id_A87F.tactical_greenberet ) && level._id_A87F.tactical_greenberet )
        _id_B190::greenberet_takeweapon();

    if ( isdefined( level._id_CE78 ) && level._id_CE78 )
        _id_D1F3();

    if ( isdefined( level._id_C70E ) && level._id_C70E )
        _id_D0C5();
}
