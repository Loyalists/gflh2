// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self.animtree = "";
    self.additionalassets = "common_rambo_anims.csv";
    self.team = "axis";
    self.type = "human";
    self.subclass = "militia";
    self.accuracy = 0.12;
    self.health = 150;
    self.grenadeweapon = "fraggrenade";
    self.grenadeammo = 0;
    self.secondaryweapon = "";
    self.sidearm = "glock";

    if ( isai( self ) )
    {
        self setengagementmindist( 256.0, 0.0 );
        self setengagementmaxdist( 768.0, 1024.0 );
    }

    switch ( codescripts\character::get_random_weapon( 11 ) )
    {
        case 0:
            self.weapon = "ak47";
            break;
        case 1:
            self.weapon = "ak47_grenadier";
            break;
        case 2:
            self.weapon = "ak47_reflex";
            break;
        case 3:
            self.weapon = "ak47_acog";
            break;
        case 4:
            self.weapon = "fal";
            break;
        case 5:
            self.weapon = "fal_shotgun";
            break;
        case 6:
            self.weapon = "fal_reflex";
            break;
        case 7:
            self.weapon = "fal_acog";
            break;
        case 8:
            self.weapon = "iw5_ak12_sp";
            break;
        case 9:
            self.weapon = "iw5_hbra3_sp";
            break;
        case 10:
            self.weapon = "iw5_bal27_sp";
            break;
    }

    character\gfl\character_gfl_vespid::main();
}

spawner()
{
    self setspawnerteam( "axis" );
}

precache()
{
    character\gfl\character_gfl_vespid::precache();
    precacheitem( "ak47" );
    precacheitem( "ak47_grenadier" );
    precacheitem( "gl_ak47" );
    precacheitem( "ak47_reflex" );
    precacheitem( "ak47_acog" );
    precacheitem( "fal" );
    precacheitem( "fal_shotgun" );
    precacheitem( "fal_shotgun_attach" );
    precacheitem( "fal_reflex" );
    precacheitem( "fal_acog" );
    precacheitem( "glock" );
    precacheitem( "fraggrenade" );
    maps\_rambo::main();
}
