// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self.animtree = "";
    self.additionalassets = "";
    self.team = "neutral";
    self.type = "human";
    self.subclass = "regular";
    self.accuracy = 0.2;
    self.health = 100;
    self.grenadeweapon = "";
    self.grenadeammo = 0;
    self.secondaryweapon = "fraggrenade";
    self.sidearm = "glock";

    if ( isai( self ) )
    {
        self setengagementmindist( 256.0, 0.0 );
        self setengagementmaxdist( 768.0, 1024.0 );
    }

    self.weapon = "beretta";
    character\gfl\randomizer_seal::main();
}

spawner()
{
    self setspawnerteam( "neutral" );
}

precache()
{
    character\gfl\randomizer_seal::precache();
    precacheitem( "beretta" );
    precacheitem( "fraggrenade" );
    precacheitem( "glock" );
}
