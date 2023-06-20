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
    self.health = 150;
    self.grenadeweapon = "fraggrenade";
    self.grenadeammo = 0;
    self.secondaryweapon = "";
    self.sidearm = "beretta";

    if ( isai( self ) )
    {
        self setengagementmindist( 256.0, 0.0 );
        self setengagementmaxdist( 768.0, 1024.0 );
    }

    // self.weapon = "m14_scoped";
    switch ( codescripts\character::get_random_weapon( 3 ) )
    {
        case 0:
            self.weapon = "m14_scoped";
            break;
        case 1:
            self.weapon = "iw5_gm6_sp";
            break;
        case 2:
            self.weapon = "iw5_mors_sp";
            break;
    }

    character\gfl\randomizer_seal::main();
}

spawner()
{
    self setspawnerteam( "allies" );
}

precache()
{
    character\gfl\randomizer_seal::precache();
    precacheitem( "m14_scoped" );
    precacheitem( "beretta" );
    precacheitem( "fraggrenade" );
}
