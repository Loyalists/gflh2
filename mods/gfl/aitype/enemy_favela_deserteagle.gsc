// H2 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self.animtree = "";
    self.additionalassets = "common_rambo_anims.csv";
    self.team = "axis";
    self.type = "human";
    self.subclass = "regular";
    self.accuracy = 0.2;
    self.health = 150;
    self.grenadeweapon = "fraggrenade";
    self.grenadeammo = 0;
    self.secondaryweapon = "";
    self.sidearm = "deserteagle";

    if ( isai( self ) )
    {
        self setengagementmindist( 0.0, 0.0 );
        self setengagementmaxdist( 350.0, 600.0 );
    }

    self.weapon = "iw5_ak12_sp";

    character\gfl\randomizer_favela_ar::main();
}

spawner()
{
    self setspawnerteam( "axis" );
}

precache()
{
    character\gfl\randomizer_favela_ar::precache();
    precacheitem( "ak47" );
    precacheitem( "deserteagle" );
    precacheitem( "fraggrenade" );
    maps\_rambo::main();
}
