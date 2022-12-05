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
    self.sidearm = "deserteagle";

    if ( isai( self ) )
    {
        self setengagementmindist( 256.0, 0.0 );
        self setengagementmaxdist( 512.0, 1024.0 );
    }

    self.weapon = "none";
    character\gfl\character_gfl_ouroboros::main();
}

spawner()
{
    self setspawnerteam( "axis" );
}

precache()
{
    character\gfl\character_gfl_ouroboros::precache();
    precacheitem( "deserteagle" );
    precacheitem( "fraggrenade" );
    maps\_rambo::main();
}
