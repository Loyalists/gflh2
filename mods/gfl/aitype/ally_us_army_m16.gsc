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
    self.grenadeweapon = "fraggrenade";
    self.grenadeammo = 0;
    self.secondaryweapon = "";
    self.sidearm = "beretta";

    if ( isai( self ) )
    {
        self setengagementmindist( 256.0, 0.0 );
        self setengagementmaxdist( 768.0, 1024.0 );
    }

    switch ( codescripts\character::get_random_weapon( 6 ) )
    {
        case 0:
            self.weapon = "m16_basic";
            break;
        case 1:
            self.weapon = "m16_acog";
            break;
        case 2:
            self.weapon = "m16_grenadier";
            break;
        case 3:
            self.weapon = "iw5_ak12_sp";
            break;
        case 4:
            self.weapon = "iw5_hbra3_sp";
            break;
        case 5:
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
    precacheitem( "m16_basic" );
    precacheitem( "m16_acog" );
    precacheitem( "m16_grenadier" );
    precacheitem( "m203_m16" );
    precacheitem( "beretta" );
    precacheitem( "fraggrenade" );
}
