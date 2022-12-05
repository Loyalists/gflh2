// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self.animtree = "";
    self.additionalassets = "";
    self.team = "axis";
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
        self setengagementmindist( 0.0, 0.0 );
        self setengagementmaxdist( 280.0, 400.0 );
    }

    switch ( codescripts\character::get_random_weapon( 7 ) )
    {
        case 0:
            self.weapon = "striker";
            break;
        case 1:
            self.weapon = "striker_reflex";
            break;
        case 2:
            self.weapon = "striker_woodland";
            break;
        case 3:
            self.weapon = "striker_woodland_reflex";
            break;
        case 4:
            self.weapon = "m1014";
            break;
        case 5:
            self.weapon = "m1014";
            break;
        case 6:
            self.weapon = "m1014";
            break;
    }

    character\gfl\randomizer_merc_lmg::main();
}

spawner()
{
    self setspawnerteam( "axis" );
}

precache()
{
    character\gfl\randomizer_merc_lmg::precache();
    precacheitem( "striker" );
    precacheitem( "striker_reflex" );
    precacheitem( "striker_woodland" );
    precacheitem( "striker_woodland_reflex" );
    precacheitem( "m1014" );
    precacheitem( "m1014" );
    precacheitem( "m1014" );
    precacheitem( "pp2000" );
    precacheitem( "fraggrenade" );
}
