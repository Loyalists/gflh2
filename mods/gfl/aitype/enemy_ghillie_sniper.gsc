// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self.animtree = "";
    self.additionalassets = "sniper_glint.csv";
    self.team = "axis";
    self.type = "human";
    self.subclass = "regular";
    self.accuracy = 0.2;
    self.health = 150;
    self.grenadeweapon = "fraggrenade";
    self.grenadeammo = 0;
    self.secondaryweapon = "pp2000_silencer";
    self.sidearm = "usp_silencer";

    if ( isai( self ) )
    {
        self setengagementmindist( 256.0, 0.0 );
        self setengagementmaxdist( 768.0, 1024.0 );
    }

    // self.weapon = "wa2000";
    switch ( codescripts\character::get_random_weapon( 3 ) )
    {
        case 0:
            self.weapon = "wa2000";
            break;
        case 1:
            self.weapon = "iw5_mors_sp";
            break;
        case 2:
            self.weapon = "iw5_gm6_sp";
            break;
    }

    character\gfl\randomizer_merc_sniper::main();
}

spawner()
{
    self setspawnerteam( "axis" );
}

precache()
{
    character\gfl\randomizer_merc_sniper::precache();
    precacheitem( "wa2000" );
    precacheitem( "pp2000_silencer" );
    precacheitem( "usp_silencer" );
    precacheitem( "fraggrenade" );
    maps\_sniper_glint::main();
}
