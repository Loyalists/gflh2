// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self.animtree = "";
    self.additionalassets = "";
    self.team = "allies";
    self.type = "human";
    self.subclass = "regular";
    self.accuracy = 0.2;
    self.health = 100;
    self.grenadeweapon = "";
    self.grenadeammo = 0;
    self.secondaryweapon = "beretta";
    self.sidearm = "";

    if ( isai( self ) )
    {
        self setengagementmindist( 256.0, 0.0 );
        self setengagementmaxdist( 768.0, 1024.0 );
    }

    // self.weapon = "m4_grunt";
    switch ( codescripts\character::get_random_weapon( 4 ) )
    {
        case 0:
            self.weapon = "m4_grunt";
            break;
        case 1:
            self.weapon = "iw5_ak12_sp";
            break;
        case 2:
            self.weapon = "iw5_hbra3_sp";
            break;
        case 3:
            self.weapon = "iw5_bal27_sp";
            break;
    }

    character\gfl\randomizer_us_army::main();
}

spawner()
{
    self setspawnerteam( "allies" );
}

precache()
{
    character\gfl\randomizer_us_army::precache();
    precacheitem( "m4_grunt" );
    precacheitem( "beretta" );
}
