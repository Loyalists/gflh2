// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self.animtree = "";
    self.additionalassets = "sniper_glint.csv";
    self.team = "team3";
    self.type = "human";
    self.subclass = "regular";
    self.accuracy = 0.2;
    self.health = 150;
    self.grenadeweapon = "fraggrenade";
    self.grenadeammo = 0;
    self.secondaryweapon = "";
    self.sidearm = "pp2000";

    if ( isai( self ) )
    {
        self setengagementmindist( 1250.0, 1024.0 );
        self setengagementmaxdist( 1600.0, 2400.0 );
    }

    switch ( codescripts\character::get_random_weapon( 4 ) )
    {
        case 0:
            self.weapon = "dragunov";
            break;
        case 1:
            self.weapon = "dragunov_woodland";
            break;
        case 2:
            self.weapon = "iw5_gm6_sp";
            break;
        case 3:
            self.weapon = "iw5_mors_sp";
            break;
    }

    character\gfl\randomizer_merc_sniper::main();
}

spawner()
{
    self setspawnerteam( "team3" );
}

precache()
{
    character\gfl\randomizer_merc_sniper::precache();
    precacheitem( "dragunov" );
    precacheitem( "dragunov_woodland" );
    precacheitem( "pp2000" );
    precacheitem( "fraggrenade" );
    maps\_sniper_glint::main();
}
