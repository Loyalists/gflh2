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

    switch ( codescripts\character::get_random_weapon( 4 ) )
    {
        case 0:
            self.weapon = "m240";
            break;
        case 1:
            self.weapon = "m240_acog";
            break;
        case 2:
            self.weapon = "m240_reflex";
            break;
        case 3:
            self.weapon = "iw5_asaw_sp";
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
    precacheitem( "m240" );
    precacheitem( "m240_acog" );
    precacheitem( "m240_reflex" );
    precacheitem( "beretta" );
    precacheitem( "fraggrenade" );
}
